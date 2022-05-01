<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    protected $fillable = ['week_id', 'terminal_id', 'zone_id', 'agent_id', 'bet1', 'bet2', 'bank_tf', 'paid', 'win', 'betwin1', 'betwin2'];

    public $timestamps = true;

    public function options()
    {
        return $this->belongsToMany(Option::class);
    }
    
    public function zone()
    {
        return $this->belongsTo(Zone::class);
    }

    public function week()
    {
        return $this->belongsTo(Week::class);
    }

    public function agent()
    {
        return $this->belongsTo(Agent::class);
    }

    public function terminal()
    {
        return $this->belongsTo(Terminal::class);
    }
}
