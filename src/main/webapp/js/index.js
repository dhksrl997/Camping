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
    console.log("asdasd");
    if(flag){
 
    asideMenu.classList.add("show");
    // section.insertAdjacentHTML('afterbegin',template);
   shield.classList.add("showup");
}
else{
    asideMenu.classList.remove("show");
    shield.classList.remove("showup");
  

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





// let section = document.querySelector(".container");
// let pages = section.querySelectorAll(".page");
// let wrapper = section.querySelector(".page_wrapper");
// let first = document.querySelector(".first");
// let second = document.querySelector(".second");
// let third = document.querySelector(".third");
// let imges = document.querySelectorAll(".img");
// let ACTIVE_CLASS = "active";

// const currentPage = wrapper.querySelector(`.${ACTIVE_CLASS}`);
// console.log(currentPage.nextElementSibling);

// first.addEventListener("click", function(){
//     for(var i=0; i<pages.length; i++){
//         pages[i].classList.remove("active");
//         // pages[i].style.transform = "scale(0.8)";
//     }
// pages[0].classList.add("active");
// });
// second.addEventListener("click", function(){
//     for(var i=0; i<pages.length; i++){
//         pages[i].classList.remove("active");
//     }
//     pages[1].classList.add("active");
//     images[0].classList.add("active");
// });
// third.addEventListener("click", function(){
//     for(var i=0; i<pages.length; i++){
//         pages[i].classList.remove("active");
//     }
//     pages[2].classList.add("active");
// });
 