var today = moment().format("YYYY-MM-DD");
$("input[name=regDate]").val(today);
	
function chkVal(){
	var title = $("input[name=title]").val();
	var content = $("#contentArea").val();
	
	
	if(title == ""){
		alert("제목을 입력해주세요.");
	}else if(content == ""){
		alert("내용을 입력해주세요.");
	}else{
		doSave();
	}
}

function doSave(){
var frm = document.Form;
var params = $("Form").serialize(document.Form, true);
console.log(params);
/*	$.ajax({
			type : "post",
			postdata : params
			url : "/member/idCheck?userId=" + userId,
			success : function(data) {

				console.log(data);

				if (data == 1) {
					$('#id-danger').css('display', 'inline-block');
					idFlag = false;
				} else {
					$('#id-danger').css('display', 'none');
					idFlag = true;
				}
			},
			error : function() {
				console.log("실패");
			}
		});*/
}
