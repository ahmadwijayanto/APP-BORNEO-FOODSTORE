<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FoodTransaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'food_id',
        'qty',
        'price',
        'transaction_id'
    ];
    protected $hidden = [
        'food_id',
        'transaction_id'
    ];
    public $with = [
        'food'
    ];

    public function food()
    {
        return $this->belongsTo(Food::class);
    }
}
