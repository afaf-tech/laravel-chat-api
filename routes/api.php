<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('register', 'UserController@register');
Route::post('login', 'UserController@login');

Route::middleware(['jwt.verify'])->group(function () {
    // Route::auth();
    Route::get('user', 'UserController@getAuthenticatedUser');
    Route::get('logout', 'UserController@logout');
    Route::get('refresh', 'UserController@refresh'); // refresh token
    Route::get('trial', function(Request $request){
        return $request->all();
    });
});
