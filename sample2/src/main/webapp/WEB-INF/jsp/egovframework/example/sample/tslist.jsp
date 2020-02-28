<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/> <!-- 전체 CSS  -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> <!-- 달력  -->
<script src="http://malsup.github.io/min/jquery.form.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script>
	/* $(document).ready(function(){
		$("#search_form").submit();
	}); */

	$(document).ready(function() {
		$("#btnReset").click(function() {
			$("form").each(function() {
					this.reset();
			});
		});
	});

	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy-mm' //Input Display Format 변경
		});
	});
	$(document).ready(function() {

		$("#search_btn").on("click", function() {
			$("#search_form").attr("action", "tslist.do");
			$("#search_form").submit();
		});
	});
	
</script>
</head>
<body>
<form method="post" id="search_form">
	<div style="width:100%;height:20px">
		등록연월 <input type="text" id="datepicker" name="useday" readonly> 
		사용내역 <select name="used">
			  	<option value="0">전체</option>
			  	<option value="1">식대(야근)</option>
			  	<option value="2">택시비(야근)</option>
			  	<option value="3">택시비(회식)</option>
			  	<option value="4">사무용품 구매</option>
			  	<option value="5">교육비</option>
			  	<option value="6">접대비</option>
			  </select>
		처리상태 <select name="processed">
			  	<option value="2">전체</option>
			  	<option value="0">접수</option>
			  	<option value="1">승인</option>
			  </select>
			  <span style="float:right">
			  	<button type="button" id="btnReset">초기화</button>
			  	<button type="button" id="search_btn">검색</button>
			  </span>
	</div>
</form>
	
	<div style="width:100%;height:20px">
		총 ${pageMaker.totalCount }건
		<span style="float:right">
	  <!-- excel file 읽어오기 -->
	<form id="excelUploadForm" name="excelUploadForm" enctype="multipart/form-data" method="post" action="excelUploadAjax.do">
		<div class="contents">
			<dl class="vm_name">
				<dt class="down w90">첨부 파일</dt>
				<dd>
					<input id="excelFile" type="file" name="excelFile" />
				</dd>
			</dl>
		</div>
		<div class="bottom">
			<button type="button" id="addExcelImpoartBtn" class="btn" onclick="check()">
				<span>추가</span>
			</button>
		</div>
	</form>
<script>
//파일업로드
function checkFileType(filePath) {
    var fileFormat = filePath.split(".");

    if (fileFormat.indexOf("xls") > -1 || fileFormat.indexOf("xlsx") > -1) {
      return true;
      } else {
      return false;
    }
  }

  function check() {

    var file = $("#excelFile").val();

    if (file == "" || file == null) {
    alert("파일을 선택해주세요.");

    return false;
    } else if (!checkFileType(file)) {
    alert("엑셀 파일만 업로드 가능합니다.");

    return false;
    }

    if (confirm("업로드 하시겠습니까?")) {

      var options = {

        success : function(data) {
          alert("모든 데이터가 업로드 되었습니다.");

        },
        type : "POST"
        };
      $("#excelUploadForm").ajaxSubmit(options);

    }
  }
</script>
	  <form id="excelForm" name="excelForm" method="post" action="ExcelPoi.do">
	    <input type="text" name="fileName" />
	    <input type="submit" value="엑셀다운로드" />

			<button type="button" onclick="location.href='tswrite.do'">등록</button>
		</span>
	</div>
	<div id="table">
	  
		<table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-collapse:collapse;text-align:center">
			<tr>
				<td>순번</td>
				<td>사용일</td>
				<td>사용내역</td>
				<td>사용금액</td>
				<td>승인금액</td>
				<td>처리상태</td>
				<td>등록일</td>
			</tr>
			<c:forEach items="${list }" var="list" varStatus="i">
			<input type="hidden" name="id" value="${list.id }">
	  </form>  
			<tr>
				<td>
					${(pageMaker.totalCount-((cri.page-1)*cri.perPageNum))-i.index}
				</td>
				<td><a href="tscontent.do?id=${list.id }">${list.useday }</a></td>
				<td>
					<c:choose>
						<c:when test="${list.used eq '1'}">
							식대(야근)
						</c:when>
						<c:when test="${list.used eq '2'}">
							택시비(야근)
						</c:when>
						<c:when test="${list.used eq '3'}">
							택시비(회식)
						</c:when>
						<c:when test="${list.used eq '4'}">
							사무용품 구매
						</c:when>
						<c:when test="${list.used eq '5'}">
							교육비
						</c:when>
						<c:when test="${list.used eq '6'}">
							접대비
						</c:when>
					</c:choose>
				
				</td>
				<td>
					<fmt:formatNumber value="${list.usecost }" pattern="#,###" />
				</td>
				<td>
					<c:choose>
						<c:when test="${list.processed eq '0' }">
							
						</c:when>
						<c:when test="${list.processed eq '1' }">
							<fmt:formatNumber value="${list.appcost }" pattern="#,###" />
						</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${list.processed eq '0' }">
							접수
						</c:when>
						<c:when test="${list.processed eq '1' }">
							승인
						</c:when>
					</c:choose>
				</td>
				<td>${list.writeday }</td>
			</tr>
			<c:set var="total_use" value="${total_use + list.usecost }"/>
			<c:set var="total_app" value="${total_app + list.appcost }"/>
			</c:forEach>
			<tr>
				<td>합계</td>
				<td></td>
				<td></td>
				<td>
					<fmt:formatNumber value="${total_use }" pattern="#,###" />
				</td>
				<td>
					<fmt:formatNumber value="${total_app }" pattern="#,###"/>
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
</body>
</html>