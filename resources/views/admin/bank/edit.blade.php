@extends('layouts.load')
@section('styles')
<link href="{{asset('assets/admin/css/jquery-ui.css')}}" rel="stylesheet" type="text/css">
@endsection

@section('content')

    <div class="content-area">
        <div class="add-product-content1">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product-description">
                        <div class="body-area">
                            <div class="row">
                                <div class="col-lg-4 left-area"><h5>Update Bank</h5></div>
                                <div class="col-lg-7">
                                    @include('includes.admin.form-both')
                                </div>
                            </div>
                        
                        <form id="geniusformdata" action="{{ route('admin-bank-update',$data->id) }}" method="POST" enctype="multipart/form-data">
                            {{csrf_field()}}
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading">{{ __('Name') }} *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="name" placeholder="{{ __("Name") }}" required="" value="{{ $data->name }}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading">{{ __('No') }} *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="no" placeholder="{{ __("No") }}" required="" value="{{ $data->no }}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                <div class="left-area">
                                </div>
                                </div>
                                <div class="col-lg-7">
                                <button class="addProductSubmit-btn" type="submit">{{ __("Update Bank") }}</button>
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
    // var dates = $( "#from,#to" ).datepicker('destroy').datepicker({
    //     defaultDate: "+1w",
    //     changeMonth: true,
    //     changeYear: true,
    //     minDate: new Date(),
    //     dateFormat: 'yy-mm-dd',
    //     onSelect: function(selectedDate) {
    //         var option = this.id == "from" ? "minDate" : "maxDate",
    //         instance = $(this).data("datepicker"),
    //         date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
    //         dates.not(this).datepicker("option", option, date);
    //     }
    // });
</script>
@endsection