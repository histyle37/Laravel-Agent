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
                                <div class="col-lg-4 left-area"><h5>Add New Week</h5></div>
                                <div class="col-lg-7">
                                    @include('includes.admin.form-both')
                                </div>
                            </div>
                        
                        <form id="geniusformdata" action="{{ route('admin-week-store') }}" method="POST" enctype="multipart/form-data">
                            {{csrf_field()}}
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading">{{ __('Week') }} *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="name" placeholder="{{ __("Week") }}" required="" value="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                        <h4 class="heading">{{ __('Start Date') }} *</h4>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="datetime-local" class="input-field start-date" name="start_date" id="start_date" placeholder="{{ __('Select a date') }}" required="" value="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                        <h4 class="heading">{{ __('End Date') }} *</h4>
                                        
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="datetime-local" class="input-field" name="end_date" id="end_date" placeholder="{{ __('Select a date') }}" required="" value="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                        <h4 class="heading">{{ __('Set Current') }} *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <label class="switch">
                                        <input type="checkbox" name="is_current" value="1" checked>
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
                                <button class="addProductSubmit-btn" type="submit">{{ __("Create Week") }}</button>
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