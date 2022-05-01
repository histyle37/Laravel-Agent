@extends('layouts.admin')

@section('styles')
@endsection

@section('content')

    <div class="content-area">
        <div class="mr-breadcrumb">
            <div class="row">
                <div class="col-lg-12">
                    <h4 class="heading">{{ __('Edit Agent') }} <a class="add-btn" href="{{ url()->previous() }}"><i class="fas fa-arrow-left"></i> {{ __("Back") }}</a></h4>
                    <ul class="links">
                    <li>
                        <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
                    </li>
                    <li>
                        <a href="javascript:;">{{ __('Agent') }} </a>
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
                            <form id="geniusformdata" action="{{ route('admin-agent-update', $data->id) }}" method="POST" enctype="multipart/form-data">
                                {{csrf_field()}}
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('UserID') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="user_id" placeholder="{{ __("UserID") }}" required="" value="{{ $data->user_id }}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Password') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="password" placeholder="{{ __("Password") }}" required="" value="{{ $data->password }}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                                <h4 class="heading">{{ __('Name') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="name" placeholder="{{ __("Agent Name") }}" required="" value="{{ $data->name }}">
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
                                            <option value="{{ $zone->id }}" {{ $data->zone_id == $zone->id ? 'selected' : '' }}>{{$zone->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                                <h4 class="heading">{{ __('Phone Number') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="phone_number" placeholder="{{ __("Phone Number") }}" required="" value="{{ $data->phone_number }}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                                <h4 class="heading">{{ __('Address') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="address" placeholder="{{ __("Address") }}" required="" value="{{ $data->address }}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                                <h4 class="heading">{{ __('Loan') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="loan" placeholder="{{ __("Loan") }}" required="" value="{{ $data->loan }}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                                <h4 class="heading">{{ __('Deduction') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="deduction" placeholder="{{ __("Deduction") }}" required="" value="{{ $data->deduction }}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Exceptional Rule') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <label class="switch exceptional-rule">
                                            <input type="checkbox" name="exceptional_rule" value="1" {{ $data->exceptional_rule == 1 ? 'checked' : '' }}>
                                            <span class="slider round"></span>
                                        </label>
                                    </div>
                                </div>

                                <div class="row exceptional-prop"  {{ $data->exceptional_rule == 0 ? 'style=display:none' : '' }}>
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Options') }}</h4>
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
                                            @foreach($options as $option)
                                                <div class="option-area">
                                                    <div class="col-2">
                                                        <input value="{{$option->id}}" class="option-checkbox" type="checkbox" name="option[]" id="option_{{$option->id}}" {{ $data->options && in_array($option->id, $data->options->pluck('id')->toArray()) ? "checked" : ""}}/>
                                                    </div>
                                                    <div class="col-5">{{$option->name}}</div>
                                                    <div class="col-5">{{$option->commission}}</div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>

                                <div class="row exceptional-prop" {{ $data->exceptional_rule == 0 ? 'style=display:none' : '' }}>
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Gross Percent') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="gross_percent" placeholder="{{ __("Gross Percent") }}" required="" value="{{$data->gross_percent}}">
                                    </div>
                                </div>

                                <div class="row exceptional-prop" {{ $data->exceptional_rule == 0 ? 'style=display:none' : '' }}>
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('RT/EXP') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="rt_exp" placeholder="{{ __("RT/EXP") }}" value="{{ $data->rt_exp }}">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                    <div class="left-area">
                                    </div>
                                    </div>
                                    <div class="col-lg-7">
                                    <button class="addProductSubmit-btn" type="submit">{{ __("Update Agent") }}</button>
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
    $(".switch.exceptional-rule").click(function(){
        let checked = $(this).find("input").prop("checked");
        checked ? $(".exceptional-prop").show() : $(".exceptional-prop").hide();
    });
</script>
@endsection