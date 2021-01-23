<?php

use App\Http\Controllers\FoodController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\TransactionController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['auth:sanctum', 'verified'])->prefix('dashboard')->group(function (){
    Route::get('/', [HomeController::class, 'index'])->name('dashboard');
    Route::resources([
        'foods' => FoodController::class,
        'payments' => PaymentController::class,
        'users' => UserController::class,
        'transactions' => TransactionController::class
    ]);
});
