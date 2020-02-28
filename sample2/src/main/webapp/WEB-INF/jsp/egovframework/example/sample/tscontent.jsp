<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> <!-- 전체 CSS  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> <!-- 달력  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.inputArea {margin:10px 0;}
	.select_img{width:150px;height:150px}
	.select_img img{width:150px;height:150px}
</style>
<script>
/*문서 실행시 실행되는 함수*/
$(function(){
	used_sel(${content.used});
});
$(function() {
	$("#datepicker").datepicker({
		dateFormat: 'yy-mm-dd' //Input Display Format 변경
	});
});

	function used_sel(value) {
		if(value == "0") {
			document.getElementById("appcost").innerText="";
			document.getElementById("appcost2").value=0;
		} else if(value == "1") {
			document.getElementById("appcost").innerText='7,000';
			document.getElementById("appcost2").value=7000;
		}else if(value == "2") {
			document.getElementById("appcost").innerText='20,000';
			document.getElementById("appcost2").value=20000;
		}else if(value == "3") {
			document.getElementById("appcost").innerText='30,000';
			document.getElementById("appcost2").value=30000;
		}else if(value == "4") {
			document.getElementById("appcost").innerText='10,000';
			document.getElementById("appcost2").value=10000;
		}else if(value == "5") {
			document.getElementById("appcost").innerText='100,000';
			document.getElementById("appcost2").value=100000;
		}else if(value == "6") {
			document.getElementById("appcost").innerText='50,000';
			document.getElementById("appcost2").value=50000;
		}
	}
	$(document).ready(function() {
	    
		$("#approval").on("click", function() {
			result = confirm("승인하시겠습니까?");
			if(result) {
				$("#form_path").attr("action","tsupdate.do");
		        $("#form_path").submit();				
			} else {
				
			}
	    });
		$("#store").on("click", function() {
			result = confirm("수정하시겠습니까?");
			if(result) {
				$("#form_path").attr("action","tsstore.do");
				$("#form_path").attr("enctype","multipart/form-data");
		        $("#form_path").submit();		
			} else {
				
			}
	    });
		$("#delete").on("click", function() {
			result = confirm("삭제하시겠습니까?");
			if(result) {
				$("#form_path").attr("action","tsdelete.do");
		        $("#form_path").submit();	
			} else {
				
			}
	    });
	});
</script>
</head>
<body>
<form method="post" id="form_path">
	<input type="hidden" name="appcost" id="appcost2">
	<input type="hidden" name="processed" value="0">
	<input type="hidden" name="content" value="${content.used }">
	<input type="hidden" name="id" value="${content.id }">
	<input type="hidden" name="gdsimg" value="${content.gdsimg }">
	<input type="hidden" name="gdsthumbimg" value="${content.gdsthumbimg }">
	<div style="clear:both">청구내역</div>
	<div style="float:right">
		<button id="approval" type="button">승인</button>
		<c:if test="${content.processed == '0' }">
			<button id="store" type="button">저장</button>
		</c:if>
		<c:if test="${content.processed == '1' }">
			<button type="button">저장</button>
		</c:if>
		<button id="delete" type="button">삭제</button>
		<button type="button" onclick="history.back()">목록</button>
	</div>
	<div id="table">
		<table width="400" border="1" cellpadding="0" cellspacing="0" style="border-collapse:collapse;float:left">
			<tr>
				<td>사영내역 *</td>
				<td>
					<select name="used" id="used" onchange="used_sel(this.value)">
						<option value="0" <c:out value="${content.used eq '0' ? 'selected' : ''}"/>>선택</option>
						<option value="1" <c:out value="${content.used eq '1' ? 'selected' : ''}"/>>식대(야근)</option>
						<option value="2" <c:out value="${content.used eq '2' ? 'selected' : ''}"/>>택시비(야근)</option>
						<option value="3" <c:out value="${content.used eq '3' ? 'selected' : ''}"/>>택시비(회식)</option>
						<option value="4" <c:out value="${content.used eq '4' ? 'selected' : ''}"/>>사무용품 구매</option>
						<option value="5" <c:out value="${content.used eq '5' ? 'selected' : ''}"/>>교육비</option>
						<option value="6" <c:out value="${content.used eq '6' ? 'selected' : ''}"/>>접대비</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>사용일 *</td>
				<td><input type="text" id="datepicker" name="useday" value="${content.useday }"></td>
			</tr>
			<tr>
				<td>금액 *</td>
				<td><input type="text" name="usecost" value="<fmt:formatNumber value="${content.usecost  }" pattern="#,###" />"></td>
			</tr>
			<tr>
				<td>영수증 *</td>
				<td>
					<input type="file" id="gdsImg2" name="file">
				</td>
			</tr>
		</table>
	</div>
	<div class="select_img" style="float:left;width:150px;height:150px">
		<img src="${content.gdsthumbimg }" width="150" height="150">
	</div>
<script>
	$("#gdsImg2").change(function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result).width(150);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
</script>
	<div style="width:600px;height:20px;clear:both">처리내역</div>
	<div id="table">
		<table width="400" border="1" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
			<tr>
				<td style="width:90px">처리상태</td>
				<td>
					<c:choose>
						<c:when test="${content.processed eq '0' }">
							접수
						</c:when>
						<c:when test="${content.processed eq '1' }">
							승인
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td style="width:90px">처리일시</td>
				<td>
					<c:choose>
						<c:when test="${content.processed eq '0' }">
						</c:when>
						<c:when test="${content.processed eq '1' }">
							${content.proday }
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td style="width:90px">승인금액</td>
				<td>
					<span id="appcost"></span>
				</td>
			</tr>
			<tr>
				<td style="width:90px">비고</td>
				<td>
					<c:if test="${content.processed == '1' }">
						<c:choose>
							<c:when test="${content.content eq '0' }">
							</c:when>
							<c:when test="${content.content eq '1' }">
								<span>야근 식대는 7천원까지 지원됩니다</span>
							</c:when>
							<c:when test="${content.content eq '2' }">
								<span>야근택시비는 2만원까지 지원됩니다</span>
							</c:when>
							<c:when test="${content.content eq '3' }">
								<span>회식후 택시비는 3만원까지 지원됩니다</span>
							</c:when>
							<c:when test="${content.content eq '4' }">
								<span>사무용품 구매는 1만원까지 지원됩니다</span>
							</c:when>
							<c:when test="${content.content eq '5' }">
								<span>교육비는 10만원까지 지원됩니다</span>
							</c:when>
							<c:when test="${content.content eq '6' }">
								<span>접대비는 5만원까지 지원됩니다</span>
							</c:when>
						</c:choose>
					</c:if>
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>