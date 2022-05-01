@extends('layouts.admin')

@section('styles')
@endsection

@section('content')

    <div class="content-area">
        <div class="mr-breadcrumb">
            <div class="row">
              <div class="col-lg-12">
                  <h4 class="heading">{{ __('Add New Zone') }} <a class="add-btn" href="{{ url()->previous() }}"><i class="fas fa-arrow-left"></i> {{ __("Back") }}</a></h4>
                  <ul class="links">
                    <li>
                      <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
                    </li>
                    <li>
                      <a href="javascript:;">{{ __('Zone') }} </a>
                    </li>
                    <li>
                      <a href="javascript:;">{{ __('Add') }}</a>
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
                            <form id="geniusformdata" action="{{ route('admin-zone-store') }}" method="POST" enctype="multipart/form-data">
                                {{csrf_field()}}
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                                <h4 class="heading">{{ __('Name') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="name" placeholder="{{ __("Zone Name") }}" required="" value="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('UserID') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="user_id" placeholder="{{ __("UserID") }}" required="" value="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Password') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="password" placeholder="{{ __("Password") }}" required="" value="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Commission') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="commission" placeholder="{{ __("Commission") }}" required="" value="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Options') }} *</h4>
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
                                                        <input value="{{$option->id}}" class="option-checkbox" type="checkbox" name="option[]" id="option_{{$option->id}}" />
                                                    </div>
                                                    <div class="col-5">{{$option->name}}</div>
                                                    <div class="col-5">{{$option->commission}}</div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Gross Percent') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="gross_percent" placeholder="{{ __("Gross Percent") }}" required="" value="0">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('RT/EXP') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="rt_exp" placeholder="{{ __("RT/EXP") }}" required="" value="">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Bet1') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <label class="switch">
                                            <input type="checkbox" name="bet1" value="1" checked>
                                            <span class="slider round"></span>
                                        </label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Bet2') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <label class="switch">
                                            <input type="checkbox" name="bet2" value="1" checked>
                                            <span class="slider round"></span>
                                        </label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('Loto') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <label class="switch">
                                            <input type="checkbox" name="loto" value="1" checked>
                                            <span class="slider round"></span>
                                        </label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                    <div class="left-area">
                                    </div>
                                    </div>
                                    <div class="col-lg-7">
                                    <button class="addProductSubmit-btn" type="submit">{{ __("Create Zone") }}</button>
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
</script>
@endsection