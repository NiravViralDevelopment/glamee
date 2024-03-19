@extends('layouts.admin.app')
@section('content')
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Service</h4>
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                    <li class="breadcrumb-item active">Service Type</li>
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
                                        <h5 class="card-title mb-0 flex-grow-1">Service-Data</h5>
                                        <div>
                                            <a href="{{ route('service.create') }}"
                                                class="btn btn-primary btn-sm">Create</a>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <table id="example"
                                            class="table table-bordered dt-responsive nowrap table-striped">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Image</th>
                                                    <th>Service Name</th>
                                                    <th>Category Name</th>
                                                    <th>Price</th>
                                                    <th>Duration</th>
                                                    <th>Discount</th>
                                                    <th>Featured</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($data as $key => $row)
                                                    <tr>
                                                        <td>{{ $key + 1 }}</td>

                                                        <td><img width="50" height="50"
                                                                src="{{ Helper::image_path($row->image) }}"
                                                                alt="{{ trans('labels.service') }}"
                                                                class="rounded table-image"></td>
                                                        <td>{{ $row->name }}</td>
                                                        <td>{{ $row['categoryname']->name }}</td>
                                                        <td>{{ Helper::currency_format($row->price) }}</td>

                                                        <td>
                                                            @if ($row->price_type == 'Fixed')
                                                                @if ($row->duration_type == 1)
                                                                    {{ $row->duration . trans('labels.minutes') }}
                                                                @elseif ($row->duration_type == 2)
                                                                    {{ $row->duration . trans('labels.hours') }}
                                                                @elseif ($row->duration_type == 3)
                                                                    {{ $row->duration . trans('labels.days') }}
                                                                @else
                                                                    {{ $row->duration . trans('labels.minutes') }}
                                                                @endif
                                                            @else
                                                                {{ $row->price_type }}
                                                            @endif
                                                        </td>
                                                        <td>
                                                            @if ($row->discount > 0)
                                                                {{ $row->discount }}%
                                                            @endif
                                                        </td>
                                                        <td>
                                                            @if ($row->is_featured == 1)
                                                                <span class="badge text-bg-success">Active</span>
                                                            @else
                                                                <span class="badge text-bg-danger">In-Active</span>
                                                            @endif
                                                        </td>
                                                        <td>
                                                            @if ($row->is_available == 1)
                                                                <span class="badge text-bg-success">Active</span>
                                                            @else
                                                                <span class="badge text-bg-danger">In-Active</span>
                                                            @endif
                                                        </td>

                                                        <td>
                                                            <div class="d-flex gap-2">
                                                                <div class="edit">
                                                                    <a href="{{ route('service.edit', $row->id) }}"
                                                                        class="btn btn-sm btn-primary edit-item-btn">Edit</a>
                                                                </div>
                                                                <div class="detail">
                                                                    <a href="{{ route('service.show', $row->id) }}"
                                                                        class="btn btn-sm btn-secondary show-item-btn">View</a>
                                                                </div>
                                                                <div class="remove">
                                                                    <form action="{{ route('service.destroy', $row->id) }}"
                                                                        method="POST">
                                                                        @csrf @method('DELETE')
                                                                        <button type="submit"
                                                                            onclick="return confirm('Are you sure want to delete ? ')"
                                                                            class="btn btn-sm btn-danger remove-item-btn">Delete</button>
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
