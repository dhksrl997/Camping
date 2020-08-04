'use strict';
// let container = document.querySelector(".container");
let asideButton = document.querySelector(".aside-button");
let numButton = document.querySelector(".numbutton");
let asideMenu = document.querySelector(".aside-list");
let login = document.querySelector(".header-login");
let myPage = document.querySelector(".header-mypage");

let shield = document.querySelector(".shield");
var flag = false;
var flag2 = false;
var test=document.querySelector("body");


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





var imgs = document.querySelectorAll(".img");
var nums = document.querySelectorAll(".number");
// var boxs = document.querySelector(".box");
nums[0].onclick = function () {
    imgs[0].style.top = "0%";
    imgs[1].style.top = "100%";
    imgs[2].style.top = "200%";
    imgs[3].style.top = "300%";
}
nums[1].onclick = function () {
    imgs[0].style.top = "-100%";
    imgs[1].style.top = "0%";
    imgs[2].style.top = "100%";
    imgs[3].style.top = "200%";
}
nums[2].onclick = function () {
    imgs[0].style.top = "-200%";
    imgs[1].style.top = "-100%";
    imgs[2].style.top = "0%";
    imgs[3].style.top = "100%";
}
nums[3].onclick = function () {
    imgs[0].style.top = "-300%";
    imgs[1].style.top = "-200%";
    imgs[2].style.top = "-100%";
    imgs[3].style.top = "0%";
}


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
