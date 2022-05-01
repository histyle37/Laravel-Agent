<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;

use Auth;
use Image;
use Config;

use App\Models\Nphoto;
use App\Models\Extension;
use App\Models\Licensing;
use App\Models\MediaFolder;

use App\Classes\MediaIdHelper;
use App\Classes\CryptorHelper;
use App\Classes\PhotoHelper;
use App\Classes\SystemHelper;
use App\Classes\FolderHelper;

class MediaController extends BaseController
{
    public function __construct()
    {
    }

    public function medias(Request $request)
    {
        $user = $request->user;
        $restricted = $request->restricted;
        $deactivated = $request->deactivated;
        $projection = $request->projection;
        $types = $request->types;

        if ($types == "FONT"){
            $data = [
                'media' => [],
                "continuation" => null
            ];
            return $this->sendResponse($data);
        }

        $limit = $request->limit;
        $unwatermarked = $request->unwatermarked || false;
        return $this->sendResponse([]);

        $data = array(
            'media' => 
                array(
                    [
                        "id" => "M77yZOBsXH",
                        "importKey" => "",
                        "importBucket" => "",
                        "importFilename" => "",
                        "type" => "VECTOR",
                        "copyright" => "",
                        "bundle" => 
                        array(
                            "licensing" => ($unwatermarked) ? "STANDARD" : "STANDARD", 
                            "version" => 1,
                            "restrictedAccess" => false,
                            "listed" => false,
                            "status" => "PENDING_SUBMISSION",
                            "rejectionReason" => "rejectionReason",
                            "importState" => "PENDING_IMPORT",
                            "importMessage" => "importMessage",
                            "designVersion" => "designVersion",
                            "designType" => "designType",
                            "artist" => "",
                            "title" => "",
                            "titles" => "",
                            "description" => "",
                            "descriptions" => "",
                            "locale" => null,
                            "background" => false,
                            "cutout" => false,
                            "isolated" => false,
                            "photoholder" => false,
                            "textholder" => false,
                            "repeating" => false,
                            "recolorable" => false,
                            "superKeywords" => [],
                            "keywords" => [],
                            "files" => [
                                "THUMBNAIL" => array(
                                    "bucket" => "",
                                    "height" => 200,
                                    "key" => "",
                                    "page" => 0,
                                    "quality" => "THUMBNAIL",
                                    "spritesheet" => false,
                                    "url" => "//localhost:8082/assets/static/icons/V0E9PQ__/M77yZOBsXH/EN.png",
                                    "urlDenied" => false,
                                    "watermarked" => false,
                                    "width" => 163
                                ),
                                "SCREEN" => array(
                                    "bucket" => "",
                                    "height" => 800,
                                    "key" => "",
                                    "page" => 0,
                                    "quality" => "SCREEN",
                                    "spritesheet" => false,
                                    // "url" => !($unwatermarked) ? "http://localhost:8082/assets/static/icons/V0E9PQ__/M77yZOBsXH/Mw.png" : "http://localhost:8082/icon/get/M77yZOBsXH/s.svg",
                                    "url" => "http://localhost:8082/assets/static/icons/V0E9PQ__/M77yZOBsXH/EN.png",
                                    "urlDenied" => false,
                                    "watermarked" => true,
                                    "width" => 653
                                )
                            ],
                            "quality" => "",
                            "ageRating" => null,
                            "spritesheetMetadata" => "",
                            "submittedBy" => "",
                            "submittedDate" => "",
                            "reviewedBy" => "",
                            "reviewedDate" => ""
                        )
                        ,
                        "deactivated" => false,
                        "oneTimeUseDiscountable" => false,
                        "brand" => "BACPQOvgJog",
                        "user" => "UACPQLgRkLY",
                        "design" => ""
                    ]
                )
        );

        return $this->sendResponse($data);
        $result = '{
            "media": [
                {
                    "id": "M77yZOBsXH",
                    "brand": "BACPQOvgJog",
                    "user": "UAAMMQvPszs",
                    "importBucket": "import.canva.com",
                    "importKey": "BABj9f0X1bg/2-11-2019/newpngelement17a.png",
                    "importFilename": "newpngelement17a.png",
                    "type": "RASTER",
                    "bundle": {
                        "version": 1,
                        "importVersion": "zQZEJMH0mSIXWGd0q5.9QIAzvhh8bWaz",
                        "listed": true,
                        "importState": "IMPORTED",
                        "status": "APPROVED",
                        "reviewedBy": "UAAJg4BFhGQ",
                        "reviewedDate": 1549856788000,
                        "modifiedDate": 1566361451000,
                        "title": "Horizontal Rectangular Polaroid",
                        "description": "",
                        "background": false,
                        "cutout": false,
                        "isolated": false,
                        "photoholder": false,
                        "textholder": false,
                        "repeating": false,
                        "recolorable": false,
                        "colorSpace": "RGB",
                        "ageRating": "GENERAL",
                        "keywords": [
                            {
                                "locale": "en",
                                "text": "newpngelement"
                            },
                            {
                                "locale": "en",
                                "text": "polaroid"
                            },
                            {
                                "locale": "en",
                                "text": "photo"
                            },
                            {
                                "locale": "en",
                                "text": "photography"
                            },
                            {
                                "locale": "en",
                                "text": "vintage"
                            },
                            {
                                "locale": "en",
                                "text": "print"
                            },
                            {
                                "locale": "en",
                                "text": "instax"
                            },
                            {
                                "locale": "en",
                                "text": "rectangle"
                            },
                            {
                                "locale": "en",
                                "text": "horizontal"
                            },
                            {
                                "locale": "en",
                                "text": "landscape"
                            }
                        ],
                        "processedFiles": [
                            {
                                "bucket": "media-private.canva.com",
                                "key": "MADRQwuex6w/1/print.png",
                                "page": 0
                            }
                        ],
                        "files": [
                            {
                                bucket: ""
                                height: 200
                                key: ""
                                page: 0
                                quality: "THUMBNAIL"
                                spritesheet: false
                                url: "//localhost:8082/assets/static/icons/V0E9PQ__/M77yZOBsXH/kK.png"
                                urlDenied: false
                                watermarked: false
                                width: 163
                            },
                            {
                                "page": 0,
                                "quality": "SCREEN",
                                "bucket": "media-public.canva.com",
                                "key": "MADRQwuex6w/1/screen.png",
                                "width": 800,
                                "height": 633,
                                "watermarked": false,
                                "spritesheet": false,
                                "url": "https://media-public.canva.com/MADRQwuex6w/1/screen.png",
                                "urlDenied": false
                            }
                        ],
                        "files_": [
                            {
                                bucket: ""
                                height: 200
                                key: ""
                                page: 0
                                quality: "THUMBNAIL"
                                spritesheet: false
                                url: "//localhost:8082/assets/static/icons/V0E9PQ__/M77yZOBsXH/kK.png"
                                urlDenied: false
                                watermarked: false
                                width: 163
                            },
                            {
                                "page": 0,
                                "quality": "SCREEN",
                                "bucket": "media-public.canva.com",
                                "key": "MADRQwuex6w/1/screen.png",
                                "width": 800,
                                "height": 633,
                                "watermarked": false,
                                "spritesheet": false,
                                "url": "https://media-public.canva.com/MADRQwuex6w/1/screen.png",
                                "urlDenied": false
                            }
                        ],
                        "componentMedia": [],
                        "licensing": "FREE",
                        "contentMetadata": {
                            "title": "Horizontal Rectangular Polaroid",
                            "description": "",
                            "keywords": [
                                {
                                    "locale": "en",
                                    "text": "newpngelement"
                                },
                                {
                                    "locale": "en",
                                    "text": "polaroid"
                                },
                                {
                                    "locale": "en",
                                    "text": "photo"
                                },
                                {
                                    "locale": "en",
                                    "text": "photography"
                                },
                                {
                                    "locale": "en",
                                    "text": "vintage"
                                },
                                {
                                    "locale": "en",
                                    "text": "print"
                                },
                                {
                                    "locale": "en",
                                    "text": "instax"
                                },
                                {
                                    "locale": "en",
                                    "text": "rectangle"
                                },
                                {
                                    "locale": "en",
                                    "text": "horizontal"
                                },
                                {
                                    "locale": "en",
                                    "text": "landscape"
                                }
                            ],
                            "superKeywords2": [],
                            "tags": [],
                            "ethnicities": []
                        },
                        "fileSize": 856406,
                        "localizedMetadata": {
                            "en": {
                                "locale": "en",
                                "title": "Horizontal Rectangular Polaroid",
                                "description": "",
                                "keywords": [
                                    "newpngelement",
                                    "polaroid",
                                    "photo",
                                    "photography",
                                    "vintage",
                                    "print",
                                    "instax",
                                    "rectangle",
                                    "horizontal",
                                    "landscape"
                                ],
                                "superKeywords": []
                            }
                        }
                    },
                    "deactivated": false,
                    "oneTimeUseDiscountable": false,
                    "restrictedAccess": false,
                    "aclAllowedActions": [],
                    "acl": [],
                    "created": 1570010798000,
                    "updated": 1570010798000
                }
            ]
        }';
        $responseHeader = "'\"])}while(1);</x>//";
        return response()->make($responseHeader.$result, 200, ['CONTENT_TYPE' => 'application/json']);
    }

    public function media(Request $request, $mediaId)
    {
        $includeImportFileUrl = $request->includeImportFileUrl;
        $projection = $request->projection;

        $photo = PhotoHelper::getFromMediaId($mediaId);
        if (!$photo) return $this->sendResponse(['success' => false]);
        $json = $photo->JsonModel();
        $json['bundle']['status'] = "APPROVED";
        $json['bundle']['importFileUrl'] = PhotoHelper::getPhotoUrl($photo, 'ourl');

        return $this->sendResponse($json);
    }

    public function uploadMedia(Request $request)
    {
        $file = $request->file;
        $restricted = $request->restricted;
        $listed = $request->listed;
        $fileSize = $request->fileSize;

        $fileNames = explode('.', $file);
        if ( count($fileNames) > 1 && $fileNames[1] == 'svg' ){
            $mediaId = MediaIdHelper::generate('VECTOR');
        } else {
            $mediaId = MediaIdHelper::generate('RASTER');
        }

        $data = [
            "id" => $mediaId,
            "importKey" => "",
            "importBucket" => "",
            "importFilename" => "",
            "type" => "VECTOR",
            "copyright" => "",
            "bundle" => [
                "licensing" => "FREE",
                "version" => 1,
                "restrictedAccess" => false,
                "listed" => false,
                "status" => "PENDING_SUBMISSION",
                "rejectionReason" => "rejectionReason",
                "importState" => "PENDING_IMPORT",
                "importMessage" => "importMessage",
                "designVersion" =>  1,
                "designType" => "",
                "artist" => "",
                "title" => "",
                "titles" => "",
                "description" => "",
                "descriptions" => "",
                "locale" => null,
                "background" => false,
                "cutout" => false,
                "isolated" => false,
                "photoholder" => false,
                "textholder" => false,
                "repeating" => false,
                "recolorable" => false,
                "superKeywords" => [],
                "keywords" => [],
                "files" => NULL,
                "quality" => "",
                "ageRating" => null,
                "spritesheetMetadata" => "",
                "submittedBy" => "",
                "submittedDate" => "",
                "reviewedBy" => "",
                "reviewedDate" => ""
            ],
            "deactivated" => false,
            "oneTimeUseDiscountable" => false,
            "brand" => "BACPQOvgJog",
            "user" => Auth::user()->uid,
            "design" => ""
        ];

        return $this->sendResponse($data);
    }

    public function getMedia(Request $request, $mediaId, $versionId)
    {
        //media/myupload/1?form&signatureV4&mimeType=image%2Fpng
        if ($request->has('form') && $request->has('signatureV4')){
            return $this->sendResponse(
                [
                    'key' => $mediaId,
                    'awsAccessKeyId' => $mediaId,
                    'RV' => $mediaId,
                    'policy' => 'policy',
                    'signature' => 'signature',
                    'postUrl' => '/api/media/' . $mediaId . '/aws/upload'
                ]
            );    
        }

        if ($request->staging){
            $photo = PhotoHelper::getFromMediaId($mediaId);
            if (!$photo) return $this->sendResponse(['success' => false]);
            $json = $photo->JsonModel();
            $json['bundle']['status'] = 'APPROVED';

            return $this->sendResponse($json);
        }
    }

    public function uploadAWSMedia(Request $request, $mediaId){
        $user = Auth::user();

        if ($file = $request->file('file')){
            $name = time().$file->getClientOriginalName();
        }

        $input = [];
        $input['file'] = $request->file('file');
        $input['licensing'] = 1;
        $input['title'] = $user->name . "'s upload image";
        $input['mediaId'] = $mediaId;
        $input['user_id'] = $user->id;

        $rules = [
            'file' => 'required|mimes:jpeg,jpg,png|photo_extension'
        ];
        $validator = Validator::make($input, $rules);

        if ($validator->fails()){
            return response()->json([
                'success' => false,
                'errors' =>$validator->getMessageBag()->toArray()
            ]);
        }

        $data = new Nphoto;
        $data->fill($input)->save();

        $id = $data->id;
        $mediaFolder = CryptorHelper::encrypt((int)($id/1000));

        if ($file = $request->file('file')){
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

            SystemHelper::createDirectory($public_prefix.'/'.$mediaId);
            SystemHelper::createDirectory($storage_prefix.'/'.$mediaId);

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
                $newimg->line(0,0,$newdim['w'], $newdim['h'], function($iimg){
                    $iimg->color('#ffffff');
                });
                $newimg->line($newdim['w'],0,0, $newdim['h'], function($iimg){
                    $iimg->color('#ffffff');
                });
                $newimg = $newimg->save($p_path.$swurl.$ext);
                
            }

            $data->update($input);
        }

        return response()->make(
            json_encode([
                'success' => true
            ]), 200, 
            [
                'CONTENT_TYPE' => 'application/json',
                'x-amz-version-id' => $mediaId
            ]
        );
    }

    public function uploadMediaImport(Request $request, $mediaId, $versionId)
    {
        $photo = PhotoHelper::getFromMediaId($mediaId);
        if ($request->deactivated)
        {
            $user = Auth::user();
            if ($user->id == $photo->user_id){
                PhotoHelper::destroy($photo);
                return $this->sendResponse(['success' => true]);
            } else {
                return $this->sendError();
            }
        }

        $folderKey = $request->folderKey;
        $importVersion = $request->importVersion;
        $isPaid = $request->isPaid;

        $folder = FolderHelper::getFromMediaId($folderKey);
        if (!$folder || !$photo) return $this->sendError();

        $designFolder = MediaFolder::create([
            'nphoto_id' => $photo->id,
            'folder_id' => $folder->id
        ]);
        
        $json = $photo->JsonModel();
        $json['bundle']['status'] = "APPROVED";

        $data = [
            "media" => $json
        ];
        return $this->sendResponse($data);
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
}
