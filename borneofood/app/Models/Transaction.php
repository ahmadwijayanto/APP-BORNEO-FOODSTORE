<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'invoice',
        'status',
        'totalPrice',
        'payment_id'
    ];
    protected $hidden = [
        'user_id',
        'payment_id'
    ];
    public $with =[
        'items',
        'payment'
    ];
    public function items()
    {
        return $this->hasMany(FoodTransaction::class);
    }

    public function payment()
    {
        return $this->belongsTo(Payment::class);
    }
}
