<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OptionZone extends Model
{
    protected $table = 'option_zone';
    protected $fillable = ['option_id', 'zone_id'];

    public $timestamps = false;
}
