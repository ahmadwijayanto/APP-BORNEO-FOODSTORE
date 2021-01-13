<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseHelper;
use App\Http\Controllers\Controller;
use App\Models\Food;
use App\Models\FoodTransaction;
use App\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class TransactionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $transaction = Transaction::all();
        return ResponseHelper::success(
            $transaction,
            "Transaction Loaded"
        );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $request->validate([
                'totalPrice' => 'numeric|required',
                'payment_id' => 'required|exists:payments,id'
            ]);
            $transaction = Transaction::create([
                'user_id' => Auth::user()->id,
                'totalPrice' => $request->totalPrice,
                'status' => 'NEW_ORDER',
                'payment_id' => $request->payment_id,
                'invoice' => "INV/".Str::upper(Str::random(6)).Str::upper(Auth::user()->id)."/". Carbon::now()->year,
            ]);
            $carts = Auth::user()->carts;
            foreach ($carts as $cart) {
                FoodTransaction::create(
                    [
                        "food_id" => $cart->food->id,
                        "qty" => $cart->qty,
                        "price" => $cart->total,
                        "transaction_id" => $transaction->id
                    ]
                );
                $food = Food::find($cart->food->id);
                $food->stock = $food->stock - $cart->qty;
                $food->save();
                $cart->delete();
            }
            $transaction = Transaction::find($transaction->id);
            return ResponseHelper::success(
                $transaction,
                'Transaction Successfuly'
            );
        } catch (\Exception $error) {
            return ResponseHelper::error(
                [
                    "message" => "Transakasi Gagal",
                    "error" => $error
                ],
                'Transaksi Gagal!',
                401
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
