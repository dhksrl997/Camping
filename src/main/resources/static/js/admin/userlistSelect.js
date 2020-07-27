$(function(){
	$("#listNum").change(function(){
		$.ajax({
			type:"POST",
			url:"/admin/userlistSelect",
			async: "true",
			data:{index:$("#listNum").val()},
			datatype: "json",
			success: function(userlistNumSelect) {
				console.log(userlistNumSelect);
				$("tbody").find("tr").remove();
				for(var i=0; i<userlistNumSelect.userlistSelect.length; i++){
					var ulinum = userlistNumSelect.userlistSelect[i];
					$("tbody").append(`
					<tr>
						<td>${ulinum.id}</td>
	                    <td><a href="detail?id=${ulinum.id}" target="_blank"><b>${ulinum.uid}</b></a></td>
	                    <td>${ulinum.regDate}</td>
	                    <td>${ulinum.name}</td>
	                    <td>${ulinum.phone}</td>
	                    <td>${ulinum.email}</td>
	                    <td>${ulinum.age}</td>
	                </tr>    
                    `);
				};
					
			}})
	});
})