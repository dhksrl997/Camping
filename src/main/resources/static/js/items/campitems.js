$(function () {
	var itemsWrap = document.querySelector(".items-wrap");
	var itemPart = document.querySelectorAll(".item-part");
	var slideCount = itemPart.length;
	var prevBtn = document.querySelector(".prev");
	var nextBtn = document.querySelector(".next");
	var currentIdx = 0;
	var partWidth = 380;
	var partMargin = 50;

	itemsWrap.style.width = `${(partWidth + partMargin) * slideCount}px`;
	
	function moveSlide(num) {
		// $(".items-wrap").css('transition', 'left 0.5s ease-out')
		itemsWrap.style.left = -num * 430 + "px";
		currentIdx = num;
	}
	
	nextBtn.onclick = function () {
		// console.log("index = "+currentIdx);
		// console.log("slide = "+slideCount);
		if (currentIdx < slideCount - 3) {
			moveSlide(currentIdx + 1);
		} else {
			moveSlide(0);
		}
	};
	prevBtn.onclick = function () {
		if (currentIdx > 0) {
			moveSlide(currentIdx - 1);
		} else {
			moveSlide(slideCount - 3);
		}
	};

});

