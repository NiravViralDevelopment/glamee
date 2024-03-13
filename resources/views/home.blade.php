@extends('layouts.admin.app')
@section('content')
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Projects</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                    <li class="breadcrumb-item active">Projects</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row project-wrapper">
                    <div class="col-xxl-12">
                        <div class="row">
                            <div class="col-xl-3">
                                <div class="card card-animate">
                                    <div class="card-body bg-dark text-white">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-sm flex-shrink-0">
                                                <span class="avatar-title bg-soft-primary rounded-2 fs-2 text-white">
                                                    {{ $total_providers}}
                                                </span>
                                            </div>
                                            <div class="flex-grow-1 overflow-hidden ms-3">
                                                <p class="text-uppercase fw-medium  mb-3 text-white">Total Providers</p>
                                                <div class="d-flex align-items-center mb-3">

                                                </div>

                                            </div>
                                        </div>
                                    </div><!-- end card body -->
                                </div>
                            </div><!-- end col -->

                            <div class="col-xl-3">
                                <div class="card card-animate">
                                    <div class="card-body bg-dark">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-sm flex-shrink-0">
                                                <span class="avatar-title bg-soft-primary text-white rounded-2 fs-2">
                                                    {{ $total_categories }}
                                                </span>
                                            </div>
                                            <div class="flex-grow-1 ms-3">
                                                <p class="text-uppercase fw-medium text-white  mb-3">Total Categories</p>
                                                <div class="d-flex align-items-center mb-3">

                                                </div>

                                            </div>
                                        </div>
                                    </div><!-- end card body -->
                                </div>
                            </div><!-- end col -->

                            <div class="col-xl-3">
                                <div class="card card-animate">
                                    <div class="card-body bg-dark">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-sm flex-shrink-0">
                                                <span class="avatar-title bg-soft-primary text-white rounded-2 fs-2">
                                                    {{ $total_coupons }}
                                                </span>
                                            </div>
                                            <div class="flex-grow-1 overflow-hidden ms-3">
                                                <p class="text-uppercase fw-medium text-white mb-3">Total Coupons</p>
                                                <div class="d-flex align-items-center mb-3">

                                                </div>

                                            </div>
                                        </div>
                                    </div><!-- end card body -->
                                </div>
                            </div><!-- end col -->

                            <div class="col-xl-3">
                                <div class="card card-animate">
                                    <div class="card-body bg-dark">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-sm flex-shrink-0">
                                                <span class="avatar-title bg-soft-primary text-white rounded-2 fs-2">
                                                    {{ $total_ptypes }}
                                                </span>
                                            </div>
                                            <div class="flex-grow-1 overflow-hidden ms-3">
                                                <p class="text-uppercase fw-medium text-white mb-3">Total Provider Types</p>
                                                <div class="d-flex align-items-center mb-3">

                                                </div>

                                            </div>
                                        </div>
                                    </div><!-- end card body -->
                                </div>
                            </div><!-- end col -->

                            <div class="col-xl-3">
                                <div class="card card-animate">
                                    <div class="card-body bg-dark">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-sm flex-shrink-0">
                                                <span class="avatar-title bg-soft-primary text-white rounded-2 fs-2">
                                                   {{ $total_cities }}
                                                </span>
                                            </div>
                                            <div class="flex-grow-1 overflow-hidden ms-3">
                                                <p class="text-uppercase fw-medium text-white mb-3">Total Cities</p>
                                                <div class="d-flex align-items-center mb-3">

                                                </div>

                                            </div>
                                        </div>
                                    </div><!-- end card body -->
                                </div>
                            </div><!-- end col -->
                            <div class="col-xl-3">
                                <div class="card card-animate">
                                    <div class="card-body bg-dark">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-sm flex-shrink-0">
                                                <span class="avatar-title bg-soft-primary text-white rounded-2 fs-2">
                                                    {{ $total_services }}
                                                </span>
                                            </div>
                                            <div class="flex-grow-1 overflow-hidden ms-3">
                                                <p class="text-uppercase fw-medium text-white mb-3">Total Services</p>
                                                <div class="d-flex align-items-center mb-3">

                                                </div>

                                            </div>
                                        </div>
                                    </div><!-- end card body -->
                                </div>
                            </div>
<!--
                            <div class="col-xl-3">
                                <div class="card card-animate">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div class="avatar-sm flex-shrink-0">
                                                <span class="avatar-title bg-soft-primary text-primary rounded-2 fs-2">
                                                    {{ $total_handymans }}
                                                </span>
                                            </div>
                                            <div class="flex-grow-1 overflow-hidden ms-3">
                                                <p class="text-uppercase fw-medium text-muted text-truncate mb-3">Total Handyman</p>
                                                <div class="d-flex align-items-center mb-3">

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->

                        </div><!-- end row -->


                    </div><!-- end col -->



                </div><!-- end row -->

                <div class="row project-wrapper">
                    <div class="col-xxl-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h5 class="card-title mb-0 flex-grow-1">PENDING PROVIDERS-DATA</h5>
                                    <div>
                                        <a href="{{ route('cities.create')}}" class="btn btn-primary btn-sm">Create</a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table id="example" class="table table-bordered dt-responsive nowrap table-striped">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($PenndingProvider as $key=>$row)
                                                <tr>
                                                    <td>{{ $key+1 }}</td>
                                                    <td><img width="50" height="50" src="{{Helper::image_path($row->image)}}" alt="{{trans('labels.users')}}" class="rounded table-image"></td>
                                                    <td>{{ $row->name}}</td>
                                                    <td>
                                                        @if($row->is_available == 1)
                                                            <span class="badge text-bg-success">Active</span>
                                                        @else
                                                            <span class="badge text-bg-danger">In-Active</span>
                                                        @endif
                                                    </td>
                                                    <td>
                                                    <div class="d-flex gap-2">
                                                        <div class="edit">
                                                            <button class="btn btn-sm btn-primary edit-item-btn" data-bs-toggle="modal" data-bs-target="#showModal">Edit</button>
                                                        </div>
                                                        <div class="remove">
                                                            <button class="btn btn-sm btn-danger remove-item-btn" data-bs-toggle="modal" data-bs-target="#deleteRecordModal">Remove</button>
                                                        </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach

                                        </tbody>
                                    </table>
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
            <!-- container-fluid -->
        </div>
        <!-- End Page-content -->

        <footer class="footer">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <script>document.write(new Date().getFullYear())</script> © Velzon.
                    </div>
                    <div class="col-sm-6">
                        <div class="text-sm-end d-none d-sm-block">
                            Design & Develop by Themesbrand
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    @endsection
