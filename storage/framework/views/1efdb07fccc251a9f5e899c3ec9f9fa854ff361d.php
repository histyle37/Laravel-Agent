<?php $__env->startSection('content'); ?>
<div class="row">
    <div class="col-lg-4">
        <div class="left-area">
            <h4 class="heading"><?php echo e(__('Options')); ?> *</h4>
        </div>
    </div>
    <div class="col-lg-7">
        <div class="options-area">
            <input type="text" class="input-field" name="op_count" placeholder="" value="<?php echo e($options->count()); ?>" hidden>
            <?php $__currentLoopData = $options; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index=>$option): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <div class="option-area">
                    <div class="col-3"><?php echo e($option->name); ?></div>
                    <div class="col-7">
                        <input type="text" class="input-field" name="<?php echo e('op'.$index); ?>" placeholder="" id="option_<?php echo e($option->id); ?>" value="<?php echo e($option->id); ?>" hidden>
                        <input type="text" class="input-field" name="<?php echo e('val'.$index); ?>" placeholder="" required>
                    </div>
                </div>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.load', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>