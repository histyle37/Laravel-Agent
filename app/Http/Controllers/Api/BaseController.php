<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;

class BaseController extends Controller
{
    public $responseHeader = "'\"])}while(1);</x>//";
    public function __construct()
    {
        
    }

    public function sendResponse($jsonData, $statusCode = 200){
        return response()->make($this->responseHeader.json_encode($jsonData), 200, ['CONTENT_TYPE' => 'application/json']);
    }

    public function sendCSRFResponse($csrf_token, $statusCode = 200){
        return response()->make($this->responseHeader.$csrf_token, 200, ['CONTENT_TYPE' => 'application/json']);
    }

    public function sendError()
    {
        return response()->make($this->responseHeader.json_encode(['success' => false]), 200, ['CONTENT_TYPE' => 'application/json']);
    }
}
