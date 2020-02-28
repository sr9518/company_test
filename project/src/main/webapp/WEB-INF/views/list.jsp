<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a {text-decoration:none};
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		var usertype = document.getElementById('usertype').value;
		var bong = document.getElementById('bong').value;
		var bun = document.getElementById('bun').value;
		var search = document.getElementById('search').value;
		var text = document.getElementById('text').value;
		location.href = "list?page=${pageMaker.page}&perPageNum="+sel+"&usertype="+usertype+"&bong="+bong+"&bun="+bun+"&search="+search+"&text="+text;
	}
	function searchBtn() {
		var usertype = document.getElementById('usertype').value;
		var bong = document.getElementById('bong').value;
		var bun = document.getElementById('bun').value;
		var search = document.getElementById('search').value;
		var text = document.getElementById('text').value;
		location.href = "list?page=${pageMaker.page}&perPageNum=${pageMaker.perPageNum}&usertype="+usertype+"&bong="+bong+"&bun="+bun+"&search="+search+"&text="+text;
	}
	
</script>
</head>
<body>

	<div>
		<select name="usertype" id="usertype">
			<option value="0">전체</option>
			<option value="1">번역봉사자</option>
			<option value="2">기관방문</option>
			<option value="3">일반</option>
			<option value="4">신청 일시중지</option>
			<option value="5">페널티 일시중지</option>
			<option value="6">직원 일시중지</option>
			<option value="7">활동재개테스트</option>
		</select>

		
		<select name="bong" id="bong">
			<option value="">전체</option>
			<option value="0">새싹</option>
			<option value="1">열매</option>
		</select>
		
		<select name="bun" id="bun">
			<option value="0">모두</option>
			<option value="1">아동서신</option>
			<option value="2">후원자서신</option>
		</select>
		<%-- <c:out value="${list.bun eq '2' ? 'selected' : '' }"/> --%>
		<select name="search" id="search">
			<option value="n">이름</option>
			<option value="im">아이디/이메일</option>
			<option value="p">휴대전화</option>
			<option value="s">담당직원</option>
		</select>
		<input type="text" id="text" name="text">
		<input type="button" onclick="searchBtn()" id="searchBtn" value="검색">
		
	</div>
	<div style="height:30px">
		<div style="float:left">
			총  ${pageMaker.totalCount }명 
		</div>
		<div style="float:right">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option>선택</option>
				<option value="10">
					<c:if test="${pageMaker.perPageNum == 10 }">selected</c:if>10건</option>
				<option value="20">
					<c:if test="${pageMaker.perPageNum == 20 }">selected</c:if>20건</option>
				<option value="30">
					<c:if test="${pageMaker.perPageNum == 30 }">selected</c:if>30건</option>
				<option value="50">
					<c:if test="${pageMaker.perPageNum == 50 }">selected</c:if>50건</option>
			</select>
		</div>
	</div>
	<table>
		<tr>
			<td>NO</td>
			<td>유형구문</td>
			<td>봉사단계</td>
			<td>이름</td>
			<td>생년월일</td>
			<td>아이디</td>
			<td>이메일</td>
			<td>번역구분</td>
			<td>담당직원</td>
			<td>가입일</td>
		</tr>
		<c:forEach items="${list }" var="list">	
			<tr>
				<td>${list.id }</td>
				<td>
					<c:choose>
						<c:when test="${list.usertype eq '0'}">
							전체
						</c:when>
						<c:when test="${list.usertype eq '1'}">
							번역봉사자
						</c:when>
						<c:when test="${list.usertype eq '2'}">
							기관방문
						</c:when>
						<c:when test="${list.usertype eq '3'}">
							일반
						</c:when>
						<c:when test="${list.usertype eq '4'}">
							신청 일시중지
						</c:when>
						<c:when test="${list.usertype eq '5'}">
							페널티 일시중지
						</c:when>
						<c:when test="${list.usertype eq '6'}">
							직원 일시중지
						</c:when>
						<c:when test="${list.usertype eq '7'}">
							활동재개테스트
						</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${list.bong eq '0'}">
							새싹
						</c:when>
						<c:when test="${list.bong eq '1'}">
							열매
						</c:when>
					</c:choose>
				</td>
				<td><a href="content?id=${list.id }">${list.name }</a></td>
				<td>${list.birth }</td>
				<td>${list.userid }</td>
				<td>${list.email }</td>
				<td>
					<c:choose>
						<c:when test="${list.bun eq '0'}">
							모두
						</c:when>
						<c:when test="${list.bun eq '1'}">
							아동서신
						</c:when>
						<c:when test="${list.bun eq '2'}">
							후원자서신
						</c:when>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${list.staff eq '0'}">
							김직원
						</c:when>
						<c:when test="${list.staff eq '1'}">
							이직원
						</c:when>
						<c:when test="${list.staff eq '2'}">
							박직원
						</c:when>
					</c:choose>
				</td>
				<td>${list.writeday }</td>
			</tr>
		</c:forEach>
	</table>
	
<ul style="display:flex; list-style:none;padding-left:350px;">
   <c:if test="${pageMaker.prev}">
      <li><a href="list${pageMaker.makeQuery(pageMaker.startPage -1)}">&laquo;</a></li>
   </c:if>
 
   <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="idx">
       <li style="padding-left:15px"
         <c:out value="${pageMaker.page ==idx? 'class=active' : ''}" />
        >
         <a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
   </c:forEach> 
    
   <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
      <li><a href="list${pageMaker.makeQuery(pageMaker.endPage +1)}">&raquo;</a></li>
   </c:if>
</ul>
		<span style="float:right">
			<input type="button" onclick="location.href='write2'" value="등록">
		</span>       
</body>
</html>