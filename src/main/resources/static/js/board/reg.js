$(function(){
	var fileNames="";
	$(".btn-search").click(function(e){
		searchPop();
	});
	
	$("#submit").click(function(){		
    sendRegData();
});
	
// $("input[type=file]").change(function (e){
// var filesTempArr = [];
// var files = e.target.files;
// var filesArr = Array.prototype.slice.call(files);
// var filesArrLen = filesArr.length;
// console.log(filesArrLen);
// var filesTempArrLen = filesTempArr.length;
// var formData = new FormData();
// // 파일 데이터
// for(var i=0, filesTempArrLen = filesTempArr.length; i<filesArrLen; i++) {
// formData.append("files", filesTempArr[i]);
// }
// console.log(formData);
// $.ajax({
// type : "POST",
// url : "/board/imgs-upload",
// data : formData,
// processData: false,
// contentType: false,
// success : function(data) {
// // console.log(data);
// if(data.result){
// alert("Success");
// }else{
// alert(data.result);
// }
// },
// err : function(err) {
// alert(err.status);
// }
// });
// });
	
	
	
// $("input[type=file]").change(function (){
// var fileInput = document.getElementById("images");
// var filess = fileInput.files;
// console.log(filess);
// var file;
// for (var i = 0; i < filess.length; i++) {
// file = filess[i];
// console.log(file.name);
// }
// });

	
 	$("input[type=file]").bind("input",function(){
 		var fileInput = $("input[type=file]");
 		var files = fileInput[0].files;
 		for(var i=0; i<files.length;i++){
 		 fileNames += files[i].name+",";
 		 }
 		console.log(fileNames);
 		var formData = new FormData();
 		for(var i=0; i<files.length; i++){ 			
 			formData.append("regImages", files[i]);
 		}
 		console.log(formData);
 		$.ajax({
 			type: "POST",
 			enctype: 'multipart/form-data', 
 			url: '/board/imgs-upload',
// data:formData,
 			data:{file:fileNames}, 
//            processData: false, 
//            contentType: false, 
// 			cache: false,
// success: function (result) {
// console.log(result);
// },
 			 });
 	});
 		
 
 	

  

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
// function fetchSearchResult(){
// $.ajax({
// type: "POST",
// url : "/board/reg-search",
// data: {content:$(".reg-search-box").text()},
// // datatype: "json",
// async:"true",
// success: function(list) {
// console.log(list.regSearch);
// if(list.regSearch[0] == null){
// alert("검색된 결과가 없습니다! 다시 입력하숑");
// }
// else{
// for(var i = 0; i<list.regSearch.length; i++){
// var searched = list.regSearch[i];
//	        			   
// $(".content").append(`
// <div class="searched-list">
// <img src="/images/${searched.img1}" width="400px" height="300px" />
// <div class="searched-content">
// <div>* 이름 : ${searched.name}</div>
// <div>* 주소 : ${searched.address} </div>
// </div>
// </div>
// `);
// }
//
// }
// }
// })
//		
// }


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
