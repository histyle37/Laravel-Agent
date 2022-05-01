<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;
use Image;

use App\Classes\SystemHelper;
use App\Classes\DesignHelper;
use App\Classes\ImageGenerator;

class ExportController extends BaseController
{
    public function __construct()
    {
    }

    public function export(Request $request){
        $docId = $request->docId;
        $docVersion = $request->docVersion;
        $spec = $request->spec;
        // type: "SCREEN"
        // bleed: false
        // crops: false
        // mediaDpi: 300
        // format: "PDF"
        // mediaQuality: "SCREEN"
        // pages: [1]
        // removeCanvas: false
        $schema = $request->schema;

        $design = DesignHelper::getFromMediaId($docId);
        $PXDimensions = DesignHelper::getPXDimension($design);
        $imageGenerator = new ImageGenerator();
        
        $downloadFolderUrl = public_path().'/assets/hicanva/downloads/';
        SystemHelper::createDirectory($downloadFolderUrl);
        $file_name = strtolower(str_random(4)).'.png';
        $thumbnail_url = $downloadFolderUrl.$file_name;
        $pages = json_decode($design->pages, true);
        $elements = $pages[0]['elements'];
        $width = $PXDimensions['width'];
        $height = $PXDimensions['height'];
        $scale = 1;

        $imageGenerator->generateThumbnail($width * $scale, $height * $scale, $elements, $thumbnail_url, $scale);

        $data = 
        [
            "_export"=> [
                "id"=> 1,
                "output"=> [
                    "title"=> "test download",
                    "exportBlobs"=> [
                        [
                            "width"=> $width,
                            "height"=> $height,
                            "url"=> asset('assets/hicanva/downloads/'.$file_name),
                            "page"=> 0,
                            "bucket"=> "",
                            "key"=> ""
                        ]
                    ]
                ],
                "status"=> "COMPLETE",
                "failureReason"=> "none"
            ]
        ];
        return $this->sendResponse($data);

        // $responseHeader = "'\"])}while(1);</x>//";
        // return response()->make($responseHeader.$result, 200, ['CONTENT_TYPE' => 'application/json']);
    }

    public function exportVersion(Request $request, $id)
    {
        // "/_export/1?attachment=true"
        $attachment = $request->attachment;
        $result = '{
            "_export": {
                "id": 1,
                "output": {
                    "title": "test download",
                    "exportBlobs": [
                        {
                            "width": 300,
                            "height": 300,
                            "url": "http://localhost:8082/assets/hicanva/images/charts.2.png",
                            "page": 0,
                            "bucket": "media-public.canva.com",
                            "key": "MADRQwuex6w/1/thumbnail-1.png"
                        },
                        {
                            "width": 300,
                            "height": 300,
                            "url": "http://localhost:8082/assets/hicanva/images/charts.2.png",
                            "page": 1,
                            "bucket": "media-public.canva.com",
                            "key": "MADRQwuex6w/1/thumbnail-1.png"
                        }
                    ]
                },
                "status": "COMPLETE",
                "failureReason": "a"
            }
        }';
        

        // id: getNumberOpValue("id", a),
        // output: createObjectFromKeyValue(kw, "output", a),
        // status: getRqConstantFromKey(getExportStatusConstant, "status", a),
        // failureReason: getStringOpValue("failureReason", a)

        $responseHeader = "'\"])}while(1);</x>//";
        return response()->make($responseHeader.$result, 200, ['CONTENT_TYPE' => 'application/json']);
    }

    public function exportModel()
    {
        return [
            "_export"=> [
                "id"=> 2,
                "output"=> [
                    "title"=> "test download",
                    "exportBlobs"=> [
                        [
                            "width"=> 300,
                            "height"=> 300,
                            "url"=> "http://localhost:8082/assets/hicanva/images/icons.2.png",
                            "page"=> 0,
                            "bucket"=> "",
                            "key"=> ""
                        ]
                    ]
                ],
                "status"=> "COMPLETE",
                "failureReason"=> "a"
            ]
        ];
    }
}
