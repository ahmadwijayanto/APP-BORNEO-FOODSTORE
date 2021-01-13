<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseHelper;
use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartFood;
use App\Models\Food;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cart = Auth::user()->carts;

        return ResponseHelper::success(
            $cart,
            "Data keranjang berhasil Di load"
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

        $request->validate(
            [
                'food_id' => 'required|exists:food,id',
                'qty' => 'required',
                'total' => 'required'
            ]
        );

        $cart = Cart::firstOrCreate([
            'food_id' => $request->food_id,
            'user_id' => Auth::user()->id,
        ]);

        $cart->qty = $cart->qty + $request->qty;
        $cart->total = $cart->total + $request->total;

        $cart->save();
        $cart = Cart::find($cart->id);

        return ResponseHelper::success(
            $cart->toArray(),
            "Succesfuly add to cart"
        );
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
        $cart = Cart::find($id);
        $cart->update($request->all());
        $cart = Cart::find($cart->id);
        return ResponseHelper::success(
            $cart->toArray(),
            "Update Successfuly"
        );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $cart = Cart::find($id);
        $cart->delete();
        return ResponseHelper::success(
            null,
            "Delete Successfuly"
        );
    }
}
