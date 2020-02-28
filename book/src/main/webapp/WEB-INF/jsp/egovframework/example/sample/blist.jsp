<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat: 'yy-mm' //Input Display Format 변경
		});
	});
</script>
</head>
<body>
	blist 입니다
	<div style="width:100%;height:20px">
		등록연월 <input type="text" id="datepicker" name="writeday"> 
		사용내역 <select name="used">
			  	<option value="0">전체</option>
			  	<option value="1">식대(야근)</option>
			  	<option value="2">택시비(야근)</option>
			  	<option value="3">택시비(회식)</option>
			  	<option value="4">사무용품 구매</option>
			  	<option value="5">교육비</option>
			  	<option value="6">접대비</option>
			  </select>
		처리상태 <select name="process">
			  	<option value="0">전체</option>
			  	<option value="1">접수</option>
			  	<option value="2">승인</option>
			  </select>
			  <span style="float:right">
			  	<button>초기화</button>
			  	<button>검색</button>
			  </span>
	</div>
	<div style="width:100%;height:20px">
		총 00건
		<span style="float:right">
			<button>엑셀다운로드</button>
			<button type="button" onclick="location.href='tswrite.do'">등록</button>
		</span>
	</div>
	<div id="table">
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>순번</td>
				<td>사용일</td>
				<td>사용내역</td>
				<td>사용금액</td>
				<td>승인금액</td>
				<td>처리상태</td>
				<td>등록일</td>
			</tr>
			<tr>
				<td>순번</td>
				<td>사용일</td>
				<td>사용내역</td>
				<td>사용금액</td>
				<td>승인금액</td>
				<td>처리상태</td>
				<td>등록일</td>
			</tr>
		</table>
	</div>
</body>
</html>