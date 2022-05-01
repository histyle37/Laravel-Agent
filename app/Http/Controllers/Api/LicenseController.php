<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;
use Carbon\Carbon;

class LicenseController extends BaseController
{
    public function __construct()
    {
    }

    public function licenses(){
        $data = array(
            'licenses' => [
                array(
                    "id" => "id",
                    "media" => "M77yZOBsXH",
                    "mediaVersion" => 1,
                    "brand" => "BACPQOvgJog",
                    "user" => "UACPQLgRkLY",
                    "creatingBrand" => "creatingBrand",
                    "invoiceItem" => "invoiceItem",
                    "document" => "document",
                    "createdDate" => 1620755811,
                    "modifiedDate" => 1620755811,
                    "expiryDate" => 1620803744,
                    "prerequisite" => "UNLIMITED_IMAGES",
                    "type" => "ONE_USE",
                    "status" => "ACTIVATED",
                    "mediaBrand" => "mediaBrand"
                )
                
            ],
            'responseTimestamp' => (int)Carbon::now()->format('U'),
            'continuation' => "C"
        );

        return $this->sendResponse($data);
    }
}
