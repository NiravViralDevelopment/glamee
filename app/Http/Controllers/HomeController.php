<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\User;
use App\Models\Booking;
use App\Models\ProviderType;
use App\Models\Coupons;
use App\Models\Service;
use App\Models\City;
use App\Models\Testing;



class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $total_categories = Category::where('is_deleted',2)->count();
        $total_providers = User::where('type',2)->count();
        $total_ptypes = ProviderType::where('is_deleted',2)->count();
        $total_coupons = Coupons::where('is_deleted',2)->count();
        $total_services = Service::where('is_deleted',2)->count();
        $total_handymans = User::where('type',3)->count();


        $PenndingProvider = User::where('is_verified',2)->get();


        $total_cities = City::where('is_deleted',2)->count();
        return view('home',compact('PenndingProvider','total_categories',
        'total_providers','total_ptypes','total_coupons','total_services','total_handymans',
        'total_cities'));
    }


    public function testing()
    {

        $testing_data = Testing::orderby('id','desc')->get();
        return view('testing',compact('testing_data'));
    }
    public function store_profile(request $request)
    {
        // dd($request->all());
        $request->validate([
            'addmore.*.name' => 'required',
            'addmore.*.email' => 'required',
            
        ]);

        $delete = new Testing();
        $delete->delete();
        foreach ($request->addmore as $key => $value) {
            
            
            if(!empty($value['id'])){
                    $data = Testing::find($value['id']);

                    // $value['image'] = $image;
                    $image = $data->image;
                    
                    if(!empty($value['image']))
                    {
                        if($value['image']){

                            $new_image = $value['image'];
                            $image = time().'en.'.$new_image->getClientOriginalExtension();
                            $destinationPath = public_path('/all_image');
                            $new_image->move($destinationPath, $image);
                        }
                    }
                   
                    $data->image = $image;
                    $data->name = $value['name'];
                    $data->email = $value['email'];
                    $data->save();

            }else{  
                    // $value['image'] = $image;
                    $image =null;
                    if(!empty($value['image']))
                    {
                        if($value['image']){

                            $new_image = $value['image'];
                            $image = time().'en.'.$new_image->getClientOriginalExtension();
                            $destinationPath = public_path('/all_image');
                            $new_image->move($destinationPath, $image);
                        }
                    }
                    $data = new Testing();
                    $data->image = $image;
                    $data->name = $value['name'];
                    $data->email = $value['email'];
                    $data->save();
                                
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
