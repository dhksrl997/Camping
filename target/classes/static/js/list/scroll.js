
$(function(){
   let index=0;
   let $window = $(this);
   let scrollTop = $window.scrollTop();
   let windowHeight = $window.height();
   let documentHeight = $(document).height();
//   let header = $("#header");
   
//   function scrollIntoView(selector) {
//	   const scrollTo = $(selector);
//	   scrollTo.scrollIntoView({ behavior: 'smooth' });
//	 }
//	   const navbarMenu = document.querySelector('.navbar__menu');
//	   navbarMenu.addEventListener('click', (event) => {
//	     const target = event.target;
//	     const link = target.dataset.link;
//	     if (link == null) {
//	       return;
//	     }
//	     navbarMenu.classList.remove('open');
//	     scrollIntoView(link);
//	   });
//   $(".top-button").click(function(e){
//	   console.log(scrollTop);
//	   console.log(documentHeight);
//	   if(scrollTop == 0){
//		   $(".top-button").addClass("d-none");
//		   return;
//	   }
//	   else {
//		   documentHeight--;
//	   }
//   });
   
   
    $(window).scroll(function(){
       
  
        if( scrollTop + windowHeight + 0.1>= documentHeight ){
        		 index++;
                 fetchImage();
                 setTimeout(vanishLoad,500);
                 setTimeout(fetchlist,500); 
                 $(".top-button").removeClass("d-none");
        }
        function vanishLoad(){
        	$(".loadimage").css("display","none");
        }
//        if("")
      function fetchImage(){
    	$('body').append('<div class="loadimage"><img src="/images/load.gif" style="width:400px;height:50px;" ></div>');
    }
        function fetchlist(){
           $.ajax({
               type: "get",
               url : "/camp/getlist?reg="+searchParam('reg')+"&index="+index,
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



        
   
    