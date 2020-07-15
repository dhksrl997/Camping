
'use strict';

let img1 = $(".img1").find("img").attr("src");
let img2 = $(".img2").find("img").attr("src");
let img3 = $(".img3").find("img").attr("src");
let img4 = $(".img4").find("img").attr("src");
// console.log(img1);
$(".img1").hover(function(){
    $(".main-img").attr("src",img1).css("transition",".7s").css("transform","scale(1.1)");
});

$(".img2").hover(function(){
    $(".main-img").attr("src",img2).css("transition",".7s").css("transform","scale(1.1)");
});

$(".img3").hover(function(){
    $(".main-img").attr("src",img3).css("transition",".7s").css("transform","scale(1.1)");
});

$(".img4").hover(function(){
    $(".main-img").attr("src",img4).css("transition",".7s").css("transform","scale(1.1)");
});
