$(function() {
	var body = $("body");
	var darkBtn = document.querySelector(".dark-mode-btn");
	var body = document.querySelector("body");
	var darkmode = true;
	darkBtn.onclick = function() {
		darkmode = !darkmode;
		console.log($(".dark-mode-btn"));
		if (darkmode == false) { //다크모드 
			body.style.cursor = "url('images/WhiteCursor.png'), auto";
			body.style.background = "black";
			body.style.color = "white";
			darkBtn.style.backgroundImage = "url('https://png.pngtree.com/png-vector/20190115/ourmid/pngtree-vector-stars-and-moon-icon-png-image_317944.jpg')";
		} else {//라이트모드 
			body.style.cursor = "url('images/BlackCursor.png'), auto";
			body.style.background = "white";
			body.style.color = "black";
			darkBtn.style.backgroundImage = "url('images/night.png')";
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