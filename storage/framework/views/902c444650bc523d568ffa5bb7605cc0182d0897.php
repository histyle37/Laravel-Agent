<li>
    <a href="#zones" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
        <i class="fas fa-image"></i><?php echo e(__('Zone')); ?>

    </a>
    <ul class="collapse list-unstyled" id="zones" data-parent="#accordion" >
        <li>
            <a href="<?php echo e(route('admin-zone-index')); ?>"> <?php echo e(__('Zones')); ?></a>
        </li>
        <li>
            <a href="<?php echo e(route('admin-zone-create')); ?>"> <?php echo e(__('Add Zone')); ?></a>
        </li>
    </ul>
</li>

<li>
    <a href="#agents" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
        <i class="icofont-user"></i><?php echo e(__('Agents')); ?>

    </a>
    <ul class="collapse list-unstyled" id="agents" data-parent="#accordion">
        <li>
            <a href="<?php echo e(route('admin-agent-index')); ?>"><span><?php echo e(__('Agents List')); ?></span></a>
        </li>
        <li>
            <a href="<?php echo e(route('admin-agent-create')); ?>"><span><?php echo e(__('Add New Agent')); ?></span></a>
        </li>
    </ul>
</li>

<li>
    <a href="#setting" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
        <i class="fas fa-fw fa-cogs"></i><?php echo e(__('Setting')); ?>

    </a>
    <ul class="collapse list-unstyled" id="setting" data-parent="#accordion">
        <li>
            <a href="<?php echo e(route('admin-option-index')); ?>"><span><?php echo e(__('Options')); ?></span></a>
        </li>
        <li>
            <a href="<?php echo e(route('admin-week-index')); ?>"><span><?php echo e(__('Weeks')); ?></span></a>
        </li>
        <li>
            <a href="<?php echo e(route('admin-bank-index')); ?>"><span><?php echo e(__('Banks')); ?></span></a>
        </li>
        <li>
            <a href="<?php echo e(route('admin-terminal-index')); ?>"><span><?php echo e(__('Terminals')); ?></span></a>
        </li>
    </ul>
    <li>
        <a href="#sales" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
            <i class="icofont-user"></i><?php echo e(__('Sales')); ?>

        </a>
        <ul class="collapse list-unstyled" id="sales" data-parent="#accordion">
            <li>
                <a href="<?php echo e(route('admin-sale-index')); ?>"><span><?php echo e(__('Sales List')); ?></span></a>
            </li>
            <li>
                <a href="<?php echo e(route('admin-sale-create')); ?>"><span><?php echo e(__('Add New Report')); ?></span></a>
            </li>
        </ul>
    </li>
</li>