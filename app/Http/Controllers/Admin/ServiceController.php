<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Provider;
use Illuminate\Http\Request;
use App\Models\ProviderType;
use App\Models\Service;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class ServiceController extends Controller
{

    public function index()
    {
        $data = Service::with('categoryname')->get();
        return view('admin.services.index', compact('data'));
    }

    public function create()
    {
        $categories = Category::all();
        $providers = Provider::all();

        return view('admin.services.create', compact(['categories', 'providers']));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'price' => 'required|numeric',
            'price_type' => 'required',
            'category_id' =>  'required',
            'provider_id' => 'required',
            'duration' => 'required',
            'duration_type_id' => 'required',
            'image' => 'required',
            'description' => 'required',
            'address' => 'required',
            'is_featured' => 'required',
            'is_available' => 'required',
            'discount' => 'required|numeric'
        ], [
            "name.required" => trans('messages.enter_name'),
            "price.required" => trans('messages.enter_price'),
            "price_type.required" => trans('messages.enter_price_type'),
            "category.required" => trans('messages.enter_category'),
            "provider.required" => trans('messages.enter_provider'),
            "duration.required" => trans('messages.enter_duration'),
            "duration_type_id.required" => trans('messages.enter_duration_type'),
            "image.required" => trans('messages.enter_image'),
            "description.required" => trans('messages.enter_description'),
            "address.required" => trans('messages.enter_address'),
            "is_featured.required" => trans('messages.enter_is_featured'),
            "is_available.required" => trans('messages.enter_is_available'),
            "discount.required" => trans('messages.enter_discount'),
        ]);
        if ($validator->fails()) {
            dd($validator);
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $en_uploaded = '';
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $en_uploaded = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/all_image');
            $image->move($destinationPath, $en_uploaded);
        }

        Service::create([
            'name' => $request->name,
            'price' => $request->price,
            'slug' => strtolower(str_replace(' ', '-', $request->name)),
            'price_type' => $request->price_type,
            'category_id' => $request->category_id,
            'image' => $en_uploaded,
            'provider_id' => $request->provider_id,
            'duration' => $request->duration,
            'duration_type' => $request->duration_type,
            'discount' => $request->discount,
            'is_featured' => $request->is_featured ? 1 : 2,
            'is_available' => $request->is_available ? 1 : 2,
            'is_deleted' => 2,
            'description' => $request->description,
            'address' => $request->address
        ]);

        return redirect(route('service.index'))->with('success', trans('messages.service_added'));
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
        $categories = Category::all();
        $providers = Provider::all();
        $updatedService = Service::find($id);

        return view('admin.services.edit', compact(['categories', 'updatedService', 'providers']));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $service = Service::find($id);

        if ($request->has('name')) {
            $service->name = $request->name;
        }
        if ($request->has('description')) {
            $service->description = $request->description;
        }
        if ($request->has('address')) {
            $service->address = $request->address ? $request->address : "";
        }
        if ($request->has('price_type')) {
            $service->price_type = $request->price_type;
        }
        if ($request->has('category_id')) {
            $service->category_id = $request->category_id;
        }
        if ($request->has('provider_id')) {
            $service->provider_id = $request->provider_id;
        }
        if ($request->has('duration')) {
            $service->duration = $request->duration;
        }
        if ($request->has('duration_type_id')) {
            $service->duration_type = $request->duration_type;
        }
        if ($request->has('image')) {
            $en_uploaded = '';
            if ($request->hasFile('image')) {
                $image = $request->file('image');
                $en_uploaded = time() . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('/all_image');
                $image->move($destinationPath, $en_uploaded);
            }

            $service->image = $request->en_uploaded;
        }
        if ($request->has('price')) {
            $service->price = $request->price;
        }
        if ($request->has('discount')) {
            $service->discount = $request->discount;
        }
        if ($request->has('is_featured')) {
            $service->is_featured = $request->is_featured == 'on' ? 1 : 2;
        }
        if ($request->has('is_available')) {
            $service->is_available = $request->is_available == 'on' ? 1 : 2;
        }
        

        $service->save();

        return redirect(route('service.index'))->with('success', trans('messages.service_updated'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Service::where('id', $id)->delete();

        return redirect(route('service.index'))->with('success', trans('messages.service_deleted'));
    }
}
