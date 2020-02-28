<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form method="post" action="update_ok">	
		<input type="hidden" name="id" value="${update.id }">
		<input type="hidden" name="name" value="${update.name }">
		<input type="hidden" name="usertype">
		<input type="hidden" name="birth" value="${update.birth }">
	<table width=700>
		<tr>	
			<td>이름</td>
			<td>
				${update.name }
			</td>
			<td>영문이름</td>
			<td><input type="text" name="eng_name" value="${update.eng_name }"></td>
		</tr>
		<tr>	
			<td>아이디</td>
			<td>
				<input type="text" name="userid" value="${update.userid }">
			</td>
			<td>이메일</td>
			<td>
				<input type="text" name="email" value="${update.email }">
				<c:choose>
					<c:when test="${update.emailchk1 eq '0'}">
						<input type="checkbox" name="emailchk1" value="0" checked> 이메일 수신 동의
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="emailchk1" value="0"> 이메일 수신 동의
					</c:otherwise>
				</c:choose>	
				
				<c:choose>
					<c:when test="${update.emailchk2 eq '0'}">
						<input type="checkbox" name="emailchk2" value="0" checked> 서신할당 알림메일 수신허용(해외거주 등 문자수신 불가한 경우)
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="emailchk2" value="0"> 서신할당 알림메일 수신허용(해외거주 등 문자수신 불가한 경우)
					</c:otherwise>
				</c:choose>	
			
			</td>
		</tr>
		<tr>	
			<td>생년월일</td>
			<td>
				${update.birth}
			</td>
			<td colspan="2">
				<c:choose>
					<c:when test="${update.birthchk eq '0'}">
						<input type="radio" name="birthchk" value="0" checked> 음력
						<input type="radio" name="birthchk" value="1"> 양력
					</c:when>
					<c:when test="${update.birthchk eq '1'}">
						<input type="radio" name="birthchk" value="0"> 음력
						<input type="radio" name="birthchk" value="1" checked> 양력
					</c:when>
					<c:otherwise>
						<input type="radio" name="birthchk" value="0"> 음력
						<input type="radio" name="birthchk" value="1"> 양력
					</c:otherwise>
				</c:choose>	
			</td>
		</tr>
		<tr>	
			<td>휴대폰 번호</td>
			<td>
				<input type="text" name="phone" value="${update.phone }">
				<c:choose>
					<c:when test="${update.phonechk eq '0' }">
						<input type="checkbox" name="phonechk" value="0" checked> SMS 수신동의
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="phonechk" value="0"> SMS 수신동의
					</c:otherwise>
				</c:choose>
			</td>
			<td>직업</td>
			<td>
				<input type="text" name="job" value="${update.job }">
				<c:choose>
					<c:when test="${update.jobchk eq '0'}">
						<input type="checkbox" name="jobchk" value="0" checked> 직업 정보 동의
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="jobchk" value="0"> 직업 정보 동의
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>봉사단계</td>
			<td>
				<c:choose>
					<c:when test="${update.bong eq '0'}">
						<select name="bong">
							<option value="0" selected>새싹</option>
							<option value="1">열매</option>
						</select>
					</c:when>
					<c:when test="${update.bong eq '1' }">
						<select name="bong">
							<option value="0">새싹</option>
							<option value="1" selected>열매</option>
						</select>
					</c:when>
					<c:otherwise>
						<select name="bong">
							<option value="0">새싹</option>
							<option value="1">열매</option>
						</select>
					</c:otherwise>
				</c:choose>
			</td>
			<td>번역구분</td>
			<td>
				<c:choose>
					<c:when test="${update.bun eq '0'}">
						<select name="bun">
							<option value="0" selected>모두</option>
							<option value="1">아동서신</option>
							<option value="2">후원자 서신</option>
						</select>
					</c:when>
					<c:when test="${update.bun eq '1' }">
						<select name="bun">
							<option value="0">모두</option>
							<option value="1" selected>아동서신</option>
							<option value="2">후원자 서신</option>
						</select>
					</c:when>
					<c:when test="${update.bun eq '2' }">
						<select name="bun">
							<option value="0">모두</option>
							<option value="1">아동서신</option>
							<option value="2" selected>후원자 서신</option>
						</select>
					</c:when>
					<c:otherwise>
						<select name="bun">
							<option value="0">모두</option>
							<option value="1">아동서신</option>
							<option value="2">후원자 서신</option>
						</select>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>담당직원</td>
			<td colspan="3">
				<c:choose>
					<c:when test="${update.staff eq '0' }">
						<select name="staff">
							<option value="0" selected>김직원</option>
							<option value="1">이직원</option>
							<option value="2">박직원</option>
						</select>
					</c:when>
					<c:when test="${update.staff eq '1' }">
						<select name="staff">
							<option value="0">김직원</option>
							<option value="1" selected>이직원</option>
							<option value="2">박직원</option>
						</select>
					</c:when>
					<c:when test="${update.staff eq '2' }">
						<select name="staff">
							<option value="0">김직원</option>
							<option value="1">이직원</option>
							<option value="2" selected>박직원</option>
						</select>
					</c:when>
					<c:otherwise>
						<select name="staff">
							<option value="0">김직원</option>
							<option value="1">이직원</option>
							<option value="2">박직원</option>
						</select>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>	
			<td>자택주소</td>
			<td colspan="3">
				우편번호 <input type="text" name="juso1" value="${update.juso1 }"> <p>
				주소 <input type="text" name="juso2" value="${update.juso2 }"> <p>
				<c:choose>
					<c:when test="${update.jusochk eq '0' }">
						<input type="checkbox" name="jusochk" value="0" checked> 자택주소 정보 동의
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="jusochk" value="0"> 자택주소 정보 동의
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>	
			<td>프로필사진</td>
			<td colspan="3">
				<input type="file" name="profile"> <p>
				<c:choose>
					<c:when test="${update.profilechk eq '0'}">
						<input type="checkbox" name="profilechk" value="0" checked> 프로필이미지 정보 동의						
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="profilechk" value="0"> 프로필이미지 정보 동의
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>	
			<td>지원동기</td>
			<td colspan="3">
				<textarea cols=40 rows=5 name="content">
					${update.content }
				</textarea>
			</td>
		</tr>
	</table>
	<c:choose>
		<c:when test="${update.agree eq '0' }">
			<input type="checkbox" name="agree" value="0" checked> 최소 6개월 이상 봉사활동을 성실히 할 것을 약속합니다.<p>
		</c:when>
		<c:otherwise>
			<input type="checkbox" name="agree" value="0"> 최소 6개월 이상 봉사활동을 성실히 할 것을 약속합니다. <p>
		</c:otherwise>
	</c:choose>
	<div>
		<input type="submit" value="수정">
		<%-- <button type="button" onclick="list()">목록보기</button>
		<button type="button"><a href="delete?id=${update.id }">삭제</a></button> --%>
	</div>
	</form>
</body>
</html>