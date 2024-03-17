<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Subscribe;
use Illuminate\Support\Facades\Validator;

class SubscrbtionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Subscribe::get();
        return view('admin.subscribers.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.subscribers.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required'
        ], [
            "email.required" => trans('messages.enter_email'),
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        } else {
            Subscribe::create([
                'email' => $request->email
            ]);

            return redirect(route('subscribers.index'))->with('success', trans('messages.subscriber_added'));
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
        $updatedSubscriber = Subscribe::find($id);
        return view('admin.subscribers.edit', compact('updatedSubscriber'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $subscriber = Subscribe::find($id);

        if ($request->has('email')) {
            $subscriber->email = $request->email;
        }

        $subscriber->save();

        return redirect(route('subscribers.index'))->with('success',trans('messages.subscriber_updated'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        Subscribe::where('id', $id)->delete();
        return redirect(route('subscribers.index'))->with('success',trans('messages.subscriber_deleted'));
    
    }
}
