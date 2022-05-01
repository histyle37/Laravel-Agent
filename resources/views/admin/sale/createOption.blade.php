@extends('layouts.load')
@section('content')
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
                    <div class="col-3">{{$option->name}}</div>
                    <div class="col-7">
                        <input type="text" class="input-field" name="{{'op'.$index}}" placeholder="" id="option_{{$option->id}}" value="{{$option->id}}" hidden>
                        <input type="text" class="input-field" name="{{'val'.$index}}" placeholder="" required>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</div>
@endsection