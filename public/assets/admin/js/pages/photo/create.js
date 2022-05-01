$(document).ready(function(){
	var _tags = $("#tags").tagit({
		fieldName: "tags[]",
		allowSpaces: true,
		autocomplete: {
			source: function( request, response ) {
			$.ajax({
				url: mainurl + "/admin/terms/get", 
				data: {term:request.term},
				success: function( data ) {
					response( $.map( data, function( item ) {
						return {
							label: item.Trans,
							value: item.Id
						}
					}));
				}
			});
			}
		}
	});
	//$('#tags').tagit('createTag', "xxxx1");
	
	$("#photo_upload").change(function(e){
	});


	$(document).on('submit','#photo_data_form',function(e){
		e.preventDefault();
		if(admin_loader == 1)
		{
			$('.gocover').show();
		}
		var fd = new FormData(this);
	
		var photo_form = $(this);

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
					photo_form.parent().find('.alert-success').hide();
					photo_form.parent().find('.alert-danger').show();
					photo_form.parent().find('.alert-danger ul').html('');
					for(var error in data.errors)
					{
						$('.alert-danger ul').append('<li>'+ data.errors[error] +'</li>')
					}
					photo_form.find('input , select , textarea').eq(1).focus();
				}
				else
				{
					photo_form.parent().find('.alert-danger').hide();
					photo_form.parent().find('.alert-success').show();
					photo_form.parent().find('.alert-success p').html(data.message);
					photo_form.find('input , select , textarea').eq(1).focus();
					// $(".photo-uploaded-preview").attr('src', mainurl+'/'+data.data.original.url);
				}
				$('button.addProductSubmit-btn').prop('disabled',false);
				if(admin_loader == 1){
					$('.gocover').hide();
				}
				// $(window).scrollTop(0);
			},
			error:function(data){
				if(admin_loader == 1){
					$('.gocover').hide();
				}
			}
		});
	});
});

