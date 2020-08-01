$(function() {

	$("#listNum").change(function(){
		$.ajax({
			type:"POST",
			url:"/admin/boardlistSelect",
			async: "true",
			data:{index:$("#listNum").val()},
			datatype: "json",
			success: function(boardlistNumSelect) {
				//console.log(boardlistNumSelect);
				$("tbody").find("tr").remove();
				for(var i=0; i<boardlistNumSelect.boardlistSelect.length; i++){
					var linum = boardlistNumSelect.boardlistSelect[i];
					$("tbody").append(`
					<tr>
	                    <td>${linum.id}</td>
	                    <td><a href="/board/list?cate=free?id=${linum.id}" target="_blank"><b>${linum.title}</b></a></td>
	                    <td>${linum.writer}</td>
	                    <td>${linum.regDate}</td>
	                    <td>${linum.hit}</td>
	                </tr>
					`);
				};
					
			}})
	});
	
	
});