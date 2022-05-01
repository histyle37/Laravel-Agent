<?php $__env->startSection('content'); ?>
<div class="content-area">
    <?php echo $__env->make('includes.form-success', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>

    <?php if(Session::has('cache')): ?>

    <div class="alert alert-success validation">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">×</span></button>
        <h3 class="text-center"><?php echo e(Session::get("cache")); ?></h3>
    </div>
  <?php endif; ?>
    <div class="row row-cards-one">
        <div class="col-md-12 col-lg-6 col-xl-4">
            <div class="mycard bg1">
                <div class="left">
                    <h5 class="title"><?php echo e(__('Zones')); ?> </h5>
                    <span class="number"><?php echo e(App\Models\Zone::count()); ?></span>
                    <a href="<?php echo e(route('admin-zone-index')); ?>" class="link"><?php echo e(__('View All')); ?></a>
                </div>
                <div class="right d-flex align-self-center">
                    <div class="icon">
                        <?php echo e(__('counts')); ?>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-6 col-xl-4">
            <div class="mycard bg2">
                <div class="left">
                    <h5 class="title"><?php echo e(__('Agents')); ?></h5>
                    <span class="number"><?php echo e(App\Models\Agent::count()); ?></span>
                    <a href="<?php echo e(route('admin-agent-index')); ?>" class="link"><?php echo e(__('View All')); ?></a>
                </div>
                <div class="right d-flex align-self-center">
                    <div class="icon">
                        <!-- <i class="icofont-dollar"></i> -->
                        <?php echo e(__('counts')); ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>

<script language="JavaScript">
</script>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>