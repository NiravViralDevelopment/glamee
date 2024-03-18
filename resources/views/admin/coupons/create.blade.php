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
                    <div class="col-xxl-8">
                        <div class="row">
                            <div class="col-xxl-6">
                                <div class="card">
                                    <div class="card-header align-items-center d-flex">
                                        <h4 class="card-title mb-0 flex-grow-1">Form COUPON</h4>

                                    </div>

                                    <div class="card-body">

                                        <div class="live-preview">
                                            <form action="{{ route('coupons.store') }}" method="POST"
                                                enctype="multipart/form-data">
                                                @csrf
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="service" class="form-label">Service</label> <span
                                                                class="text-danger">*</span>
                                                            <select class="form-control" name="service_id" id="service">
                                                                <option value="">Select a service   </option>
                                                                @foreach ($services as $service)
                                                                    <option value="{{ $service->id }}">{{ $service->name }}
                                                                    </option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>


                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="descriptionInput"
                                                                class="form-label">Description</label>
                                                            <span class="text-danger">*</span>
                                                            <input type="text" class="form-control" name="description"
                                                                placeholder="Enter description" id="descriptionInput">
                                                            @error('description')
                                                                <span class="text-danger"
                                                                    id="description_error">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="codeInput"
                                                                class="form-label">Code</label>
                                                            <span class="text-danger">*</span>
                                                            <input type="text" class="form-control" name="code"
                                                                placeholder="Enter code" id="codeInput">
                                                            @error('code')
                                                                <span class="text-danger"
                                                                    id="code_error">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="discountType" class="form-label">Discount
                                                                type</label>
                                                            <span class="text-danger">*</span>
                                                            <select class="form-control" name="discount_type"
                                                                id="discountType">
                                                                <option value="Fixed">Fixed</option>
                                                                <option value="Percentage">Percentage</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="discountInput" class="form-label">Discount</label>
                                                            <span class="text-danger">*</span>
                                                            <input type="text" class="form-control" name="discount"
                                                                placeholder="Enter discount" id="dicountInput">
                                                            @error('discount')
                                                                <span class="text-danger"
                                                                    id="discount_error">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="startDate" class="form-label">Start date</label>
                                                            <span class="text-danger">*</span>
                                                            <input type="date" name="start_date" class="form-control"
                                                                id="startDate">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="expiryDate" class="form-label">Expiry date</label>
                                                            <span class="text-danger">*</span>
                                                            <input type="date" name="expiry_date" class="form-control"
                                                                id="expiryDate">
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <input type="checkbox" name="is_available"
                                                                id="isAvailable">
                                                            <label for="isAvailable" class="form-label">IS AVAILBLE</label>
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
