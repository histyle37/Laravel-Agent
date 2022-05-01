<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use App\Models\Nphoto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use InvalidArgumentException;
use Image;

use App\Models\Generalsetting;

use App\Models\Font;
use App\Models\FontCategory;

use App\Classes\PhotoHelper;
use App\Classes\CryptorHelper;
use App\Classes\SystemHelper;

class PhotoController extends Controller
{
    public function __construct()
    {
    }

    public function get($mediaId, Request $request)
    {
        $type = ($request->t) ? CryptorHelper::decrypt($request->t) : 'o';
        $type .= 'url';

        $photo = Nphoto::where('mediaId', $mediaId)->first();
        if (!$photo) abort(404);
        $url = PhotoHelper::getPhotoUrl($photo, $type, true);
        
        try{
            return Image::make($url)->response();
        } catch(\Exception $e){
            abort(404);
        }
        
    }

    // Capcha Code Image
    public function  code_image()
    {
        $actual_path = str_replace('project','',base_path().'\\public\\');
        $image = imagecreatetruecolor(200, 50);
        $background_color = imagecolorallocate($image, 255, 255, 255);
        imagefilledrectangle($image,0,0,200,50,$background_color);

        $pixel = imagecolorallocate($image, 0,0,255);
        for($i=0;$i<500;$i++)
        {
            imagesetpixel($image,rand()%200,rand()%50,$pixel);
        }

        $font = $actual_path.'assets/front/fonts/kpkwamym.ttf';
        $allowed_letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        //$allowed_letters = '가나다라마바사';
        
        $gs = Generalsetting::findOrfail(1);
        $allowed_letters = $gs->popup_text;
        $length = strlen($allowed_letters);
        $letter = $allowed_letters[rand(0, $length-1)];
        $word='';
        //$text_color = imagecolorallocate($image, 8, 186, 239);
        $text_color = imagecolorallocate($image, 0, 0, 0);
        $cap_length=6;// No. of character in image
        for ($i = 0; $i< $cap_length;$i++)
        {
            $letter = $allowed_letters[rand(0, $length-1)];
            //$letter = $this->properText($letter);
            imagettftext($image, 25, 1, 35+($i*25), 35, $text_color, $font, $letter);
            $word.=$letter;
        }
        $pixels = imagecolorallocate($image, 8, 186, 239);
        for($i=0;$i<500;$i++)
        {
            imagesetpixel($image,rand()%200,rand()%50,$pixels);
        }
        session(['captcha_string' => $word]);
        imagepng($image, $actual_path."assets/capcha_code.png");
        $img = Image::make($image, $actual_path."assets/capcha_code.png");
        $img->line(0,0,$img->getWidth(), $img->getHeight(), function($iimg){
            $iimg->color('#ffffff');
            $iimg->width = 3;
            var_dump($iimg);
        });
        $img->line($img->getWidth(),0,0, $img->getHeight(), function($iimg){
            $iimg->color('#ffffff');
            $iimg->width = 3;
            var_dump($iimg);
        });
        $img->save($actual_path."assets/capcha_code1.png");
    }

    public function properText($text){
        $text = mb_convert_encoding($text, "HTML-ENTITIES", "UTF-8");
        $text = preg_replace('~^(&([a-zA-Z0-9]);)~',htmlentities('${1}'),$text);
        $text = html_entity_decode($text,ENT_NOQUOTES, "ISO-8859-1");
        return($text); 
    }

    public function test()
    {
        return Carbon::now()->format('U');
    }

    public function fontPareGenerate(){
        $imageName = 'Lato-Lato-Lato';

        // $titleFonts = Font::whereIn('category_id', FontCategory::where('usage', 1)->pluck('id'))->get(); //130
        // $subTitleFonts = Font::whereIn('category_id', FontCategory::where('usage', 2)->pluck('id'))->take(5)->get(); //65
        // $contentFonts = Font::whereIn('category_id', FontCategory::where('usage', 3)->pluck('id'))->take(5)->get(); //36
        $subTitleFonts = Font::where('id', '>=', 181)->where('id', '<=', 300)->get();
        $contentFonts = Font::all();
        foreach($subTitleFonts as $subTitleFont)
        {
            foreach($contentFonts as $contentFont)
            {
                if ($subTitleFont->id != $contentFont->id){
                    $folderName = FontCategory::find($subTitleFont->category_id)->name . '-' . $subTitleFont->display_name;
                    $imageName = $folderName . '--' .FontCategory::find($contentFont->category_id)->name.'-'.$contentFont->display_name;
                    $this->fontPareGenerator($subTitleFont->family, $subTitleFont->family, $contentFont->family, $imageName, $folderName);
                }
            }   
        }

        var_dump('success');

    }

    public function fontPareGenerator($tFamily, $stFamily, $cFamily, $displayName, $folderName)
    {
        // $titleText = '생일을 축하합니다!';
        $subTitleText = '생일을 축하합니다!';
        $contentText = '축하합니다 생일을 기쁨넘친 생일을 좋은 세월 행복한 생일 노래불러 축하합니다. 축하합니다 생일을 행복넘친 생일을 해님품에 행복한 생일 노래불러 축하합니다. 세월의 눈비를 다 맞으시며 나를 품어 키우신 나의 어머니 만가지 소원을 헤아려주시며 조선의 고운 꿈 꽃피워주셨네 비오나 눈오나 먼길 떠나도 손잡아 이끄신 나의 어머니 그 은혜 못잊어 세월의 끝까지 수령님 받들어 한길을 가리라.';

        $page_template = public_path().'/assets/static/fontsparing.html';
        $doc = new \DOMDocument();
        libxml_use_internal_errors(true);
        $doc->formatOutput = true;
        $doc->loadHTMLFile($page_template);

        $section = $doc->getElementsByTagName('section');
        $section = $section->item(0);

        /////////////////////////////////
        // $title = $doc->createElement('p');
        // $title->setAttribute('class', 'title');
        // $title->setAttribute('style', 'font-family:'. $tFamily .';');

        // $fragment = $doc->createDocumentFragment();
        // $fragment->appendXML($titleText);
        // $title->appendChild($fragment);
        // $section->appendChild($title);
        //////////////////////////////////

        //////////////////////////////////
        $title = $doc->createElement('p');
        $title->setAttribute('class', 'sub-title');
        $title->setAttribute('style', 'font-family:'. $stFamily .';');

        $fragment = $doc->createDocumentFragment();
        $fragment->appendXML($subTitleText);
        $title->appendChild($fragment);
        $section->appendChild($title);
        //////////////////////////////////

        //////////////////////////////////
        $title = $doc->createElement('p');
        $title->setAttribute('class', 'content');
        $title->setAttribute('style', 'font-family:'. $cFamily .';');

        $fragment = $doc->createDocumentFragment();
        $fragment->appendXML($contentText);
        $title->appendChild($fragment);
        $section->appendChild($title);
        //////////////////////////////////

        //////////////////////////////////
        $title = $doc->createElement('p');
        $title->setAttribute('class', 'description');
        $title->setAttribute('style', 'font-family:WKCBBonm;');

        $fragment = $doc->createDocumentFragment();
        $fragment->appendXML($displayName);
        $title->appendChild($fragment);
        $section->appendChild($title);
        //////////////////////////////////

        $output_html = public_path().'/assets/static/fontsparing_output_html.html';
        $doc->saveHTMLFile($output_html);
        libxml_clear_errors();

        $folderPath = 'c:/fontsparing/'.$folderName.'-'.$stFamily;
        SystemHelper::createDirectory($folderPath);
        $output_path = $folderPath. '/' . $stFamily . '-' . $cFamily . '.png';
        //$output_path = 'c:/fontsparing/' . $displayName . '.png';

        $output = shell_exec('wkhtmltoimage --width 800 --quality 50 '.$output_html.' '.$output_path.' 2>&1');
    }

}
