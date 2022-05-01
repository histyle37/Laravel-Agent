 

<?php $__env->startSection('content'); ?>  
<input type="hidden" id="headerdata" value="<?php echo e(__('Terminal')); ?>">
<div class="content-area">
    <div class="mr-breadcrumb">
        <div class="row">
            <div class="col-lg-12">
                    <h4 class="heading"><?php echo e(__('Terminals')); ?></h4>
                    <ul class="links">
                        <li>
                            <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
                        </li>
                        <li>
                            <a href="<?php echo e(route('admin-terminal-index')); ?>"><?php echo e(__('Terminals')); ?></a>
                        </li>
                    </ul>
            </div>
        </div>
    </div>
    <div class="product-area">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-area">
                    <h4 class="title">Terminals</h4>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="mr-table allproduct">
                    <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?> 
                    <div class="table-responsiv">
                        <table id="geniustable" class="table table-hover dt-responsive" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th><?php echo e(__('No')); ?></th>
                                    <th><?php echo e(__('Name')); ?></th>
                                    <th><?php echo e(__('Options')); ?></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
                        
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
                                <div class="submit-loader">
                                        <img  src="<?php echo e(asset('assets/images/'.$gs->admin_loader)); ?>" alt="">
                                </div>
                            <div class="modal-header">
                            <h5 class="modal-title"></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            </div>
                            <div class="modal-body">

                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"><?php echo e(__('Close')); ?></button>
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
            <p class="text-center"><?php echo e(__('You are about to delete this Terminal.')); ?></p>
            <p class="text-center"><?php echo e(__('Do you want to proceed?')); ?></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer justify-content-center">
            <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo e(__('Cancel')); ?></button>
            <a class="btn btn-danger btn-ok" data-dismiss="modal"><?php echo e(__('Delete')); ?></a>
      </div>

    </div>
  </div>
</div>



<?php $__env->stopSection(); ?>    



<?php $__env->startSection('scripts'); ?>




    <script type="text/javascript">

		var table = $('#geniustable').DataTable({
			   ordering: false,
               processing: true,
               serverSide: true,
               ajax: '<?php echo e(route('admin-terminal-datatables')); ?>',
               columns: [
                        { data: 'no', name: 'no' },
                        { data: 'name', name: 'name' },
            			{ data: 'action', searchable: false, orderable: false }
                     ],
               language : {
                	processing: '<img src="<?php echo e(asset('assets/images/'.$gs->admin_loader)); ?>">'
                }
            });

      	$(function() {
        $(".btn-area").append('<div class="col-sm-4 text-right">'+
        	'<a class="add-btn" data-href="<?php echo e(route('admin-terminal-create')); ?>" id="add-data" data-toggle="modal" data-target="#modal1">'+
          '<i class="fas fa-plus"></i> <?php echo e(__('Add New Terminal')); ?>'+
          '</a>'+
          '</div>');
      });												
									
    </script>


    
<?php $__env->stopSection(); ?>   
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>