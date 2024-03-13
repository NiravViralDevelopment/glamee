@extends('layouts.admin.app')
@section('content')


<div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Users</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                    <li class="breadcrumb-item active">Users</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row project-wrapper">
                    <div class="col-xxl-8">
                <!-- end page title -->
                <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Users-Data</h5>
                                </div>
                                <div class="card-body">
                                    <table id="example" class="table table-bordered dt-responsive nowrap table-striped align-middle" style="width:100%">
                                        <thead>
                                            <tr>
                                                
                                                <th data-ordering="false">SR No.</th>
                                                <th data-ordering="false">Profile</th>
                                                <th data-ordering="false">Name</th>
                                                <th data-ordering="false">Email</th>
                                                <th data-ordering="false">Mobile</th>
                                                <th>Status</th>
                                                <th>Status</th>
                                                <!-- <th>Action</th> -->
                                            </tr>
                                        </thead>
                                        <tbody>
                                           @foreach($data as $row)
                                            <tr>
                                                    <td>14</td>
                                                    <td><img width="50" height="50" src="{{Helper::image_path($row->image)}}" alt="{{trans('labels.users')}}" class="rounded table-image"></td>
                                                    <td>{{ $row->name}}</td>
                                                    <td>{{ $row->email }}</td>
                                                    
                                                    <td>{{ $row->mobile }}</td>
                                                    <td><span class="badge badge-soft-warning">Inprogress</span></td>
                                                    <td><span class="badge bg-success">Low</span></td> 
                                                     <!-- <td>
                                                    <div class="d-flex gap-2">
                                                        <div class="edit">
                                                            <button class="btn btn-sm btn-primary edit-item-btn" data-bs-toggle="modal" data-bs-target="#showModal">Edit</button>
                                                        </div>
                                                        <div class="remove">
                                                            <button class="btn btn-sm btn-success remove-item-btn" data-bs-toggle="modal" data-bs-target="#deleteRecordModal">Remove</button>
                                                        </div>
                                                        </div>
                                                    </td>  -->
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