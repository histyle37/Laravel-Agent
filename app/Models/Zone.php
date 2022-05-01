<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Zone extends Model
{
    protected $fillable = ['user_id', 'password', 'name', 'commission', 'gross_percent', 'rt_exp', 'bet1', 'bet2', 'loto'];

    public $timestamps = true;

    public function options()
    {
        return $this->belongsToMany(Option::class);
    }

    public function agents()
    {
        return $this->hasMany(Agent::class);
    }
}
