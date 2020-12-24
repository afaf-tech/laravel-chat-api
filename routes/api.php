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

    // private messages
    Route::group(['prefix' => 'messages'], function () {
        // Route::get('list', 'MessageController@list');
        Route::get('list/{id_user}', 'MessageController@list');
        Route::post('send', 'MessageController@send');
        Route::put('update/{id_project}', 'MessageController@update');
        Route::delete('delete/{id_project}', 'MessageController@delete');
    });
});
