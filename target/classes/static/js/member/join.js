window.addEventListener("load", function() {
	var idFlag = true;
	var pwdFlag = true;
	var flag = true;
	$('#id-text').keyup(function() {

		var userId = $('#id-text').val();

		$.ajax({
			type : "get",
			url : "/member/idCheck?userId=" + userId,
			success : function(data) {

				console.log(data);

				if (data == 1) {
					$('#id-danger').css('display', 'inline-block');
					idFlag = false;
				} else {
					$('#id-danger').css('display', 'none');
					idFlag = true;
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
				pwdFlag = true;
			} else {
				$('#pwd-danger').css('display', 'inline-block');
				console.log("불일치");
				pwdFlag = false;
			}

		}
	});
	$('#submit-Button').click(function(e) {
		if (idFlag == false) {
			e.preventDefault();
			$('#id-text').focus();
		}
		else if (pwdFlag==false){
			e.preventDefault();
			$('.pwd2').focus();
		}
		
		// e.preventDefault();
		// if($('#id-danger').css('display')!="inline-block" &&
		// $('.pwd1').val()!="" &&
		// $('.pwd2').val()!="" &&
		// $('.width-half').val()!="")
		// {
		// //alert("가입되셨습니다.");
		//				
		// }
		// else {
		// //alert("공백을 확인해주세요");
		// }
		// $('#submit-Button').click(function(e){
		// if($('#id-danger').css('display')=="inline-block"){
		// e.preventDefault();
		// }
		// else {
		// if($('#id-text').val()!="" ||
		// $('.pwd1').val()!="" ||
		// $('.width-half').val()!=""){
		// alert("d");
		// }
		// }

	});

});
