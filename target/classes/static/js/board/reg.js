
$(function(){
$("#submit").click(function(){		
    sendRegData();
})
function sendRegData(){
	   $.ajax({
           type: "POST",
           url : "/board/reg",
           data: {content:$(".content").html(),title:$(".reg-title").text()},     
           dataType:"json",
           async:"true",
           success: function() {
        	   console.log("asdasd")
           }
           })
      };
});

1

document.execCommand('styleWithCSS', false, true);
document.execCommand('insertBrOnReturn', false, true);
$("#fontSize").change(function(){
    document.execCommand('fontSize', false, $(this).val());
 });
