$(function() {
   var sessionValue=localStorage.getItem('darkmode');
   if(sessionValue=="false"||sessionValue==null)
      var flag = false;
   else if(sessionValue=="true")
      flag=true;
   
   var darkBtn = document.querySelector(".dark-mode-btn");
   var body = document.querySelector("body");
   var logo = $(".logo");
   darkBtn.style.backgroundImage = "url('/images/night.png')";
   var searchStatus=true;
   $(".fa-search").click(function(){
	   searchStatus= !searchStatus;
	   if(searchStatus)
		   $(".search-field").css("transition", "0.7s").css("width","0px");
	   else
		   $(".search-field").css("transition", "0.7s").css("width","130px");
	
   });
   
   
   $(document).ready(function() {
      var flag= sessionValue;
      if (flag == "false") { // 다크모드
    	  $(".search-field").css("transition", "0.7s").attr("style","color:white;");
    	 $(".search-icon").css("transition", "0.7s").css("color","white");
    	 $(".comment-Line").css("transition", "0.7s").css("border","1px solid lightgrey");
         logo.attr("src", "/images/indexlogo-w.png");
         $(".header").css("background-color","rgb(47, 47, 47)");
         $("body").css("background-color","rgb(15,15,15)").css("color", "rgb(166,170,175)");
         darkBtn.style.backgroundImage = "url('https://png.pngtree.com/png-vector/20190115/ourmid/pngtree-vector-stars-and-moon-icon-png-image_317944.jpg')";
         $(".sidemenu").css("color", "white");
         $(".aside-list").css("background-color","rgb(47, 47, 47)").find("li").css("transition", "0.7s").css("background-color", "rgb(47, 47, 47)").css("color", "white").hover(
                     function() {$(this).css("background-color","rgb(86,88,96)").css("color","white")},
                     function() {$(this).css("background-color","rgb(47, 47, 47)").css("color", "white")}).find("i").css("color", "white");
         $(".region-list").find("li a").css("transition", "0.7s").css("color","white");
         $("a").css("transition", "0.7s").css("color","white");
         $(".survival-items").css("transition", "0.7s").css("color","white").css("background-color","rgb(41,41,41)");
         $(".linear").attr("src","../../images/mark-w.png");
         $(".checklist-wrap").css("transition", "0.7s").css("background-color","rgb(150,150,150)").css("color","black");
         $(".listcontent").css("transition", "0.7s").css("background-color","rgb(150,150,150)").css("color","black");
         $(".item-text").css("transition", "0.7s").css("background-color","white").css("color","black");
      } else {// 라이트모드
    	  $(".search-field").css("transition", "0.7s").attr("style","color:black;");
    	  $(".search-icon").css("transition", "0.7s").css("color","black");
    	  $(".comment-Line").css("transition", "0.7s").css("border","1px solid black");
         logo.attr("src", "/images/indexlogo-b.png");
         $(".header").css("background-color", "white");
         $("body").css("background-color", "white").css("color", "black");
         darkBtn.style.backgroundImage = "url('/images/night.png')";
         $(".sidemenu").css("color", "black");
         $(".aside-list").css("background-color","white").find("li").css("background-color", "white").css("color", "black").hover(
               function() {$(this).css("background-color", "rgb(210,210,210)").css("color", "black")},
               function() {$(this).css("background-color", "white").css("color","black")}).find("i").css("color", "black");
         $(".region-list").find("li a").css("transition", "0.7s").css("color","black");
         $("a").css("transition", "0.7s").css("color","black");
         $(".survival-items").css("transition", "0.7s").css("color","black").css("background-color","rgb(226,225,225)");
         $(".linear").attr("src","../../images/mark-b.png");
         $(".checklist-wrap").css("transition", "0.7s").css("background-color","white").css("color","black");
         $(".listcontent").css("transition", "0.7s").css("background-color","white").css("color","black");
         $(".item-text").css("transition", "0.7s").css("background-color","white").css("color","black");
         }
   });
   
   
   
   darkBtn.onclick = function() {
      console.log(flag);
      flag = !flag;
      if (flag == false) { // 다크모드
    	  localStorage.setItem('darkmode','false');
    	  $(".search-icon").css("transition", "0.7s").css("color","white");
    	  $(".search-field").css("transition", "0.7s").attr("style","color:white;");
    	  $(".search").css("transition", "0.7s").css("color","white");
    	  $(".comment-Line").css("transition", "0.7s").css("border","1px solid lightgrey");
         logo.attr("src", "/images/indexlogo-w.png");
         $(".header").css("transition", "0.7s").css("background-color","rgb(47, 47, 47)").css("color","rgb(166,170,175)");
         $("body").css("transition", "0.7s").css("background-color","rgb(15,15,15)").css("color", "rgb(166,170,175)");
         darkBtn.style.backgroundImage = "url('https://png.pngtree.com/png-vector/20190115/ourmid/pngtree-vector-stars-and-moon-icon-png-image_317944.jpg')";
         $(".sidemenu").css("color", "white");
         $(".aside-list").css("transition", "0.7s").css("background-color","rgb(47, 47, 47)").find("li").css("transition", "0.7s").css("background-color", "rgb(47, 47, 47)").css("color", "white").hover(
                     function() {$(this).css("background-color","rgb(86,88,96)").css("color","white")},
                     function() {$(this).css("background-color","rgb(47, 47, 47)").css("color", "white")}).find("i").css("color", "white");
         $(".region-list").find("li a").css("transition", "0.7s").css("color","white");
         $("a").css("transition", "0.7s").css("color","white");
         $(".survival-items").css("transition", "0.7s").css("color","white").css("background-color","rgb(41,41,41)");
         $(".linear").attr("src","../../images/mark-w.png");
         $(".checklist-wrap").css("transition", "0.7s").css("background-color","rgb(150,150,150)").css("color","black");
         $(".listcontent").css("transition", "0.7s").css("background-color","rgb(150,150,150)").css("color","black");
         $(".item-text").css("transition", "0.7s").css("background-color","white").css("color","black");
      } else {// 라이트모드
    	  localStorage.setItem('darkmode','true');
    	  $(".search-field").css("transition", "0.7s").attr("style","color:black;");
    	  $(".search-icon").css("transition", "0.7s").css("color","black");
         $(".search").css("transition", "0.7s").css("color","black");
         $(".comment-Line").css("transition", "0.7s").css("border","1px solid black");
         logo.attr("src", "/images/indexlogo-b.png");
         $(".header").css("transition", "0.7s").css("background-color", "white").css("color","black");
         $("body").css("transition", "0.7s").css("background-color", "white").css("color", "black");
         darkBtn.style.backgroundImage = "url('/images/night.png')";
         $(".sidemenu").css("color", "black");
         $(".aside-list").css("transition", "0.7s").css("background-color","white").find("li").css("transition", "0.7s").css("background-color", "white").css("color", "black").hover(
               function() {$(this).css("background-color", "rgb(210,210,210)").css("color", "black")},
               function() {$(this).css("background-color", "white").css("color","black")}).find("i").css("color", "black");
         $(".region-list").find("li a").css("transition", "0.7s").css("color","black");
         $("a").css("transition", "0.7s").css("color","black");
         $(".survival-items").css("transition", "0.7s").css("color","black").css("background-color","rgb(226,225,225)");
         $(".linear").attr("src","../../images/mark-b.png");
         $(".checklist-wrap").css("transition", "0.7s").css("background-color","white").css("color","black");
         $(".listcontent").css("transition", "0.7s").css("background-color","white").css("color","black");
         $(".item-text").css("transition", "0.7s").css("background-color","white").css("color","black");
         }
   };
//   ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
   

});