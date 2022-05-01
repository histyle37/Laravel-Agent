<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Option extends Model
{
    protected $fillable = ['name', 'commission', 'status'];

    public $timestamps = true;

    public function zones()
    {
        return $this->belongsToMany(Zone::class);
    }

    public function agents()
    {
        return $this->belongsToMany(Agent::class);
    }

    public function sales()
    {
        return $this->belongsToMany(Sale::class);
    }
}
