$(".del-btn").click(function(e) {
	e.preventDefault();
	console.log($(this).attr("data-rno"));
	let id = $(this).attr("data-rno");
	$.ajax({
		type : "get",
		url : "/board/detail/delete?id=" + id,
		success : function(data) {
			alert("삭제되었습니다.");
			location.reload();

		},
		error : function() {
			console.log("실패");
		}
	});
});