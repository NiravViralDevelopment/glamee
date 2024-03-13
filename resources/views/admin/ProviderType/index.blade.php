@extends('layouts.admin.app')
@section('content')


<div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Provider Type</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                    <li class="breadcrumb-item active">Provider Type</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="row project-wrapper">
                    <div class="col-xxl-8">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-center">
                                    <h5 class="card-title mb-0 flex-grow-1">ProviderType-Data</h5>
                                    <div>
                                        <a href="{{ route('providertypes.create')}}" class="btn btn-primary btn-sm">Create</a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <table id="example" class="table table-bordered dt-responsive nowrap table-striped">
                                        <thead>
                                            <tr>
                                                <th>No.</th>
                                                <th>Type Name</th>
                                                <th>Commission</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           @foreach($data as $key=>$row)
                                            <tr>
                                                    <td>{{ $key+1 }}</td>
                                                    
                                                    <td>{{ $row->name}}</td>
                                                    <td>{{ $row->commission}} % </td>
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
                                                            <a href="{{ route('providertypes.edit',$row->id)}}" class="btn btn-sm btn-primary edit-item-btn" >Edit</a>
                                                        </div>
                                                        <div class="remove">
                                                            <form action="{{ route('providertypes.destroy',$row->id) }}" method="POST">
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