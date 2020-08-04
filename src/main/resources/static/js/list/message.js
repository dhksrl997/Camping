$(".message-send").click(function(e) {
   e.preventDefault();
      let messageText = $("#writeNote").val();
      console.log($(".message-camp-id").text());
       var message = document.querySelector(".message");
      $.ajax({
         type : "POST",	
         url : "/camp/message-data" ,
         data : {
               content : messageText		
               },
             dataType:"json",
            success : function(data) {
            alert("메시지가 전송되었습니다.");
             $(".content-container").css({"filter": "blur(0px)"});
             $(".img").css({"filter": "blur(0px)"});
             $(".list-map").css({"filter": "blur(0px)"});
             $(".message-icons").css({"filter": "blur(0px)"});
   				message.classList.add("hide");
            },
            error: function(){
            
            }
               
   });
});