<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;
use Auth;
use Carbon\Carbon;

use App\Models\User;

class CommentController extends BaseController
{
    public function __construct()
    {
    }

    public function docComments($docId, Request $request){
        $user = Auth::user();
        $limit = $request->limit;

        $user1 = User::find(27);

        $data = array(
            "comments" => [
                [
                    "object" => $docId,
                    "id" => "asdf",
                    "authorId" => $user->uid,
                    "author" => $user->JsonModel(),
                    "content" => "[". $user->uid .":B1234567890]",
                    "created" => (int)Carbon::now()->format('U'),
                    "updated" => (int)Carbon::now()->format('U'),
                    "deleter" => null,
                    "resolved" => false,
                    "latestReply" => [
                        "object" => $docId,
                        "threadId" => "asdf",
                        "id" => "rid",
                        "authorId" => $user1->uid,
                        "author" => $user1->JsonModel(),
                        "content" => "[". $user1->uid .":B1234567890]",
                        "created" => (int)Carbon::now()->format('U'),
                        "updated" => (int)Carbon::now()->format('U'),
                        "deleter" => null
                    ],
                    "replyCount" => 1
                ],
                [
                    "object" => $docId,
                    "id" => "asdf1",
                    "authorId" => $user1->uid,
                    "author" => $user1->JsonModel(),
                    "content" => "[". $user1->uid .":B1234567890]",
                    "created" => (int)Carbon::now()->format('U'),
                    "updated" => (int)Carbon::now()->format('U'),
                    "deleter" => null,
                    "resolved" => false,
                    "latestReply" => [
                        "object" => $docId,
                        "threadId" => "asdf1",
                        "id" => "rid1",
                        "authorId" => $user->uid,
                        "author" => $user->JsonModel(),
                        "content" => "[". $user->uid .":B1234567890]",
                        "created" => (int)Carbon::now()->format('U'),
                        "updated" => (int)Carbon::now()->format('U'),
                        "deleter" => null
                    ],
                    "replyCount" => 0
                ]
            ],
            "continuation" => ""
        );
        return $this->sendResponse($data);
    }

    public function saveDocComments($docId, Request $request)
    {
        $content = $request->content;
        $object = $request->object; //docId
        
        $data = [
            "id" => "123456",
            "created" => (int)Carbon::now()->format('U')
        ];
        return $this->sendResponse($data);
    }
}
