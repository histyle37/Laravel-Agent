<?php $__env->startSection('styles'); ?>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>

    <div class="content-area">
        <div class="mr-breadcrumb">
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="heading"><?php echo e(__('Edit Sale')); ?> <a class="add-btn" href="<?php echo e(url()->previous()); ?>"><i class="fas fa-arrow-left"></i> <?php echo e(__("Back")); ?></a></h4>
                    <ul class="links">
                    <li>
                        <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
                    </li>
                    <li>
                        <a href="javascript:;"><?php echo e(__('Sale')); ?> </a>
                    </li>
                    <li>
                        <a href="javascript:;"><?php echo e(__('Edit')); ?></a>
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
                            <form id="geniusformdata" action="<?php echo e(route('admin-sale-update', $data->id)); ?>" method="POST" enctype="multipart/form-data">
                                <?php echo e(csrf_field()); ?>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('TerminalID')); ?> *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="terminal_id" placeholder="<?php echo e(__("TerminalID")); ?>" required="" value="<?php echo e($data->terminal_id); ?>">
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
                                            <option value="<?php echo e($zone->id); ?>" <?php echo e($data->zone->id == $zone->id ? 'selected' : ''); ?>><?php echo e($zone->name); ?></option>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </select>
                                    </div>
                                </div>

                                <div id="agent_list">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="left-area">
                                                <h4 class="heading"><?php echo e(__('Agent')); ?> *</h4>
                                            </div>
                                        </div>
                                        <div class="col-lg-7">
                                            <select id="agent_id" name="agent_id" required="">
                                                <option value=""><?php echo e(__('Select Agent')); ?></option>
                                                <?php $__currentLoopData = $agents; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $agent): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <option value="<?php echo e($agent->id); ?>" <?php echo e($data->agent->id == $agent->id ? 'selected' : ''); ?>><?php echo e($agent->name); ?></option>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="option_list">
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
                                                            <div class="col-3"><?php echo e($option->option->name); ?></div>
                                                            <div class="col-7">
                                                                <input type="text" class="input-field" name="<?php echo e('op'.$index); ?>" placeholder="" id="option_<?php echo e($option->option->id); ?>" value="<?php echo e($option->option->id); ?>" hidden>
                                                                <input type="text" class="input-field" name="<?php echo e('val'.$index); ?>" placeholder="" required value="<?php echo e($option->value); ?>">
                                                            </div>
                                                        </div>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                                            <option value="<?php echo e($week->id); ?>" <?php echo e($data->week->id == $week->id ? 'selected' : ''); ?>><?php echo e($week->name); ?></option>
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
                                        <input type="text" class="input-field" name="rt_exp" placeholder="<?php echo e(__("rt_exp")); ?>" required="" value="<?php echo e($data->rt_exp); ?>">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('bet1')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="bet1" placeholder="<?php echo e(__("bet1")); ?>" required="" value="<?php echo e($data->bet1); ?>">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('bet2')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="bet2" placeholder="<?php echo e(__("bet2")); ?>" required="" value="<?php echo e($data->bet2); ?>">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('bank_tf')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="bank_tf" placeholder="<?php echo e(__("bank_tf")); ?>" required="" value="<?php echo e($data->bank_tf); ?>">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('paid')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="paid" placeholder="<?php echo e(__("paid")); ?>" required="" value="<?php echo e($data->paid); ?>">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('win')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="win" placeholder="<?php echo e(__("win")); ?>" required="" value="<?php echo e($data->win); ?>">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('betwin1')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="betwin1" placeholder="<?php echo e(__("betwin1")); ?>" required="" value="<?php echo e($data->betwin1); ?>">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading"><?php echo e(__('betwin2')); ?></h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="betwin2" placeholder="<?php echo e(__("betwin2")); ?>" required="" value="<?php echo e($data->betwin2); ?>">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                    <div class="left-area">
                                    </div>
                                    </div>
                                    <div class="col-lg-7">
                                    <button class="addProductSubmit-btn" type="submit"><?php echo e(__("Update Sale")); ?></button>
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
    $("#agent_id").on('change', function(e){
        $.ajax({url: "/admin/sale/create/" + <?php echo e($data->id); ?> + "/" + this.value, success: function(result){
            $('#option_list').html(result);
        }});
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>