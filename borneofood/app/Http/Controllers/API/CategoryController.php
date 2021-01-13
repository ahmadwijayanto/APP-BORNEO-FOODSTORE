<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;
use Exception;

class CategoryController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth:sanctum'])->only(['store', 'update']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::all();
        return ResponseHelper::success(
            $categories,
            "Data categori berhasil di muat"
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
                    "name" => "required|unique:categories,name"
                ]
            );
            $category = Category::create(
                $request->all()
            );
            return ResponseHelper::success(
                $category,
                "Category Successfuly created"
            );
        } catch (Exception $error) {
            return ResponseHelper::error(
                [
                    "message" => "Something wrong!",
                    "error" => $error
                ],
                "Something wrong!"
            );
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        return ResponseHelper::success(
            $category,
            "Data category berhasil di muat"
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        $category->update($request->all());
        return ResponseHelper::success(
            $category,
            "Category Succesfully updated"
        );
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        $category->delete();
    }
}
