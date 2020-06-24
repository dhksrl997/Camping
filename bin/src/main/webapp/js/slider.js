'use strict';
// let container = document.querySelector(".container");


let section = document.querySelector(".container");
let wrapper = section.querySelector(".page_wrapper");
let pages = wrapper.querySelectorAll(".page");
let first = document.querySelector(".first");
let second = document.querySelector(".second");
let third = document.querySelector(".third");
let ACTIVE_CLASS = "active";
// console.log(pages[0].className.includes);
// if(pages[0].classList.values != 'active'){
// console.log("it has")
// }
first.addEventListener("click", function(){

 if(pages[0].classList.values != 'active'){

    
  
 }
else{
  for(var i=0; i<pages.length; i++){
    
  }
}
    
    for(var i=0; i<pages.length; i++){
        pages[i].classList.remove("active");
        pages[i].classList.add("up");
        pages[i].classList.add("behind");
    }
    pages[0].classList.add("active");


  });
// second.addEventListener("click", function(){
//   for(var i=0; i<pages.length; i++){
//       pages[i].classList.remove("active");
//       pages[i].classList.remove("up");
//       pages[i].classList.add("behind");
//   }
//   pages[1].classList.add("active");
//   pages[1].classList.add("up");
//   // console.log("asd");
// });
// third.addEventListener("click", function(){
//     for(var i=0; i<pages.length; i++){
//         pages[i].classList.remove("active");
//         pages[i].classList.remove("up");
//         pages[i].classList.add("behind");
//     }
//     pages[1].classList.add("active");
//     pages[1].classList.add("up");
//     // console.log("asd");
//   });