<?php

namespace App\Http\Controllers\User;

use App\Classes\GeniusMailer;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Support\Facades\Input;
use Validator;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;

use App\Classes\LayoutHelper;
use App\Classes\Encrypter;

class DesignController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->layoutHelper = new LayoutHelper;
        $this->encrypter = new Encrypter;
    }

    public function index(Request $request)
    {
        $user = Auth::user();
        // var_dump($user->auth_token);
        // die();


        $compactDocumentCreationOptions = $this->layoutHelper->compactDocumentCreationOptions();
        $expandedDocumentCreationOptionGroups = $this->layoutHelper->expandedDocumentCreationOptionGroups();
        
        return view('user.mydesigns',compact('user', 'compactDocumentCreationOptions', 'expandedDocumentCreationOptionGroups'));
    }
}
