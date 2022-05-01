 

<?php $__env->startSection('styles'); ?>
<link href="<?php echo e(asset('assets/admin/css/pages/photo.css')); ?>" rel="stylesheet" />
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>  

<div class="content-area">
    <div class="mr-breadcrumb">
      <div class="row">
        <div class="col-lg-12">
            <h4 class="heading"><?php echo e(__('Add New Photo')); ?> <a class="add-btn" href="<?php echo e(route('admin-photo-index')); ?>"><i class="fas fa-arrow-left"></i> <?php echo e(__('Back')); ?></a></h4>
            <ul class="links">
              <li>
                <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
              </li>
              <li><a href="javascript:;"><?php echo e(__('Excel')); ?></a></li>
              <li>
                <a href="<?php echo e(route('admin-photo-index')); ?>"><?php echo e(__('Excels')); ?></a>
              </li>
              <li>
                <a href="<?php echo e(route('admin-photo-create')); ?>"><?php echo e(__('Add New Excel')); ?></a>
              </li>
            </ul>
        </div>
      </div>
    </div>

    <div class="add-product-content1">
      <div class="row">
        <div class="col-lg-12">
          <div class="product-description">
            <div class="body-area">
              <div class="gocover" style="background: url(<?php echo e(asset('assets/images/spinner.gif')); ?>) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
              <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>  
              <form id="photo_data_form" action="<?php echo e(route('admin-photo-store')); ?>" method="POST" enctype="multipart/form-data">
              <?php echo e(csrf_field()); ?>


              <div class="row">
                <div class="col-lg-3">
                  <div class="left-area">
                      <h4 class="heading"><?php echo e(__('Excel File')); ?> *</h4>
                  </div>
                </div>
                <div class="col-lg-9">
                  <div class="img-upload">
                        <input type="file" name="photo" class="img-upload" id="image-upload">
                  </div>

                </div>
              </div>

              <div class="row">
                <div class="col-lg-3">
                  <div class="left-area">
                    
                  </div>
                </div>
                <div class="col-lg-9">
                  <button class="addProductSubmit-btn" type="submit"><?php echo e(__('Upload Excel')); ?></button>
                </div>
              </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
<script src="<?php echo e(asset('assets/admin/js/pages/photo/create.js')); ?>"></script>
<?php $__env->stopSection(); ?>   
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>