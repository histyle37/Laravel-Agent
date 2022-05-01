<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;

class TemplateController extends BaseController
{
    public function __construct()
    {
    }

    public function get(){
        $result = array(
            "items" => 
            [
                array(
                    "type" => "DESIGN",
                    "name" => "test",
                    "id" => "testid"
                )
            ],
            "folder" => []
        );
        return $this->sendResponse($result);
    }
}
