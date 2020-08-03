$(".response").click(function(e) {
	   let messageText = $(".content").val();
		console.log(messageText);
		let loginId = $(".loginId").text();
		let sendId = $(".sendId").text();
		console.log(loginId);
		console.log(sendId);
	   $.ajax({
		  type : "POST",	
		  url : "/member/responseLetter-data" ,
		  data : {
				send : loginId,
				recieve : sendId,
				content : messageText		
				},
			  dataType:"json",
			 success : function(data) {
				alert("전송되었습니다");
				history.pushState(null, null, '/member/letters');
				location.reload();			 
				 },
			 error: function(){
			 
			 }
				
	});
 });