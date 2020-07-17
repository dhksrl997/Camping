
$(function(){
	
	
$("#submit").click(function(){
//	e.preventDefault();
//	let data = regData.serialize();
//	alert(data);
//	e.preventDefault();
//   alert(regData);
	
	
    sendRegData();

})
//,title:$(".title").html()
function sendRegData(){
	   $.ajax({
           type: "POST",
           url : "/board/reg",
           data: {content:$(".content").html(),title:$(".reg-title").text()},     
           dataType:"json",
           async:"true",
           success: function() {
//               alert($(".regData").serialize());
        	   console.log("asdasd")
           }
           })
      };
});



document.execCommand('styleWithCSS', false, true);
document.execCommand('insertBrOnReturn', false, true);
$("#fontSize").change(function(){
    document.execCommand('fontSize', false, $(this).val());
 });
