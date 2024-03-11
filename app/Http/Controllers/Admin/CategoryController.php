<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Str;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Response;

class CategoryController extends Controller
{

    public function index(){
        $data = Category::orderBy('id','desc')->get();
        return view('admin.categories.index',compact('data'));
    }


    public function create(){
        return view('admin.categories.create');
    }


    public function store(Request $request)
    {
        $validator = Validator::make($request->all(),
            [   'name' => 'required',
                'image' => 'required'
            ]);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $en_uploaded = '';
        if ($request->hasFile('image')){
            $image = $request->file('image');
            $en_uploaded = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/all_image');
            $image->move($destinationPath, $en_uploaded);
        }

        $data = new Category();
        $data->image = $en_uploaded;
        $data->name  = $request->name;
        $data->is_featured = (!empty($request->is_featured)) ? 1 : null;
        $data->save();
        return redirect(route('categories.index'))->with('success',trans('messages.category_added'));

    }

    public function show(string $id){
        //
    }

    public function edit(string $id){
        $data = Category::find($id);
        return view('admin.categories.edit',compact('data'));
    }

    public function update(Request $request, string $id)
    {
        $validator = Validator::make($request->all(),
        [   'name' => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }
        $data = Category::find($id);
        $en_uploaded = $data->image;

        if ($request->hasFile('image')){
            $image = $request->file('image');
            $en_uploaded = time() . '.' . $image->getClientOriginalExtension();
            $destinationPath = public_path('/all_image');
            $image->move($destinationPath, $en_uploaded);
        }
        $data->image = $en_uploaded;
        $data->name  = $request->name;
        $data->is_featured = (!empty($request->is_featured)) ? 1 : null;
        $data->is_available = (!empty($request->is_available)) ? 1 : null;
        $data->save();
        return redirect(route('categories.index'))->with('success',trans('messages.category_added'));

    }

    public function destroy(string $id){
        $data = Category::find($id);
        $data->delete();
        return redirect(route('categories.index'))->with('success','Data deleted successfully');
    }
}
