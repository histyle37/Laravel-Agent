 

<?php $__env->startSection('styles'); ?>

<link href="<?php echo e(asset('assets/admin/css/hidatatable.css')); ?>" rel="stylesheet" />

<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>  

<input type="hidden" id="headerdata" value="<?php echo e(__('EXCELS')); ?>">
<div class="content-area">
    <div class="mr-breadcrumb">
        <div class="row">
            <div class="col-lg-12">
                    <h4 class="heading"><?php echo e(__('All EXCELS')); ?></h4>
                    <ul class="links">
                        <li>
                            <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
                        </li>
                        <li>
                            <a href="javascript:;"><?php echo e(__('EXCELS')); ?></a>
                        </li>
                        <li>
                            <a href="<?php echo e(route('admin-photo-index')); ?>"><?php echo e(__('All Excels')); ?></a>
                        </li>
                    </ul>
            </div>
        </div>
    </div>
    <div class="product-area">
        <div class="gocover" style="background: url(<?php echo e(asset('assets/images/spinner.gif')); ?>) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
        <div class="row">
            <div class="col-12">
                <div id="hi_datatable">
                    <div class="row search-item search-header" data-id="0">
                        <div class="col-1">Id</div>
                        <div class="col-9">Action</div>
                    </div>
                    <div class="search-section">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

	<div class="modal-header d-block text-center">
		<h4 class="modal-title d-inline-block"><?php echo e(__('Confirm Delete')); ?></h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
	</div>

      <!-- Modal body -->
      <div class="modal-body">
            <p class="text-center"><?php echo e(__('You are about to delete this Data.')); ?></p>
            <p class="text-center"><?php echo e(__('Do you want to proceed?')); ?></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer justify-content-center">
            <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
            <a class="btn btn-danger btn-ok"><?php echo e(__('Delete')); ?></a>
      </div>

    </div>
  </div>
</div>



<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
<script src="<?php echo e(asset('assets/admin/js/hidatatable.js')); ?>"></script>
<script type="text/javascript">

    $(document).ready(function(){
        hidatatable($("#hi_datatable"), {
            ajax: '<?php echo e(route('admin-photo-datatables')); ?>',
            columns: [
                { data: 'id'},
                { data: 'action'}
            ],
            loading: $(".gocover")
        });
    });

</script>


    
<?php $__env->stopSection(); ?>   
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>