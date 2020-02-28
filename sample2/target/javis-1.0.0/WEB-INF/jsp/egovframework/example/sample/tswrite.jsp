<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat: 'yy-mm-dd' //Input Display Format 변경
		});
	});
	function used_ch(value) {
		if(value == "0") {
			document.getElementById("cost").innerText="";
			document.getElementById("usecost").value="";
		} else if(value == "1") {
			document.getElementById("cost").innerText="7000원";
			document.getElementById("usecost").value="7000";
		}else if(value == "2") {
			document.getElementById("cost").innerText="20000원";
			document.getElementById("usecost").value="20000";
		}else if(value == "3") {
			document.getElementById("cost").innerText="30000원";
			document.getElementById("usecost").value="30000";
		}else if(value == "4") {
			document.getElementById("cost").innerText="10000원";
			document.getElementById("usecost").value="10000";
		}else if(value == "5") {
			document.getElementById("cost").innerText="100000원";
			document.getElementById("usecost").value="100000";
		}else if(value == "6") {
			document.getElementById("cost").innerText="50000원";
			document.getElementById("usecost").value="50000";
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<%=request.getRealPath("/") %>
	<form method="post" id="frm-store" action="tswrite_ok.do" enctype="multipart/form-data">
	<input type="hidden" name="usecost">
		<table>
			<tr>
				<td>사용내역 *</td>
				<td>
					<select name="used" onchange="used_ch(this.value)">
					  	<option value="0">선택</option>
					  	<option value="1">식대(야근)</option>
					  	<option value="2">택시비(야근)</option>
					  	<option value="3">택시비(회식)</option>
					  	<option value="4">사무용품 구매</option>
					  	<option value="5">교육비</option>
					  	<option value="6">접대비</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>사용일 *</td>
				<td>
					<input type="text" id="datepicker" name="writeday">
				</td>
			</tr>
			<tr>
				<td>금액 *</td>
				<td>
					<span id="cost"></span>
				</td>
			</tr>
			<tr>
				<td>영수증 *</td>
				<td>
					<input type="file" id="gdsImg" name="file"> <p>
					<div class="select_img"><img src="" width="150" height="150"/></div>
				</td>
			</tr>
<script>
$(document).ready(function() {
    
    $('.btn-form-submit').on('click', function() {
        $('#frm-store').submit();
    });
});
	$("#gdsImg").change(function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result).width(500);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
</script>
		</table>
		<button type="button" class="btn-form-submit">저장</button>
	</form>
</body>
</html>