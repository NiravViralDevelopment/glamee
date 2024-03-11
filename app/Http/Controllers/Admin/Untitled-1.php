<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Support;
use App\Models\AddMore;
use App\Models\Testing;

class HomeController extends Controller
{
    

    
    public function index()
    {
        $seller = User::role('seller')->count();
        $consumer = User::role('consumer')->count();
        $sub_admin = User::role('sub-admin')->count();
        $support = Support::count();
        
        return view('home',compact('seller','consumer','sub_admin','support'));
    }


    public function add_more()
    {
        $add_more_data = AddMore::orderby('id','desc')->get();
        return view('add_more',compact('add_more_data'));
    }
    public function store_data(request $request)
    {
        // return $request->all();

        $request->validate([
            'addmore.*.name' => 'required',
            'addmore.*.qty' => 'required',
            'addmore.*.price' => 'required',
        ]);
        foreach ($request->addmore as $key => $value) {
            if(!empty($value['id'])){
                AddMore::where('id', $value['id'])->update($value);
            }else{  
                AddMore::create($value);                
            }
        }
        return back()->with('success', 'Record Created Successfully.');
    }

    public function add_more_listing()
    {
       $add_more_data = AddMore::get();
       return view('add_more_listing',compact('add_more_data'));
    }

    public function add_more_Delete($id)
    {
       AddMore::where('id',$id)->delete();
       return redirect()->back()->with('success','Data Deleted Successfully.');
    }
    
    public function add_more_update(request $request,$id)
    {
       return $id;
    }
    public function testing()
    {

        $testing_data = Testing::orderby('id','desc')->get();
        return view('testing',compact('testing_data'));
    }
    public function store_profile(request $request)
    {
        $request->validate([
            'addmore.*.name' => 'required',
            'addmore.*.email' => 'required',
            // 'addmore.*.image' => 'required',
        ]);

        foreach ($request->addmore as $key => $value) {

            $image='';
            if($value->hasFile('image')) {

                $new_image = $request->file('image');
                return $new_image;
                $image = time().'en.'.$new_image->getClientOriginalExtension();
                $destinationPath = public_path('/all_image');
                $new_image->move($destinationPath, $image);
            }
        
            if(!empty($value['id'])){
                Testing::where('id', $value['id'])->update($value);
            }else{  
                // $value['image'] = $image;
                Testing::create($value);                
            }
        }
        return back()->with('success', 'Record Created Successfully.');
    }

    public function testing_Delete($id)
    {
        Testing::where('id',$id)->delete();
       return redirect()->back()->with('success','Data Deleted Successfully.');
    }

}
