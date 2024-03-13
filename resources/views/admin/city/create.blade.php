@extends('layouts.admin.app')
@section('content')


<div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">CITY</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                    <li class="breadcrumb-item active">CITY</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row project-wrapper">
                    <div class="col-xxl-12">
                    <div class="row">
                        <div class="col-xxl-12">
                            <div class="card">
                                <div class="card-header align-items-center d-flex">
                                    <h4 class="card-title mb-0 flex-grow-1">Form CITY</h4>

                                </div>

                                <div class="card-body">

                                    <div class="live-preview">
                                        <form action="{{ route('cities.store')}}" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Name</label> <span class="text-danger">*</span>
                                                        <input type="text" class="form-control" name="name" placeholder="Enter name" id="firstNameinput">
                                                        @error('name')<span class="text-danger" id="name_error">{{ $message }}</span>@enderror
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="lastNameinput" class="form-label">Image</label>  <span class="text-danger">*</span>
                                                        <input type="file" class="form-control" name="image" placeholder="Enter your lastname" id="lastNameinput">
                                                        @error('image')<span class="text-danger" id="image_error">{{ $message }}</span>@enderror
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="col-lg-12">
                                                    <div class="">
                                                        <button type="submit" class="btn btn-success btn-sm">Submit</button>
                                                        <a href="{{ route('cities.index')}}" class="btn btn-danger btn-sm">Cancel</a>
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
