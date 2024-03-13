<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Banner;
use App\Models\Service;
use App\Models\Category;
use Illuminate\Support\Facades\Validator;

class BannerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Banner::get();
        return view('admin.Banner.index',compact('data'));
    }

    
    public function create()
    {
        $categorydata = Category::where('is_available',1)->where('is_deleted',2)->orderBy('id','DESC')->get();
        $servicedata = Service::where('is_available',1)->where('is_deleted',2)->orderBy('id','DESC')->get(); 
        return view('admin.Banner.create',compact('categorydata','servicedata'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
