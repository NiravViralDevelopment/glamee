@extends('layouts.admin.app')
@section('content')


<div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                            <h4 class="mb-sm-0">Categories</h4>

                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                    <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboards</a></li>
                                    <li class="breadcrumb-item active">Categories</li>
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
                                    <h4 class="card-title mb-0 flex-grow-1">Form category</h4>
                                   
                                </div>

                                <div class="card-body">
                                    
                                    <div class="live-preview">
                                        <form action="{{ route('banner.store')}}" method="POST" enctype="multipart/form-data">
                                            @csrf
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="mb-3">
                                                        <label for="firstNameinput" class="form-label">Name</label> <span class="text-danger">*</span>
                                                        <select name="" id="" class="form-control">
                                                            <option value="" selected>{{trans('labels.select')}}</option>
                                                            <option value="1" @if (old('type') == '1') selected @endif>{{trans('labels.category')}}</option>
                                                            <option value="2" @if (old('type') == '2') selected @endif>{{trans('labels.service')}}</option>
                                                        </select>
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
                                                <div class="col-md-12">
                                                    <div class="mb-3">
                                                        <input type="checkbox" placeholder="Enter company name" name="is_featured" value="is_featured" id="compnayNameinput">
                                                        <label for="compnayNameinput"  class="form-label">IS FEATURED</label>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="col-lg-12">
                                                    <div class="">
                                                        <button type="submit" class="btn btn-success btn-sm">Submit</button>
                                                        <a href="{{ route('categories.index')}}" class="btn btn-danger btn-sm">Cancel</a>
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


            <script type="text/javascript">
            function getduration(x) {
   
                if(x.value == 'Fixed'){
                    
                    document.getElementById("duration").style.display = '';
                }
                else{
                    document.getElementById("duration").style.display = 'none';
                }
                }
                $('#banner_type').change(function(){
                if($('#banner_type').val() == '1') {
                    $('#category').show();$('#service').hide();
                }else if($('#banner_type').val() == '2') {
                    $('#service').show();$('#category').hide();
                } else {
                    $('#category').hide();$('#service').hide();
                } 
                });

        function deletebanner(id,title,yes,no,deleteurl,wrong,recordsafe) {
        swal({
            title: title,
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: yes,
            cancelButtonText: no,
            closeOnConfirm: false,
            closeOnCancel: false,
            showLoaderOnConfirm: true,
        },
        function(isConfirm) {

            if (isConfirm) {
                $.ajax({
                headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
                url:deleteurl,
                data: {id: id},
                method: 'POST',
                success: function(response) {
                    if (response == 1) {
                        swal.close();
                        window.location.reload();
                    } else {
                        swal("Cancelled", wrong , "error");
                    }
                },
                error: function(e) {
                    swal("Cancelled", wrong , "error");
                }
                });
            } else {
                swal("Cancelled", recordsafe , "error");
            }
        });
    }
          
</script>