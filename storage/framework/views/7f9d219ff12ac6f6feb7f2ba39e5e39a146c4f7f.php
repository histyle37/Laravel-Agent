<!doctype html>
<html lang="en" dir="ltr">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author" content="GeniusOcean">
	<meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
	<!-- Title -->
	<title>Agent</title>
	<!-- favicon -->
	<link rel="icon"  type="image/x-icon" href="<?php echo e(asset('assets/images/favicon.png')); ?>"/>
	<!-- Bootstrap -->
	<link href="<?php echo e(asset('assets/admin/css/bootstrap.min.css')); ?>" rel="stylesheet" />
	<!-- Fontawesome -->
	<link rel="stylesheet" href="<?php echo e(asset('assets/admin/css/fontawesome.css')); ?>">
	<!-- icofont -->
	<link rel="stylesheet" href="<?php echo e(asset('assets/admin/css/icofont.min.css')); ?>">
	<!-- Sidemenu Css -->
	<link href="<?php echo e(asset('assets/admin/plugins/fullside-menu/css/dark-side-style.css')); ?>" rel="stylesheet" />
	<link href="<?php echo e(asset('assets/admin/plugins/fullside-menu/waves.min.css')); ?>" rel="stylesheet" />

	<link href="<?php echo e(asset('assets/admin/css/plugin.css')); ?>" rel="stylesheet" />

	<link href="<?php echo e(asset('assets/admin/css/jquery.tagit.css')); ?>" rel="stylesheet" />
	<link rel="stylesheet" href="<?php echo e(asset('assets/admin/css/bootstrap-coloroicker.css')); ?>">
	<!-- Main Css -->
	<link href="<?php echo e(asset('assets/admin/css/style.css')); ?>" rel="stylesheet"/>
	<link href="<?php echo e(asset('assets/admin/css/custom.css')); ?>" rel="stylesheet"/>
	<link href="<?php echo e(asset('assets/admin/css/responsive.css')); ?>" rel="stylesheet" />
	<link href="<?php echo e(asset('assets/admin/css/common.css')); ?>" rel="stylesheet" />

	<?php echo $__env->yieldContent('styles'); ?>

</head>
<body>
	<div class="page">
			<div class="page-main">
				<!-- Header Menu Area Start -->
				<div class="header">
					<div class="container-fluid">
						<div class="d-flex justify-content-between">
							<a class="admin-logo" href="<?php echo e(route('admin.dashboard')); ?>" target="_blank">
								<img src="<?php echo e(asset('assets/images/logo.png')); ?>" alt="">
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
												<img src="<?php echo e(Auth::guard('admin')->user()->photo ? asset('assets/images/admin.jpg'):asset('assets/images/noimage.png')); ?>" alt="">
											</div>
										</a>
										<div class="dropdown-menu">
											<div class="dropdownmenu-wrapper">
													<ul>
														<h5><?php echo e(__('Welcome!')); ?></h5>
															<li>
																<a href="<?php echo e(route('admin.profile')); ?>"><i class="fas fa-user"></i> <?php echo e(__('Edit Profile')); ?></a>
															</li>
															<li>
																<a href="<?php echo e(route('admin.password')); ?>"><i class="fas fa-cog"></i> <?php echo e(__('Change Password')); ?></a>
															</li>
															<li>
																<a href="<?php echo e(route('admin.logout')); ?>"><i class="fas fa-power-off"></i> <?php echo e(__('Logout')); ?></a>
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
								<a href="<?php echo e(route('admin.dashboard')); ?>" class="wave-effect"><i class="fa fa-home mr-2"></i><?php echo e(__('Dashboard')); ?></a>
							</li>
							<?php if(Auth::guard('admin')->user()->IsSuper()): ?>
							<?php echo $__env->make('includes.admin.roles.super', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
							<?php else: ?>
							<?php echo $__env->make('includes.admin.roles.normal', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
							<?php endif; ?>

						</ul>
					</nav>
					<!-- Main Content Area Start -->
					<?php echo $__env->yieldContent('content'); ?>
					<!-- Main Content Area End -->
					</div>
				</div>
			</div>

			<script type="text/javascript">
			  var mainurl = "<?php echo e(url('/')); ?>";
			</script>

		<!-- Dashboard Core -->
		<script src="<?php echo e(asset('assets/admin/js/vendors/jquery-1.12.4.min.js')); ?>"></script>
<script src="<?php echo e(asset('assets/admin/js/vendors/vue.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/vendors/bootstrap.min.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/jqueryui.min.js')); ?>"></script>
	<!-- Fullside-menu Js-->
	<script src="<?php echo e(asset('assets/admin/plugins/fullside-menu/jquery.slimscroll.min.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/plugins/fullside-menu/waves.min.js')); ?>"></script>

	<script src="<?php echo e(asset('assets/admin/js/plugin.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/Chart.min.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/tag-it.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/nicEdit.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/bootstrap-colorpicker.min.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/admin/js/notify.js')); ?>"></script>

	<script src="<?php echo e(asset('assets/admin/js/jquery.canvasjs.min.js')); ?>"></script>

	<script src="<?php echo e(asset('assets/admin/js/load.js')); ?>"></script>
	<!-- Custom Js-->
	<script src="<?php echo e(asset('assets/admin/js/custom.js')); ?>"></script>
	<!-- AJAX Js-->
	<!-- <script src="<?php echo e(asset('assets/admin/js/myscript.js')); ?>"></script> -->
	<script src="<?php echo e(asset('assets/admin/js/common.js')); ?>"></script>

	<script type="text/javascript">
	$(document).ready(function () {
		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});
	});
	</script>
	<?php echo $__env->yieldContent('scripts'); ?>
</body>

</html>
