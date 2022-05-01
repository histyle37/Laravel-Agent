<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;

class NotificationController extends BaseController
{
    public function __construct()
    {
    }

    //GET REQUEST
    public function getUserNotfs(Request $request)
    {
        $limit = $request->limit;
        $unreadOnly = $request->unreadOnly;

        $document = array(
            "id"=> "DAEa4ZCMSF0",
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
                "content"=> [
                    "keywords"=> [],
                    "doctype"=> [
                        "type"=> "REFERENCE",
                        "id"=> "TAEB2h7V5Cw",
                        "version"=> 1
                    ]
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
        $user = array(
            "id" => "x",
            "username" => "x",
            "personalBrand" => "x",
            "displayName" => "x",
            "homepage" => "x",
            "city" => "x",
            "countryCode" => "US",
            "avatar" => array(
                "version" => 0,
                "sizes" => array(
                    "50" => array(
                        "size" => 50,
                        "width" => 50,
                        "height" => 50,
                        "url" => "/assets/images/users/1557677677bouquet_PNG62.png"
                    ),
                    "200" => array(
                        "size" => 200,
                        "width" => 200,
                        "height" => 200,
                        "url" => "/assets/images/users/1557677677bouquet_PNG62.png"
                    )
                ),
                "status" => "SUCCEEDED"
            ),
            "locale" => "en",
            "deactivated" => false,
        );

        $data = array(
            "events" => [
                array(
                    "identifier" => "a",
                    "topic" => "Test Topic",
                    "timestamp" => 12345678,
                    "type" => "COMMENT", //or "SOCIAL"
                    "event" => array(
                        "comment" => array(
                            "type" => "COMMENT", //"REPLY", "MENTION"
                            "user" => $user,
                            "document" => $document
                        ),
                        "social" =>array(
                            "type" => "FOLLOW", //LIKE, PUBLICIFY
                            "user" => $user,
                            "object" => array(
                                "type" => "DOCUMENT", //USER
                                "id" => "xxxx",
                                "document" => $document,
                                "user" => $user
                            )
                        )
                    )
                )
            ],
            "read" => 0,
            "continuation" => "C",
            "throttle" => true
        );

        return $this->sendResponse($data);
    }

    //POST REQUEST
    public function postUserNotfs(Request $request)
    {
        //user read action will be here
        //the notifications will be set to read status
        $read = $request->read;

        $data = array(
            'success' => true
        );

        return $this->sendResponse($data);
    }
}
