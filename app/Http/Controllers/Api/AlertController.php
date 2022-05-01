<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Auth;

class AlertController extends BaseController
{
    public function __construct()
    {
    }

    public function active(){
        $data = 
        [
            "fonts"=> []
        ];

        return $this->sendResponse($data);
    }
}
