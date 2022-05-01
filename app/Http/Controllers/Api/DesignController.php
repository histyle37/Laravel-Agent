<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Auth;

use App\Models\Design;

use App\Classes\DesignHelper;

class DesignController extends BaseController
{
    public function __construct()
    {
    }

    public function getAllDesigns(Request $request){
        $user = Auth::user();
        $continuation = $request->continuation;
        $limit = $request->limit;
        
        $designs = $user->designs()->where('is_trashed', 0)->get()->map(
            function ($design){
                return $design->JsonModel();
            }
        );

        $folders = $user->folders->map(function($folder) {
            $item = $folder->JsonModel();
            return $item;
        });

        $result = array(
            "items" => $designs,
            "folders" => $folders,
            // "continuation" => $continuation + 1
            "continuation" => false
        );
        return $this->sendResponse($result);
    }

    public function getTrashedDesigns(Request $request, $brandId, $userId)
    {
        $user = Auth::user();
        $limit = $request->limit;
        $decorations = $request->decorations;

        $designs = $user->designs()->where('is_trashed', 1)->get()->map(
            function ($design){ return $design->JsonModel(); }
        );

        $folders = $user->folders->map(function($folder) use($user) {
            return $folder->JsonModel();
        });

        $result = array(
            "items" => $designs,
            "folders" => $folders,
            // "continuation" => $continuation + 1
            "continuation" => false
        );
        return $this->sendResponse($result);
    }
}
