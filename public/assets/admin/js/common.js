$(document).ready(function(){
	$(document).on('submit','#data_form, #geniusform, #geniusformdata',function(e){
		e.preventDefault();
		$('.gocover').show();
		var fd = new FormData(this);
	
		var _form = $(this);

		$.ajax({
			method:"POST",
			url:$(this).prop('action'),
			data:fd,
			contentType: false,
			cache: false,
			processData: false,
			success:function(data)
			{
				console.log(data);
				if ((data.errors)) {
					_form.parent().find('.alert-success').hide();
					_form.parent().find('.alert-danger').show();
					_form.parent().find('.alert-danger ul').html('');
					for(var error in data.errors)
					{
						$('.alert-danger ul').append('<li>'+ data.errors[error] +'</li>')
					}
					_form.find('input , select , textarea').eq(1).focus();
				}
				else
				{
					_form.parent().find('.alert-danger').hide();
					_form.parent().find('.alert-success').show();
					_form.parent().find('.alert-success p').html(data.message ? data.message : data);
					_form.find('input , select , textarea').eq(1).focus();
					// $(".photo-uploaded-preview").attr('src', mainurl+'/'+data.data.original.url);
					try{
						if(table)
							table.ajax.reload();
					}catch{}
				}
				$('button.addProductSubmit-btn').prop('disabled',false);
				$('.gocover').hide();
				$(window).scrollTop(0);
			},
			error:function(data){
				$('.gocover').hide();
			}
		});
	});

	$(document).on('click', '#add-data, .edit', function(e) {
		e.preventDefault();
		
		let link = $(this).data('href');
		$('.gocover').show();
		$.get( link, function(data) {
		}).done(function(data) {
			$('.gocover').hide();
			$('#modal1 .modal-body').html(data);
	  	})
	});
	$(document).on('click', '.delete', function(e) {
		e.preventDefault();
		let link = $(this).data('href');
		$("#confirm-delete .btn-ok").data('href', link);
	});
	
	$("#confirm-delete").on('click', '.btn-ok', function(e){
		let link = $(this).data('href');
		$('.gocover').show();
		$.get( link, function(data) {
		}).done(function(data) {
			$('.gocover').hide();
			
			if ((data.errors)) {
				$(".allproduct").find('.alert-success').hide();
				$(".allproduct").find('.alert-danger').show();
				$(".allproduct").find('.alert-danger ul').html('');
				for(var error in data.errors)
				{
					$('.alert-danger ul').append('<li>'+ data.errors[error] +'</li>')
				}
				$(".allproduct").find('input , select , textarea').eq(1).focus();
			}
			else
			{
				$(".allproduct").find('.alert-danger').hide();
				$(".allproduct").find('.alert-success').show();
				$(".allproduct").find('.alert-success p').html(data.message ? data.message : data);
				$(".allproduct").find('input , select , textarea').eq(1).focus();
				table && table.ajax.reload();
			}
	  	})
	});
	
});