<?php $__env->startSection('content'); ?>
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
            <option value="<?php echo e($agent->id); ?>"><?php echo e($agent->name); ?></option>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </select>
    </div>
</div>
<div id="option_list"></div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
<script type="text/javascript">
    $("#agent_id").on('change', function(e){
        $.ajax({url: "/admin/sale/create/" + <?php echo e($zone_id); ?> + "/" + this.value, success: function(result){
            $('#option_list').html(result);
        }});
    });
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.load', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>