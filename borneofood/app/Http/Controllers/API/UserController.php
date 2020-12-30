<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseHelper;
use App\Http\Controllers\Controller;
use App\Models\User;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Funsi untuk register
     * field: name, email, password
     *
     * return ApiJson user + token
     */
    public function register(Request $request)
    {
        try {
            $request->validate(
                [
                    "name" => "required",
                    "email" => "required|email|unique:users,email",
                    "password" => "required|confirmed"
                ]
            );
            $data_user = $request->all();
            $user = User::create($data_user);
            $user_token = $user->createToken('authToken')->plainTextToken;

            return ResponseHelper::success(
                [
                    "api_token" => $user_token,
                    "token_type" => "Bearer",
                    "user" => $user
                ],
                "Registrasi Berhasil"
            );
        } catch (Exception $error) {
            return ResponseHelper::error(
                [
                    "message" => "Sesuatu terjadi ketika anda registrasi",
                    "error" => $error
                ],
                "Registrasi Gagal",
                500
            );
        }
    }

    /**
     * Funsi untuk login
     * field: email, password
     *
     * return ApiJson user + token
     */
    public function login(Request $request)
    {
        try {
            $request->validate(
                [
                    "email" => "required|email",
                    "password" => "required"
                ]
            );
            $auth_data = $request->only(["email", "password"]);
            if (!Auth::attempt($auth_data)) {
                return ResponseHelper::error(
                    [
                        "message" => "Authorisasi Gagal"
                    ],
                    "Authentikasi Gagal"
                );
            }
            $user = User::where("email", $request->email)->first();
            $user_token = $user->createToken('authToken')->plainTextToken;
            return ResponseHelper::success([
                [
                    "api_token" => $user_token,
                    "token_type" => "Bearer",
                    "user" => $user
                ],
                "Authentikasi berhasil"
            ]);
        } catch (Exception $error) {
            return ResponseHelper::error([
                "message" => "Login Gagal",
                "error" => $error
            ], "Login gagal");
        }
    }

    /**
     * Fungsi untuk logout
     *
     * Remove token from user
     */
    public function logout(Request $request)
    {
        $token = $request->user()->currentAccessToken()->delete();

        return ResponseHelper::success(
            $token,
            "Token Berhasil di hapus"
        );
    }

    /**
     * Fungsi untuk get user login
     *
     * Return ApiJson user
     */
    public function user(Request $request)
    {
        return ResponseHelper::success(
            $request->user(),
            "Data user berhasil di muat"
        );
    }
}
