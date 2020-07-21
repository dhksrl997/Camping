
'use strict';
$(function(){

	$(".btn-search").click(function(e){
//		console.log("asdasd");
		fetchSearchResult();
	});
	
	$("#submit").click(function(){		
    sendRegData();
})

function fetchSearchResult(){
		 $.ajax({
	           type: "POST",
	           url : "/board/reg-search",
	           data: {content:$(".reg-search-box").text()},     
//	           datatype: "json",
	           async:"true",
	           success: function(list) {
	        	   console.log(list.regSearch);
	        	   if(list.regSearch[0] == null){
	        		   alert("검색된 결과가 없습니다! 다시 입력하숑");
	        	   }
	        	   else{
	        		   for(var i = 0; i<list.regSearch.length; i++){
	        			   var searchedname = list.regSearch[i];
	        			   
	        			   $(".content").append(`
	        				<div style="font-size:20px; font-weight:bold">
	        	
	        			<span>이름: ${searchedname.name}</span> 	 
	        				 
	        				 </div>	
	        				
	        			   `);
	        		   }

	        	   }
	           }
	           })
		
	}


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
