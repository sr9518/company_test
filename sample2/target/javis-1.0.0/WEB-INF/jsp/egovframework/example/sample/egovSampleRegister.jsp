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
    <c:set var="registerFlag" value="${empty sampleVO.id ? 'create' : 'modify'}"/>
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
    <style>
    	#textstyle{width:280px;height:120px}
    </style>
</head>
<body style="text-align:center; margin:0 auto; display:inline; padding-top:100px;">

<form:form commandName="sampleVO" id="detailForm" name="detailForm">
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
    	<!-- // 타이틀 -->
    	<div id="table">
    	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
    		<colgroup>
    			<col width="150"/>
    			<col width="?"/>
    			<col width="150"/>
    			<col width="?"/>
    			<col width="150"/>
    			<col width="?"/>
    		</colgroup>
    		<c:if test="${registerFlag == 'modify'}">
        		<tr>
        			<td class="tbtd_caption"><label for="usertype">유형구문</label></td>
        			<td class="tbtd_content">
        				<form:select path="usertype" cssClass="use">
	    					<form:option value="0" label="전체" />
	    					<form:option value="1" label="번역봉사자" />
	    					<form:option value="2" label="기관방문" />
	    					<form:option value="3" label="일반" />
	    					<form:option value="4" label="신청 일시중지" />
	    					<form:option value="5" label="페널티 일시중지" />
	    					<form:option value="6" label="직원 일시중지" />
	    					<form:option value="7" label="활동재개테스트" />
    				</form:select>
        			</td>
        			<td class="tbtd_caption"><label for="bong">봉사단계</label></td>
        			<td class="tbtd_content">
        				<form:select path="bong" cssClass="use">
	    					<form:option value="0" label="새싹" />
	    					<form:option value="1" label="열매" />
    				</form:select>
        			</td>
        			<td class="tbtd_caption"><label for="bun">번역구분</label></td>
        			<td class="tbtd_content">
        				<form:select path="bun" cssClass="use">
	    					<form:option value="0" label="모두" />
	    					<form:option value="1" label="아동서신" />
	    					<form:option value="2" label="후원자서신" />
    				</form:select>
        			</td>
        		</tr>
    		</c:if>
    		<tr>

    			<td class="tbtd_caption"><label for="id">미번역서신수</label></td>
    			<td class="tbtd_content">
    				
    			</td>
    			<td class="tbtd_caption"><label for="writeday">가입일자</label></td>
    			<td class="tbtd_content">
    				
    			</td>
    			<td class="tbtd_caption"><label for="staff">담당직원</label></td>
        			<td class="tbtd_content">
        				<form:select path="staff" cssClass="use">
	    					<form:option value="0" label="김직원" />
	    					<form:option value="1" label="이직원" />
	    					<form:option value="2" label="박직원" />
    				</form:select>
        		</td>
    		</tr>
    		</table>
    		<table width="100%" border="1" cellpadding="0" cellspacing="0" style="bordercolor:#D3E2EC; bordercolordark:#FFFFFF; BORDER-TOP:#C2D0DB 2px solid; BORDER-LEFT:#ffffff 1px solid; BORDER-RIGHT:#ffffff 1px solid; BORDER-BOTTOM:#C2D0DB 1px solid; border-collapse: collapse;">
    		<colgroup>
    			<col width="150"/>
    			<col width="?"/>
    		</colgroup>
    		<tr>
    			<td class="tbtd_caption"><label for="name">이름</label></td>
    			<td class="tbtd_content">
    				<form:input path="name" maxlength="30" cssClass="txt"/>
    				&nbsp;<form:errors path="name" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="eng_name">영문이름</label></td>
    			<td class="tbtd_content">
    				<form:input path="eng_name" maxlength="30" cssClass="txt"/>
    				&nbsp;<form:errors path="eng_name" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="userid">아이디</label></td>
    			<td class="tbtd_content">
    				<form:input path="userid" maxlength="30" cssClass="txt"/>
    				&nbsp;<form:errors path="userid" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="email">이메일</label></td>
    			<td class="tbtd_content">
    				<form:input path="email" maxlength="30" cssClass="txt"/>
    				&nbsp;<form:errors path="email" />
    				<form:checkbox path="emailchk1" value="0" label="이메일 수신 동의"/>
    				<form:checkbox path="emailchk2" value="0" label="서신할당 알림메일 수신 허용 (해외거주 등 문자수신 불가한 경우)"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="birth">생년월일</label></td>
    			<td class="tbtd_content">
    				<form:input path="birth" maxlength="30" cssClass="txt"/>
    				&nbsp;<form:errors path="birth" />
    				<form:radiobutton path="birthchk" value="0" label="음력"/>
    				<form:radiobutton path="birthchk" value="1" label="양력"/>
    			</td>
    		</tr>	
    		<tr>
    			<td class="tbtd_caption"><label for="phone">핸드폰</label></td>
    			<td class="tbtd_content">
    				<form:input path="phone" maxlength="30" cssClass="txt"/>
    				&nbsp;<form:errors path="phone" />
    				<form:checkbox path="phonechk" value="0" label="SMS 수신동의"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="job">직업</label></td>
    			<td class="tbtd_content">
    				<form:input path="job" maxlength="30" cssClass="txt"/>
    				&nbsp;<form:errors path="job" />
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="phone">자택주소</label></td>
    			<td class="tbtd_content">
    				<form:input path="juso1" maxlength="30" size="11" cssClass="txt"/>
    				&nbsp;<form:errors path="juso1" /> 나머지 주소
    				<form:input path="juso2" maxlength="30" cssClass="txt"/>
    				&nbsp;<form:errors path="juso2" />
    				<form:checkbox path="jusochk" value="0" label="자택주소 정보 동의"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="profile">프로필사진</label></td>
    			<td class="tbtd_content">
    				<input type="file" name="files"/>
    				<form:checkbox path="profilechk" value="0" label="프로필이미지 정보 동의"/>
    			</td>
    		</tr>
    		<tr>
    			<td class="tbtd_caption"><label for="content">내용</label></td>
    			<td class="tbtd_content">
    				<form:textarea path="content" cols="48" rows="5" id="textstyle"/>
    				&nbsp;<form:errors path="content" />
                </td>
    		</tr>
    	</table>
    	<form:checkbox path="agree" value="0" label="최소 6개월 이상 봉사활동을 성실히 할 것을 약속합니다."/>
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