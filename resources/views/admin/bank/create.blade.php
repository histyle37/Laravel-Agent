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
                                <div class="col-lg-4 left-area"><h5>Add New Bank</h5></div>
                                <div class="col-lg-7">
                                    @include('includes.admin.form-both')
                                </div>
                            </div>
                        
                        <form id="geniusformdata" action="{{ route('admin-bank-store') }}" method="POST" enctype="multipart/form-data">
                            {{csrf_field()}}
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading">{{ __('Name') }} *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="name" placeholder="{{ __("Name") }}" required="" value="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="left-area">
                                            <h4 class="heading">{{ __('No') }} *</h4>
                                    </div>
                                </div>
                                <div class="col-lg-7">
                                    <input type="text" class="input-field" name="no" placeholder="{{ __("No") }}" required="" value="">
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-4">
                                <div class="left-area">
                                </div>
                                </div>
                                <div class="col-lg-7">
                                <button class="addProductSubmit-btn" type="submit">{{ __("Create Bank") }}</button>
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