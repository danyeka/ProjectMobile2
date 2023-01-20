<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    public function login(Request $request)
    {

        $validasi = Validator::make($request->all(), [
            'email' => 'required',
            'password' => 'required|min:6',
        ]);

        if ($validasi->fails()) {
            return $this->error($validasi->errors()->first());
        }

        $user = User::where('email', $request->email)->first();
        if ($user) {

            $user->update([
                'fcm' =>$request->fcm
            ]);
            
            if(password_verify($request->password, $user->password)){
                return $this->success($user);
            }else{
                return $this->error("Password Salah");
            }

           
        }
        return $this->error("User tidak ditemukan ");
    }

    public function register(Request $request)
    {
        $validasi = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|unique:users',
            'phone' => 'required|unique:users',
            'password' => 'required|min:6',
        ]);
        if ($validasi->fails()) {
            return $this->error($validasi->errors()->first());
        }

        $user = User::create(array_merge($request->all(),[
            'password' => bcrypt($request->password)
        ]));
        
        if ($user) {
            return $this->success($user, 'selamat datang '.$user->name);
        } else {
            return $this->error("Terjadi Kesalahan");
        }
    }

    public function success($user, $message = "Success"){
        return response()->json([
            'success' => 200,
            'message' => $message,
            'user' => $user
        ]);
    }

    public function error($message){
        return response()->json([
            'success' => 400,
            'message' => $message
        ], 400);
    }
}
