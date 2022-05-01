<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Auth;

use App\Models\User;

class ProfileController extends BaseController
{
    public function __construct()
    {
    }

    public function uiinfo(){
        $responseHeader = "'\"])}while(1);</x>//";
        $result = '{"contextTipRoyaltyFreePaymentOption":true,"hasSeenPublishPaymentLicensesOnboarding":true,"seenMobileExpDialog":true,"seenInviteExpDialog":true}';
        return response()->make($responseHeader.$result, 200, ['CONTENT_TYPE' => 'application/json']);
    }

    public function userInfo($userId){
        $user = User::getFromUID($userId);
        $data = $user->JsonProfileModel();
        
        return $this->sendResponse($data);
    }

    public function userInfos(Request $request){
        $ids = $request->ids;
        $ids = explode(',', $ids);

        $users = [];
        $emails = [];
        foreach($ids as $id){
            $user = User::where('uid', $id)->first();
            array_push($users, $user->JsonModel());
            array_push($emails, $user->email);
        }
        $data = [
            "users" => $users,
            "emails" => $emails
        ];
        return $this->sendResponse($data);
    }

    public function getbrand($brandId){
        $responseHeader = "'\"])}while(1);</x>//";
        $result = '{
            "id":"BACPQOvgJog",
            "brandname":null,
            "displayName":null,
            "personal":true,
            "contributor":false,
            "layoutContributor":false,
            "thirdParty":false,
            "brandColor":"5703ad"
            }
        ';
        return response()->make($responseHeader.$result, 200, ['CONTENT_TYPE' => 'application/json']);
    }
    
    public function getbrandmembers()
    {
        $user = array(
            "id" => "x",
            "username" => "x",
            "personalBrand" => "x",
            "displayName" => "x",
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
                        "url" => "/assets/images/users/1557677677bouquet_PNG62.png"
                    ),
                    "200" => array(
                        "size" => 200,
                        "width" => 200,
                        "height" => 200,
                        "url" => "/assets/images/users/1557677677bouquet_PNG62.png"
                    )
                ),
                "status" => "SUCCEEDED"
            ),
            "locale" => "en",
            "deactivated" => false,
        );

        $data = array(
            "members" => 
            [
                array(
                    "user" => $user,
                    "email" => "markquetgles@gmail.com",
                    "role" => "VIEWER"
                )
            ],
            "continuation" => false
        );

        return $this->sendResponse($data);

        // return response()->make($responseHeader.$result, 200, ['CONTENT_TYPE' => 'application/json']);
    }
}
