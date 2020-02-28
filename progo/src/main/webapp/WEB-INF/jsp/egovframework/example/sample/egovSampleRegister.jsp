<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"         uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"      uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="spring"    uri="http://www.springframework.org/tags"%>
<%
  /**
  * @Class Name : egovSampleRegister.jsp
  * @Description : Sample Register 화면
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
    <c:set var="registerFlag" value="${empty sampleVO.profile ? 'create' : 'modify'}"/>
    <title>Sample <c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                  <c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if>
    </title>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/egovframework/sample.css'/>"/>
    
    <!--For Commons Validator Client Side-->
    <script type="text/javascript" src="<c:url value='/cmmn/validator.do'/>"></script>
    <validator:javascript formName="sampleVO" staticJavascript="false" xhtml="true" cdata="false"/>
    
    <script type="text/javaScript" language="javascript" defer="defer">
        <!--
        /* 글 목록 화면 function */
        function fn_egov_selectList() {
           	document.detailForm.action = "<c:url value='/egovSampleList.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 삭제 function */
        function fn_egov_delete() {
           	document.detailForm.action = "<c:url value='/deleteSample.do'/>";
           	document.detailForm.submit();
        }
        
        /* 글 등록 function */
        function fn_egov_save() {
        	frm = document.detailForm;
        	if(!validateSampleVO(frm)){
                return;
            }else{
            	frm.action = "<c:url value="${registerFlag == 'create' ? '/addSample.do' : '/updateSample.do'}"/>";
                frm.submit();
            }
        }
        
        -->
    </script>
    
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">
<form:form commandName="sampleVO" id="detailForm" name="detailForm" method="post">
    <div id="content_pop">
    
    	<!-- 타이틀 -->
    	<div id="title">
    		<ul>
    			<li><img src="<c:url value='/images/egovframework/example/title_dot.gif'/>" alt=""/>
                    <c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                    <c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if>
                </li>
    		</ul>
    	</div>
    	<c:if test="${registerFlag == 'modify'}">		
			<form:input path="id" type="hidden" cssClass="essentiality" maxlength="10" readonly="true" />
    	</c:if>
    	<!-- // 타이틀 -->
    	<div id="table">
    	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
    		<colgroup>
    			<col width="100"/>
    			<col width="?"/>
    			<col width="100"/>
    			<col width="?"/>
    		</colgroup>
    		
    		<%-- <c:if test="${registerFlag == 'create'}">
    		</c:if> --%>
        		<tr>
        			<td class="tbtd_caption"><label for="usertype"><spring:message code="title.sample.usertype" /></label></td>
        			<td class="tbtd_content">
        				<form:select path="usertype" cssClass="use">
	    					<form:option value="번역봉사자" />
	    					<form:option value="기관방문" />
	    					<form:option value="일반" />
	    					<form:option value="신청 일시중지" />
	    					<form:option value="페널티 일시중지" />
	    					<form:option value="직원 일시중지" />
	    					<form:option value="활동재개테스트" />
	    				</form:select>
        			</td>
        			<td class="tbtd_caption"><label for="bong"><spring:message code="title.sample.bong" /></label></td>
        			<td class="tbtd_content">
        				<form:select path="bong" cssClass="use">
	    					<form:option value="새싹" />
	    					<form:option value="열매" />
	    				</form:select>
        			</td>
        		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="bun"><spring:message code="title.sample.bun" /></label></td>
        		<td class="tbtd_content">
        			<form:select path="bun" cssClass="use">
	    				<form:option value="아동서신" />
	    				<form:option value="후원자서신" />
	    			</form:select>
        		</td>
        		<td class="tbtd_caption"><label for="staff"><spring:message code="title.sample.staff" /></label></td>
        		<td class="tbtd_content">
        			<form:select path="staff" cssClass="use">
	    				<form:option value="김직원" />
	    				<form:option value="이직원" />
	    				<form:option value="박직원" />
	    			</form:select>
        		</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="name"><spring:message code="title.sample.name" /></label></td>
    			<td class="tbtd_content">
    				<form:input path="name" maxlength="20" cssClass="txt" />
    			</td>
    			<td class="tbtd_caption"><label for="eng_name"><spring:message code="title.sample.eng_name" /></label></td>
    			<td class="tbtd_content">
    				<form:input path="eng_name" maxlength="20" cssClass="txt" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="email"><spring:message code="title.sample.email" /></label></td>
    			<td class="tbtd_content">
    				<form:input path="email" maxlength="30" cssClass="txt"  />
    				<form:checkbox path="emailchk1" cssClass="txt" value="0"/> 이메일 수신동의 <br/>
    				<form:checkbox path="emailchk2" cssClass="txt" value="0"/> 서신할당 알림메일 수신허용
    			</td>
    			<td class="tbtd_caption"><label for="userid"><spring:message code="title.sample.userid" /></label></td>
    			<td class="tbtd_content">
    				<form:input path="userid" maxlength="16" cssClass="txt"  />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="birth"><spring:message code="title.sample.birth" /></label></td>
    			<td class="tbtd_content" colspan="3">
    				<form:input path="birth" maxlength="16" cssClass="txt" />
    				<form:radiobutton path="birthchk" cssClass="txt" value="0"/> 음력
    				<form:radiobutton path="birthchk" cssClass="txt" value="1"/> 양력
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="phone"><spring:message code="title.sample.phone" /></label></td>
    			<td class="tbtd_content">
    				<form:input path="phone" maxlength="16" cssClass="txt" />
    				<form:checkbox path="phonechk" cssClass="txt" value="0"/> SMS 수신동의
    			</td>
    			<td class="tbtd_caption"><label for="job"><spring:message code="title.sample.job" /></label></td>
    			<td class="tbtd_content">
    				<form:input path="job" maxlength="16" cssClass="txt" size="10"/>
    				<form:checkbox path="jobchk" cssClass="txt" value="0"/> 직업 정보 동의
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="juso1"><spring:message code="title.sample.juso1" /></label></td>
    			<td class="tbtd_content" colspan="3">
    				<form:input path="juso1" maxlength="16" cssClass="txt" /> <br/>
    				<form:input path="juso2" maxlength="16" cssClass="txt" /> <br/>
    				<form:checkbox path="jusochk" cssClass="txt" value="0"/> 자택주소 정보 동의
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="profile"><spring:message code="title.sample.profile" /></label></td>
    			<td class="tbtd_content" colspan="3">
    				<input type="file" name="profile"/> <br/>
    				<form:checkbox path="jusochk" cssClass="txt" value="0"/> 프로필이미지 정보 동의
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="content"><spring:message code="title.sample.content" /></label></td>
    			<td class="tbtd_content" colspan="3">
    				<form:textarea path="content" rows="5" cols="58" style="width:500px"/>&nbsp;<form:errors path="content" />
                </td>
    		</tr>
    		<%-- <tr>
    			<td class="tbtd_caption"><label for="regUser"><spring:message code="title.sample.regUser" /></label></td>
    			<td class="tbtd_content">
                    <c:if test="${registerFlag == 'modify'}">
        				<form:input path="regUser" maxlength="10" cssClass="essentiality" readonly="true" />
        				&nbsp;<form:errors path="regUser" /></td>
                    </c:if>
                    <c:if test="${registerFlag != 'modify'}">
        				<form:input path="regUser" maxlength="10" cssClass="txt"  />
        				&nbsp;<form:errors path="regUser" /></td>
                    </c:if>
             
    		</tr> --%>
    	</table>
    	<form:checkbox path="agree" cssClass="txt" value="0"/> 최소 6개월 이상 봉사활동을 성실히 할 것을 약속합니다. ${sampleVO.id }
      </div>
    	<div id="sysbtn">
    		<ul>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_egov_selectList();"><spring:message code="button.list" /></a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:fn_egov_save();">
                            <c:if test="${registerFlag == 'create'}"><spring:message code="button.create" /></c:if>
                            <c:if test="${registerFlag == 'modify'}"><spring:message code="button.modify" /></c:if>
                        </a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
    			<c:if test="${registerFlag == 'modify'}">
                    <li>
                        <span class="btn_blue_l">
                            <a href="javascript:fn_egov_delete();"><spring:message code="button.delete" /></a>
                            <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                        </span>
                    </li>
    			</c:if>
    			<li>
                    <span class="btn_blue_l">
                        <a href="javascript:document.detailForm.reset();"><spring:message code="button.reset" /></a>
                        <img src="<c:url value='/images/egovframework/example/btn_bg_r.gif'/>" style="margin-left:6px;" alt=""/>
                    </span>
                </li>
            </ul>
    	</div>
    </div>
    <!-- 검색조건 유지 -->
    <input type="hidden" name="searchCondition" value="<c:out value='${searchVO.searchCondition}'/>"/>
    <input type="hidden" name="searchKeyword" value="<c:out value='${searchVO.searchKeyword}'/>"/>
    <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
</form:form>
</body>
</html>