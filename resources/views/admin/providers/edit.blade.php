@extends('layouts.admin.app')
@section('content')
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">PROVIDER</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                    <li class="breadcrumb-item active">PROVIDER</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row project-wrapper">
                    <div class="col-xxl-8">
                        <div class="row">
                            <div class="col-xxl-6">
                                <div class="card">
                                    <div class="card-header align-items-center d-flex">
                                        <h4 class="card-title mb-0 flex-grow-1">Form Provider</h4>

                                    </div>

                                    <div class="card-body">

                                        <div class="live-preview">
                                            <form action="{{ route('providers.update', $updatedProvider->id) }}"
                                                method="POST" enctype="multipart/form-data">
                                                @method('PUT')
                                                @csrf
                                                <div class="row">
                                                    {{-- Name --}}
                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="firstNameinput" class="form-label">Name</label>
                                                            <span class="text-danger">*</span>
                                                            <input type="text" class="form-control" name="name"
                                                                value={{ $updatedProvider->name }} placeholder="Enter name"
                                                                id="firstNameinput">
                                                            @error('name')
                                                                <span class="text-danger"
                                                                    id="name_error">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    {{-- Email --}}
                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="emailInput" class="form-label">Email</label> <span
                                                                class="text-danger">*</span>
                                                            <input type="email" class="form-control" name="email"
                                                                value={{ $updatedProvider->email }}
                                                                placeholder="Enter your email" id="emailInput">
                                                            @error('email')
                                                                <span class="text-danger"
                                                                    id="email_error">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    {{-- Mobile --}}
                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="mobileInput" class="form-label">Mobile</label> <span
                                                                class="text-danger">*</span>

                                                            <input class="form-control" type="text"
                                                                value={{ $updatedProvider->mobile }}
                                                                placeholder="Enter mobile" name="mobile"
                                                                id="mobileInput" />
                                                        </div>
                                                    </div>


                                                    {{-- Profile --}}
                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="profileInput" class="form-label">Profile</label>
                                                            <span class="text-danger">*</span>

                                                            <input class="form-control" class="form-control" type="file"
                                                                name="profile_url"
                                                                value={{ $updatedProvider->profile_url }} id="profile_url"
                                                                value="profile_url" />
                                                        </div>
                                                    </div>

                                                    {{-- Provider type --}}
                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="provider_type" class="form-label">Provider
                                                                type</label> <span class="text-danger">*</span>
                                                            <select class="form-control" name="provider_type_id"
                                                                id="provider_type">
                                                                @foreach ($provider_types as $type)
                                                                    <option value="{{ $type->id }}"
                                                                        {{ $type->id == $updatedProvider->provider_type_id ? 'selected' : '' }}>
                                                                        {{ $type->name }}
                                                                    </option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>


                                                    {{-- City --}}
                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="city" class="form-label">City</label> <span
                                                                class="text-danger">*</span>
                                                            <select class="form-control" name="city_id" id="city">
                                                                @foreach ($cities as $city)
                                                                    <option value="{{ $city->id }}"
                                                                        {{ $city->id == $updatedProvider->city_id ? 'selected' : '' }}>
                                                                        {{ $city->name }}
                                                                    </option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>


                                                    {{-- About me --}}
                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="about" class="form-label">About</label> <span
                                                                class="text-danger">*</span>
                                                            <textarea name="about" class="form-control" id="about" cols="50" rows="5">{{ $updatedProvider->about }}</textarea>
                                                        </div>
                                                    </div>

                                                    {{-- Address --}}
                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="address" class="form-label">Address</label> <span
                                                                class="text-danger">*</span>
                                                            <textarea name="address" class="form-control" id="address" cols="50" rows="5">{{ $updatedProvider->address }}</textarea>
                                                        </div>
                                                    </div>



                                                    <hr>
                                                    <div class="col-lg-12">
                                                        <div class="">
                                                            <button type="submit"
                                                                class="btn btn-success btn-sm">Submit</button>
                                                            <a href="{{ route('cities.index') }}"
                                                                class="btn btn-danger btn-sm">Cancel</a>
                                                        </div>
                                                    </div>

                                                </div>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
@endsection
