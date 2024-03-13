<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Provider;
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
        return view('admin.providers.create');
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
            $provider->password = Hash::make($request->password);
            $provider->address = $request->address;
            $provider->mobile = $request->mobile;
            $provider->about = $request->about;
            $provider->profile_url = $request->profile_url;
            $provider->city_id = $request->city_id;
            $provider->provider_type_id = $request->provider_type_id;
            $provider->save();

            return redirect(route('providers.index'))->with('success', trans('messages.provider_added'));
        }
    }
}
