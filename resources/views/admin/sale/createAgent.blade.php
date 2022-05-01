@extends('layouts.load')
@section('content')
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
            <option value="{{ $agent->id }}">{{$agent->name}}</option>
            @endforeach
        </select>
    </div>
</div>
<div id="option_list"></div>
@endsection

@section('scripts')
<script type="text/javascript">
    $("#agent_id").on('change', function(e){
        $.ajax({url: "/admin/sale/create/" + {{$zone_id}} + "/" + this.value, success: function(result){
            $('#option_list').html(result);
        }});
    });
</script>
@endsection