<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body topmargin="0" leftmargin="0">
<form method="post" action="update_ok" modelAttribute="writeVO">

<input type="hidden" name=id value="${update.id}">
<table width="640" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="640">&nbsp;</td>
  </tr>
  <tr> 
    <td height="25"><img src="image/icon.gif" width="9" height="9" align="absmiddle"> 
      <strong>사원 기본 정보 수정</strong></td>
  </tr>
  <tr> 
    <td><table width="640" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="15" align="left"><table width="640" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td><table width="640" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td height="2" background="image/bar_bg1.gif"></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8"> 
                      <td height="26" align="center" bgcolor="#E4EBF1" style="padding-right:10"><table width="600" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="center"><strong>교육정보 | 자격증. 보유기술정보 | 프로젝트 정보 |경력정보 | 근무정보</strong></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr align="center" bgcolor="F8F8F8"> 
                      <td height="3" align="right" background="image/bar_bg1.gif"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="6" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="7" align="center" valign="top"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td height="135" align="center" bgcolor="#E4EBF1"><table width="600" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td width="144" height="119" align="center"><table width="100" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="112" bgcolor="#CCCCCC"><table width="100" border="0" cellspacing="1" cellpadding="0">
                                  <tr>
                                    <td height="110" bgcolor="#FFFFFF">&nbsp;</td>
                                  </tr>
                              </table></td>
                            </tr>
                          
                          
                          </table></td>
                          <td width="456"><table width="423" border="0" cellspacing="2" cellpadding="0">
                            <tr>
                              <td height="2" colspan="2"></td>
                              </tr>
                            <tr>
                              <td width="107" height="26" align="right"><strong>한글이름 : </strong>&nbsp;</td>
                              <td width="310" height="26">
                                <input type="text" name="kor_name" value="${update.kor_name }">
                              </td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>영문이름 :&nbsp;</strong></td>
                              <td height="26"><input type="text" name="eng_name" value="${update.eng_name }"></td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>한문이름:</strong>&nbsp;</td>
                              <td height="26"><input type="text" name="han_name" value="${update.han_name }"></td>
                            </tr>
                            <tr>
                              <td height="26" align="right"><strong>주민등록번호 :</strong>&nbsp;</td>
                              <td height="26"><input name="jumin1" type="text" size="15" value="${update.jumin1 }">
      -
        <input name="jumin2" type="text" size="15" value="${update.jumin2 }"></td>
                            </tr>
                          </table></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="7" align="center" valign="top">&nbsp;</td>
        </tr>
        <tr> 
          <td height="13" align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#CCCCCC"><table width="600" border="0" cellspacing="1" cellpadding="0">
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="526" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>사진파일명 :&nbsp;</strong></td>
                            <td width="268"><input name="file" type="file" size="40"></td>
                            <td width="146"><font color="#FF0000"><img src="image/bt_search.gif" width="49" height="18"></font></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>생년월일 :&nbsp;</strong></td>
                            <td width="391"><input name="year" type="text" size="10" value="${update.year }">
               년               
                              <input name="month" type="text" size="7" value="${update.month }">
                              월
                              <input name="day" type="text" size="7" value="${update.day }">
                              일 ( 
                              <c:choose>
                      <c:when test="${update.yang == 0 }">
                      	<input type="radio" name="yang" value="0" checked> 양력
                      	<input type="radio" name="yang" value="1"> 음력
                      </c:when>
                      <c:when test="${update.yang == 1 }">
                      	<input type="radio" name="yang" value="0"> 양력
                      	<input type="radio" name="yang" value="1" checked> 음력
                      </c:when>
                    </c:choose>
                    
                </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>성별 :&nbsp; </strong></td>
                            <td width="391">
                     <c:choose> 
                        <c:when test="${update.sung == 0 }">
	                      	<input type="radio" name="sung" value="0" checked> 남자
	                      	<input type="radio" name="sung" value="1"> 여자
                        </c:when>
                        <c:when test="${update.sung == 1 }">
	                      	<input type="radio" name="sung" value="0"> 남자
	                      	<input type="radio" name="sung" value="1" checked> 여자
                        </c:when>
                    </c:choose>
               </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="102" align="right"><strong>결혼유무 :&nbsp;</strong></td>
                            <td width="391"> 
			                    <c:choose> 
			                        <c:when test="${update.wedding == 0 }">
				                      	<input type="radio" name="wedding" value="0" checked> 미혼
				                      	<input type="radio" name="wedding" value="1"> 기혼
			                        </c:when>
			                        <c:when test="${update.wedding == 1 }">
				                      	<input type="radio" name="wedding" value="0"> 미혼
				                      	<input type="radio" name="wedding" value="1" checked> 기혼
			                        </c:when>
			                    </c:choose>
                             </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>년차 :&nbsp;</strong></td>
                            <td width="392"><input name="yuncha" type="text" size="10" value="${update.yuncha}"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>식대 :&nbsp;</strong></td>
                            <td width="392"> 
			                    <c:choose> 
			                        <c:when test="${update.eat == 0 }">
				                      	<select name="eat">
				                                <option value="0" selected>월급</option>
				                                <option value="1">주급</option>
			                             	</select>
			                        </c:when>
			                        <c:when test="${update.eat == 1 }">
				                      	<select name="eat">
				                                <option value="0">월급</option>
				                                <option value="1" selected>주급</option>
			                             	</select>
			                        </c:when>
			                    </c:choose>
                             </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>희망직무 :&nbsp;</strong></td>
                            <td width="392"> 
                            	<c:choose> 
			                        <c:when test="${update.hopework == 0 }">
				                      	<select name="hopework">
				                             <option value="0" selected>SI</option>
				                             <option value="1">SM</option>
			                            </select>
			                        </c:when>
			                        <c:when test="${update.hopework == 1 }">
				                      	<select name="hopework">
				                             <option value="0">SI</option>
				                             <option value="1" selected>SM</option>
			                            </select>
			                        </c:when>
			                    </c:choose>
	                        </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>급여 지급 유형 :&nbsp;</strong></td>
                            <td width="392">
                                 <c:choose> 
			                        <c:when test="${update.money == 0 }">
				                      	<select name="money">
				                             <option value="0" selected>월급</option>
				                             <option value="1">주급</option>
			                            </select>
			                        </c:when>
			                        <c:when test="${update.money == 1 }">
				                      	<select name="money">
				                             <option value="0">월급</option>
				                             <option value="1" selected>주급</option>
			                            </select>
			                        </c:when>
			                    </c:choose>
	                        </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>근무 :&nbsp;</strong></td>
                            <td width="392"> 
                            	<c:choose> 
			                        <c:when test="${update.worktype == 0 }">
				                      	<select name="worktype">
				                             <option value="0" selected>정규직</option>
				                             <option value="1">계약직</option>
			                            </select>
			                        </c:when>
			                        <c:when test="${update.worktype == 1 }">
				                      	<select name="worktype">
				                             <option value="0">정규직</option>
				                             <option value="1" selected>계약직</option>
			                            </select>
			                        </c:when>
			                    </c:choose>
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>주소 :&nbsp;</strong></td>
                            <td width="392"><input name="juso1" type="text" size="10" value="${update.juso1}"> 
                              <input name="juso2" type="text" size="40" value="${update.juso2}"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>연락처:&nbsp;</strong></td>
                            <td width="392"><input name="phone1" type="text" size="10" value="${update.phone1}">
                              - 
                              <input name="phone2" type="text" size="10" value="${update.phone2}">
                              - 
                              <input name="phone3" type="text" size="10" value="${update.phone3}"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>이메일:&nbsp;</strong></td>
                            <td width="392"><input name="email" type="text" size="20" value="${update.email}"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>기술등급:&nbsp;</strong></td>
                            <td width="392"><input name="tec" type="text" size="20" value="${update.tec}"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td bgcolor="#E4EBF1"><table width="500" border="0" cellspacing="1" cellpadding="1">
                          <tr> 
                            <td width="101" align="right"><strong>주량:&nbsp;</strong></td>
                            <td width="392"><input name="soju" type="text" size="20" value="${update.soju}"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td height="3" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td height="3" align="center"><table width="107" border="0" cellpadding="1" cellspacing="1">
            <tr>
              <td width="49"><input type="submit" value="확인"></td>
              <td width="51"><img src="image/bt_cancel.gif" width="49" height="18"></td>
            </tr>
          </table> 
          </td>
        </tr>
        <tr> 
          <td height="7" align="right">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
