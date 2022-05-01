<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AgentOption extends Model
{
    protected $table = 'agent_option';
    protected $fillable = ['agent_id', 'option_id'];

    public $timestamps = false;
}
