<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FoodImage extends Model
{
    use HasFactory;

    protected $fillable = [
        'food_id', 'image'
    ];

    protected $hidden = [
        'food_id',
        'id'
    ];
    public function food()
    {
        $this->belongsTo(Food::class);
    }
}
