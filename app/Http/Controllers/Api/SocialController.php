<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Auth;

use App\Classes\DesignHelper;
use App\Classes\LayoutHelper;

class SocialController extends BaseController
{
    public function __construct()
    {
    }

    public function docProfile(Request $request, $docId){
        $user = Auth::user();

        $design = DesignHelper::getFromMediaId($docId);
        $layout = $design->layout;
        $layoutHelper = new LayoutHelper;
        $cdocType = $layoutHelper->cdocType($layout);
        // $data = [
        //     "document" => $document->JsonModel(),
        //     "mediaMap" => [],
        //     "accessRole" => []
        // ];
        $documentcontent = 
        [
            "id"=> $design->mediaId,
            "owningBrand"=> "BACzFzkHvhY",
            "creationDate"=> 1617701625991,
            "extensions"=> [
                "default"=> "arovdn4vLVBW8RYAxXQZng",
                "view"=> "dYuqcwGStWdqzYmwI4q7Cw",
                "remix"=> "3_po0CKlHpCW4KwafbhOqw",
                "edit"=> "64V1vxYKZizsojcmcskGOA"
            ],
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
                "content"=> [
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
                    "layout"=> "TABQqumtl1k",
                    "doctype"=> [
                        "type"=> "REFERENCE",
                        "id"=> "TABQqumtl1k",
                        "version"=> 1
                    ],
                    "pages"=> [
                        [
                            "elements"=> [
                                [
                                    "elementIndex"=> 0,
                                    "left"=> 43.69397590361447,
                                    "top"=> 305.2337349397591,
                                    "width"=> 394,
                                    "height"=> 60,
                                    "rotation"=> 0,
                                    "transparency"=> 0,
                                    "userEdited"=> true,
                                    "type"=> "text",
                                    "style"=> "title",
                                    "stylesOverriden"=> [
                                        "fontSize"=> true
                                    ],
                                    "index"=> 0,
                                    "html"=> "Learning Photoshop",
                                    "bold"=> false,
                                    "fontFamily"=> "AbhayaLibre-ExtraBold",
                                    "fontSize"=> 32,
                                    "italic"=> false,
                                    "justification"=> "center"
                                ]
                            ],
                            "width"=> 480,
                            "height"=> 672,
                            "layout"=> [
                                "id"=> "MAB_glCtEyQ",
                                "version"=> 2
                            ]
                        ]
                    ],
                    "palette"=> [],
                    "title"=> "Learning Photoshop"
                ],
                "schema"=> "web-2",
                "schemaFamily"=> "v2",
                "version"=> 4,
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
                                "url"=> "http://localhost:8082/assets/images/users/1557677677bouquet_PNG62.png"
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
                                "url"=> "http://localhost:8082/assets/images/users/1557677677bouquet_PNG62.png"
                            ]
                        ]
                    ]
                ]
            ],
            "version"=> 3,
            "timestamp"=> 1617701727127,
            "contributors"=> [
                "UACzF3EAwcA"=> 1617701727126
            ]
        ];

        $document = [
            "document" => $documentcontent,
            "documentType" => $cdocType,
            "owner" => $user->JsonModel(),
            "remixCount" => 1,
            "likerCount" => 1,
            "commentCount" => 1,
            "likedByMe" => true,
        ];

        $data = 
        [
            "document" => $document,
            "fonts"=> [],
            "mediaMap"=> [],
            "videos"=> [],
            "audio"=> [],
            "embeds"=> [],
            "accessRole" => "OWNER"
        ];

        return $this->sendResponse($data);
    }
}
