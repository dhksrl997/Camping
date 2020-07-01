$(function() {
	var body = $("body");
	var darkBtn = document.querySelector(".dark-mode-btn");
	var body = document.querySelector("body");
	var darkmode = true;
	var logo = $(".logo");
	darkBtn.style.backgroundImage = "url('images/night.png')";
	darkBtn.onclick = function() {
		darkmode = !darkmode;
		if (darkmode == false) { //다크모드 
			logo.attr("src", "images/indexlogo-w.png");
			$(".header").css("transition","0.5s").css("background-color","rgb(47, 47, 47)");
			body.style.cursor = "url('images/WhiteCursor.png'), auto";
			body.style.background = "black";
			body.style.color = "white";
			darkBtn.style.backgroundImage = "url('https://png.pngtree.com/png-vector/20190115/ourmid/pngtree-vector-stars-and-moon-icon-png-image_317944.jpg')";
			$(".sidemenu").css("color","white");
			$(".aside-list").find("li").css("transition","0.5s").css("background-color", "rgb(47, 47, 47)")
			.css("color","white").hover(function(){
//				console.log("asd")
				$(this).css("background-color", "rgb(86,88,96)").css("color", "white")
			},
			function(){
				$(this).css("background-color", "rgb(47, 47, 47)").css("color", "white")
			}
			);
//			%(".aside-list").find("li").hover(function(){
//				$(this).toggleClass("darkhover");
//			});
		} else {//라이트모드 
			logo.attr("src", "images/indexlogo-b.png");
			$(".header").css("background-color","white");
			body.style.cursor = "url('images/BlackCursor.png'), auto";
			body.style.background = "white";
			body.style.color = "black";
			darkBtn.style.backgroundImage = "url('images/night.png')";
			$(".sidemenu").css("color","black");
			$(".aside-list").find("li").css("transition","0.5s").css("background-color", "white")
			.css("color","black").hover(function(){
//				console.log("asd")
				$(this).css("background-color", "rgba(0, 0, 0, 0.4)").css("color", "black")
			},
			function(){
				$(this).css("background-color", "white").css("color", "black")
			}
			);;
		}
	};

	body.onmousedown = function() { // 마우스가 눌려질 때
		if (darkmode) {// 라이트모드
			body.style.cursor = "url('images/BlackCursorClicked.png'), auto";
		} else {// 다크모드일 때
			body.style.cursor = "url('images/WhiteCursorClicked.png'), auto";
		}
	};

	body.onmouseup = function() { // 마우스가 땔 때
		if (darkmode) {// 라이트모드
			body.style.cursor = "url('images/BlackCursor.png'), auto";
		} else {// 다크모드일 때
			body.style.cursor = "url('images/WhiteCursor.png'), auto";
		}
	};

});