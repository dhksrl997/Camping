$(function() {

	$("#listNum").change(function(){
		$.ajax({
			type:"POST",
			url:"/admin/listSelect",
			async: "true",
			data:{index:$("#listNum").val()},
			datatype: "json",
			success: function(listNumSelect) {
				$("tbody").find("tr").remove();
				for(var i=0; i<listNumSelect.listSelect.length; i++){
					var linum = listNumSelect.listSelect[i];
					//console.log(linum);
					$("tbody").append(`
					<tr>
						<td>${linum.id}</td>
						<td><a href="detail?id=${linum.id}" target="_blank"><b>${linum.name}</b></a></td>
						<td>${linum.address}</td>
						<td>${linum.open}</td>
						<td>${linum.phone}</td>
					</tr>
					`);
				};
					
			}})
	});
	
	
});