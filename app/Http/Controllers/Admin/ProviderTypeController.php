<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ProviderType;
use App\Models\Provider;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Response;

class ProviderTypeController extends Controller
{
   
    public function index()
    {
        $data = ProviderType::where('is_deleted',2)->orderByDesc('id')->get();
        return view('admin.ProviderType.index',compact('data'));
    }

    public function create(){
        return view('admin.ProviderType.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'commission' => 'required|numeric'
            ],[
                "name.required"=>trans('messages.enter_provider_type'),
                "commission.required"=>trans('messages.enter_commission'),
                "commission.numeric"=>trans('messages.enter_numbers_only')
            ]);
        if ($validator->fails()) {
            
            return redirect()->back()->withErrors($validator)->withInput();

        }else{

            $ptype = new ProviderType();
            $ptype->name = $request->name;
            $ptype->commission = $request->commission;
            $ptype->is_available = 1;
            $ptype->is_deleted = 2;
            $ptype->save();

            return redirect(route('providertypes.index'))->with('success',trans('messages.provider_type_added'));
        }  
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
        $updateprovidertypedata = ProviderType::find($id);
        return view('admin.ProviderType.edit',compact('updateprovidertypedata'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'commission' => 'required|numeric'
        ],[
            "name.required"=>trans('messages.enter_provider_type'),
            "commission.required"=>trans('messages.enter_commission'),
            "commission.numeric"=>trans('messages.enter_numbers_only')
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }else{
            if($request->is_available){
                $available = 1;
            }else{
                $available = 2;
            }
            ProviderType::where('id', $id)
                        ->update([
                            'name' => $request->name,
                            'commission' => $request->commission,
                            'is_available' => $available
                        ]);
            return redirect()->route('providertypes.index')->with('success',trans('messages.provider_type_updated'));
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $ptype = ProviderType::where('id',$id)->update(['is_deleted'=>1]);
        User::where('provider_type',$id)->update(['is_available'=>2]);
        return redirect()->route('providertypes.index')->with('success',trans('messages.provider_type_deleted'));
    }
}
