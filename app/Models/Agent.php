<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Option;

class Agent extends Model
{
    protected $fillable = ['user_id', 'password', 'name', 'zone_id', 'phone_number', 'address', 'exceptional_rule', 'loan', 'deduction', 'gross_percent', 'rt_exp'];

    public $timestamps = true;

    public function options()
    {
        return $this->belongsToMany(Option::class);
    }

    public function zone()
    {
        return $this->belongsTo(Zone::class);
    }
}
