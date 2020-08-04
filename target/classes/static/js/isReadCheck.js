$(function() {

	setInterval(function() {
		$.ajax({
			type : "POST",
			url : "/member/isReadCheck",
			// async : "true",
			// data:{result},
			// datatype : "json",
			success : function(data) {
				if (data != 0)
					$(".message-new").css("display", "block");
				else
					$(".message-new").css("display", "none");
			}

		})
	}, 1000);
})