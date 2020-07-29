
'use strict';
$(function(){

	$(".btn-search").click(function(e){
		searchPop();
	});
	
	$("#submit").click(function(){		
    sendRegData();
})

  

	function searchPop(){
		 $.ajax({
        type: "POST",
        url : "/board/reg-search",
        data: {content:$(".reg-search-box").text()},     
        async:"true",
        success: function(list) {
     	   console.log(list.regSearch);
     	   if(list.regSearch[0] == null){
     		   alert("검색된 결과가 없습니다! 다시 입력하숑");
     	   }
     	   else{
     		   $("body").append(`
         			   <div class="popup">
         					  <div class="popup-title">
         					  <div><span>'${$(".reg-search-box").text()}'(으)로 검색한 결과</span>   <i class="fas fa-times close"></i> </div>  
         					  <ul class="popup-list-title">
         					  
         					  </ul> 
     				   		</div>
         			   </div>
         			   `);
     		   for(var i = 0; i<list.regSearch.length; i++){
     			   var searched = list.regSearch[i];
     			   	$(".popup-list-title").append(`
     			   			<li class="popup-li"><div> 이름: <span>${searched.name}</span></div>
     			   				<div>주소: ${searched.address}</div>
     			   			 </li>
     			   	`);
     		   }
     		   $(".close").click(function(){
     			   $(".popup").remove();
     		   });
     		   $(".popup-li").click(function(e){
     			   console.log(e.target.innerText);
     				 $.ajax({
    	           type: "POST",
    	           url : "/board/reg-popup",
    	           data: {content:e.target.innerText},     
    	           async:"true",
    	           success: function(popupdata) {
    	        	   console.log(popupdata);
    	        	   $(".popup").remove();
    	        	   $(".content").append(`
    	        	   
    	        	   			<div class="searched-list" >
	        		<a href="/camp/detail?id=${popupdata[0].id}">
	        		<img src="/images/${popupdata[0].img1}" width="400px" height="300px" /></a> 
	        			<div class="searched-content">
	        			<a href="/camp/detail?id=${popupdata[0].id}"><div>* 이름 : ${popupdata[0].name}</div></a> 	 
	        			<div>* 주소 : ${popupdata[0].address} </div>
	        			<div>* 가격 : ${popupdata[0].price} </div>
	        				 </div>
	        				</div>
    	        	   <hr> <br><br><br>
    	        	   `)
    	           }
    	           })
     			   
     		   });
     		   
     	   }
        }
        })
	}
//function fetchSearchResult(){
//		 $.ajax({
//	           type: "POST",
//	           url : "/board/reg-search",
//	           data: {content:$(".reg-search-box").text()},     
////	           datatype: "json",
//	           async:"true",
//	           success: function(list) {
//	        	   console.log(list.regSearch);
//	        	   if(list.regSearch[0] == null){
//	        		   alert("검색된 결과가 없습니다! 다시 입력하숑");
//	        	   }
//	        	   else{
//	        		   for(var i = 0; i<list.regSearch.length; i++){
//	        			   var searched = list.regSearch[i];
//	        			   
//	        			   $(".content").append(`
//	        				<div class="searched-list">
//	        		<img src="/images/${searched.img1}" width="400px" height="300px" />
//	        			<div class="searched-content">
//	        			<div>* 이름 : ${searched.name}</div> 	 
//	        			<div>* 주소 : ${searched.address} </div>
//	        				 </div>
//	        				 </div>	
//	        			   `);
//	        		   }
//
//	        	   }
//	           }
//	           })
//		
//	}


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



document.execCommand('styleWithCSS', false, true);
document.execCommand('insertBrOnReturn', false, true);
$("#fontSize").change(function(){
    document.execCommand('fontSize', false, $(this).val());
 });
