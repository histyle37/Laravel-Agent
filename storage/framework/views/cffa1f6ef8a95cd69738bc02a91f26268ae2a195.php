<?php $__env->startSection('styles'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="content-area">
        <div class="mr-breadcrumb">
            <div class="row">
              <div class="col-lg-12">
                  <h4 class="heading"><?php echo e(__('Add New Report')); ?> <a class="add-btn" href="<?php echo e(url()->previous()); ?>"><i class="fas fa-arrow-left"></i> <?php echo e(__("Back")); ?></a></h4>
                  <ul class="links">
                    <li>
                      <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
                    </li>
                    <li>
                      <a href="javascript:;"><?php echo e(__('Sale')); ?> </a>
                    </li>
                    <li>
                      <a href="javascript:;"><?php echo e(__('Add')); ?></a>
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
                            <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
                            <form id="geniusformdata" action="<?php echo e(route('admin-sale-store')); ?>" method="POST" enctype="multipart/form-data">
                                <?php echo e(csrf_field()); ?>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('TerminalID')); ?> *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="terminal_id" placeholder="<?php echo e(__("TerminalID")); ?>" required="" value="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('Zone')); ?> *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <select id="zone_id" name="zone_id" required="">
                                            <option value=""><?php echo e(__('Select Zone')); ?></option>
                                            <?php $__currentLoopData = $zones; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $zone): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($zone->id); ?>"><?php echo e($zone->name); ?></option>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </select>
                                    </div>
                                </div>

                                <div id="agent_list">
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('Week')); ?> *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <select id="week_id" name="week_id" required="">
                                            <option value=""><?php echo e(__('Select Week')); ?></option>
                                            <?php $__currentLoopData = $weeks; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $week): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <option value="<?php echo e($week->id); ?>"><?php echo e($week->name); ?></option>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </select>
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('rt_exp')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="rt_exp" placeholder="<?php echo e(__("rt_exp")); ?>" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('bet1')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="bet1" placeholder="<?php echo e(__("bet1")); ?>" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('bet2')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="bet2" placeholder="<?php echo e(__("bet2")); ?>" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('bank_tf')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="bank_tf" placeholder="<?php echo e(__("bank_tf")); ?>" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('paid')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="paid" placeholder="<?php echo e(__("paid")); ?>" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('win')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="win" placeholder="<?php echo e(__("win")); ?>" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('betwin1')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="betwin1" placeholder="<?php echo e(__("betwin1")); ?>" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('betwin2')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="betwin2" placeholder="<?php echo e(__("betwin2")); ?>" required="" value="0">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                    <div class="left-area">
                                    </div>
                                    </div>
                                    <div class="col-lg-7">
                                    <button class="addProductSubmit-btn" type="submit"><?php echo e(__("Create Sale")); ?></button>
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
    $("#zone_id").on('change', function(e){
        $.ajax({url: "/admin/sale/create/" + this.value,  success: function(result){
            $('#agent_list').html(result);
        }});
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>