<!doctype html>
<html lang="en" dir="ltr">
  
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="author" content="GeniusOcean">
    <!-- Title -->
    <title>Agent</title>
    <!-- favicon -->
    <link rel="icon"  type="image/x-icon" href="<?php echo e(asset('assets/images/1571567283favicon.png')); ?>"/>
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
    <?php echo $__env->yieldContent('styles'); ?>

  </head>
  <body>

    <!-- Login and Sign up Area Start -->
    <section class="login-signup">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-5">
            <div class="login-area">
              <div class="header-area">
                <h4 class="title"><?php echo e(__('Login Now')); ?></h4>
                <p class="text"><?php echo e(__('Welcome back, please sign in below')); ?></p>
              </div>
              <div class="login-form">
                <?php echo $__env->make('includes.admin.form-login', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                <form id="loginform" action="<?php echo e(route('admin.login.submit')); ?>" method="POST">
                  <?php echo e(csrf_field()); ?>

                  <div class="form-input">
                    <input type="email" name="email" class="User Name" placeholder="<?php echo e(__('Type Email Address')); ?>" value="" required="" autofocus>
                    <i class="icofont-user-alt-5"></i>
                  </div>
                  <div class="form-input">
                    <input type="password" name="password" class="Password" placeholder="<?php echo e(__('Type Password')); ?>">
                    <i class="icofont-ui-password"></i>
                  </div>
                  <div class="form-forgot-pass">
                    <div class="left">
                      <input type="checkbox" name="remember"  id="rp" <?php echo e(old('remember') ? 'checked' : ''); ?>>
                      <label for="rp"><?php echo e(__('Remember Password')); ?></label>
                    </div>
                    <div class="right">
                      <a href="<?php echo e(route('admin.forgot')); ?>">
                        <?php echo e(__('Forgot Password?')); ?>

                      </a>
                    </div>
                  </div>
                  <input id="authdata" type="hidden"  value="<?php echo e(__('Authenticating...')); ?>">
                  <button class="submit-btn"><?php echo e(__('Login')); ?></button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--Login and Sign up Area End -->


    <!-- Dashboard Core -->
    <script src="<?php echo e(asset('assets/admin/js/vendors/jquery-1.12.4.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/admin/js/vendors/bootstrap.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/admin/js/jqueryui.min.js')); ?>"></script>
    <!-- Fullside-menu Js-->
    <script src="<?php echo e(asset('assets/admin/plugins/fullside-menu/jquery.slimscroll.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/admin/plugins/fullside-menu/waves.min.js')); ?>"></script>

    <script src="<?php echo e(asset('assets/admin/js/plugin.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/admin/js/tag-it.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/admin/js/nicEdit.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/admin/js/bootstrap-colorpicker.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/admin/js/load.js')); ?>"></script>
    <!-- Custom Js-->
    <script src="<?php echo e(asset('assets/admin/js/custom.js')); ?>"></script>
    <!-- AJAX Js-->
    <script src="<?php echo e(asset('assets/admin/js/myscript.js')); ?>"></script>

  </body>

</html>