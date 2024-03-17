     <!-- ========== App Menu ========== -->
     <div class="app-menu navbar-menu bg-danger">
        <!-- LOGO -->
        <div class="navbar-brand-box">
            <!-- Dark Logo-->
            <a href="{{ route('home')}}" class="logo logo-dark">
                <span class="logo-sm">
                    <img src="{{ asset('glamee_logo/glamee_logo.png')}}" alt="" height="50">
                </span>
                <span class="logo-lg">
                    <img src="{{ asset('glamee_logo/glamee_logo.png')}}" alt="" height="70">
                </span>
            </a>
            <!-- Light Logo-->
            <a href="{{ route('home')}}" class="logo logo-light">
                <span class="logo-sm">
                    <img src="{{ asset('glamee_logo/glamee_logo.png')}}" alt="" height="50">
                </span>
                <span class="logo-lg">
                    <img src="{{ asset('glamee_logo/glamee_logo.png')}}" alt="" height="70">
                </span>
            </a>
            <button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover" id="vertical-hover">
                <i class="ri-record-circle-line"></i>
            </button>
        </div>
        <hr>

        <div id="scrollbar">
            <div class="container-fluid">

                <div id="two-column-menu">
                </div>
                <ul class="navbar-nav" id="navbar-nav">
                    <li class="menu-title">
                        <!-- <span data-key="t-menu">Menu</span> -->
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('home')}}">
                            <i data-feather="home" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets text-white">Home</span>
                        </a>
                    </li>

                    {{-- <li class="nav-item">
                        <a class="nav-link menu-link" href="#sidebarDashboards" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarDashboards">
                            <i data-feather="copy" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboards">wigets</span>
                        </a>
                        <div class="collapse menu-dropdown" id="sidebarDashboards">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a href="dashboard-analytics.html" class="nav-link" data-key="t-analytics"> Analytics </a>
                                </li>
                                <li class="nav-item">
                                    <a href="dashboard-crm.html" class="nav-link" data-key="t-crm"> CRM </a>
                                </li>
                                <li class="nav-item">
                                    <a href="index.html" class="nav-link" data-key="t-ecommerce"> Ecommerce </a>
                                </li>
                                <li class="nav-item">
                                    <a href="dashboard-crypto.html" class="nav-link" data-key="t-crypto"> Crypto </a>
                                </li>
                                <li class="nav-item">
                                    <a href="dashboard-projects.html" class="nav-link" data-key="t-projects"> Projects </a>
                                </li>
                                <li class="nav-item">
                                    <a href="dashboard-nft.html" class="nav-link" data-key="t-nft"> NFT</a>
                                </li>
                                <li class="nav-item">
                                    <a href="dashboard-job.html" class="nav-link"><span data-key="t-job">Job</span> <span class="badge badge-pill bg-success" data-key="t-new">New</span></a>
                                </li>
                            </ul>
                        </div>
                    </li>  --}}


                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('categories.index')}}">
                            <i data-feather="users" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets">Categories</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('cities.index')}}">
                            <i data-feather="users" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets">Cities</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('providertypes.index')}}">
                            <i data-feather="users" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets">Provider Type</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('providers.index')}}">
                            <i data-feather="providers" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets">Providers</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('users.index')}}">
                            <i data-feather="users" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets">Users</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('service.index')}}">
                            <i data-feather="users" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets">Services</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('booking.index')}}">
                            <i data-feather="users" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets">Booking</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('banner.index')}}">
                            <i data-feather="users" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets">Banner</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('subscribers.index')}}">
                            <i data-feather="users" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets">Subscribers</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('help.index')}}">
                            <i data-feather="users" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets">Help</span>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link menu-link" href="{{ route('coupons.index')}}">
                            <i data-feather="users" class="icon-dual text-white"></i> <span class="text-white" data-key="t-dashboardswidgets">Coupons</span>
                        </a>
                    </li>






                </ul>
            </div>
            <!-- Sidebar -->
        </div>
        <div class="sidebar-background"></div>
    </div>
    <!-- Left Sidebar End -->
