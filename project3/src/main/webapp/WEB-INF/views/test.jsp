<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/style.css?ver=3" rel="stylesheet" type="text/css" />
<!-- Bootstrap CSS -->
<link href="/resources/css/bootstrap.min.css?ver=3" rel="stylesheet" type="text/css" media="screen" />
<!-- Latest compiled and minified CSS 부트스르랩 테이블 --> 
<link href="/css/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
<!-- <script src="/resources/js/jqGrid/jquery-1.11.0.js"></script> -->
<script src="/resources/js/jquery-1.11.2.min.js"></script>
<script src="/resources/js/jquery-migrate-1.2.1.js"> </script><!-- jQuery버전 호환성 문제 -->
<!-- jquery.tmpl -->
<script src="/resources/js/jquery.tmpl.min.js"></script>
<!-- bootstrap -->
<script src="/resources/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified JavaScript  부트스르랩 테이블 -->
<script src="/resources/js/bootstrap-table/tableExport.min.js"></script>
<script src="/resources/js/bootstrap-table/bootstrap-table.min.js"></script>
<script src="/resources/js/bootstrap-table/bootstrap-table-locale-all.min.js"></script>
<script src="/resources/js/bootstrap-table/bootstrap-table-export.min.js"></script>
<!-- 공통 스크립트 -->
<script src="/resources/js/common.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		$("#modalBtn").on("click", function(){
			alert("ff");

			return false;
			showModal({
				modalUrl: "/showModalEx", // 모달 url(필수값)
				modalSize: "lg",		// 모달 사이즈
				// 버튼 설정  (커스텀 버튼)
				buttonSet:[{
					type: "save",// 타입
					confirmUse: true,
					confirmMsg: "저장 하시겠습니까?",
					addClass: "btn btn-primary btn-sm",// bootstrap css class
					click: function(){
						alert("1.save 버튼클릭 이벤트..");
					}
				},'update']
			});
		});
	});
</script>
</head>
<body>
	
	<button type="button" class="btn btn-primary" id="modalBtn">글등록</button>
	

</body>
</html>