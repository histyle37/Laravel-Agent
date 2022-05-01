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
                                <div class="col-lg-4 left-area"><h5>Add New Week</h5></div>
                                <div class="col-lg-7">
                                    <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                                </div>
                            </div>
                        
                        <form id="geniusformdata" action="<?php echo e(route('admin-week-store')); ?>" method="POST" enctype="multipart/form-data">
                            <?php echo e(csrf_field()); ?>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('Week')); ?> *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="name" placeholder="<?php echo e(__("Week Name")); ?>" required="" value="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                        <h4 class="heading"><?php echo e(__('Start Date')); ?> *</h4>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="datetime-local" class="input-field start-date" name="start_date" id="start_date" placeholder="<?php echo e(__('Select a date')); ?>" required="" value="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                        <h4 class="heading"><?php echo e(__('End Date')); ?> *</h4>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="datetime-local" class="input-field" name="end_date" id="end_date" placeholder="<?php echo e(__('Select a date')); ?>" required="" value="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                        <h4 class="heading"><?php echo e(__('Set Current')); ?> *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <label class="switch">
                                        <input type="checkbox" name="is_current" value="1" checked>
                                        <span class="slider round"></span>
                                    </label>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                <div class="left-area">
                                </div>
                                </div>
                                <div class="col-lg-7">
                                <button class="addProductSubmit-btn" type="submit"><?php echo e(__("Create Week")); ?></button>
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