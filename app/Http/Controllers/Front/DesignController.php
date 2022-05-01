<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use InvalidArgumentException;
use Auth;

use App\Models\Design;
use App\Models\Docunit;

use App\Classes\DesignHelper;
use App\Classes\LayoutHelper;
use App\Classes\DimensionHelper;
use App\Classes\MediaIdHelper;

class DesignController extends Controller
{
    public function __construct()
    {
        $this->layoutHelper = new LayoutHelper;
        // $this->middleware('auth');
    }

    public function create(Request $request)
    {
        $user = Auth::user();
        $uid = $request->type;
        if ($uid == null){
            //CUSTOM DESIGN
            $width = $request->width;
            $height = $request->height;
            $units = $request->units;
            $layout = $this->layoutHelper->newCustomLayout($width, $height, $units);
        } else {
            $layout = $this->layoutHelper->getFromUId($uid);
        }
        
        $unitName = $layout->docunit->id ? $layout->docunit->name : 'INCHES';
        $dimensions = $this->layoutHelper->getLayoutPXDimension($layout);      
        
        $design = new Design;
        $pages = [
            array(
                "elements" => [],
                "width" => (float)$dimensions["width"],
                "height" => (float)$dimensions["height"],
                "layout" => array(
                    "id" => $layout->uid,
                    "version" => (int)$layout->version
                )
            )
        ];

        $design->pages = json_encode($pages);
        $design->mediaId = MediaIdHelper::generate();
        $design->name = "";
        $design->version = 1;
        $mediaMap = '{}';
        $cdocType = $this->layoutHelper->cdocType($layout);

        //type: "REFERENCE", id: "TABQqumtl1k", version: 1
        // {type: "INLINE", width: 6, height: 7, units: "INCHES"}
        $docType = ($layout->is_custom == 'YES') ? array(
            "type" => "INLINE",
            "width" => (float)$layout->width,
            "height" => (float)$layout->height,
            "units" => $unitName
        ) : array(
            "type" => "REFERENCE",
            "id" => $layout->uid,
            "version" => (int)$layout->version
        );

        return view('hicanva.index', compact('design', 'mediaMap', 'layout', 'cdocType', 'docType', 'user'));
    }

    public function edit($id, Request $request)
    {
        if (!Auth::guard('web')->check()) {
            return redirect( route('user.login', ['return' => $request->fullUrl()]) );
        }

        $user = Auth::user();
        $design = DesignHelper::getFromMediaId($id);
        $mediaMap = json_encode(DesignHelper::getMediaMap($design));
        $layout = $this->layoutHelper->getLayout($design);
        $cdocType = $this->layoutHelper->cdocType($layout);

        $docType = ($layout->is_custom == 'YES') ? array(
            "type" => "INLINE",
            "width" => (float)$layout->width,
            "height" => (float)$layout->height,
            "units" => $layout->docunit->id ? $layout->docunit->name : 'PIXELS'
        ) : array(
            "type" => "REFERENCE",
            "id" => $layout->uid,
            "version" => (int)$layout->version
        );

        return view('hicanva.index', compact('design', 'mediaMap', 'layout', 'cdocType', 'docType', 'user'));
    }
    public function edit1($id, Request $request)
    {
        if (!Auth::guard('web')->check()) {
            return redirect( route('user.login', ['return' => $request->fullUrl()]) );
        }

        $user = Auth::user();
        $design = DesignHelper::getFromMediaId($id);
        $mediaMap = json_encode(DesignHelper::getMediaMap($design));
        $layout = $this->layoutHelper->getLayout($design);
        $cdocType = $this->layoutHelper->cdocType($layout);

        $docType = ($layout->is_custom == 'YES') ? array(
            "type" => "INLINE",
            "width" => (float)$layout->width,
            "height" => (float)$layout->height,
            "units" => $layout->docunit->id ? $layout->docunit->name : 'PIXELS'
        ) : array(
            "type" => "REFERENCE",
            "id" => $layout->uid,
            "version" => (int)$layout->version
        );

        return view('hicanva.index1', compact('design', 'mediaMap', 'layout', 'cdocType', 'docType', 'user'));
    }
}
