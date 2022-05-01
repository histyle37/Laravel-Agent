@extends('layouts.admin') 

@section('content')  
<input type="hidden" id="headerdata" value="{{ __('Sale') }}">
<div class="content-area">
    <div class="mr-breadcrumb">
        <div class="row">
            <div class="col-lg-12">
                    <h4 class="heading">{{ __('Sales') }}</h4>
                    <ul class="links">
                        <li>
                            <a href="{{ route('admin.dashboard') }}">{{ __('Dashboard') }} </a>
                        </li>
                        <li>
                            <a href="{{ route('admin-sale-index') }}">{{ __('Sales') }}</a>
                        </li>
                    </ul>
            </div>
        </div>
    </div>
    <div class="product-area">
        <div class="row">
            <div class="col-lg-12">
                <div class="heading-area">
                    <h4 class="title">Sales</h4>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="mr-table allproduct">
                    @include('includes.admin.form-both') 
                    <div class="table-responsiv">
                            <table id="geniustable" class="table table-hover dt-responsive" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>{{ __('WK') }}</th>
                                        <th>{{ __('ID') }}</th>
                                        <th>{{ __('TerminalID') }}</th>
                                        <th>{{ __('Zone') }}</th>
                                        <th>{{ __('Agent') }}</th>
                                        <th>{{ __('sales') }}</th>
                                        <th>{{ __('net') }}</th>
                                        <th>{{ __('BankTF') }}</th>
                                        <th>{{ __('Paid') }}</th>
                                        <th>{{ __('Loan') }}</th>
                                        <th>{{ __('SP') }}</th>
                                        <th>{{ __('PSP') }}</th>
                                        <th>{{ __('RT/EXP') }}</th>
                                        <th>{{ __('G %') }}</th>
                                        <th>{{ __('Win') }}</th>
                                        <th>{{ __('TSP') }}</th>
                                        <th>{{ __('Pay Agent') }}</th>
                                        <th>{{ __('Actions') }}</th>
                                    </tr>
                                </thead>
                            </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{{-- ADD / EDIT MODAL --}}

<div class="modal fade" id="modal1" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
                        
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="submit-loader">
                    <img  src="{{asset('assets/images/'.$gs->admin_loader)}}" alt="">
            </div>
            <div class="modal-header">
            <h5 class="modal-title"></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ __('Close') }}</button>
            </div>
        </div>
    </div>

</div>

{{-- ADD / EDIT MODAL ENDS --}}
{{-- DELETE MODAL --}}
<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="modal1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">

	<div class="modal-header d-block text-center">
		<h4 class="modal-title d-inline-block">{{ __('Confirm Delete') }}</h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
	</div>

      <!-- Modal body -->
      <div class="modal-body">
            <p class="text-center">{{ __('You are about to delete this Sale.') }}</p>
            <p class="text-center">{{ __('Do you want to proceed?') }}</p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer justify-content-center">
            <button type="button" class="btn btn-default" data-dismiss="modal">{{ __('Cancel') }}</button>
            <a class="btn btn-danger btn-ok" data-dismiss="modal">{{ __('Delete') }}</a>
      </div>

    </div>
  </div>
</div>

{{-- DELETE MODAL ENDS --}}

@endsection    



@section('scripts')

{{-- DATA TABLE --}}


    <script type="text/javascript">
		var table = $('#geniustable').DataTable({
			   ordering: false,
               processing: true,
               serverSide: true,
               autoWidth: true,
               ajax: '{{ route('admin-sale-datatables') }}',
               columns: [
                        { data: 'week', name: 'week' },
                        { data: 'id', name: 'id' },
                        { data: 'terminal', name: 'terminal' },
                        { data: 'zone', name: 'zone' },
                        { data: 'agent', name: 'agent' },
                        { data: 'sales', name: 'sales' },
                        { data: 'net', name: 'net' },
                        { data: 'bank_tf', name: 'bank_tf' },
                        { data: 'paid', name: 'paid' },
                        { data: 'loan', name: 'loan' },
                        { data: 'sp', name: 'sp' },
                        { data: 'psp', name: 'psp' },
                        { data: 'rt_exp', name: 'rt_exp' },
                        { data: 'gross', name: 'gross' },
                        { data: 'win', name: 'win' },
                        { data: 'tsp', name: 'tsp' },
                        { data: 'pay_agent', name: 'pay_agent' },
            			{ data: 'action', searchable: false, orderable: false }
                     ],
               language : {
                	processing: '<img src="{{asset('assets/images/'.$gs->admin_loader)}}">'
                }
            });

            table.on( 'rowgroup-datasrc', function ( e, dt, val ) {
                alert("asdasd");
            } );
      	$(function() {
        $(".btn-area").append('<div class="col-sm-4 text-right">'+
        	'<a class="add-btn" href="{{route('admin-sale-create')}}">'+
          '<i class="fas fa-plus"></i> {{ __('Add New Report') }}'+
          '</a>'+
          '</div>');
      });												
									
    </script>

{{-- DATA TABLE --}}
    
@endsection   