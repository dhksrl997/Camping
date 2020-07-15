'use strict';
$(document).ready(function(){
   let index=0;
   let topBtn = $('.top-btn');
   let flag = true;
   var para = document.location.href.split("?");
   console.log(para[1]);

 
   
   /////////////////////////////////////////////////////////////
   function message1(){
	   $(".Message1").css("transition","1.2s").css("left","350px");
   }
   function message2(){
	   $(".Message2").css("transition","1.2s").css("left","550px");
   }
   function loadMessage(){
	   setTimeout(message1,300);
	   setTimeout(message2,1000);
   };
   loadMessage();
   
   ///////////////////////////////////////////////
   $(".rec-Button").click(function(){
	   $(".box").remove();
	   getRecList();
   });
   
   topBtn.click(function() {
     $('html, body').animate({scrollTop: 0}, 500);
   });
  
  

   
   function getRecList(){
	   $.ajax({
           type: "get",
           url : "/camp/reclist",
           async:"true",
           success : function(recommend) {
        	   console.log(recommend.reclist);
        	   for(var i=0; i<recommend.reclist.length; i++){
        		   var rec = recommend.reclist[i];
        		   $(".box-wrap").append(`
				<div class="box">
						<img src="/images/${rec.img1 }" class="rec-img">
					<div class="name-sec">
						<span class="rec-name"><i class="fas fa-map-signs">&nbsp;&nbsp;${rec.name }</i></span>
					</div>
					<div class="address-sec">
						<span class="rec-address"> ${rec.address } </span>
					</div>
				</div>

	`);
        		   
        	   };
           }
	   })
   };
   //////////////////////////////
   	function fetchImage(){
   		if(localStorage.getItem('darkmode') == "true")
   		$("body").append('<div class="load-box" style="text-align:center"><img class="ajaxload" src="/images/loadimage.gif" /></div>');
   		else 
   			$("body").append('<div class="load-box" style="text-align:center"><img class="ajaxload" src="/images/loadimage2.gif" /></div>')
   			}
   	
   	function vanishImage(){
   		$(".load-box").hide();
   	}
    $(window).scroll(function(){
        let $window = $(this);
        let scrollTop = $window.scrollTop();
        let windowHeight = $window.height();
        let documentHeight = $(document).height();
        
        if(scrollTop<1){
        	topBtn.hide();
        }
        else if(scrollTop>1){
        	topBtn.show();
        }
     



        
        if(scrollTop + windowHeight +0.1>= documentHeight){
           index++;
           if(flag == true){  
        	   fetchImage();
           };
           setTimeout(vanishImage,500);
           

           if (para[1].indexOf('reg') != -1) {
        	   setTimeout(fetchlist,500);
           };

           if (para[1].indexOf('query') != -1) {
        	   setTimeout(fetchsearchlist,500); 
           };
        }
        
        
        function fetchsearchlist(){
//        	console.log(searchParam('query'));
            $.ajax({
                type: "get",
                url : "/camp/searchlist?query="+searchParam('query')+"&index="+index,
                async:"true",
                success : function(searched) {
                	
                   if (searched.searchlist.length <10){
                	 if(flag == true){
                	   $("body").append('<div class="alert-text">존재하는 데이터가 없습니다</div>')
                	 }
                	   flag = false;
                   }
                	   else{
                   for(var i=0; i<searched.searchlist.length; i++){
                      var search = searched.searchlist[i];
                        $("body").append(`
                        <section class="list">
                        <div class="list-container">
					<div class="img">
						<a href="detail?id=${search.id }"><img class="image"
							src="/images/${search.img1 }" width="200" height="150"></a>
					</div>
					<div class="content-container">
						<div class="title">
							<a style="color: rgb(255, 72, 82);" href="detail?id=${search.id }">${search.name }</a>
						</div>
						<div style="color: rgb(0, 140, 236);" class="local">${search.address }</div>
						<div class="comfor">${search.faclity }</div>
					</div>
					<div class="icon-list">
						<div class="icons">
							<div class="icon">
								<i class="fas fa-map-marker-alt"></i> <span>지도</span>
							</div>
						</div>
						<div class="icons">
							<div class="icon">
								<i class="fas fa-book"></i> <span>예약</span>
							</div>
						</div>
					</div>
				</div>
				</section>
                 `);
                       
                   }
                   };
                }
            });
        }
        
        function fetchlist(){
        	   let title = "";
        	   let sessionValue=localStorage.getItem('darkmode');
        	   if(sessionValue == "false"){
        	    	 title = "title";
        	     }
        	     else if(sessionValue == "true"){
        	    	 title = "title2"; 
        	     }
           $.ajax({
               type: "get",
               url : "/camp/getlist?reg="+searchParam('reg')+"&index="+index,
               async:"false",
               success : function(camps) {
                  console.log(camps.lists[1]);
                  if (camps == null){
                     $(body).append(``);
                  }
                  if(camps != null)
                  for(var i=0; i<camps.lists.length; i++){
                     var camping = camps.lists[i];
                     
                       $("body").append(`<section class="list">
                     <div class="list-container">
                        <div class="img">
                           <img class="image" src="/images/${camping.img1 }" width="200"
                              height="150">
                        </div>
                        <div class="content-container">
                           <div class="${title}">
                           <a href="detail?id=${camping.id }">${camping.name }</a>
                           </div>
                           <div class="local" style="color: rgb(0, 140, 236);">${camping.address }</div>
                           <div class="comfor">${camping.faclity }</div>
                        </div>
                        <div class="icon-list">
                           <div class="icons">
                              <div class="icon">
                                 <i class="fas fa-map-marker-alt"></i> <span>지도</span>
                              </div>
                           </div>
                           <div class="icons">
                              <div class="icon">
                                 <i class="fas fa-book"></i> <span>예약</span>
                              </div>
                           </div>
                        </div>
                     </div>
                  </section>
                  `);
                      
                  }
               }
           });
           };
           
           function searchParam(key) {
                return new URLSearchParams(location.search).get(key);
              };
    })    
});



        
   
    