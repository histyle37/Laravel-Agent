<!DOCTYPE html>
<html lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><?php echo e($gs->title); ?></title>
	<!-- favicon -->
	<link rel="icon"  type="image/x-icon" href="<?php echo e(asset('assets/images/'.$gs->favicon)); ?>"/>

	<link rel="stylesheet" href="<?php echo e(asset('assets/front/css/common.css')); ?>">
	<!-- <link rel="stylesheet" href="<?php echo e(asset('assets/front/css/rtl/styles.php?color='.str_replace('#','',$gs->colors).'&amp;'.'header_color='.str_replace('#','',$gs->header_color).'&amp;'.'footer_color='.str_replace('#','',$gs->footer_color).'&amp;'.'copyright_color='.str_replace('#','',$gs->copyright_color).'&amp;'.'menu_color='.str_replace('#','',$gs->menu_color).'&amp;'.'menu_hover_color='.str_replace('#','',$gs->menu_hover_color))); ?>"> -->

	<?php echo $__env->yieldContent('styles'); ?>

</head>

<body>

<?php if($gs->is_loader == 1): ?>
	<div style="display:none;" class="preloader" id="preloader" style="background: url(<?php echo e(asset('assets/images/'.$gs->loader)); ?>) no-repeat scroll center center #FFF;"></div>
<?php endif; ?>

<?php if($gs->is_popup== 1): ?>

<?php if(isset($visited)): ?>
    <!--  Starting of subscribe-pre-loader Area   -->
    <!--  Ending of subscribe-pre-loader Area   -->
<?php endif; ?>

<?php endif; ?>
<div id="wrapper">
	<?php echo $__env->yieldContent('content'); ?>
</div>

<script type="text/javascript">
  var mainurl = "<?php echo e(url('/')); ?>";
  var gs      = <?php echo json_encode($gs); ?>;
  var langg    = <?php echo json_encode($langg); ?>;
</script>
	<!-- common -->
	<script src="<?php echo e(asset('assets/libs/js/jquery-3.3.1.min.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/libs/js/bootstrap.min.js')); ?>"></script>
	<script src="<?php echo e(asset('assets/front/js/common.js')); ?>"></script>

	<?php echo $__env->yieldContent('scripts'); ?>
</body>

</html>
