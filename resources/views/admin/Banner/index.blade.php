@extends('layouts.admin.app')
@section('content')
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Banner</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                    <li class="breadcrumb-item active">Banner</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row project-wrapper">
                    <div class="col-xxl-12">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-header d-flex align-items-center">
                                        <h5 class="card-title mb-0 flex-grow-1">Banner-Data</h5>
                                        <div>
                                            <a href="{{ route('banner.create')}}" class="btn btn-primary btn-sm">Create</a>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <table id="example"
                                            class="table table-bordered dt-responsive nowrap table-striped">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Image</th>
                                                    <th>Type</th>
                                                    <th>Category Name</th>
                                                    <th>Service Name</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($data as $key => $row)
                                                    <tr>
                                                        <td>{{ $key + 1 }}</td>
                                                        <td><img width="50" height="50"
                                                                src="{{ Helper::image_path($row->image) }}"
                                                                alt="{{ trans('labels.users') }}"
                                                                class="rounded table-image"></td>
                                                        <td>{{ $row->type === 1 ? "Category" : "Service" }}</td>
                                                        <td>{{ $row->categoryname ? $row->categoryname->name : "" }}</td>
                                                        <td>{{ $row->servicename ? $row->servicename->name : "" }}</td>
                                                        <td>
                                                            <div class="d-flex gap-2">
                                                                <div class="edit">
                                                                    <a href="{{ route('banner.edit',$row->id)}}" class="btn btn-sm btn-primary edit-item-btn">Edit</a>
                                                                </div>
                                                                <div class="remove">
        
                                                                <form action="{{ route('banner.destroy',$row->id) }}" method="POST">
                                                                    @csrf @method('DELETE')
                                                                    <button type="submit" onclick="return confirm('Are you sure want to delete ? ')" class="btn btn-sm btn-danger remove-item-btn">Delete</button>
                                                                </form>
        
                                                                
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
@endsection
