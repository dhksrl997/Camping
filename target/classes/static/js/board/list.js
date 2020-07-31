$(function(){
	
	let flag = true;
	$(".best-title").click(function(){
		$(".click-here").toggle();
		$(".best-title2").toggle(400);
		if (flag == false){
			$(".best-box").hide(400);
		}
	});
	$(".best-title2").click(function(){
		flag = false;
		$(".best-box").toggle(400);
	})
 });
