@extends('layouts.admin.app')
@section('content')
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Services</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                    <li class="breadcrumb-item active">Services</li>
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
                                        <h4 class="card-title mb-0 flex-grow-1">Form Services</h4>

                                    </div>

                                    <div class="card-body">

                                        <div class="live-preview">
                                            <form action="{{ route('service.store') }}" method="POST"
                                                enctype="multipart/form-data">
                                                @csrf
                                                <div class="row">
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

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="descriptionInput"
                                                                class="form-label">Description</label>
                                                            <span class="text-danger">*</span>
                                                            <input type="text" class="form-control" name="description"
                                                                placeholder="Enter description" id="descriptionInput">
                                                            @error('name')
                                                                <span class="text-danger"
                                                                    id="name_error">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="addressInput" class="form-label">Address</label>
                                                            <span class="text-danger">*</span>
                                                            <input type="text" class="form-control" name="address"
                                                                placeholder="Enter address" id="addressInput">
                                                            @error('address')
                                                                <span class="text-danger"
                                                                    id="address_error">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="categoryInput" class="form-label">Category</label>
                                                            <span class="text-danger">*</span>
                                                            <select class="form-control" name="category_id" id="category">
                                                                @foreach ($categories as $category)
                                                                    <option value="{{ $category->id }}">
                                                                        {{ $category->name }}
                                                                    </option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="categoryInput" class="form-label">Provider</label>
                                                            <span class="text-danger">*</span>
                                                            <select class="form-control" name="provider_id" id="provider">
                                                                @foreach ($providers as $provider)
                                                                    <option value="{{ $provider->id }}">
                                                                        {{ $provider->name }}
                                                                    </option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="duration" class="form-label">Duration</label> <span
                                                                class="text-danger">*</span>
                                                            <input type="number" class="form-control" name="duration"
                                                                placeholder="Enter duration" id="firstNameinput">
                                                            @error('duration')
                                                                <span class="text-danger"
                                                                    id="name_error">{{ $message }}</span>
                                                            @enderror
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="durationType" class="form-label">Duration
                                                                Type</label> <span class="text-danger">*</span>
                                                            <select class="form-control" name="duration_type_id"
                                                                id="durationType">
                                                                <option value="1">Minutes</option>
                                                                <option value="2">Hours</option>
                                                                <option value="3">Days</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="image" class="form-label">Image</label> <span
                                                                class="text-danger">*</span>

                                                            <input class="form-control" class="form-control"
                                                                type="file" name="image" id="image"
                                                                value="image" />
                                                        </div>
                                                    </div>

                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <label for="categoryInput" class="form-label">Price
                                                                type</label>
                                                            <span class="text-danger">*</span>
                                                            <select class="form-control" name="price_type"
                                                                id="price_type">
                                                                <option value="Fixed">Fixed</option>
                                                                <option value="Hourly">Hourly</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="priceInput" class="form-label">Price</label>
                                                            <span class="text-danger">*</span>
                                                            <input type="text" class="form-control" name="price"
                                                                placeholder="Enter price" id="priceInput">
                                                            @error('price')
                                                                <span class="text-danger"
                                                                    id="price_error">{{ $message }}</span>
                                                            @enderror
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
                                                            <input type="checkbox" name="is_featured"
                                                                id="isFeaturedInput">
                                                            <label for="isFeaturedInput" class="form-label">IS
                                                                FEATURED</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="mb-3">
                                                            <input type="checkbox" name="is_available"
                                                                id="isAvailableInput">
                                                            <label for="isAvailableInput" class="form-label">IS
                                                                AVAILABLE</label>
                                                        </div>
                                                    </div>

                                                    <hr>
                                                    <div class="col-lg-12">
                                                        <div class="">
                                                            <button type="submit"
                                                                class="btn btn-success btn-sm">Submit</button>
                                                            <a href="{{ route('service.index') }}"
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
