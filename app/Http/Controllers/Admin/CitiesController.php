<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\City;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class CitiesController extends Controller
{
    public function index(){
        $data = City::orderByDesc('id')->get();
        return view('admin.city.index',compact('data'));
    }

    public function create(){
        return view('admin.city.create');
    }

    public function store(Request $request){
        $validator = Validator::make($request->all(),[
            'name' => 'required|unique:cities',
            'image' => 'required'
        ],[
            "name.required" => trans('messages.enter_city'),
            "name.unique" => trans('messages.city_exist'),
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }else{

            $file = $request->file("image");
            $filename = 'city-'.time().".".$file->getClientOriginalExtension();
            $file->move(storage_path().'/app/public/city/',$filename);
        
            $c = new City();
            $c->name = $request->name;
            $c->image = $filename;
            $c->is_available = 1;
            $c->is_deleted = 2;
            $c->save();
            return redirect(route('cities.index'))->with('success',trans('messages.city_added'));
        }
    }

    public function show(string $id){
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $updatecitydata = City::find($id);
        return view('admin.city.edit',compact('updatecitydata'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validator = Validator::make($request->all(),[
            'name' => 'required|unique:cities,name,'.$id
        ],[
            "name.required" => trans('messages.enter_city'),
            "name.unique" => trans('messages.city_exist')
        ]);
        if ($validator->fails()) {
            
            return redirect()->back()->withErrors($validator)->withInput();

        }else{
            if($request->file("image") != ""){
                $validator = Validator::make($request->all(),[
                        'image' => 'image|mimes:jpeg,jpg,png'
                    ],  [ 
                        'image.image' => trans('messages.enter_image_file'),
                        'image.mimes' => trans('messages.valid_image')
                    ]);
                if ($validator->fails()) {

                    return redirect()->back()->withErrors($validator)->withInput();

                }else{
                    $city = City::find($id); 
                    if(file_exists(storage_path("app/public/city/".$city->image)))
                    {
                        unlink(storage_path("app/public/city/".$city->image));
                    }

                    $file = $request->file("image");
                    $filename = 'city-'.time().".".$file->getClientOriginalExtension();
                    $file->move(storage_path().'/app/public/city/',$filename);

                    City::where('id', $id)->update(['image' => $filename]);    
                }
            }
                if($request->is_available){
                    $availilable = 1;
                }else{
                    $availilable = 2;
                }
                City::where('id',$id)
                        ->update([
                            'name'=> $request->name,
                            'is_available'=> $availilable
                        ]);
            return redirect(route('cities.index'))->with('success',trans('messages.city_updated'));
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, $id)
    {
        $updatecity = City::where('id',$id)->update(['is_deleted'=>1]);
        
        $users = User::where('city_id',$id)->get();
        foreach($users as $user){
            $update = User::find($user->id);
            $update->is_available = $request->status;
            $update->save();
            Service::where('provider_id',$user->id)->update(['is_deleted'=>1]);
            User::where('provider_id',$user->id)->where('type',3)->update(['is_available'=>$request->status]);
        }
        return redirect(route('cities.index'))->with('success',trans('messages.city_deleted'));
    }
}
