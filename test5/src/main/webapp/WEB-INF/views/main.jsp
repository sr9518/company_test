<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body topmargin="0" leftmargin="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="image/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원조회</strong></td>
  </tr>
  <tr> 
    <td><table width="640" border="0" cellspacing="0" cellpadding="0">
    
        <tr> 
          <td height="30" align="right">
            <form name="form1" method="post" action="main">
          	  <select name="searchOption" class="INPUT">
	              <option selected value="all" <c:out value="${map.searchOption == 'all'?'selected':''}"/>>::::: 전체 :::::</option>
	              <option value="n" <c:out value="${map.searchOption == 'kor_name'?'selected':''}"/> > 이름 </option>
	              <option value="s" <c:out value="${map.searchOption == 'sung'?'selected':''}"/>> 성별 </option>
	              <option value="t" <c:out value="${map.searchOption == 'tec'?'selected':''}"/>> 기술등급 </option>
               </select> 
               <input name="keyword" type="text" class="INPUT" value="${map.keyword }"> 
               <input type="submit" value="검색">
            </form>
				
				
	  </td>
        </tr>
        
        <tr> 
          <td><table width="640" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="3" background="image/bar_bg1.gif"></td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <input type=button class="update_btn" value="수정"> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
<script>
	$(".update_btn").click(function(){ 
				var confirm_val = confirm("개인정보를 수정하시겠습니까?");
				if (confirm_val) {
					var checkArr = new Array();
					$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-program"));
							})
							location.href="/info_update?id="+checkArr;
				}
			});

</script>                 
                  <button type="button" class="selectDelete_btn"> 삭제 </button> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  
<script>
	
	$(".selectDelete_btn").click(function(){ 
				var confirm_val = confirm("정말 삭제하시겠습니까?");
				if (confirm_val) {
					var checkArr = new Array();
					$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-program"));
							})

					$.ajax({
						url : "/deleteInfo",
						type : "post",
						data : {
							chBox : checkArr
						},
						success : function() {
							location.href = "/main";
						},
						error : function(request, status, error) {
							alert("code:" + request.status + "\n"
									+ "message:"
									+ request.responseText + "\n"
									+ "error:" + error);
						}
			
						
					});
				}
			});

</script>
                  
                  <a href="#">인사기록카드</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">경력정보</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">근무정보</a> </td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="1" align="right" bgcolor="B1B1B1"></td>
              </tr>
              <tr> 
                <td>
				<!-------------------------  ����Ʈ ------------------------------>
				<table width="640" border="0" cellspacing="0" cellpadding="0">
				<c:forEach items="${list }" var="list">	
                    <tr> 
                      <td width="35" height="20" align="center"><input type="checkbox" class="chBox" name="checkbox" data-program="${list.id }"></td>
                      <td width="85" align="center">${list.kor_name }</td>
                      <td width="153" align="center">${list.jumin1 } - ${list.jumin2 }</td>
                   
                    <c:choose>
                      <c:when test="${list.sung == 0 }">
                      	<td width="91" align="center">남자</td>
                      </c:when>
                      <c:when test="${list.sung == 1 }">
                      <td width="91" align="center">여자</td>
                      </c:when>
                    </c:choose>
                   
                      <td width="91" align="center">${list.tec }</td>
                      <td width="91" align="center">${list.yuncha }년</td>
                    <c:choose>
                  	  <c:when test="${list.hopework == 0 }">
                        <td width="94" align="center">SI</td>
                      </c:when>
                      <c:when test="${list.hopework == 1 }">
                        <td width="94" align="center">SM</td>
                      </c:when>
                    </c:choose>
                    
                    </tr>
				</c:forEach>
                    
                 
                  </table>
 				<!-------------------------  ����Ʈ ------------------------------>
				  </td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="1" align="right" bgcolor="B1B1B1"></td>
              </tr>
              <tr align="center" bgcolor="F8F8F8"> 
                <td height="26" align="right" bgcolor="F8F8F8" style="padding-right:10"><img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">수정</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">인사기록카드</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">경력정보</a> <img src="image/all_icon.gif" width="11" height="11" align="absmiddle"> 
                  <a href="#">근무정보</a> </td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="3" background="image/bar_bg1.gif"></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
