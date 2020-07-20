'use strict';
// let container = document.querySelector(".container");
let asideButton = document.querySelector(".aside-button");
let numButton = document.querySelector(".numbutton");
// console.log(asideButton);
let asideMenu = document.querySelector(".aside-list");
let login = document.querySelector(".header-login");
let myPage = document.querySelector(".header-mypage");

let shield = document.querySelector(".shield");
var flag = false;
var flag2 = false;




asideButton.addEventListener("click", function (e) {
    flag = !flag;
    e.preventDefault();
    if (flag) {
        asideMenu.classList.add("show");
    }
    else {
        asideMenu.classList.remove("show");
    }
});







login.addEventListener("click", function (e) {
	flag2 = !flag2;
	e.preventDefault();
	if (flag2) {
		myPage.classList.add("show2");
	}
	else {
		myPage.classList.remove("show2");
	}
});

