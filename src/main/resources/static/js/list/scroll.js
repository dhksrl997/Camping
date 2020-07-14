
$(function(){
   let index=0;
//   $(".rec-img").hover(function() {
//	 $(".rec-img").css("transition",".7s").css("transform","scale(1.2)");
//	   
//	 });
   
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
        
       
        
        if( scrollTop + windowHeight +0.1>= documentHeight ){
           index++;
           fetchImage();
           setTimeout(vanishImage,500);
           setTimeout(fetchlist,500); 
        }
        function fetchlist(){
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
                           <div class="title">
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



        
   
    