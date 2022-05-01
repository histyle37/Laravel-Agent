<?php
namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;
use Carbon\Carbon;

use App\Models\Design;

use App\Classes\DesignHelper;
use App\Classes\LayoutHelper;
use App\Classes\SystemHelper;
use App\Classes\ImageGenerator;
use App\Classes\MediaIdHelper;

use Config;
use Auth;

class DocumentController extends BaseController
{
    public function __construct()
    {
        $this->layoutHelper = new LayoutHelper;
    }

    public function doctypes()
    {
        $data = array(
            'success' => true
        );

        return $this->sendResponse($data);
    }

    //POST REQUEST
    public function savecontent($id, Request $request){
        //GET PARAMS
        $version = $request->version;
        $session = $request->session;
        //POST PARAMS
        $canvaDefaultFonts = $request->canvaDefaultFonts;
        $defaultFonts = $request->defaultFonts;
        $doctype = $request->doctype;
        $layout = $request->layout;
        $pages = $request->pages;
        $palette = $request->palette;
        $title = empty($request->title) ? "Untitled Design" : $request->title;

        $mediaId = $id;

        if ($doctype['type'] == "INLINE"){
            //custom
            $width = $doctype['width'];
            $height = $doctype['height'];
            $units = $doctype['units'];

            $_layout = $this->layoutHelper->newCustomLayout($width, $height, $units);
        } else {
            $uid = $doctype['id'];
            $_layout = $this->layoutHelper->getFromUId($uid);
        }
        $design = DesignHelper::getFromMediaId($mediaId);
        
        $thumbnail_dimension = $this->layoutHelper->getThumbnailDimension($_layout);
        $PXDimensions = $this->layoutHelper->getLayoutPXDimension($_layout);
        $thumbnail_scale = $thumbnail_dimension['width'] / $PXDimensions['width'];
        $thumbnail_name = DesignHelper::generateThumbnailName();

        if ($design == null)
        {
            //CREATE NEW DESIGN
            $design = Design::create([
                'mediaId' => $mediaId,
                'name' => $title,
                'version' => 1,
                'thumbnail_width' => $thumbnail_dimension['width'],
                'thumbnail_height' => $thumbnail_dimension['height'],
                'thumbnail_name' => $thumbnail_name,
                'user_id' => 22,
                'type' => DesignHelper::getTypeId($doctype),
                'layout_id' => DesignHelper::getLayoutId($layout),
                'width' => $_layout->width,
                'height' => $_layout->height,
                'docunit_id' => $_layout->docunit_id,
                'pages' => json_encode($pages)
            ]);
        }
        else 
        {
            $version++;
            $old_thumbnial_url = DesignHelper::getPhotoUrl($design, true);
            //UPDATE DESIGN
            $isSuccess = $design->update([
                'name' => $title,
                'version' => $version,
                'thumbnail_width' => $thumbnail_dimension['width'],
                'thumbnail_height' => $thumbnail_dimension['height'],
                'thumbnail_name' => $thumbnail_name,
                'user_id' => 22,
                'type' => DesignHelper::getTypeId($doctype),
                'layout_id' => DesignHelper::getLayoutId($layout),
                'width' => $_layout->width,
                'height' => $_layout->height,
                'docunit_id' => $_layout->docunit_id,
                'pages' => json_encode($pages)
            ]);

            if ($isSuccess) {
                SystemHelper::deleteFile($old_thumbnial_url);
            }
        }

        $page = (!empty($pages) && is_array($pages)) ? $pages[0] : null;
        
        if ($page) {
            $isThrottle = true;

            $elements = $page["elements"];
            $height = $page["height"];
            $width = $page["width"];

            $imageGenerator = new ImageGenerator();
            $thumbnail_url = DesignHelper::getPhotoUrl($design, true);
            $folderpath = DesignHelper::getDirectory($design);
            SystemHelper::createDirectory($folderpath);
            
            $imageGenerator->generateThumbnail($thumbnail_dimension['width'], $thumbnail_dimension['height'], $elements, $thumbnail_url, $thumbnail_scale);
        
        } else {
            $isThrottle = false;
        }

        $pageCount = count($pages);
        
        $data = array(
            "throttle" => $isThrottle,
            "document" => array(
                "draft" => array(
                    "version" => $design->version,
                    "session" => (int)Carbon::now()->format('U'),
                    "pageCount" => $pageCount
                ),
                "id" => $id,
                "version" => $design->version
            ),
            "session" => (int)Carbon::now()->format('U'),
            "sessionExpiresAt" => (int)Carbon::now()->addDay(10)->format('U'),
        );

        return $this->sendResponse($data);
    }

    //POST REQUEST
    public function savetitle($id, Request $request)
    {
        $version = $request->version;
        $session = $request->session;
        $title = $request->title;
        
        $design = DesignHelper::getFromMediaId($id);
        if (is_null($design)){
            $isThrottle = false;
        } else {
            $isThrottle = true;
            $design->update(['name' => $title]);
        }

        $pageCount = count(json_decode($design->pages));

        $data = array(
            "throttle" => $isThrottle,
            "document" => array(
                "draft" => array(
                    "version" => $design->version,
                    "session" => (int)Carbon::now()->format('U'),
                    "pageCount" => $pageCount
                ),
                "id" => $id,
                "version" => $design->version
            ),
            "session" => (int)Carbon::now()->format('U'),
            "sessionExpiresAt" => (int)Carbon::now()->addDay(10)->format('U'),
        );

        return $this->sendResponse($data);
    }

    //POST REQUEST
    public function savepagecontent($id, $page_id, Request $request){
        $elements = $request->elements;
        $height = $request->height;
        $width = $request->width;
        $layout = $request->layout;

        $design = DesignHelper::getFromMediaId($id);
        if (is_null($design)){
            $isThrottle = false;
        } else {
            $isThrottle = true;
            $pages = json_decode($design->pages);
            $pages[$page_id] = array(
                "elements" => $elements,
                "width" => $width,
                "height" => $height,
                "layout" => $layout,
            );

            if ($page_id == 0){
                $old_thumbnial_url = DesignHelper::getPhotoUrl($design, true);
                $thumbnail_name = DesignHelper::generateThumbnailName();
                //UPDATE DESIGN
                $isSuccess = $design->update([
                    'thumbnail_name' => $thumbnail_name,
                    'pages' => json_encode($pages)
                ]);

                if ($isSuccess) {
                    SystemHelper::deleteFile($old_thumbnial_url);
                }

                $thumbnail_dimension = DesignHelper::getThumbnailDimension($design);
                $PXDimensions = DesignHelper::getPXDimension($design);
                $thumbnail_scale = ($thumbnail_dimension['width'] / $PXDimensions['width']);

                $imageGenerator = new ImageGenerator();
                $thumbnail_url = DesignHelper::getPhotoUrl($design, true);
                $imageGenerator->generateThumbnail($thumbnail_dimension['width'], $thumbnail_dimension['height'], $elements, $thumbnail_url, $thumbnail_scale);
            } else {
                $isSuccess = $design->update([
                    'pages' => json_encode($pages)
                ]);
                if ($isSuccess) {
                    $isThrottle = false;
                }
            }
        }

        $data = array(
            "throttle" => $isThrottle,
            "document" => array(
                "draft" => array(
                    "version" => 8,
                    "session" => (int)Carbon::now()->format('U'),
                    "pageCount" => 1
                ),
                "id" => $id,
                "version" => 7
            ),
            "session" => 191380057,
            "sessionExpiresAt" => 1621489410
        );
        
        return $this->sendResponse($data);
    }

    //GET REQUEST
    public function expanded(){
        $expandedDocumentCreationOptionGroups = $this->layoutHelper->expandedDocumentCreationOptionGroups();
        $data = array(
            'groups' => $expandedDocumentCreationOptionGroups
        );

        return $this->sendResponse($data);
    }

    //GET REQUEST
    public function get(Request $request){
        $user = Auth::user();
        $documents = $user->designs->map(function($design){
            return $design->JsonDocumentModel();
        });

        $data = [
            "documents" => $documents
        ];
        return $this->sendResponse($data);
    }

    //GET REQUEST
    public function getdocument($id, Request $request){
        $includePages = $request->includePages;
        $design = DesignHelper::getFromMediaId($id);
        $document = $design->JsonDocumentModel();
        $data = [
            "document" => $document,
            "fonts"=> [],
            "mediaMap"=> DesignHelper::getMediaMap($design),
            "videos"=> [],
            "audio"=> [],
            "embeds"=> [],
            "accessRole"=> "OWNER"
        ];
        return $this->sendResponse($data);
        
        $result = '
        {
            "document":  
            {
                "id": "'.$id.'",
                "owningBrand": "BACzFzkHvhY",
                "creationDate": 1617701625991,
                "extensions": {
                    "default": "arovdn4vLVBW8RYAxXQZng",
                    "view": "dYuqcwGStWdqzYmwI4q7Cw",
                    "remix": "3_po0CKlHpCW4KwafbhOqw",
                    "edit": "64V1vxYKZizsojcmcskGOA"
                },
                "tags": [
                    "content_updated_by:web"
                ],
                "acl": {
                    "rules": [
                        {
                            "type": "EXTENSION",
                            "owningBrandOnly": false,
                            "role": "VIEWER",
                            "origin": {
                                "type": "MANUAL"
                            }
                        },
                        {
                            "type": "DEFAULT",
                            "role": "NONE",
                            "origin": {
                                "type": "MANUAL"
                            }
                        },
                        {
                            "type": "USER",
                            "principal": {
                                "brand": "BACzFzkHvhY",
                                "user": "UACzF3EAwcA"
                            },
                            "role": "OWNER",
                            "origin": {
                                "type": "MANUAL"
                            }
                        }
                    ],
                    "invites": [],
                    "version": 1,
                    "owner": {
                        "brand": "BACzFzkHvhY",
                        "user": "UACzF3EAwcA"
                    }
                },
                "brandTemplate": false,
                "draft": {
                    "content": {
                        "canvaDefaultFonts": {
                            "title": {
                                "fontSize": 42,
                                "fontFamily": "AbhayaLibre-ExtraBold"
                            },
                            "subtitle": {
                                "fontSize": 24,
                                "fontFamily": "AbhayaLibre-ExtraBold"
                            },
                            "body": {
                                "fontSize": 16,
                                "fontFamily": "AbhayaLibre-ExtraBold"
                            }
                        },
                        "defaultFonts": {
                            "title": {},
                            "subtitle": {},
                            "body": {}
                        },
                        "layout": "TABQqumtl1k",
                        "doctype": {
                            "type": "REFERENCE",
                            "id": "TABQqumtl1k",
                            "version": 1
                        },
                        "pages": [
                            {
                                "elements": [
                                    {
                                        "elementIndex": 0,
                                        "left": 43.69397590361447,
                                        "top": 305.2337349397591,
                                        "width": 394,
                                        "height": 60,
                                        "rotation": 0,
                                        "transparency": 0,
                                        "userEdited": true,
                                        "type": "text",
                                        "style": "title",
                                        "stylesOverriden": {
                                            "fontSize": true
                                        },
                                        "index": 0,
                                        "html": "Learning Photoshop",
                                        "bold": false,
                                        "fontFamily": "AbhayaLibre-ExtraBold",
                                        "fontSize": 32,
                                        "italic": false,
                                        "justification": "center"
                                    }
                                ],
                                "width": 480,
                                "height": 672,
                                "layout": {
                                    "id": "MAB_glCtEyQ",
                                    "version": 2
                                }
                            }
                        ],
                        "palette": [],
                        "title": "Learning Photoshop"
                    },
                    "schema": "web-2",
                    "schemaFamily": "v2",
                    "version": 0,
                    "timestamp": 1617701727126,
                    "untouched": false,
                    "pageCount": 1,
                    "imageSets": {
                        "thumbnail": {
                            "height": 133,
                            "width": 200,
                            "version": 0,
                            "images": [
                                {
                                    "bucket": "static.canva.com",
                                    "key": "default_thumbnail.gif",
                                    "page": 0,
                                    "url": "https://static.canva.com/default_thumbnail.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQYCGKMUHWDTJW6UD%2F20210405%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210405T192734Z&X-Amz-Expires=56029&X-Amz-Signature=3954485d11ff64c395bf29cd4350aed0b8abaaae2116e42165157d499f5013af&X-Amz-SignedHeaders=host&response-expires=Tue%2C%2006%20Apr%202021%2011%3A01%3A23%20GMT"
                                }
                            ]
                        },
                        "preview": {
                            "height": 532,
                            "width": 800,
                            "version": 0,
                            "images": [
                                {
                                    "bucket": "static.canva.com",
                                    "key": "default_preview.gif",
                                    "page": 0,
                                    "url": "https://static.canva.com/default_preview.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQYCGKMUHWDTJW6UD%2F20210406%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210406T045630Z&X-Amz-Expires=23037&X-Amz-Signature=f59339e6bf2042c90ec9db194d245778de423a425ee0b587a8bed1abcb97030a&X-Amz-SignedHeaders=host&response-expires=Tue%2C%2006%20Apr%202021%2011%3A20%3A27%20GMT"
                                }
                            ]
                        }
                    }
                },
                "version": 3,
                "timestamp": 1617701727127,
                "contributors": {
                    "UACzF3EAwcA": 1617701727126
                }
            },
            "fonts": [],
            "mediaMap": [],
            "videos": [],
            "audio": [],
            "embeds": [],
            "accessRole": "OWNER"
        }';
        $responseHeader = "'\"])}while(1);</x>//";
        return response()->make($responseHeader.$result, 200, ['CONTENT_TYPE' => 'application/json']);
    }

    public function getmedia($id, Request $request)
    {
        $design = DesignHelper::getFromMediaId($id);
        $mediaMaps = DesignHelper::getMediaMap($design);
        $medias = [];
        foreach($mediaMaps as $key => $value){
            $media = [
                'id' => $key,
                'version' => 1,
                'images' => $value["1"]
            ];
            array_push($medias, $media);
        }
        return $this->sendResponse($medias);
    }

    //POST REQUEST
    public function postdocument(Request $request, $id){
        if ($request->has('trash')){
            $design = DesignHelper::getFromMediaId($id);
            $design->is_trashed = 1;
            $design->deleted_at = Carbon::now();
            $design->save();

            $user = Auth::user();
            
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
            
            $data = array(
                'success' => true
            );
    
            return $this->sendResponse($data);
        }

        if ($request->has('untrash')){
            $design = DesignHelper::getFromMediaId($id);
            $design->is_trashed = 0;
            $design->deleted_at = null;
            $design->save();

            $data = array(
                'success' => true
            );
    
            return $this->sendResponse($data);
        }

        if ($request->has('delete')){
            $design = DesignHelper::getFromMediaId($id);

            $thumbnail_path = DesignHelper::getPhotoUrl($design, $isfile=true);
            $directory_path = DesignHelper::getDirectory($design);
            SystemHelper::deleteFile($thumbnail_path);
            SystemHelper::destroyDirectory($directory_path, $remove_folder = true);

            $design->designFolders()->delete();
            $design->delete();

            $data = array(
                'success' => true
            );
    
            return $this->sendResponse($data);
        }
       
        $result = '{}';
        $responseHeader = "'\"])}while(1);</x>//";
        return response()->make($responseHeader.$result, 200, ['CONTENT_TYPE' => 'application/json']);
    }
    
    //POST REQUEST
    public function duplicate(Request $request)
    {
        $colorReplacements = $request->colorReplacements;
        $id = $request->id;
        $title = $request->title;

        $design = DesignHelper::getFromMediaId($id);
        $thumbnail_path = DesignHelper::getPhotoUrl($design, $isfile=true);

        $input = $design->toArray();
        $mediaId = MediaIdHelper::generate();
        $thumbnail_name = DesignHelper::generateThumbnailName();

        $data = new Design;
        $input['name'] = $title;
        $input['mediaId'] = $mediaId;
        $input['thumbnail_name'] = $thumbnail_name;
        $data->fill($input)->save();

        $new_thumbnail_path = DesignHelper::getPhotoUrl($data, $isfile=true);

        $folderpath = DesignHelper::getDirectory($data);
        SystemHelper::createDirectory($folderpath);

        copy($thumbnail_path, $new_thumbnail_path);

        $document = array(
            "id"=> $data->mediaId,
            "owningBrand"=> "BACzFzkHvhY",
            "creationDate"=> 1617701625991,
            "origin"=> array(
                "id"=> "xyz123",
                "version"=> 1
            ),
            "extensions"=> array(
                "default"=> "arovdn4vLVBW8RYAxXQZng",
                "view"=> "dYuqcwGStWdqzYmwI4q7Cw",
                "remix"=> "3_po0CKlHpCW4KwafbhOqw",
                "edit"=> "64V1vxYKZizsojcmcskGOA"
            ),
            "tags"=> [
                "content_updated_by:web"
            ],
            "acl"=> [
                "rules"=> [
                    [
                        "type"=> "EXTENSION",
                        "owningBrandOnly"=> false,
                        "role"=> "VIEWER",
                        "origin"=> [
                            "type"=> "MANUAL"
                        ]
                    ],
                    [
                        "type"=> "DEFAULT",
                        "role"=> "NONE",
                        "origin"=> [
                            "type"=> "MANUAL"
                        ]
                    ],
                    [
                        "type"=> "USER",
                        "principal"=> [
                            "brand"=> "BACzFzkHvhY",
                            "user"=> "UACzF3EAwcA"
                        ],
                        "role"=> "OWNER",
                        "origin"=> [
                            "type"=> "MANUAL"
                        ]
                    ]
                ],
                "invites"=> [],
                "version"=> 1,
                "owner"=> [
                    "brand"=> "BACzFzkHvhY",
                    "user"=> "UACzF3EAwcA"
                ]
            ],
            "brandTemplate"=> false,
            "draft"=> [
                "content"=> 
                [
                    "canvaDefaultFonts"=> [
                        "title"=> [
                            "fontSize"=> 42,
                            "fontFamily"=> "AbhayaLibre-ExtraBold"
                        ],
                        "subtitle"=> [
                            "fontSize"=> 24,
                            "fontFamily"=> "AbhayaLibre-ExtraBold"
                        ],
                        "body"=> [
                            "fontSize"=> 16,
                            "fontFamily"=> "AbhayaLibre-ExtraBold"
                        ]
                    ],
                    "defaultFonts"=> [
                        "title"=> [],
                        "subtitle"=> [],
                        "body"=> []
                    ],
                    "layout"=> "LYT-VW0KLG",
                    "doctype"=> [
                        "type"=> "REFERENCE",
                        "id"=> "LYT-VW0KLG",
                        "version"=> 1
                    ],
                    "pages"=> [
                        [
                            "elements"=> [],
                            "width"=> 321.26,
                            "height"=> 188.98,
                            "layout"=> [
                                "id"=> "LYT-VW0KLG",
                                "version"=> 1
                            ]
                        ]
                    ],
                    "palette"=> [],
                    "title"=> ""
                ],
                "schema"=> "web-2",
                "schemaFamily"=> "v2",
                "version"=> 0,
                "timestamp"=> 1617701727126,
                "untouched"=> false,
                "pageCount"=> 1,
                "imageSets"=> [
                    "thumbnail"=> [
                        "height"=> 133,
                        "width"=> 200,
                        "version"=> 0,
                        "images"=> [
                            [
                                "bucket"=> "static.canva.com",
                                "key"=> "default_thumbnail.gif",
                                "page"=> 0,
                                "url"=> "https://static.canva.com/default_thumbnail.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQYCGKMUHWDTJW6UD%2F20210405%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210405T192734Z&X-Amz-Expires=56029&X-Amz-Signature=3954485d11ff64c395bf29cd4350aed0b8abaaae2116e42165157d499f5013af&X-Amz-SignedHeaders=host&response-expires=Tue%2C%2006%20Apr%202021%2011%3A01%3A23%20GMT"
                            ]
                        ]
                    ],
                    "preview"=> [
                        "height"=> 532,
                        "width"=> 800,
                        "version"=> 0,
                        "images"=> [
                            [
                                "bucket"=> "static.canva.com",
                                "key"=> "default_preview.gif",
                                "page"=> 0,
                                "url"=> "https://static.canva.com/default_preview.gif?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQYCGKMUHWDTJW6UD%2F20210406%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210406T045630Z&X-Amz-Expires=23037&X-Amz-Signature=f59339e6bf2042c90ec9db194d245778de423a425ee0b587a8bed1abcb97030a&X-Amz-SignedHeaders=host&response-expires=Tue%2C%2006%20Apr%202021%2011%3A20%3A27%20GMT"
                            ]
                        ]
                    ]
                ]
            ],
            "version"=> 3,
            "timestamp"=> 1617701727127,
            "trashed"=> [
                "timestamp"=> 1617701727127
            ],
            "contributors"=> [
                "UACzF3EAwcA"=> 1617701727126
            ]
        );

        $result = array(
            'document' => $document,
            'session' => (int)Carbon::now()->format('U')
        );
        return $this->sendResponse($result);
    }

    ////GET REQUEST
    public function search(Request $request)
    {
        $query = $request->query;
        $query = substr($query->get('query'), 0, -1);

        $searchId = str_random(11);
        $index = 0;
        $designs = Design::where('name', 'like', '%'.$query.'%')->get()->map(
            function($item) use ($index, $searchId){
                $result = $item->JsonSearchModel();
                $result['searchId'] = $searchId;
                $result['rank'] = $index;
                return $result;
            }
        );

        $result = array(
            "id" => $searchId,
            "totalHits" => 0,
            "continuation" => null,
            "results" => $designs
        );
        return $this->sendResponse($result);
    }
    
}
