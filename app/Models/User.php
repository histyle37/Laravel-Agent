<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{

    protected $fillable = ['name', 'photo', 'zip','residency', 'city', 'country', 'address', 'phone', 'fax', 'email','password','affilate_code','verification_link','shop_name','owner_name','shop_number','shop_address','reg_number','shop_message','is_vendor','shop_details','shop_image','f_url','g_url','t_url','l_url','f_check','g_check','t_check','l_check','shipping_cost','date','mail_sent', 'auth_token'];


    protected $hidden = [
        'password', 'remember_token'
    ];

    public static function getFromUID($uid)
    {
        return User::where('uid', $uid)->first();
    }

    public function getPhotoUrl()
    {
        return asset('assets/images/users/'.$this->photo);
    }

    public function folders()
    {
        return $this->hasMany('App\Models\Folder');
    }

    public function designs()
    {
        return $this->hasMany('App\Models\Design');
    }

    public function IsVendor(){
        if ($this->is_vendor == 2) {
           return true;
        }
        return false;
    }

    public function JsonProfileModel()
    {
        return 
        [
            "id"=> $this->uid,
            "avatar"=> [
                "version"=> 0,
                "sizes"=> [
                    "50"=> [
                        "size" => 50,
                        "width" => 50,
                        "height" => 50,
                        "url" => $this->getPhotoUrl()
                    ],
                    "200"=> [
                        "size" => 200,
                        "width" => 200,
                        "height" => 200,
                        "url" => $this->getPhotoUrl()
                    ]
                ],
                "status"=> "SUCCEEDED"
            ],
            "email"=> $this->email,
            "emailVerified"=> false,
            "verified"=> false,
            "username"=> $this->name,
            "displayName"=> $this->name,
            "roles"=> [
                "USER"
            ],
            "personalBrand"=> "BACPQOvgJog",
            "brands"=> [
                "BACPQOvgJog"=> [
                    "id"=> "BACPQOvgJog",
                    "brandname"=> null,
                    "displayName"=> null,
                    "personal"=> true,
                    "contributor"=> false,
                    "layoutContributor"=> false,
                    "thirdParty"=> false,
                    "brandColor"=> "5703ad"
                ]
            ],
            "uiInfo"=> [
                "neverShowReplacePageContentWarning"=> true,
                "seenMobileExpDialog"=> true,
                "seenInviteExpDialog"=> true
            ],
            "creationDate"=> 1489020881000,
            "locale"=> "en",
            "country"=> null,
            "privacyPolicyNotified"=> 1529146817000,
            "preferredHomepage"=> "H2",
            "userNotificationSettings" => [
                "receiveSocialEmails" => true
            ]
        ];
    }

    public function JsonModel()
    {
        return
        [
            "id" => $this->uid,
            "username" => $this->name,
            "email" => $this->email,
            "personalBrand" => "x",
            "displayName" => $this->name,
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
                        "url" => $this->getPhotoUrl()
                    ),
                    "200" => array(
                        "size" => 200,
                        "width" => 200,
                        "height" => 200,
                        "url" => $this->getPhotoUrl()
                    )
                ),
                "status" => "SUCCEEDED"
            ),
            "locale" => "en",
            "deactivated" => false
        ];
    }
    /////////////////
    public function comments()
    {
        return $this->hasMany('App\Models\Comment');
    }

    public function replies()
    {
        return $this->hasMany('App\Models\Reply');
    }

    public function ratings()
    {
        return $this->hasMany('App\Models\Rating');
    }

    public function wishlists()
    {
        return $this->hasMany('App\Models\Wishlist');
    }

    public function withdraws()
    {
        return $this->hasMany('App\Models\Withdraw');
    }

    public function conversations()
    {
        return $this->hasMany('App\Models\AdminUserConversation');
    }

    public function notifications()
    {
        return $this->hasMany('App\Models\Notification');
    }

    public function services()
    {
        return $this->hasMany('App\Models\Service');
    }

    public function senders()
    {
        return $this->hasMany('App\Models\Conversation','sent_user');
    }

    public function recievers()
    {
        return $this->hasMany('App\Models\Conversation','recieved_user');
    }

    public function notivications()
    {
        return $this->hasMany('App\Models\UserNotification','user_id');
    }

    public function subscribes()
    {
        return $this->hasMany('App\Models\UserSubscription');
    }

    public function favorites()
    {
        return $this->hasMany('App\Models\FavoriteSeller');
    }

    public function shippings()
    {
        return $this->hasMany('App\Models\Shipping','user_id');
    }

    public function packages()
    {
        return $this->hasMany('App\Models\Package','user_id');
    }

    public function reports()
    {
        return $this->hasMany('App\Models\Report','user_id');
    }

    public function verifies()
    {
        return $this->hasMany('App\Models\Verification','user_id');
    }

    public function wishlistCount()
    {

        return \App\Models\Wishlist::where('user_id','=',$this->id)->with(['product'])->whereHas('product', function($query) {
                    $query->where('status', '=', 1);
                 })->count();
    }

    public function checkVerification()
    {
        return count($this->verifies) > 0 ? 
        (empty($this->verifies()->where('admin_warning','=','0')->orderBy('id','desc')->first()->status) ? false : ($this->verifies()->orderBy('id','desc')->first()->status == 'Pending' ? true : false)) : false;
    }

    public function checkStatus()
    {
        return count($this->verifies) > 0 ? ($this->verifies()->orderBy('id','desc')->first()->status == 'Verified' ? true : false) :false;
    }

    public function checkWarning()
    {
        return count($this->verifies) > 0 ? ( empty( $this->verifies()->where('admin_warning','=','1')->orderBy('id','desc')->first() ) ? false : (empty($this->verifies()->where('admin_warning','=','1')->orderBy('id','desc')->first()->status) ? true : false) ) : false;
    }

    public function displayWarning()
    {
        return $this->verifies()->where('admin_warning','=','1')->orderBy('id','desc')->first()->warning_reason;
    }

}
