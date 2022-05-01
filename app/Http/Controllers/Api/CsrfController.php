<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;
use Carbon\Carbon;
use Auth;

use App\Classes\TokenHelper;

class CsrfController extends BaseController
{
    protected $tokenHelper;
    protected $user;

    public function __construct()
    {
        $this->tokenHelper = new TokenHelper;
        $this->user = Auth::user();
    }

    //GET REQUEST
    public function documents(){
        $data = [ $this->tokenHelper->generate() ];
        return $this->sendResponse($data);
    }

    //GET REQUEST
    public function metrics(){
        $data = [ $this->tokenHelper->generate() ];
        return $this->sendResponse($data);
    }

    //GET REQUEST
    public function search(){
        $data = [ $this->tokenHelper->generate() ];
        return $this->sendResponse($data);
    }

    //GET REQUEST
    public function billing()
    {
        $data = [ $this->tokenHelper->generate() ];
        return $this->sendResponse($data);
    }

    //GET REQUEST
    public function _export()
    {
        $data = [ $this->tokenHelper->generate() ];
        return $this->sendResponse($data);
    }

    //GET REQUEST
    public function notifications()
    {
        $data = [ $this->tokenHelper->generate() ];
        return $this->sendResponse($data);
    }

    //GET REQUEST
    public function folders(){
        $data = [ $this->tokenHelper->generate() ];
        return $this->sendResponse($data);
    }

    //GET REQUEST
    public function social()
    {
        $data = [ $this->tokenHelper->generate() ];
        return $this->sendResponse($data);
    }
    
}
