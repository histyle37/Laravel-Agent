<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OptionSale extends Model
{
    protected $table = 'option_sale';
    protected $fillable = ['option_id', 'sale_id', 'value'];

    public $timestamps = false;

    public function sale()
    {
        return $this->belongsTo(Sale::class);
    }

    public function option()
    {
        return $this->belongsTo(Option::class);
    }
}
