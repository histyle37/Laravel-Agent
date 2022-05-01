<li>
    <a href="#zones" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
        <i class="fas fa-image"></i>{{ __('Zone') }}
    </a>
    <ul class="collapse list-unstyled" id="zones" data-parent="#accordion" >
        <li>
            <a href="{{route('admin-zone-index')}}"> {{ __('Zones') }}</a>
        </li>
        <li>
            <a href="{{route('admin-zone-create')}}"> {{ __('Add Zone') }}</a>
        </li>
    </ul>
</li>

<li>
    <a href="#agents" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
        <i class="icofont-user"></i>{{ __('Agents') }}
    </a>
    <ul class="collapse list-unstyled" id="agents" data-parent="#accordion">
        <li>
            <a href="{{ route('admin-agent-index') }}"><span>{{ __('Agents List') }}</span></a>
        </li>
        <li>
            <a href="{{ route('admin-agent-create') }}"><span>{{ __('Add New Agent') }}</span></a>
        </li>
    </ul>
</li>

<li>
    <a href="#setting" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
        <i class="fas fa-fw fa-cogs"></i>{{ __('Setting') }}
    </a>
    <ul class="collapse list-unstyled" id="setting" data-parent="#accordion">
        <li>
            <a href="{{ route('admin-option-index') }}"><span>{{ __('Options') }}</span></a>
        </li>
        <li>
            <a href="{{ route('admin-week-index') }}"><span>{{ __('Weeks') }}</span></a>
        </li>
        <li>
            <a href="{{ route('admin-bank-index') }}"><span>{{ __('Banks') }}</span></a>
        </li>
        <li>
            <a href="{{ route('admin-terminal-index') }}"><span>{{ __('Terminals') }}</span></a>
        </li>
    </ul>
    <li>
        <a href="#sales" class="accordion-toggle wave-effect" data-toggle="collapse" aria-expanded="false">
            <i class="icofont-user"></i>{{ __('Sales') }}
        </a>
        <ul class="collapse list-unstyled" id="sales" data-parent="#accordion">
            <li>
                <a href="{{ route('admin-sale-index') }}"><span>{{ __('Sales List') }}</span></a>
            </li>
            <li>
                <a href="{{ route('admin-sale-create') }}"><span>{{ __('Add New Report') }}</span></a>
            </li>
        </ul>
    </li>
</li>