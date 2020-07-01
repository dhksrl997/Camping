'use strict';
var imgs = document.querySelectorAll(".img");
var nums = document.querySelectorAll(".number");
var boxs = document.querySelector(".box");
nums[0].onmouseover = function () {
    console.log("1번째");
    imgs[0].style.top = "0%";
    imgs[1].style.top = "100%";
    imgs[2].style.top = "200%" ;
}
nums[1].onmouseover = function () {
    console.log("2번째");
    imgs[0].style.top = "-100%";
    imgs[1].style.top = "0%";
    imgs[2].style.top = "100%";
}
nums[2].onmouseover = function () {
    console.log("3번째");
    imgs[0].style.top = "-200%";
    imgs[1].style.top = "-100%";
    imgs[2].style.top = "0%";
}