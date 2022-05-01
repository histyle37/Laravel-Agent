@extends('layouts.admin')

@section('styles')
@endsection

@section('content')

    <div class="content-area">
        <div class="mr-breadcrumb">
            <div class="row">
              <div class="col-lg-12">
                  <h4 class="heading">{{ __('Add New Report') }} <a class="add-btn" href="{{ url()->previous() }}"><i class="fas fa-arrow-left"></i> {{ __("Back") }}</a></h4>
                  <ul class="links">
                    <li>
                      <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
                    </li>
                    <li>
                      <a href="javascript:;">{{ __('Sale') }} </a>
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
                            <form id="geniusformdata" action="{{ route('admin-sale-store') }}" method="POST" enctype="multipart/form-data">
                                {{csrf_field()}}
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('TerminalID') }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="terminal_id" placeholder="{{ __("TerminalID") }}" required="" value="">
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
                                            <option value="{{ $zone->id }}">{{$zone->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div id="agent_list">
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
                                            <option value="{{ $week->id }}">{{$week->name}}</option>
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
                                        <input type="text" class="input-field" name="bet1" placeholder="{{ __("bet1") }}" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('bet2') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="bet2" placeholder="{{ __("bet2") }}" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('bank_tf') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="bank_tf" placeholder="{{ __("bank_tf") }}" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('paid') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="paid" placeholder="{{ __("paid") }}" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('win') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="win" placeholder="{{ __("win") }}" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('betwin1') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="betwin1" placeholder="{{ __("betwin1") }}" required="" value="0">
                                    </div>
                                </div>

                                <div class="row exceptional-prop">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                            <h4 class="heading">{{ __('betwin2') }}</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                        <input type="text" class="input-field" name="betwin2" placeholder="{{ __("betwin2") }}" required="" value="0">
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-4">
                                    <div class="left-area">
                                    </div>
                                    </div>
                                    <div class="col-lg-7">
                                    <button class="addProductSubmit-btn" type="submit">{{ __("Create Sale") }}</button>
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
</script>
@endsection