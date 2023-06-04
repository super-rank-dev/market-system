<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductTypeController;
use App\Http\Controllers\SaleController;

Route::get('/api/csrf_token', function() {
    return response()->json(['csrf_token' => csrf_token()]);
});

Route::get('/api/products', [ProductController::class, 'index']);
Route::post('/api/products', [ProductController::class, 'store']);
Route::get('/api/products/{id}', [ProductController::class, 'show']);
Route::put('/api/products/{id}', [ProductController::class, 'update']);
Route::delete('/api/products/{id}', [ProductController::class, 'destroy']);

Route::get('/api/product-types', [ProductTypeController::class, 'index']);
Route::post('/api/product-types', [ProductTypeController::class, 'store']);
Route::get('/api/product-types/{id}', [ProductTypeController::class, 'show']);
Route::put('/api/product-types/{id}', [ProductTypeController::class, 'update']);
Route::delete('/api/product-types/{id}', [ProductTypeController::class, 'destroy']);

Route::get('/api/sales', [SaleController::class, 'index']);
Route::post('/api/sales', [SaleController::class, 'store']);