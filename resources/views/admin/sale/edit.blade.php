@extends('layouts.admin')

@section('styles')
@endsection

@section('content')

    <div class="content-area">
        <div class="mr-breadcrumb">
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="heading">{{ __('Edit Sale') }} <a class="add-btn" href="{{ url()->previous() }}"><i class="fas fa-arrow-left"></i> {{ __("Back") }}</a></h4>
                    <ul class="links">
                    <li>
                        <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
                    </li>
                    <li>
                        <a href="javascript:;">{{ __('Sale') }} </a>
                    </li>
                    <li>
                        <a href="javascript:;">{{ __('Edit') }}</a>
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
                            @include('includes.admin.form-both')
                            <form id="geniusformdata" action="{{ route('admin-sale-update', $data->id) }}" method="POST" enctype="multipart/form-data">
                                {{csrf_field()}}
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('TerminalID') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="terminal_id" placeholder="{{ __("TerminalID") }}" required="" value="{{ $data->terminal_id }}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Zone') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <select id="zone_id" name="zone_id" required="">
                                            <option value="">{{ __('Select Zone') }}</option>
                                            @foreach($zones as $zone)
                                            <option value="{{ $zone->id }}" {{$data->zone->id == $zone->id ? 'selected' : '' }}>{{$zone->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div id="agent_list">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="left-area">
                                                <h4 class="heading">{{ __('Agent') }} *</h4>
                                            </div>
                                        </div>
                                        <div class="col-lg-7">
                                            <select id="agent_id" name="agent_id" required="">
                                                <option value="">{{ __('Select Agent') }}</option>
                                                @foreach($agents as $agent)
                                                <option value="{{ $agent->id }}" {{$data->agent->id == $agent->id ? 'selected' : '' }}>{{$agent->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div id="option_list">
                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="left-area">
                                                    <h4 class="heading">{{ __('Options') }} *</h4>
                                                </div>
                                            </div>
                                            <div class="col-lg-7">
                                                <div class="options-area">
                                                    <input type="text" class="input-field" name="op_count" placeholder="" value="{{$options->count()}}" hidden>
                                                    @foreach($options as $index=>$option)
                                                        <div class="option-area">
                                                            <div class="col-3">{{$option->option->name}}</div>
                                                            <div class="col-7">
                                                                <input type="text" class="input-field" name="{{'op'.$index}}" placeholder="" id="option_{{$option->option->id}}" value="{{$option->option->id}}" hidden>
                                                                <input type="text" class="input-field" name="{{'val'.$index}}" placeholder="" required value="{{$option->value}}">
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Week') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <select id="week_id" name="week_id" required="">
                                            <option value="">{{ __('Select Week') }}</option>
                                            @foreach($weeks as $week)
                                            <option value="{{ $week->id }}" {{$data->week->id == $week->id ? 'selected' : '' }}>{{$week->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('bet1') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="bet1" placeholder="{{ __("bet1") }}" required="" value="{{$data->bet1}}">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('bet2') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="bet2" placeholder="{{ __("bet2") }}" required="" value="{{$data->bet2}}">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('bank_tf') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="bank_tf" placeholder="{{ __("bank_tf") }}" required="" value="{{$data->bank_tf}}">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('paid') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="paid" placeholder="{{ __("paid") }}" required="" value="{{$data->paid}}">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('win') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="win" placeholder="{{ __("win") }}" required="" value="{{$data->win}}">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('betwin1') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="betwin1" placeholder="{{ __("betwin1") }}" required="" value="{{$data->betwin1}}">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('betwin2') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="betwin2" placeholder="{{ __("betwin2") }}" required="" value="{{$data->betwin2}}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                    <div class="left-area">
                                    </div>
                                    </div>
                                    <div class="col-lg-7">
                                    <button class="addProductSubmit-btn" type="submit">{{ __("Update Sale") }}</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
@endsection

@section('scripts')
<script type="text/javascript">
    $("#zone_id").on('change', function(e){
        $.ajax({url: "/admin/sale/create/" + this.value,  success: function(result){
            $('#agent_list').html(result);
        }});
    });
    $("#agent_id").on('change', function(e){
        $.ajax({url: "/admin/sale/create/" + {{$data->id}} + "/" + this.value, success: function(result){
            $('#option_list').html(result);
        }});
    });
</script>
@endsection