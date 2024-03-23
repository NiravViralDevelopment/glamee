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
        return view('admin.Banner.index', compact('data'));
    }


    public function create()
    {
        $categories = Category::where('is_available', 1)->where('is_deleted', 2)->orderBy('id', 'DESC')->get();
        $services = Service::where('is_available', 1)->where('is_deleted', 2)->orderBy('id', 'DESC')->get();
        return view('admin.Banner.create', compact('categories', 'services'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'type' => 'required',
            'image' => 'required|file',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $en_uploaded = '';
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $en_uploaded = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/all_image');
            $image->move($destinationPath, $en_uploaded);
        }

        Banner::create([
            'type' => $request->type,
            'image' => $en_uploaded,
            'category_id' => $request->category_id ? $request->category_id : null,
            'service_id' => $request->service_id ? $request->service_id : null
        ]);

        return redirect(route('banner.index'))->with('success', trans('messages.banner_added'));
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
        $updatedBanner = Banner::find($id);
        $categories = Category::all();
        $services = Service::all();
        return view('admin.Banner.edit', compact(['updatedBanner', 'categories', 'services']));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $banner = Banner::find($id);

        if ($request->has('type')) {
            $banner->type = $request->type;
        }

        if ($request->has('image')) {
            $en_uploaded = '';
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $en_uploaded = time() . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('/all_image');
                $image->move($destinationPath, $en_uploaded);
            }

            $banner->image = $en_uploaded;
        }

        if ($request->has('category_id')) {
            $banner->category_id = $request->category_id;
        }

        if ($request->has('service_id')) {
            $banner->service_id = $request->service_id;
        }

        $banner->save();
        return redirect(route('banner.index'))->with('success', trans('messages.banner_updated'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Banner::where('id', $id)->delete();

        return redirect(route('banner.index'))->with('success', trans('messages.banner_deleted'));
    }
}
