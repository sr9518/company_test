<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleList.jsp
  * @Description : Sample List 화면
  * @Modification Information
  *
  *   수정일         수정자                   수정내용
  *  -------    --------    ---------------------------
  *  2009.02.01            최초 생성
  *
  * author 실행환경 개발팀
  * since 2009.02.01
  *
  * Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><spring:message code="title.sample" /></title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    <script type="text/javaScript" language="javascript" defer="defer">
        <!--
        /* 글 수정 화면 function */
        function fn_egov_select(id) {
        	document.listForm.selectedId.value = id;
           	document.listForm.action = "<c:url value='/updateSampleView.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 등록 화면 function */
        function fn_egov_addView() {
           	document.listForm.action = "<c:url value='/addSample1.do'/>";
           	document.listForm.submit();
        }
        
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        /* pagination 페이지 링크 function */
        function fn_egov_link_page(pageNo){
        	document.listForm.pageIndex.value = pageNo;
        	document.listForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.listForm.submit();
        }
        
        //-->
    </script>
</head>

<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
    <form:form commandName="searchVO" id="listForm" name="listForm" method="post">
        <input type="hidden" name="selectedId" />
        
        <div id="content_pop">
        	<!-- 타이틀 -->
        	<div id="title">
        		<ul>
        			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/><spring:message code="list.sample" /></li>
        		</ul>
        	</div>
        	<!-- // 타이틀 -->
        	<div id="search">
        		<ul>
        			<li>
        			    <form:select path="usertype" cssClass="use">
        					<form:option value="전체" label="전체" />
        					<form:option value="번역봉사자" label="번역봉사자" />
        					<form:option value="기관방문" label="기관방문" />
        					<form:option value="일반" label="일반" />
        					<form:option value="신청 일시중지" label="신청 일시중지" />
        					<form:option value="페널티 일시중지" label="페널티 일시중지" />
        					<form:option value="직원 일시중지" label="직원 일시중지" />
        					<form:option value="활동재개테스트" label="활동재개테스트" />
        				</form:select>
        				<form:select path="bong" cssClass="use">
        					<form:option value="전체" label="전체" />
        					<form:option value="새싹" label="새싹" />
        					<form:option value="열매" label="열매" />
        				</form:select>
        				<form:select path="bun" cssClass="use">
        					<form:option value="모두" label="모두" />
        					<form:option value="아동서신" label="아동서신" />
        					<form:option value="후원자서신" label="후원자서신" />
        				</form:select>
        			    <label for="searchCondition" style="visibility:hidden;"><spring:message code="search.choose" /></label>
        				<form:select path="searchCondition" cssClass="use">
        					<form:option value="이름" label="이름" />
        					<form:option value="아이디이메일" label="아이디/이메일" />
        					<form:option value="휴대전화" label="휴대전화" />
        					<form:option value="담당직원" label="담당직원" />
        				</form:select>
        			</li>
        			<li><label for="searchKeyword" style="visibility:hidden;display:none;"><spring:message code="search.keyword" /></label>
                        <form:input path="searchKeyword" cssClass="txt"/>
                    </li>
        			<li>
        	            <span class="btn_blue_l">
        	                <a href="javascript:fn_egov_selectList();"><spring:message code="button.search" /></a>
        	                <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
        	            </span>
        	        </li>
                </ul>
        	</div>
        	<!-- List -->
        	<div id="table">
        		<table width="100%" border="0" cellpadding="0" cellspacing="0" summary="NO, 유형구문, 봉사단계, 이름, 생년월일, 아이디, 이메일, 번역구분, 담당직원, 가입일">
        			<caption style="visibility:hidden">NO, 유형구문, 봉사단계, 이름, 생년월일, 아이디, 이메일, 번역구분, 담당직원, 가입일</caption>
        			<colgroup>
        				<col width="40"/>
        				<col width="80"/>
        				<col width="80"/>
        				<col width="80"/>
        				<col width="100"/>
        				<col width="100"/>
        				<col width="100"/>
        				<col width="70"/>
        				<col width="70"/>
        				<col width="100"/>
        			</colgroup>
        			<tr>
        				<th align="center">No</th>
        				<th align="center"><spring:message code="title.sample.usertype" /></th>
        				<th align="center"><spring:message code="title.sample.bong" /></th>
        				<th align="center"><spring:message code="title.sample.name" /></th>
        				<th align="center"><spring:message code="title.sample.birth" /></th>
        				<th align="center"><spring:message code="title.sample.userid" /></th>
        				<th align="center"><spring:message code="title.sample.email" /></th>
        				<th align="center"><spring:message code="title.sample.bun" /></th>
        				<th align="center"><spring:message code="title.sample.staff" /></th>
        				<th align="center"><spring:message code="title.sample.writeday" /></th>
        			</tr>
        			<c:forEach var="result" items="${resultList}" varStatus="status">
            			<tr>
            				<td align="center" class="listtd"><c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}"/></td>
            				<td align="left" class="listtd"><c:out value="${result.usertype}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.bong}"/>&nbsp;</td>
            				<td align="center" class="listtd"><a href="javascript:fn_egov_select('<c:out value="${result.id}"/>')"><c:out value="${result.name}"/></a></td>
            				<td align="center" class="listtd"><c:out value="${result.birth}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.userid}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.email}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.bun}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.staff}"/>&nbsp;</td>
            				<td align="center" class="listtd"><c:out value="${result.writeday}"/>&nbsp;</td>
            			</tr>
        			</c:forEach>
        		</table>
        	</div>
        	<!-- /List -->
        	<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<form:hidden path="pageIndex" />
        	</div>
        	<div id="sysbtn">
        	  <ul>
        	      <li>
        	          <span class="btn_blue_l">
        	              <a href="javascript:fn_egov_addView();"><spring:message code="button.create" /></a>
                          <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                      </span>
                  </li>
              </ul>
        	</div>
        </div>
    </form:form>
</body>
</html>
