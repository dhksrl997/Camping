window.addEventListener("load", function() {
	$('#id-text').keyup(function() {
		
		var userId = $('#id-text').val();
		
		$.ajax({
			type : "get",
			url : "/member/idCheck?userId="+userId,
			success : function(data) {
				
				console.log(data);
			
				if(data==1){
					$('#id-danger').css('display', 'inline-block');
				}
				else
					{
					$('#id-danger').css('display', 'none');
					console.log("사용가능!!");
				}
			},
		error : function() {
			console.log("실패");
		}
		});
	});
		$('.pwd2').keyup(function() {

			var pwd1 = $(".pwd1").val();
			var pwd2 = $(".pwd2").val();
			console.log(pwd1);
			console.log(pwd2);
			if (pwd1 != '' && pwd2 == '') {
				null;
			} else if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$('#pwd-danger').css('display', 'none');
					console.log("일치");
				} else {
					$('#pwd-danger').css('display', 'inline-block');
					console.log("불일치");
				}

			}
		});
		$('#submit-Button').click(function(e){
			e.preventDefault();
			if($('#id-danger').css('display')!="inline-block"){
				$('#form1').submit();
			}
			else {
				
			}
//		$('#submit-Button').click(function(e){
//			if($('#id-danger').css('display')=="inline-block"){
//				e.preventDefault();
//			}
//			else {
//				if($('#id-text').val()!="" ||
//				$('.pwd1').val()!=""    ||
//				$('.width-half').val()!=""){
//					alert("d");
//				}
//			}
			
			
		});
		
	});
