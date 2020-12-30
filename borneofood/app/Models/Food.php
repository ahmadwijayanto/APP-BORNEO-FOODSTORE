<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Food extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'price',
        'stock',
        'category_id',
    ];

    protected $with = [
        'images'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function images()
    {
        return $this->hasMany(FoodImage::class);
    }

    protected $appends = [
        'category_name',
    ];

    protected $hidden = [
        'category',
        'category_id'
    ];

    public function getCategoryNameAttribute()
    {
        return $this->category != null ? $this->category->name : null;
    }
}
