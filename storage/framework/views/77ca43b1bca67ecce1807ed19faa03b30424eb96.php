<?php $__env->startSection('content'); ?>

						<div class="content-area">
							<div class="mr-breadcrumb">
								<div class="row">
									<div class="col-lg-12">
											<h4 class="heading"><?php echo e(__('Edit Profile')); ?></h4>
											<ul class="links">
												<li>
													<a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo e(__('Dashboard')); ?> </a>
												</li>
												<li>
													<a href="<?php echo e(route('admin.profile')); ?>"><?php echo e(__('Edit Profile')); ?> </a>
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

				                        <div class="gocover" style="background: url(<?php echo e(asset('assets/images/spinner.gif')); ?>) no-repeat scroll center center rgba(45, 45, 45, 0.5);"></div>
											<form id="data_form" action="<?php echo e(route('admin.profile.update')); ?>" method="POST" enctype="multipart/form-data">
												<?php echo e(csrf_field()); ?>


                        <?php echo $__env->make('includes.admin.form-both', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>  

						                        <div class="row">
						                          <div class="col-lg-4">
						                            <div class="left-area">
						                                <h4 class="heading"><?php echo e(__('Current Profile Image')); ?> *</h4>
						                            </div>
						                          </div>
						                          <div class="col-lg-7">
						                            <div class="img-upload">
						                                <div id="image-preview" class="img-preview" style="background: url(<?php echo e($data->photo ? asset('assets/images/admins/'.$data->photo):asset('assets/images/noimage.png')); ?>);">
						                                    <label for="image-upload" class="img-label" id="image-label"><i class="icofont-upload-alt"></i><?php echo e(__('Upload Image')); ?></label>
						                                    <input type="file" name="photo" class="img-upload" id="image-upload">
						                                  </div>
						                            </div>
						                          </div>
						                        </div>


												<div class="row">
													<div class="col-lg-4">
														<div class="left-area">
																<h4 class="heading"><?php echo e(__('Name')); ?> *</h4>
														</div>
													</div>
													<div class="col-lg-7">
														<input type="text" class="input-field" name="name" placeholder="<?php echo e(__('User Name')); ?>" required="" value="<?php echo e($data->name); ?>">
													</div>
												</div>


												<div class="row">
													<div class="col-lg-4">
														<div class="left-area">
																<h4 class="heading"><?php echo e(__('Email')); ?> *</h4>
														</div>
													</div>
													<div class="col-lg-7">
														<input type="email" class="input-field" name="email" placeholder="<?php echo e(__('Email Address')); ?>" required="" value="<?php echo e($data->email); ?>">
													</div>
												</div>

												<div class="row">
													<div class="col-lg-4">
														<div class="left-area">
																<h4 class="heading"><?php echo e(__('Phone')); ?> *</h4>
														</div>
													</div>
													<div class="col-lg-7">
														<input type="text" class="input-field" name="phone" placeholder="<?php echo e(__('Phone Number')); ?>" required="" value="<?php echo e($data->phone); ?>">
													</div>
												</div>

											<?php if(Auth::guard('admin')->user()->id == 1): ?>
												<div class="row">
													<div class="col-lg-4">
														<div class="left-area">
															<h4 class="heading"><?php echo e(__('Shop Name')); ?> *</h4>
														</div>
													</div>
													<div class="col-lg-7">
														<input type="text" class="input-field" name="shop_name" placeholder="<?php echo e(__('Shop Name')); ?>" required="" value="<?php echo e($data->shop_name); ?>">
													</div>
												</div>
											<?php endif; ?>



						                        <div class="row">
						                          <div class="col-lg-4">
						                            <div class="left-area">
						                              
						                            </div>
						                          </div>
						                          <div class="col-lg-7">
						                            <button class="addProductSubmit-btn" type="submit"><?php echo e(__('Save')); ?></button>
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
<?php echo $__env->make('layouts.admin', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>