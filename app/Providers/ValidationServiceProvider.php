<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Validator;
use Config;

class ValidationServiceProvider extends ServiceProvider
{
    public function boot()
    {
        Validator::extend('photo_extension', function($attribute, $value, $parameters)
        {
            $valid_extensions = Config::get('siteconf.photo.valid_extentions');
            $extension = strtolower($value->getClientOriginalExtension());
            return in_array($extension,$valid_extensions,true);
        });

        Validator::extend('font_extension', function($attribute, $value, $parameters)
        {
            $valid_extensions = Config::get('siteconf.font.valid_extentions');
            $extension = strtolower($value->getClientOriginalExtension());
            return in_array($extension,$valid_extensions,true);
        });
    }

}
