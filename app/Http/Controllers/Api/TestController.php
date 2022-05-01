<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;
use Carbon\Carbon;


class TestController extends BaseController
{
    public $key = 'pMvomkHO76jpdc8rrSZ3UjXiKKa7NdYKnYRf1tFhGMs=';
    public $cipher = 'AES-256-CBC';

    public function __construct()
    {
    }

    public function index(){
        return [
            'stauts' => '1',
            'message' => Carbon::now()->format('Y-m-d H:i:s')
        ];
    }

}
