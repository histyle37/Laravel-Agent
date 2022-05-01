<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use App\Models\Icon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use InvalidArgumentException;
use Image;
use File;

use App\Models\Generalsetting;

use App\Classes\IconHelper;
use App\Classes\CryptorHelper;

class IconController extends Controller
{
    public function __construct()
    {
    }

    public function get($mediaId, Request $request)
    {
        $type = ($request->t) ? CryptorHelper::decrypt($request->t) : 'o';
        $type .= 'url';

        $icon = Icon::where('mediaId', $mediaId)->first();
        if (!$icon) abort(404);
        $path = IconHelper::_getIconUrl($icon, $type, true);
        
        try{
            if (!File::exists($path)) {
                abort(404);
            }
        
            $file = File::get($path);
            $type = File::mimeType($path);

            return response()->make($file, 200, ['CONTENT_TYPE' => 'text/html']);
        } catch(\Exception $e){
            abort(404);
        }
        
    }

}
