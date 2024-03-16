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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::group(['middleware' => ['auth']], function() {

    Route::resource('users','Admin\UserController');
    Route::resource('categories','Admin\CategoryController');
    Route::resource('cities','Admin\CitiesController');
    Route::resource('providertypes','Admin\ProviderTypeController');
    Route::resource('providers','Admin\ProviderController');
    Route::resource('banner','Admin\BannerController');
    Route::resource('subscribers','Admin\SubscrbtionController');
    Route::resource('help','Admin\HelpController');
    Route::resource('service','Admin\ServiceController');
    Route::resource('booking','Admin\BookingController');
    Route::resource('coupons','Admin\CoupenController');


});

Route::get('testing','HomeController@testing')->name('testing');
Route::POST('store_profile','HomeController@store_profile')->name('store_profile');
Route::get('testing_Delete/{id}','HomeController@testing_Delete')->name('testing_Delete');