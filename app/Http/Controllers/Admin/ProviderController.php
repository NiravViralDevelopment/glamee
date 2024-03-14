<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\City;
use App\Models\Provider;
use App\Models\ProviderType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class ProviderController extends Controller
{
    public function index()
    {
        $data = Provider::orderByDesc('id')->get();
        return view('admin.providers.index', compact('data'));
    }

    public function create()
    {
        $provider_types = ProviderType::all();
        $cities = City::all();
        return view('admin.providers.create', compact(['provider_types', 'cities']));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required',
            'password' => 'required',
            'mobile' => 'required',
            'address' => 'required',
            'city_id' => 'required',
            'provider_type_id' => 'required',
            'about' => 'required'
        ], [
            "name.required" => trans('messages.enter_provider_type'),
            "email.required" => trans('messages.enter_email'),
            "password.required" => trans('messages.enter_password'),
            "address.required" => trans('messages.enter_address'),
            "mobile.required" => trans('messages.enter_mobile'),
            "about.required" => trans('messages.enter_about'),
            "profile_url.required" => trans('messages.enter_profile_url'),
            "city.required" => trans('messages.enter_city'),
            "provider_type.required" => trans('messages.enter_provider_type'),
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        } else {

            $provider = new Provider();
            $provider->name = $request->name;
            $provider->email = $request->email;
            $provider->password = Hash::make($request->password);
            $provider->address = $request->address;
            $provider->mobile = $request->mobile;
            $provider->about = $request->about;

            $en_uploaded = '';
            if ($request->hasFile('profile_url')) {
                $image = $request->file('profile_url');
                $en_uploaded = time() . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('/all_image');
                $image->move($destinationPath, $en_uploaded);
            }


            $provider->city_id = $request->city_id;
            $provider->provider_type_id = $request->provider_type_id;
            $provider->save();

            return redirect(route('providers.index'))->with('success', trans('messages.provider_added'));
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $updatedProvider = Provider::find($id);
        $provider_types = ProviderType::all();
        $cities = City::all();
        return view('admin.providers.edit', compact(['updatedProvider', 'provider_types', 'cities']));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => '',
            'email' => '',
            'mobile' => '',
            'address' => '',
            'city_id' => '',
            'provider_type_id' => '',
            'about' => ''
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        } else {
            $provider = Provider::find($id);
            if ($request->has('name')) {
                $provider->name = $request->name;
            }

            if ($request->has('email')) {
                $provider->email = $request->email;
            }

            if ($request->has('address')) {
                $provider->address = $request->address;
            }

            if ($request->has('mobile')) {
                $provider->mobile = $request->mobile;
            }

            if ($request->has('city_id')) {
                $provider->city_id = $request->city_id;
            }

            if ($request->has('provider_type_id')) {
                $provider->provider_type_id = $request->provider_type_id;
            }

            if ($request->has('about')) {
                $provider->about = $request->about;
            }

            $provider->save();
            
            return redirect()->route('providers.index')->with('success', trans('messages.provider_updated'));
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Provider::where('id', $id)->delete();
        return redirect()->route('providers.index')->with('success', trans('messages.providers_deleted'));
    }
}
