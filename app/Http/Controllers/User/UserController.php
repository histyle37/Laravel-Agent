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
use App\Models\Subscription;
use App\Models\Generalsetting;
use App\Models\UserSubscription;
use App\Models\FavoriteSeller;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = Auth::user();
        return view('user.account',compact('user'));
    }

    public function brand()
    {
        $user = Auth::user();
        return view('user.brand',compact('user'));
    }
}
