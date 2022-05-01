<?php $__env->startSection('styles'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="content-area">
        <div class="mr-breadcrumb">
            <div class="row">
              <div class="col-lg-12">
                  <h4 class="heading"><?php echo e(__('Add New Agent')); ?> <a class="add-btn" href="<?php echo e(url()->previous()); ?>"><i class="fas fa-arrow-left"></i> <?php echo e(__("Back")); ?></a></h4>
                  <ul class="links">
                    <li>
                      <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
                    </li>
                    <li>
                      <a href="javascript:;"><?php echo e(__('Agent')); ?> </a>
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
                            <form id="geniusformdata" action="<?php echo e(route('admin-agent-store')); ?>" method="POST" enctype="multipart/form-data">
                                <?php echo e(csrf_field()); ?>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('UserID')); ?> *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="user_id" placeholder="<?php echo e(__("UserID")); ?>" required="" value="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('Password')); ?> *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="password" placeholder="<?php echo e(__("Password")); ?>" required="" value="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                                <h4 class="heading"><?php echo e(__('Name')); ?> *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="name" placeholder="<?php echo e(__("Agent Name")); ?>" required="" value="">
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

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                                <h4 class="heading"><?php echo e(__('Phone Number')); ?> *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="phone_number" placeholder="<?php echo e(__("Phone Number")); ?>" required="" value="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                                <h4 class="heading"><?php echo e(__('Address')); ?> *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="address" placeholder="<?php echo e(__("Address")); ?>" required="" value="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('Exceptional Rule')); ?> *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <label class="switch exceptional-rule">
                                            <input type="checkbox" name="exceptional_rule" value="1" >
                                            <span class="slider round"></span>
                                        </label>
                                    </div>
                                </div>

                                <div class="row exceptional-prop" style="display: none">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('Options')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <div class="options-area">
                                            <div class="row option-area">
                                                <div class="col-2"></div>
                                                <div class="col-5">Name</div>
                                                <div class="col-5">Commission</div>
                                            </div>
                                            <hr style="margin: 0;margin: 0 0 10px 0;">
                                            <?php $__currentLoopData = $options; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $option): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <div class="option-area">
                                                    <div class="col-2">
                                                        <input value="<?php echo e($option->id); ?>" class="option-checkbox" type="checkbox" name="option[]" id="option_<?php echo e($option->id); ?>" />
                                                    </div>
                                                    <div class="col-5"><?php echo e($option->name); ?></div>
                                                    <div class="col-5"><?php echo e($option->commission); ?></div>
                                                </div>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </div>
                                    </div>
                                </div>

                                <div class="row exceptional-prop" style="display: none">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('Gross Percent')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="number" class="input-field" name="gross_percent" placeholder="<?php echo e(__("Gross Percent")); ?>" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop" style="display: none">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('RT/EXP')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="rt_exp" placeholder="<?php echo e(__("RT/EXP")); ?>" value="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                    <div class="left-area">
                                    </div>
                                    </div>
                                    <div class="col-lg-7">
                                    <button class="addProductSubmit-btn" type="submit"><?php echo e(__("Create Agent")); ?></button>
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
    $(".switch.exceptional-rule").click(function(){
        let checked = $(this).find("input").prop("checked");
        checked ? $(".exceptional-prop").show() : $(".exceptional-prop").hide();
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>