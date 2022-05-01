@extends('layouts.load')
@section('content')

    <div class="content-area">
        <div class="add-product-content1">
            <div class="row">
                <div class="col-lg-12">
                    <div class="product-description">
                        <div class="body-area">
                            <div class="row">
                                <div class="col-lg-4 left-area"><h5>Add New Option</h5></div>
                                <div class="col-lg-7">
                                    @include('includes.admin.form-both')
                                </div>
                            </div>
                        
                        <form id="geniusformdata" action="{{ route('admin-option-update',$data->id) }}" method="POST" enctype="multipart/form-data">
                            {{csrf_field()}}

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading">{{ __('Name') }} *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="name" placeholder="{{ __("Option Name") }}" required="" value="{{ $data->name }}">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading">{{ __("Commission") }} *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="commission" placeholder="{{ __("Commission") }}" required="" value="{{ $data->commission }}">
                                </div>
                            </div>

                            <div class="row">
                                    <div class="col-lg-4">
                                        <div class="left-area">
                                                <h4 class="heading">{{ __("Status") }} *</h4>
                                        </div>
                                    </div>
                                    <div class="col-lg-7">
                                            <select  name="status" required="">
                                                <option value="">{{ __('Select Status') }}</option>

                                                <option value="1" {{ $data->status == 1 ? 'selected' : '' }}>Active</option>
                                                <option value="0" {{ $data->status == 0 ? 'selected' : '' }}>Disabled</option>
                                            </select>
                                        </div>
                                </div>

                            <div class="row">
                                <div class="col-lg-4">
                                <div class="left-area">
                                </div>
                                </div>
                                <div class="col-lg-7">
                                <button class="addProductSubmit-btn" type="submit">{{ __("Update Option") }}</button>
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