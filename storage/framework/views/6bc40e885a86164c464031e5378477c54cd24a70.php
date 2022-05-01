<?php $__env->startSection('content'); ?>

    <div class="content-area">
        <div class="add-product-content1">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product-description">
                        <div class="body-area">
                            <div class="row">
                                <div class="col-lg-4 left-area"><h5>Add New Option</h5></div>
                                <div class="col-lg-7">
                                    <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                                </div>
                            </div>
                        
                        <form id="geniusformdata" action="<?php echo e(route('admin-option-update',$data->id)); ?>" method="POST" enctype="multipart/form-data">
                            <?php echo e(csrf_field()); ?>


                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('Name')); ?> *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="name" placeholder="<?php echo e(__("Option Name")); ?>" required="" value="<?php echo e($data->name); ?>">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading"><?php echo e(__("Commission")); ?> *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="commission" placeholder="<?php echo e(__("Commission")); ?>" required="" value="<?php echo e($data->commission); ?>">
                                </div>
                            </div>

                            <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                                <h4 class="heading"><?php echo e(__("Status")); ?> *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                            <select  name="status" required="">
                                                <option value=""><?php echo e(__('Select Status')); ?></option>

                                                <option value="1" <?php echo e($data->status == 1 ? 'selected' : ''); ?>>Active</option>
                                                <option value="0" <?php echo e($data->status == 0 ? 'selected' : ''); ?>>Disabled</option>
                                            </select>
                                        </div>
                                </div>

                            <div class="row">
                                <div class="col-lg-4">
                                <div class="left-area">
                                </div>
                                </div>
                                <div class="col-lg-7">
                                <button class="addProductSubmit-btn" type="submit"><?php echo e(__("Update Option")); ?></button>
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
<?php echo $__env->make('layouts.load', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>