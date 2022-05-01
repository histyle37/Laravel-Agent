@extends('layouts.admin')

@section('content')
<div class="content-area">
    @include('includes.form-success')

    @if(Session::has('cache'))

    <div class="alert alert-success validation">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                aria-hidden="true">×</span></button>
        <h3 class="text-center">{{ Session::get("cache") }}</h3>
    </div>
  @endif
    <div class="row row-cards-one">
        <div class="col-md-12 col-lg-6 col-xl-4">
            <div class="mycard bg1">
                <div class="left">
                    <h5 class="title">{{ __('Zones') }} </h5>
                    <span class="number">{{App\Models\Zone::count()}}</span>
                    <a href="{{route('admin-zone-index')}}" class="link">{{ __('View All') }}</a>
                </div>
                <div class="right d-flex align-self-center">
                    <div class="icon">
                        {{ __('counts') }}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-lg-6 col-xl-4">
            <div class="mycard bg2">
                <div class="left">
                    <h5 class="title">{{ __('Agents') }}</h5>
                    <span class="number">{{App\Models\Agent::count()}}</span>
                    <a href="{{route('admin-agent-index')}}" class="link">{{ __('View All') }}</a>
                </div>
                <div class="right d-flex align-self-center">
                    <div class="icon">
                        <!-- <i class="icofont-dollar"></i> -->
                        {{ __('counts') }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@section('scripts')

<script language="JavaScript">
</script>

@endsection