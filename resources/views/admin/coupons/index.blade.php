@extends('layouts.admin.app')
@section('content')
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">COUPON</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                    <li class="breadcrumb-item active">COUPON</li>
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
                                        <h5 class="card-title mb-0 flex-grow-1">COUPON-Data</h5>
                                        <div>
                                            <a href="{{ route('coupons.create') }}"
                                                class="btn btn-primary btn-sm">Create</a>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <table id="example"
                                            class="table table-bordered dt-responsive nowrap table-striped">
                                            <thead>
                                                <tr>
                                                    <th>No.</th>
                                                    <th>Service</th>
                                                    <th>Discount type</th>
                                                    <th>Discount</th>
                                                    <th>Start date</th>
                                                    <th>Expire date</th>
                                                    <th>Description</th>
                                                    <th>Is available</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($data as $key => $row)
                                                    <tr>
                                                        <td>{{ $key + 1 }}</td>
                                                        <td>{{ $row->servicename ? $row->servicename->name : '' }}</td>
                                                        <td>{{ $row->discount_type === 1 ? 'Fixed' : 'Percentage' }}</td>
                                                        <td>{{ $row->discount }}</td>
                                                        <td>{{ $row->start_date }}</td>
                                                        <td>{{ $row->expire_date }}</td>
                                                        <td style="white-space: normal; max-width: 130px;">
                                                            {{ $row->description }}
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
                                                                    <a href="{{ route('coupons.edit', $row->id) }}"
                                                                        class="btn btn-sm btn-primary edit-item-btn">Edit</a>
                                                                </div>
                                                                <div class="remove">

                                                                    <form action="{{ route('coupons.destroy', $row->id) }}"
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
