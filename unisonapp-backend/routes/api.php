<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\TaskController;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// this is the endpoint with prefix /api
Route::post('/login', [UsersController::class, 'login']);
Route::post('/register', [UsersController::class, 'register']);

// Define the middleware group for authenticated users
Route::middleware(['auth:sanctum'])->group(function () {

    // Routes that require authentication
    Route::get('tasks', 'TaskController@index');
    Route::post('tasks', 'TaskController@store');
    Route::get('tasks/{id}', 'TaskController@show');
    Route::put('tasks/{id}', 'TaskController@update');
    Route::delete('tasks/{id}', 'TaskController@destroy');

    // You can add more authenticated routes here if needed

});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
