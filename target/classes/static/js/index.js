'use strict';
// let container = document.querySelector(".container");
let asideButton = document.querySelector(".aside-button");
let numButton = document.querySelector(".numbutton");
// console.log(asideButton);
let asideMenu = document.querySelector(".aside-list");

let shield = document.querySelector(".shield");
var flag = false;


asideButton.addEventListener("click", function(e){
    flag=!flag;
    e.preventDefault();
    if(flag){
    asideMenu.classList.add("show");
   
 
}
else{
    asideMenu.classList.remove("show");
     

}
});






var imgs = document.querySelectorAll(".img");
var nums = document.querySelectorAll(".number");
console.log(nums);
console.log(imgs)
// var boxs = document.querySelector(".box");
nums[0].onclick = function () {
    console.log("1번째");
    imgs[0].style.top = "0%";
    imgs[1].style.top = "100%";
    imgs[2].style.top = "200%" ;
}
nums[1].onclick = function () {
    console.log("2번째");
    imgs[0].style.top = "-100%";
    imgs[1].style.top = "0%";
    imgs[2].style.top = "100%";
}
nums[2].onclick = function () {
    console.log("3번째");
    imgs[0].style.top = "-200%";
    imgs[1].style.top = "-100%";
    imgs[2].style.top = "0%";
}
