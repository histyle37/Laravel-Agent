<!DOCTYPE html>
<html lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge">

	<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>{{$gs->title}}</title>
	<!-- favicon -->
	<link rel="icon"  type="image/x-icon" href="{{asset('assets/images/'.$gs->favicon)}}"/>

	<link rel="stylesheet" href="{{asset('assets/front/css/common.css')}}">
	<!-- <link rel="stylesheet" href="{{ asset('assets/front/css/rtl/styles.php?color='.str_replace('#','',$gs->colors).'&amp;'.'header_color='.str_replace('#','',$gs->header_color).'&amp;'.'footer_color='.str_replace('#','',$gs->footer_color).'&amp;'.'copyright_color='.str_replace('#','',$gs->copyright_color).'&amp;'.'menu_color='.str_replace('#','',$gs->menu_color).'&amp;'.'menu_hover_color='.str_replace('#','',$gs->menu_hover_color)) }}"> -->

	@yield('styles')

</head>

<body>

@if($gs->is_loader == 1)
	<div style="display:none;" class="preloader" id="preloader" style="background: url({{asset('assets/images/'.$gs->loader)}}) no-repeat scroll center center #FFF;"></div>
@endif

@if($gs->is_popup== 1)

@if(isset($visited))
    <!--  Starting of subscribe-pre-loader Area   -->
    <!--  Ending of subscribe-pre-loader Area   -->
@endif

@endif
<div id="wrapper">
	@yield('content')
</div>

<script type="text/javascript">
  var mainurl = "{{url('/')}}";
  var gs      = {!! json_encode($gs) !!};
  var langg    = {!! json_encode($langg) !!};
</script>
	<!-- common -->
	<script src="{{asset('assets/libs/js/jquery-3.3.1.min.js')}}"></script>
	<script src="{{asset('assets/libs/js/bootstrap.min.js')}}"></script>
	<script src="{{asset('assets/front/js/common.js')}}"></script>

	@yield('scripts')
</body>

</html>
