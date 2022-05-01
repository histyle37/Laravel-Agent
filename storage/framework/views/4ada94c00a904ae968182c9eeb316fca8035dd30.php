<?php $__env->startSection('styles'); ?>
<link href="<?php echo e(asset('assets/admin/css/jquery-ui.css')); ?>" rel="stylesheet" type="text/css">
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="content-area">
        <div class="add-product-content1">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product-description">
                        <div class="body-area">
                            <div class="row">
                                <div class="col-lg-4 left-area"><h5>Add New Bank</h5></div>
                                <div class="col-lg-7">
                                    <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                                </div>
                            </div>
                        
                        <form id="geniusformdata" action="<?php echo e(route('admin-bank-store')); ?>" method="POST" enctype="multipart/form-data">
                            <?php echo e(csrf_field()); ?>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('Name')); ?> *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="name" placeholder="<?php echo e(__("Name")); ?>" required="" value="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('No')); ?> *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="no" placeholder="<?php echo e(__("No")); ?>" required="" value="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                <div class="left-area">
                                </div>
                                </div>
                                <div class="col-lg-7">
                                <button class="addProductSubmit-btn" type="submit"><?php echo e(__("Create Bank")); ?></button>
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
<script type="text/javascript">
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.load', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>