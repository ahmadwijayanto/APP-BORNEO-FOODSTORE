<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseHelper;
use App\Http\Controllers\Controller;
use App\Models\Food;
use App\Models\FoodImage;
use Exception;
use Illuminate\Http\Request;

class FoodController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum')->except(['index', 'getBaner']);
    }
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

    public function getBaner()
    {
        $baners = FoodImage::inRandomOrder()->limit(3)->get();
        return ResponseHelper::success(
            $baners,
            "Succesfuly load baner"
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
            $data_food = $request->all();
            $food = Food::create(
                $data_food
            );

            return ResponseHelper::success(
                $food,
                "Food Susccesfuly created"
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
        if ($food == null) {
            return ResponseHelper::error(
                [
                    "message" => "Food tidak ditemukan"
                ],
                "Food with id " . $id . " Not found"
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
        if ($food == null) {
            return ResponseHelper::error(
                [
                    "message" => "Food tidak ditemukan"
                ],
                "Food with id " . $id . " Not found"
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
        if ($food == null) {
            return ResponseHelper::error(
                [
                    "message" => "Food tidak ditemukan"
                ],
                "Food with id " . $id . " Not found"
            );
        }
        $food->delete();
        return ResponseHelper::success(
            $food,
            "Food successfuly deleted"
        );
    }
}
