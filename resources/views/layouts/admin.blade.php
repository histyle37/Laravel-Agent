<!doctype html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author" content="GeniusOcean">
	<meta name="csrf-token" content="{{ csrf_token() }}">
	<!-- Title -->
	<title>Agent</title>
	<!-- favicon -->
	<link rel="icon"  type="image/x-icon" href="{{asset('assets/images/favicon.png')}}"/>
	<!-- Bootstrap -->
	<link href="{{asset('assets/admin/css/bootstrap.min.css')}}" rel="stylesheet" />
	<!-- Fontawesome -->
	<link rel="stylesheet" href="{{asset('assets/admin/css/fontawesome.css')}}">
	<!-- icofont -->
	<link rel="stylesheet" href="{{asset('assets/admin/css/icofont.min.css')}}">
	<!-- Sidemenu Css -->
	<link href="{{asset('assets/admin/plugins/fullside-menu/css/dark-side-style.css')}}" rel="stylesheet" />
	<link href="{{asset('assets/admin/plugins/fullside-menu/waves.min.css')}}" rel="stylesheet" />

	<link href="{{asset('assets/admin/css/plugin.css')}}" rel="stylesheet" />

	<link href="{{asset('assets/admin/css/jquery.tagit.css')}}" rel="stylesheet" />
	<link rel="stylesheet" href="{{ asset('assets/admin/css/bootstrap-coloroicker.css') }}">
	<!-- Main Css -->
	<link href="{{asset('assets/admin/css/style.css')}}" rel="stylesheet"/>
	<link href="{{asset('assets/admin/css/custom.css')}}" rel="stylesheet"/>
	<link href="{{asset('assets/admin/css/responsive.css')}}" rel="stylesheet" />
	<link href="{{asset('assets/admin/css/common.css')}}" rel="stylesheet" />

	@yield('styles')

</head>
<body>
	<div class="page">
			<div class="page-main">
				<!-- Header Menu Area Start -->
				<div class="header">
					<div class="container-fluid">
						<div class="d-flex justify-content-between">
							<a class="admin-logo" href="{{ route('admin.dashboard') }}" target="_blank">
								<img src="{{asset('assets/images/logo.png')}}" alt="">
							</a>
							<div class="menu-toggle-button">
								<a class="nav-link" href="javascript:;" id="sidebarCollapse">
									<div class="my-toggl-icon">
											<span class="bar1"></span>
											<span class="bar2"></span>
											<span class="bar3"></span>
									</div>
								</a>
							</div>

							<div class="right-eliment">
								<ul class="list">
									<li class="login-profile-area">
										<a class="dropdown-toggle-1" href="javascript:;">
											<div class="user-img">
												<img src="{{ Auth::guard('admin')->user()->photo ? asset('assets/images/admin.jpg'):asset('assets/images/noimage.png') }}" alt="">
											</div>
										</a>
										<div class="dropdown-menu">
											<div class="dropdownmenu-wrapper">
													<ul>
														<h5>{{ __('Welcome!') }}</h5>
															<li>
																<a href="{{ route('admin.profile') }}"><i class="fas fa-user"></i> {{ __('Edit Profile') }}</a>
															</li>
															<li>
																<a href="{{ route('admin.password') }}"><i class="fas fa-cog"></i> {{ __('Change Password') }}</a>
															</li>
															<li>
																<a href="{{ route('admin.logout') }}"><i class="fas fa-power-off"></i> {{ __('Logout') }}</a>
															</li>
														</ul>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Header Menu Area End -->
				<div class="wrapper">
					<!-- Side Menu Area Start -->
					<nav id="sidebar" class="nav-sidebar">
						<ul class="list-unstyled components" id="accordion">
							<li>
								<a href="{{ route('admin.dashboard') }}" class="wave-effect"><i class="fa fa-home mr-2"></i>{{ __('Dashboard') }}</a>
							</li>
							@if(Auth::guard('admin')->user()->IsSuper())
							@include('includes.admin.roles.super')
							@else
							@include('includes.admin.roles.normal')
							@endif

						</ul>
					</nav>
					<!-- Main Content Area Start -->
					@yield('content')
					<!-- Main Content Area End -->
					</div>
				</div>
			</div>

			<script type="text/javascript">
			  var mainurl = "{{url('/')}}";
			</script>

		<!-- Dashboard Core -->
		<script src="{{asset('assets/admin/js/vendors/jquery-1.12.4.min.js')}}"></script>
<script src="{{asset('assets/admin/js/vendors/vue.js')}}"></script>
	<script src="{{asset('assets/admin/js/vendors/bootstrap.min.js')}}"></script>
	<script src="{{asset('assets/admin/js/jqueryui.min.js')}}"></script>
	<!-- Fullside-menu Js-->
	<script src="{{asset('assets/admin/plugins/fullside-menu/jquery.slimscroll.min.js')}}"></script>
	<script src="{{asset('assets/admin/plugins/fullside-menu/waves.min.js')}}"></script>

	<script src="{{asset('assets/admin/js/plugin.js')}}"></script>
	<script src="{{asset('assets/admin/js/Chart.min.js')}}"></script>
	<script src="{{asset('assets/admin/js/tag-it.js')}}"></script>
	<script src="{{asset('assets/admin/js/nicEdit.js')}}"></script>
	<script src="{{asset('assets/admin/js/bootstrap-colorpicker.min.js') }}"></script>
	<script src="{{asset('assets/admin/js/notify.js') }}"></script>

	<script src="{{asset('assets/admin/js/jquery.canvasjs.min.js')}}"></script>

	<script src="{{asset('assets/admin/js/load.js')}}"></script>
	<!-- Custom Js-->
	<script src="{{asset('assets/admin/js/custom.js')}}"></script>
	<!-- AJAX Js-->
	<!-- <script src="{{asset('assets/admin/js/myscript.js')}}"></script> -->
	<script src="{{asset('assets/admin/js/common.js')}}"></script>

	<script type="text/javascript">
	$(document).ready(function () {
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});
	});
	</script>
	@yield('scripts')
</body>

</html>
