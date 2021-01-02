<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseHelper;
use App\Http\Controllers\Controller;
use App\Models\Food;
use Exception;
use Illuminate\Http\Request;

class FoodController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $foods = Food::all();
        return ResponseHelper::success(
            $foods,
            "Data foods berhasil di load"
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
            $request->validate(
                [
                    "name" => "required|string",
                    "price" => "required|integer",
                    "stock" => "required|integer",
                ]
            );

        } catch (Exception $error) {
            return ResponseHelper::error(
                [
                    "message" => "Something wrong",
                    "error" => $error
                ],
                "Something wrong!"
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
        $food = Food::find($id);
        if($food == null){
            return ResponseHelper::error(
                [
                    "message" => "Food tidak ditemukan"
                ],
                "Food with id ".$id." Not found"
            );
        }
        return ResponseHelper::success(
            $food,
            "Food successfuly loaded"
        );
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
        $food = Food::find($id);
        if($food == null){
            return ResponseHelper::error(
                [
                    "message" => "Food tidak ditemukan"
                ],
                "Food with id ".$id." Not found"
            );
        }
        $food->update($request->all());
        return ResponseHelper::success(
            $food,
            "Food successfuly updated"
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
        $food = Food::find($id);
        if($food == null){
            return ResponseHelper::error(
                [
                    "message" => "Food tidak ditemukan"
                ],
                "Food with id ".$id." Not found"
            );
        }
        $food->delete();
        return ResponseHelper::success(
            $food,
            "Food successfuly deleted"
        );
    }
}
