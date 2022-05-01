<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;

class BillingController extends BaseController
{
    public function __construct()
    {
    }

    public function invoice(Request $request){
        // brand: "BACPQOvgJog"
        // currency: "USD"
        // items: [{credit: "PACK_100"}]
        $brand = $request->brand;
        $currency = $request->currency;
        $items = $request->items;

        $data = array(
            "invoice" => "invoid_code",
            "error" => array(
                "message" => "success",
                "noPaymentMethod" => false,
                "invalidCreditCard" => false
            )
        );

        return $this->sendResponse($data);
    }

    public function invoicesync(Request $request)
    {
        // action: "PAY_SYNCHRONOUS"
        // invoice: "a"
        $action = $request->action;
        $invoice = $request->invoice;
        $data = array(
            "invoice" => "invoid_code",
            "error" => array(
                "message" => "success",
                "noPaymentMethod" => false,
                "invalidCreditCard" => false
            )
        );

        return $this->sendResponse($data);
    }
}
