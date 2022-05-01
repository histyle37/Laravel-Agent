<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Session;
use App\Models\Nphoto;
use App\Models\Icon;
use App\Models\IconCategory;
use App\Models\Licensing;

use App\Classes\HiStyleModels\ResponseModel;
use App\Classes\HiStyleModels\MediaModel;
use App\Classes\HiStyleModels\MediaType;
use App\Classes\HiStyleModels\FileModel;
use App\Classes\HiStyleModels\FileQuality;
use App\Classes\HiStyleModels\PricePlan;
use App\Classes\HiStyleModels\MediaLicenseDiscount;

use App\Classes\PhotoHelper;
use App\Classes\IconHelper;


class SearchController extends BaseController
{
    public $limit = 18;
    public $from = 0;

    public function __construct()
    {
    }

    public function search(Request $request){
        $q = $request->q;
        $this->limit = $request->limit ? $request->limit : 18;
        $this->from = $request->from ? $request->from : 0;

        switch($q){
            case 'free photos':
                $data = $this->freePhotos();
                break;
            case 'backgrounds':
                $data = $this->backgrounds();
                $data = $this->freePhotos();
                break;
            case 'text':
                $data = $this->texts();
                break;
            case 'lines':
            case 'icons':
            case 'frames':
            case 'shapes':
                $category = IconCategory::where('slug', substr($q, 0, strlen($q)-1))->first();
                $icons = $category->icons()->skip($this->from)->take($this->limit)->get();
                
                $data = $this->makeSvgRespnoseData($icons);
                break;
            default:
                $data = $this->searchPhotos($q);
                break;
        }

        return $this->sendResponse(json_decode($data));
    }

    private function searchPhotos($query){
        if ($query == '*')
            $photos = Nphoto::all();
        else
            $photos = Nphoto::where('title', 'like', '%'. $query .'%')->get();
        return $this->makePhotoResponseData($photos);
    }

    private function freePhotos(){
        $photos = Nphoto::where('licensing', Licensing::FREE_ID())->get();
        return $this->makePhotoResponseData($photos);
    }

    private function backgrounds(){
        $data = '{
            "id": "VuIpP_Lu26g",
            "totalHits": 1350804,
            "hasMore": true,
            "results": [
                {
                    "searchId":"VuIpP_Lu26g",
                    "rank": 0,
                    "id": "MADGyAZwZUI",
                    "version": 0,
                    "brand": "BADGSK3Wwk0",
                    "user": "UAAje2rxZBc",
                    "artist": "Matheus Bertelli",
                    "title": "Girl Leaning Her.",
                    "background": true,
                    "cutout": false,
                    "isolated": false,
                    "photoholder": false,
                    "textholder": false,
                    "repeating": false,
                    "recolorable": false,
                    "licensing": "FREE",
                    "oneTimeUsePriceCents": 0,
                    "oneTimeUseDiscountable": false,
                    "oneTimeUseAggregatePriceCents": 0,
                    "royaltyFreePriceCents": 0,
                    "extendedPriceCents": 0,
                    "componentMedia": [],
                    "superKeywords": [
                        "child",
                        "outside",
                        "sleepy",
                        "tired",
                        "girl"
                    ],
                    "keywords": [
                        "adorable",
                        "blure"
                    ],
                    "files": {},
                    "files_": [
                        {
                            "page": 0,
                            "quality": "SCREEN",
                            "bucket": "meida.public.canva.com",
                            "key": "",
                            "width": 800,
                            "height": 533,
                            "watermarked": false,
                            "spritesheet": false,
                            "url": "/assets/hicanva/images/thumbnail_large(16).jpg",
                            "urlDenied": false
                        },
                        {
                            "page": 0,
                            "quality": "THUMBNAIL",
                            "bucket": "meida.public.canva.com",
                            "key": "",
                            "width": 200,
                            "height": 133,
                            "watermarked": false,
                            "spritesheet": false,
                            "url": "/assets/hicanva/images/thumbnail_large(16).jpg",
                            "urlDenied": false
                        },
                        {
                            "page": 0,
                            "quality": "THUMBNAIL_LARGE",
                            "bucket": "meida.public.canva.com",
                            "key": "",
                            "width": 200,
                            "height": 200,
                            "watermarked": false,
                            "spritesheet": false,
                            "url": "/assets/hicanva/images/thumbnail_large(16).jpg",
                            "urlDenied": false
                        }
                    ],
                    "type": "RASTER",
                    "dateSubmitted": 0,
                    "lastModified": 1606654105770,
                    "dominantColors": [
                        "70654D",
                        "1E1A12"
                    ],
                    "usageToke": "2eyJzZWFy",
                    "qualityCurated": true
                }
            ],
            "nextQueryToken": "2eyJxdWv",
            "clientSearchToken": "1eyJzZW"
        }';

        return $data;
    }

    private function texts(){
        $data = '{
            "id": "VuIpP_Lu26g",
            "totalHits": 1350804,
            "hasMore": true,
            "results": [
                {
                    "searchId":"VuIpP_Lu26g",
                    "rank": 0,
                    "id": "MADGyAZwZUI",
                    "version": 4,
                    "brand": "BADGSK3Wwk0",
                    "user": "UAAje2rxZBc",
                    "artist": "Matheus Bertelli",
                    "title": "Girl Leaning Her.",
                    "background": true,
                    "cutout": false,
                    "isolated": false,
                    "photoholder": false,
                    "textholder": false,
                    "repeating": false,
                    "recolorable": false,
                    "licensing": "FREE",
                    "oneTimeUsePriceCents": 0,
                    "oneTimeUseDiscountable": false,
                    "oneTimeUseAggregatePriceCents": 0,
                    "royaltyFreePriceCents": 0,
                    "extendedPriceCents": 0,
                    "componentMedia": [],
                    "superKeywords": [
                        "child",
                        "outside",
                        "sleepy",
                        "tired",
                        "girl"
                    ],
                    "keywords": [
                        "adorable",
                        "blure"
                    ],
                    "files": {},
                    "files_": [
                        {
                            "page": 0,
                            "quality": "ORIGINAL",
                            "bucket": "meida.public.canva.com",
                            "key": "",
                            "width": 800,
                            "height": 533,
                            "watermarked": false,
                            "spritesheet": false,
                            "url": "/assets/static/texts/1.cdf",
                            "urlDenied": false
                        },
                        {
                            "page": 0,
                            "quality": "SCREEN",
                            "bucket": "meida.public.canva.com",
                            "key": "",
                            "width": 240,
                            "height": 120,
                            "watermarked": false,
                            "spritesheet": false,
                            "url": "/assets/static/texts/1.png",
                            "urlDenied": false
                        },
                        {
                            "page": 0,
                            "quality": "THUMBNAIL",
                            "bucket": "meida.public.canva.com",
                            "key": "",
                            "width": 240,
                            "height": 120,
                            "watermarked": false,
                            "spritesheet": false,
                            "url": "/assets/static/texts/1.png",
                            "urlDenied": false
                        }
                    ],
                    "type": "ELEMENT_GROUP",
                    "dateSubmitted": 0,
                    "lastModified": 1606654105770,
                    "dominantColors": [
                        "70654D",
                        "1E1A12"
                    ],
                    "usageToke": "2eyJzZWFy",
                    "qualityCurated": true
                }
            ],
            "nextQueryToken": "2eyJxdWv",
            "clientSearchToken": "1eyJzZW"
        }';

        return $data;
    }

    private function emptyResult(){
        return '{
            "id": "VuIpP_Lu26g",
            "totalHits": 1350804,
            "hasMore": true,
            "results": [],
            "nextQueryToken": "2eyJxdWv",
            "clientSearchToken": "1eyJzZW"
        }';
    }

    public function click(Request $request){
        $data = array(
            'success' => true
        );

        return $this->sendResponse($data);
    }

    public function makeSvgRespnoseData($icons){
        $data = new ResponseModel;
        $data->id = "VuIpP_Lu26g";
        foreach($icons as $icon){
            $media = new MediaModel;
            $media->searchId = "VuIpP_Lu26g";
            $media->id = $icon->mediaId;
            $media->type = MediaType::VECTOR;
            $media->licensing = ($icon->IS_FREE()) ? PricePlan::FREE : PricePlan::STANDARD;
            $media->discount = MediaLicenseDiscount::UNLIMITED_IMAGES;
            $media->oneTimeUseDiscountable = false;
            
            $media->oneTimeUsePriceCents = 100;
            $media->oneTimeUseAggregatePriceCents = 0;
            $media->royaltyFreePriceCents = 1000;
            $media->extendedPriceCents = 10000;
            
            $files = IconHelper::getMediaMap($icon);
            $media->files_ = $files;

            $data->push($media);
        }

        return json_encode($data);
    }

    public function makePhotoResponseData($photos)
    {
        $data = new ResponseModel;
        $data->id = "VuIpP_Lu26g";

        foreach($photos as $photo){
            $media = new MediaModel;
            $media->searchId = "VuIpP_Lu26g";
            $media->id = $photo->mediaId;
            $media->title = $photo->title;

            $files = PhotoHelper::getMediaMap($photo);
            $media->files_ = $files;
            $data->push($media);
        }

        return json_encode($data);
    }
}
