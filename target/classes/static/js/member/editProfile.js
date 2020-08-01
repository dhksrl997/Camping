window.addEventListener("load", function() {
	
	$("main").click(function(){
		
		if(event.target.className=="editProfile-main" || 
		   event.target.className=="member-information"){
			$(".name-detail").addClass('d-none');
			$(".pwd-detail").addClass('d-none');
			$(".phone-detail").addClass('d-none');
			$(".member-profile").css({"filter": "blur(0px)"});
			$(".phone-profile").css({"filter": "blur(0px)"});
		}
	});
	
	
	let nameCheck = RegExp(/^[가-힣]{2,6}$/);
	
	$(".profile-block-id").click(function() {
		alert("아이디는 수정 안됩니다만?");
	});
	
	
	$(".profile-block-name").click(function(e) {
		
		let flag = true;
		$(".member-profile").css({"filter": "blur(10px)"});
		$(".phone-profile").css({"filter": "blur(10px)"});
		$(".name-detail").removeClass('d-none');
		
		$(".name-input").keyup(function(e){
			let chk = $(".name-input").val();
			
			console.log(chk.length);
			if(chk.match(/([^가-힣\x20])/) || (chk.length<2 || chk.length>4)) { 
		    	$(".different-name").text("2~4글자 한글만 입력해주세용");
		    	flag=false;
		        return false;

			}
			else {
				flag=true;
				$(".different-name").text("");
				$(".name-detail-save").click(function(e){
					
					
					if(flag==true){
					let updateName = $('.name-input').val();

					$.ajax({
						type : "get",
						url : "/member/editProfile/update?name="+updateName,
						success : function(data) {
							if (data == 1) {
								$(".name-detail").addClass('d-none');
								$(".member-profile").css({"filter": "blur(0px)"});
								$(".phone-profile").css({"filter": "blur(0px)"});
								location.reload();
							} 
						},
						error : function() {
							console.log("실패");
						}
					});
					}
					if(flag==false){
						e.preventDefault();
					}
					});
				
			}
		});
		
		$(".name-detail-cancle").click(function(){
			$(".name-detail").addClass('d-none');
			$(".member-profile").css({"filter": "blur(0px)"});
			$(".phone-profile").css({"filter": "blur(0px)"});
			
		});
		
		
		
		
		
		
		
		
	});

	

	$(".profile-block-pwd").click(function() {
		

		let flag = true;
		let chkFlag = true;
		$(".member-profile").css({"filter": "blur(10px)"});
		$(".phone-profile").css({"filter": "blur(10px)"});
		$(".pwd-detail").removeClass('d-none');
		
		$(".pwd-detail-cancle").click(function(){
			$(".pwd-detail").addClass('d-none');
			$(".member-profile").css({"filter": "blur(0px)"});
			$(".phone-profile").css({"filter": "blur(0px)"});
		});
		$('.pwd-input').keyup(function(){
			let chk = $(".pwd-input").val();
			console.log(chk);
			if(chk.length<4 || chk. length>10){
				$(".different-pwd").text('양식은 4~10글자입니다.');
				chkFlag=false;
			}
			else{
				$(".different-pwd").text('');
				chkFlag=true;
			}
		});
		
		$('.pwd-check-input').keyup(function() {
			
			
			var pwd1 = $(".pwd-input").val();
			var pwd2 = $(".pwd-check-input").val();
			
			if (pwd1 != '' && pwd2 == '') {
				null;
			} else if (pwd1 != "" || pwd2 != "") {
				if (pwd2.length<4 || pwd2.length>10){
					flag = false;
					$(".different-pwd").text('양식은 4~10글자입니다.');
				}
				
			 else if(pwd1 != pwd2){
					$(".different-pwd").text('비밀번호가 다릅니다.');
					flag=false;
					console.log("불일치");
					
				} 
			 else if (pwd1 == pwd2) {
					$(".different-pwd").text('');
					flag=true;
					console.log("일치");
				
				}
			}
			
		});
		
		$(".pwd-detail-save").click(function(){
			
			if(flag==true && chkFlag==true){
			let updatePwd = $('.pwd-input').val();
			console.log(updatePwd);
			$.ajax({
				type : "get",
				url : "/member/editProfile/update/pwd?pwd="+updatePwd,
				success : function(data) {
					if (data == 1) {
						$(".pwd-detail").addClass('d-none');
						$(".member-profile").css({"filter": "blur(0px)"});
						$(".phone-profile").css({"filter": "blur(0px)"});
						location.reload();
					} 
				},
				error : function() {
					console.log("실패");
				}
			});
			}
			else if (flag==false && chkFlag==false){
				console.log(flag);
				console.log(chkFlag);
				e.preventDefault();
			}
		});
		
	});
	
	$(".phone-block-number").click(function() {
		let flag = true;
		$(".member-profile").css({"filter": "blur(10px)"});
		$(".phone-profile").css({"filter": "blur(10px)"});
		$(".phone-detail").removeClass('d-none');
		
		var regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
		
		
		$(".phone-input").keyup(function(e){
			let chk = $(".phone-input").val();
			console.log(chk);
			if(!chk.match(/(01[0|1|6|9|7])[-](\d{4})[-](\d{4}$)/)){ 
				$(".different-phone").text("양식은 000-0000-0000입니다");
				flag=false;
				return false;
				
			}
			else{
				flag=true;
				$(".different-phone").text("");
				console.log("성공");
			}
		});
		
		$(".phone-detail-cancle").click(function(){
			$(".phone-detail").addClass('d-none');
			$(".member-profile").css({"filter": "blur(0px)"});
			$(".phone-profile").css({"filter": "blur(0px)"});
		});
		
		$(".phone-detail-save").click(function(){
			let updatePhone = $('.phone-input').val();

			if(flag==true){
			$.ajax({
				type : "get",
				url : "/member/editProfile/update/phone?phone="+updatePhone,
				success : function(data) {
					if (data == 1) {
						$(".name-detail").addClass('d-none');
						$(".member-profile").css({"filter": "blur(0px)"});
						$(".phone-profile").css({"filter": "blur(0px)"});
						location.reload();
					} 
				},
				error : function() {
					console.log("실패");
				}
			});
			}
			else if (flag==false)
				{
				e.preventDefault();
				}
		});
	});
	
});