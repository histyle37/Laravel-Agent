<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Week extends Model
{
    protected $fillable = ['name', 'start_date', 'end_date', 'is_current'];

    public $timestamps = false;
}
