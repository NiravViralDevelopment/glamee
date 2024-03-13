@extends('layouts.admin.app')
@section('content')
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Provider</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                    <li class="breadcrumb-item active">Providers</li>
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
                                        <h4 class="card-title mb-0 flex-grow-1">Form provider</h4>

                                    </div>

                                    <div class="card-body">

                                        <div class="live-preview">
                                            <form action="{{ route('providers.store') }}" method="POST"
                                                enctype="multipart/form-data">
                                                @csrf
                                                <div class="row">
                                                    {{-- Name --}}
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="firstNameinput" class="form-label">Name</label>
                                                            <span class="text-danger">*</span>
                                                            <input type="text" class="form-control" name="name"
                                                                placeholder="Enter name" id="firstNameinput">
                                                            @error('name')
                                                                <span class="text-danger"
                                                                    id="name_error">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    {{-- Email --}}
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="emailInput" class="form-label">Email</label> <span
                                                                class="text-danger">*</span>
                                                            <input type="email" class="form-control" name="email"
                                                                placeholder="Enter your email" id="emailInput">
                                                            @error('email')
                                                                <span class="text-danger"
                                                                    id="email_error">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    {{-- Password --}}
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="password" class="form-label">Password</label> <span
                                                                class="text-danger">*</span>

                                                            <input type="password" placeholder="Enter password"
                                                                name="password" value="password" id="passwordInput">
                                                        </div>
                                                    </div>

                                                    {{-- Mobile --}}
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="mobileInput" class="form-label">Mobile</label> <span
                                                                class="text-danger">*</span>

                                                            <input type="text" placeholder="Enter mobile" name="mobile"
                                                                value="mobile" id="mobileInput">
                                                        </div>
                                                    </div>

                                                    {{-- About me --}}
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="aboutInput" class="form-label">About</label> <span
                                                                class="text-danger">*</span>

                                                            <textarea placeholder="Enter about yourself" name="about"
                                                                value="about" id="aboutInput">
                                                            </div>
                                                        </div>

                                                        {{-- Profile --}}
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="profileInput" class="form-label">Profile</label> <span
                                                                    class="text-danger">*</span>

                                                                    <input type="file" name="profile_url" id="profile_url" value="profile_url" />
                                                            </div>
                                                        </div>

                                                        {{-- Provider type --}}
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="provider_type" class="form-label">Provider type</label> <span
                                                                    class="text-danger">*</span>

                                                                <select name="provider_type" id="provider_type">
                                                                    @foreach ($provider_types as $type)
    <option value="{{ $type->id }}">{{ $type->name }}
                                                                        </option>
    @endforeach
                                                                </select>
                                                            </div>
                                                        </div>

                                                        {{-- City --}}
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="mobileInput" class="form-label">City</label> <span
                                                                    class="text-danger">*</span>

                                                                <select name="city" id="city">
                                                                    @foreach ($cities as $city)
    <option value="{{ $city->id }}">{{ $city->name }}
                                                                        </option>
    @endforeach
                                                                </select>
                                                            </div>
                                                        </div>


                                                        <hr>
                                                        <div class="col-lg-12">
                                                            <div class="">
                                                                <button type="submit"
                                                                    class="btn btn-success btn-sm">Submit</button>
                                                                <a href="{{ route('categories.index') }}"
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
