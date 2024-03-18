<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Coupons;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CoupenController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Coupons::orderByDesc('id')->get();

        return view('admin.coupons.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $services = Service::all();

        return view('admin.coupons.create', compact('services'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'service_id' => 'required',
            'discount_type' => 'required',
            'description' => 'required',
            'code' => 'required',
            'discount' => 'required',
            'start_date' => 'required',
            'expiry_date' => 'required',
            'is_available' => 'required'
        ]);

        if ($validator->fails()) {
            dd($validator);
            return back()->withErrors($validator)->withInput();
        }

        Coupons::create([
            'service_id' => $request->service_id,
            'discount_type' => $request->discount_type === "Percentage" ? 2 : 1,
            'description' => $request->description,
            'code' => $request->code,
            'discount' => $request->discount,
            'start_date' => $request->start_date,
            'expire_date' => $request->expiry_date,
            'is_available' => $request->is_available ? 1 : 0,
            'is_deleted' => 0
        ]);

        return redirect(route('coupons.index'))->with('success', trans('messages.coupon_added'));
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
        $updatedCoupon = Coupons::find($id);
        $services = Service::all();

        return view('admin.coupons.edit', compact(['updatedCoupon', 'services']));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $coupon = Coupons::find($id);

        if ($request->has('service_id')) {
            $coupon->service_id = $request->service_id;
        }

        if ($request->has('description')) {
            $coupon->description = $request->description;
        }

        if ($request->has('code')) {
            $coupon->code = $request->code;
        }

        if ($request->has('discount_type')) {
            $coupon->discount_type = $request->discount_type;
        }

        if ($request->has('discount')) {
            $coupon->discount = $request->discount;
        }

        if ($request->has('start_date')) {
            $coupon->start_date = $request->start_date;
        }

        if ($request->has('expiry_date')) {
            $coupon->expire_date = $request->expiry_date;
        }

        $coupon->save();

        return redirect(route('coupons.index'))->with('success',trans('messages.coupon_updated'));

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Coupons::find($id)->delete();

        return redirect(route('coupons.index'))->with('success', trans('messages.coupon_deleted'));
    }
}
