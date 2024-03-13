<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="light" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">

@include('layouts.admin.head')
<body>

    <!-- Begin page -->
    <div id="layout-wrapper">
        @include('layouts.admin.header')
        @include('layouts.admin.sidebaar')
            <div class="vertical-overlay"></div>
        @yield('content')
    </div>
    <button onclick="topFunction()" class="btn btn-danger btn-icon" id="back-to-top">
        <i class="ri-arrow-up-line"></i>
    </button>
    <div id="preloader">
        <div id="status">
            <div class="spinner-border text-primary avatar-sm" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>
    </div>
    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <!-- JAVASCRIPT -->
    <script src="{{asset('admin/libs/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
    <script src="{{asset('admin/libs/simplebar/simplebar.min.js')}}"></script>
    <script src="{{asset('admin/libs/node-waves/waves.min.js')}}"></script>
    <script src="{{asset('admin/libs/feather-icons/feather.min.js')}}"></script>
    <script src="{{asset('admin/js/pages/plugins/lord-icon-2.1.0.js')}}"></script>
    <script src="{{asset('admin/js/plugins.js')}}"></script>

    <!-- apexcharts -->
    <script src="{{asset('admin/libs/apexcharts/apexcharts.min.js')}}"></script>

    <!-- projects js -->
    <script src="{{asset('admin/js/pages/dashboard-projects.init.js')}}"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.2/js/buttons.html5.min.js"></script>
    <!-- App js -->
    <script src="{{asset('admin/js/app.js')}}"></script>

    <script src="{{ asset('admin/js/pages/datatables.init.js') }}"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <script>
                @if(Session::has('success'))
                    toastr.options =
                    {
                        "closeButton" : true,
                        "progressBar" : true
                    }
                            toastr.success("{{ session('success') }}");
                @endif

                @if(Session::has('error'))
                        toastr.options =
                        {
                            "closeButton" : true,
                            "progressBar" : true
                        }
                                toastr.error("{{ session('error') }}");
                @endif

                    @if(Session::has('info'))
                    toastr.options =
                    {
                        "closeButton" : true,
                        "progressBar" : true
                    }
                            toastr.info("{{ session('info') }}");
                    @endif

                    @if(Session::has('warning'))
                    toastr.options =
                    {
                        "closeButton" : true,
                        "progressBar" : true
                    }
                            toastr.warning("{{ session('warning') }}");
                    @endif
    </script>

</body>

</html>


        