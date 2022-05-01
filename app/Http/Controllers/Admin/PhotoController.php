<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Models\Licensing;
use App\Models\Extension;
use App\Models\Nphoto;
use App\Models\Excel;

use DB;
use Validator;
use Image;
use Config;

use App\Classes\CryptorHelper;
use App\Classes\PhotoHelper;
use App\Classes\MediaIdHelper;

class PhotoController extends Controller
{
    public $file_prefix = '';

    public function __construct()
    {
        $this->middleware('auth:admin');
        $this->file_prefix = public_path().'/assets';
    }

    public function datatables(Request $request)
    {
        $keyword = $request->keyword;
        $count = $request->count;
        $index = $request->index;

        if (empty($count)) $count = 10;
        if (empty($index)) $index = 1;
        $skip = $count * ($index - 1);

        if ($keyword == '')
            $data = Excel::skip($skip)->take($count)->get();
        else
            $data = Excel::skip($skip)->take($count)->get();

        $data->map(function($datumn){
            $datumn['action'] = '
            <div style="display: flex;align-items: center;justify-content: center;">
                <img alt="excel file" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAMAAABrrFhUAAAAilBMVEUAAAAjHh4kHCDy8fEhckcfckYfcUUfckYeckYec0UgcUUgVTmQjI4hQzH///8fckaFvp+YmJimpKVdfmxpZ2hWlXNyposselHy9/Sqy7nI3NLj7eiOuKI6g1yPuKJIjGh2joG51MWAr5bk7unV5dycwa07hF2Br5eOlZFknX9chW9Sgmk9fFs2eVXHJYT7AAAADnRSTlMAZkDpL++/r39vP6nYjL8RYWEAAAPpSURBVHja7Ni7TsNAEIXhAOGa4IBxEKQIQpHg/d+QFGyR9W0tUGY85/9rF3O+ytoFEREREREREREVdmHT5cJLhQfHFSg9OKzA8ZTq3NX12o+ADUB95UbACKByI2AF4EbACsCNgBmAFwE7ACcChgA+BCwBXAiYAngQsAVwIGAMYC9gDjBRICDANIGIAJMEQgJMEYgJMEEgKEC5QFQAA4EhgOeC/vBx0zSVGwE3AIUCgQHKBCIDFAmEBigRiA1QIBAcYFwgOsCoQHiAMYH4ACMCAgDDAgoAgwISAEMCGgADAiIA/QIqAL0CMgB9AjoAvQJBn8Ra9QgoAXQKSAF0CWgBdAiIAbQF1ABaAnIAuYAeQCYgCJAJ+PsTfCro9OOX4eq89fHIdK8kQA1AMICRqlYAAABAuhcAAAAAAAAAAAAAAAAAmO+T2EgAzAHgbfe5/95+bDbVfzQjgDT8Nx2AbLgOwOF0uA7AYfe+f91+pZk6ANlwHYBsuA7A8nG1yoZPa65/gsuH+7vbm+s0QwcgG64DkA3XA0j3AgAAAAAAAAAAAAAAAAAAAABAq7hPYuleAAAAAAAAAADgh7172W0QhoIA+ge2WPgBGJGgRGr6+P/fqxprrglBVRddtMzMKmFDOJjrG0CyANQJCkAAAhCAAAQggG8S7llKIABYsKfeWyK2TQQAKbuanDwywITiErhiVxFbJmwJFAB2uOctyUBSBHu74jcXRSABCNjX8lgCR5ppEDXvUr9eUBNoAGzWm7++zTYAaAD86Gqu65IQiQCW1UlP2doCnltiVvdvDaN4IgCb+Xu7HHKiAkAzlBPmxKunAmiVDx8mMgCc+PY3iAwAzRAy0QFEt87g6QBq9UcCIUB0CAYAUSeIZgi5MQL44pDRUwL0DsmJESC5lsIIUFxLTnwAtQYikQ+guHVGOgAMACSyAWAA9BgCZAB2H8w64hsXQLH5b0E3TAVgFWBq7UBgAsBpP68awoEJYH3hz9jzzAPw+DDwggmBBwADoGxeD2EBsCNOjxWxZwEYccBP7wtw3BLDAMDE18pg4QDAABg9gjKYEwOADYD4vKkwALTTvffm3PEBJgD0u2/OHR9gNynUFFaAGrInQwJ4Cs9/AQEIQAACEIAABCAAAQhAAAIQgAAEIAAB6JaYAAQgAAEIQAACEIA6wUMA0C+1Rb/Ympbb04KLP1pykxegBhCJF6Cm615Op9e398QLUAOID16ADQQvwAaCF6BB3Nck5wXoOlcjAAEIQADHA/hrEYAABIDfKwABCEAAAhCAAAQgAAEIQAC/A/BPgt8rAAF8tgcHJAAAAACC/r+OfqgAAAAAsABPTHUuW0/evgAAAABJRU5ErkJggg==" class="MuiAvatar-img">'
            .$datumn['name'].'&nbsp;&nbsp;&nbsp;'
            .'<a href="/assets/'.$datumn['name'].'">Download</a>'
            .'</div>';
            return $datumn;
        });
        return response()->json(array('success' => true, 'data' => $data));
    }

    public function index(Request $request)
    {
        return view('admin.photo.index');
    }

    public function create(Request $request)
    {
        return view('admin.photo.create');
    }

    public function edit($id){
        $photo = Nphoto::find($id);
        $licensings = Licensing::all();
        return view('admin.photo.edit', compact('photo', 'licensings'));
    }

    public function update($id, Request $request){
        $input = Input::all();
        $rules = [
            'photo' => 'mimes:jpeg,jpg,png,svg|photo_extension',
            'licensing' => 'required',
            'title' => 'required',
            'tags' => 'required'
        ];
        $validator = Validator::make($input, $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }

        $data = Nphoto::find($id);
        if (!empty($request->tags)) 
        {
            $input['termids'] = implode(',', $request->tags);
        }

        if ($file = $request->file('photo'))
        {
            $id = $data->id;
            $mediaFolder = CryptorHelper::encrypt((int)($id/1000));
            $mediaId = $data->mediaId;
            
            $fileTypes = ['ourl', 'turl', 'surl', 'swurl'];
            foreach($fileTypes as $fileType){
                $url = PhotoHelper::getPhotoUrl($data, $fileType, true);
                if (file_exists($url)) {
                    unlink($url);
                }
            }

            $ext = $file->getClientOriginalExtension();
            $dext = Extension::where('slug', strtolower($ext))->first();
            $dext || ($dext = Extension::first());
            $ext = $dext->ext;
            $input['extension_id'] = $dext->id;

            $img = Image::make($file->getRealPath());
            $w = $img->getWidth();
            $h = $img->getHeight();
            //Original Image --* -- storage
            //Thumbnail Image -- 200 -- public
            //Screen Image -- 800 -- storage
            //Screen Watermak Image - 800 -- public

            $dimensions = Config::get('siteconf.photo.dimensions');
            $fl = Config::get('siteconf.photo.filename_length');

            $public_prefix = public_path().'/assets/static/photos/'.$mediaFolder;
            $storage_prefix = storage_path('static/photos/'.$mediaFolder);
            $p_path = $public_prefix .'/'. $mediaId.'/';
            $s_path = $storage_prefix .'/'. $mediaId.'/';
            
            //Original
            $input['owidth'] = $w;
            $input['oheight'] = $h;
            $ourl = str_random($fl);
            $input['ourl'] = $ourl;
            $img->save($s_path.$ourl.$ext);
            //Thumbnail
            $newdim = $this->calculateDimension($img, 'thumbnail');
            $input['twidth'] = $newdim['w'];
            $input['theight'] = $newdim['h'];
            $turl = str_random($fl);
            $input['turl'] = $turl;
            $newimg = Image::make($file->getRealPath())->resize($newdim['w'], $newdim['h'])->save($p_path.$turl.$ext);
            //Screen
            $newdim = $this->calculateDimension($img, 'screen');
            $input['swidth'] = $newdim['w'];
            $input['sheight'] = $newdim['h'];
            $surl = str_random($fl);
            $input['surl'] = $surl;
            if ($input['licensing'] == Licensing::FREE_ID()){
                $newimg = Image::make($file->getRealPath())->resize($newdim['w'], $newdim['h'])->save($p_path.$surl.$ext);
            }else{
                $newimg = Image::make($file->getRealPath())->resize($newdim['w'], $newdim['h'])->save($s_path.$surl.$ext);
                //Screen Watermark
                $input['swwidth'] = $newdim['w'];
                $input['swheight'] = $newdim['h'];
                $swurl = str_random($fl);
                $input['swurl'] = $swurl;

                $newimg = Image::make($file->getRealPath())->resize($newdim['w'], $newdim['h']);
                $newimg = PhotoHelper::addWatermark($newimg);
                $newimg = $newimg->save($p_path.$swurl.$ext);
            }
        }
        else
        {
            if ($data->licensing != $input['licensing']){
                $id = $data->id;
                $mediaFolder = CryptorHelper::encrypt((int)($id/1000));
                $mediaId = $data->mediaId;
                
                $fileTypes = ['surl', 'swurl'];
                foreach($fileTypes as $fileType){
                    $url = PhotoHelper::getPhotoUrl($data, $fileType, true);
                    if (file_exists($url)) {
                        unlink($url);
                    }
                }

                $extension = Extension::find($data->extension_id);
                $ext = ($extension) ? '.jpg' : $extension->ext;

                $ourl = PhotoHelper::getPhotoUrl($data, 'ourl', true);
                $img = Image::make($ourl);
                $w = $img->getWidth();
                $h = $img->getHeight();

                $dimensions = Config::get('siteconf.photo.dimensions');
                $fl = Config::get('siteconf.photo.filename_length');

                $public_prefix = public_path().'/assets/static/photos/'.$mediaFolder;
                $storage_prefix = storage_path('static/photos/'.$mediaFolder);
                $p_path = $public_prefix .'/'. $mediaId.'/';
                $s_path = $storage_prefix .'/'. $mediaId.'/';
                
                //Screen
                $newdim = $this->calculateDimension($img, 'screen');
                $input['swidth'] = $newdim['w'];
                $input['sheight'] = $newdim['h'];
                $surl = str_random($fl);
                $input['surl'] = $surl;
                if ($input['licensing'] == Licensing::FREE_ID()){
                    $newimg = Image::make($ourl)->resize($newdim['w'], $newdim['h'])->save($p_path.$surl.$ext);
                }else{
                    $newimg = Image::make($ourl)->resize($newdim['w'], $newdim['h'])->save($s_path.$surl.$ext);
                    //Screen Watermark
                    $input['swwidth'] = $newdim['w'];
                    $input['swheight'] = $newdim['h'];
                    $swurl = str_random($fl);
                    $input['swurl'] = $swurl;
                    
                    $newimg = Image::make($ourl)->resize($newdim['w'], $newdim['h']);
                    $newimg = PhotoHelper::addWatermark($newimg);
                    $newimg = $newimg->save($p_path.$swurl.$ext);
                }
            }
        }

        $data->update($input);

        return response()->json(
            array(
                'success' => true,
                'message' => 'Successfully Updated.',
            )
        );
    }

    public function delete($id)
    {
        $photo = Nphoto::find($id);
        if (!$photo) return response()->json(array('success' => false, 'message' => 'No photo exists.'));
        
        $fileTypes = ['ourl', 'turl', 'surl', 'swurl'];
        foreach($fileTypes as $fileType){
            $url = PhotoHelper::getPhotoUrl($photo, $fileType, true);
            if (file_exists($url)) {
                unlink($url);
            }
        }
        PhotoHelper::destroyDirectory(PhotoHelper::getPhotoDirectory($photo, true));
        PhotoHelper::destroyDirectory(PhotoHelper::getPhotoDirectory($photo, false));

        $photo->delete();
        return response()->json(array('success' => true, 'data'=>['id'=>$id], 'message' => 'Successfully deleted.'));
    }

    public function store(Request $request){
        $input = Input::all();
        $rules = [
            //'photo' => 'required|mimes:jpeg,jpg,png,svg|photo_extension',
        ];
        $validator = Validator::make($input, $rules);
        
        if ($validator->fails()) {
          return response()->json(array('errors' => $validator->getMessageBag()->toArray()));
        }

        $data = new Excel;

        if ($file = $request->file('photo'))
        {
            
            $input['name'] = $file->getClientOriginalName();
            $file->move($this->file_prefix, $input['name']);
            $data->fill($input)->save();
        }

        return response()->json(
            array(
                'success' => true,
                'message' => 'Successfully saved. <a href="'.route("admin-photo-index").'">View Excels Lists</a>',
                'data' => $data
            )
        );
    }

    public function calculateDimension($img, $type){
        $w = $img->getWidth();
        $h = $img->getHeight();
        $dimensions = Config::get('siteconf.photo.dimensions');
        $dim = $dimensions[$type];
        $dim || ($dim=200);
        if ($dim >= max($w, $h)) return ['w' => $w, 'h' => $h];
        else return [
            'w' => $dim / max($w, $h) * $w,
            'h' => $dim / max($w, $h) * $h,
        ];
    }

    public function createFolder($url, $foldername){
        //chmod($url, 0777);
        $folderpath = $url.'/'.$foldername;
        if (!is_dir($folderpath)) {
            mkdir($folderpath, 0755, TRUE);
        }
    }

}