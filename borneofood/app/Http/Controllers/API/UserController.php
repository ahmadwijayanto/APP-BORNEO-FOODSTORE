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
    public function __construct()
    {
        $this->middleware(['auth:sanctum'])->only(['user', 'logout']);
    }
    /**
     * Fungsi Api Login
     * validasi data user field(email dan password)
     *
     * Berhasil return ApiJson berisi User dan Token
     * Gagal return ApiJson berisi message login gagal
     */

    public function login(Request $request)
    {
        try {
            $request->validate([
                'email' => 'required|email',
                'password' => 'required'
            ]);
            $credetials_account = $request->only(['email', 'password']);
            if (!Auth::attempt($credetials_account)) {
                return ResponseHelper::error(
                    [
                        "message" => "Unauthorized"
                    ],
                    "Autentikasi Gagal!",
                    401
                );
            }
            $user = User::where('email', $request->email)->first();
            $user_token = $user->createToken('simpleToken')->plainTextToken;
            return ResponseHelper::success(
                [
                    'api_token' => $user_token,
                    'user' => $user
                ],
                'Autentikasi Berhasil!'
            );
        } catch (Exception $error) {
            return ResponseHelper::error(
                [
                    "message" => "Periksa email dan password yang anda inputkan",
                    "error" => $error
                ],
                'Autentikasi Gagal!',
                401
            );
        }
    }

    /**
     * Fungsi Api register
     * validasi data user field(email, name, password)
     *
     * Berhasil return ApiJson berisi User dan Token
     * Gagal return ApiJson berisi message login gagal
     */
    public function register(Request $request)
    {
        try {
            $request->validate([
                'email' => 'required|email',
                'name' => 'required',
                'password' => 'required|confirmed|min:6',
            ]);

            $user_data = $request->all();
            $user_data["password"] = Hash::make($user_data["password"]);
            $user = User::create(
                $user_data
            );
            $user_token = $user->createToken('simpleToken')->plainTextToken;
            return ResponseHelper::success(
                [
                    'api_token' => $user_token,
                    'user' => $user
                ],
                'Registrasi Berhasil!'
            );
        } catch (Exception $error) {
            return ResponseHelper::error(
                [
                    "message" => "Periksa data yang anda inputkan",
                    "error" => $error
                ],
                'Registrasi Gagal!',
                401
            );
        }
    }

    /**
     * Fungsi Api logout
     *
     * Mengambil user active kemudian menghapus token dari sanctum
     * Success return ApiJson berisi berhasil menghapus token
     */
    public function logout(Request $request)
    {
        $user = $request->user();
        $token_deleted = $user->currentAccessToken()->delete();
        return ResponseHelper::success($token_deleted, "Token Berhasil di hapus!");
    }

    /**
     * Fungsi Api fetch data user
     *
     * Mengambil user active Mengembalikanya
     */
    public function user(Request $request)
    {
        return ResponseHelper::success(
            $request->user(),
            "Data User berhasil di muat!"
        );
    }
}
