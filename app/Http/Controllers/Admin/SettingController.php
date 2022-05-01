<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Currency;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Validator;

class SettingController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        return view('admin.setting.index');
    }
}
