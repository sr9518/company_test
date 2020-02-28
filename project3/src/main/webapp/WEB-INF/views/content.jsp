<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function updateBtn(id) {
		location = "update?id="+id;
	}
	function listBtn() {
		location = "list";
	}
</script>
</head>
<body>

	<table width=700>
		<tr>	
			<td>이름</td>
			<td>
				${detail.name }
			</td>
			<td>영문이름</td>
			<td>${detail.eng_name }</td>
		</tr>
		<tr>	
			<td>아이디</td>
			<td>
				${detail.userid }
			</td>
			<td>이메일</td>
			<td>
				${detail.email }
				<c:choose>
					<c:when test="${detail.emailchk1 eq '0'}">
						<input type="checkbox" name="emailchk1" value="0" checked disabled> 이메일 수신 동의
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="emailchk1" value="0" disabled> 이메일 수신 동의
					</c:otherwise>
				</c:choose>	
				
				<c:choose>
					<c:when test="${detail.emailchk2 eq '0'}">
						<input type="checkbox" name="emailchk2" value="0" checked disabled> 서신할당 알림메일 수신허용(해외거주 등 문자수신 불가한 경우)
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="emailchk2" value="0" disabled> 서신할당 알림메일 수신허용(해외거주 등 문자수신 불가한 경우)
					</c:otherwise>
				</c:choose>	
			
			</td>
		</tr>
		<tr>	
			<td>생년월일</td>
			<td>
				${detail.birth}
			</td>
			<td colspan="2">
				<c:choose>
					<c:when test="${detail.birthchk eq '0'}">
						<input type="radio" name="birthchk" value="0" checked disabled> 음력
						<input type="radio" name="birthchk" value="1" disabled> 양력
					</c:when>
					<c:when test="${detail.birthchk eq '1'}">
						<input type="radio" name="birthchk" value="0" disabled> 음력
						<input type="radio" name="birthchk" value="1" checked disabled> 양력
					</c:when>
					<c:otherwise>
						<input type="radio" name="birthchk" value="0" disabled> 음력
						<input type="radio" name="birthchk" value="1" disabled> 양력
					</c:otherwise>
				</c:choose>	
			</td>
		</tr>
		<tr>	
			<td>휴대폰 번호</td>
			<td>
				${detail.phone }
				<c:choose>
					<c:when test="${detail.phonechk eq '0' }">
						<input type="checkbox" name="phonechk" value="0" checked disabled> SMS 수신동의
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="phonechk" value="0" disabled> SMS 수신동의
					</c:otherwise>
				</c:choose>
			</td>
			<td>직업</td>
			<td>
				${detail.job }
				<c:choose>
					<c:when test="${detail.jobchk eq '0'}">
						<input type="checkbox" name="jobchk" value="0" checked disabled> 직업 정보 동의
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="jobchk" value="0" disabled> 직업 정보 동의
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<td>봉사단계</td>
			<td>
				<c:choose>
					<c:when test="${detail.bong eq '0'}">
						<select name="bong" disabled>
							<option value="0" selected>새싹</option>
							<option value="1">열매</option>
						</select>
					</c:when>
					<c:when test="${detail.bong eq '1' }">
						<select name="bong" disabled>
							<option value="0">새싹</option>
							<option value="1" selected>열매</option>
						</select>
					</c:when>
					<c:otherwise>
						<select name="bong" disabled>
							<option value="0">새싹</option>
							<option value="1">열매</option>
						</select>
					</c:otherwise>
				</c:choose>
			</td>
			<td>번역구분</td>
			<td>
				<c:choose>
					<c:when test="${detail.bun eq '0'}">
						<select name="bun" disabled>
							<option value="0" selected>모두</option>
							<option value="1">아동서신</option>
							<option value="2">후원자 서신</option>
						</select>
					</c:when>
					<c:when test="${detail.bun eq '1' }">
						<select name="bun" disabled>
							<option value="0">모두</option>
							<option value="1" selected>아동서신</option>
							<option value="2">후원자 서신</option>
						</select>
					</c:when>
					<c:when test="${detail.bun eq '2' }">
						<select name="bun" disabled>
							<option value="0">모두</option>
							<option value="1">아동서신</option>
							<option value="2" selected>후원자 서신</option>
						</select>
					</c:when>
					<c:otherwise>
						<select name="bun" disabled>
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
					<c:when test="${detail.staff eq '0' }">
						<select name="staff" disabled>
							<option value="0" selected>김직원</option>
							<option value="1">이직원</option>
							<option value="2">박직원</option>
						</select>
					</c:when>
					<c:when test="${detail.staff eq '1' }">
						<select name="staff" disabled>
							<option value="0">김직원</option>
							<option value="1" selected>이직원</option>
							<option value="2">박직원</option>
						</select>
					</c:when>
					<c:when test="${detail.staff eq '2' }">
						<select name="staff" disabled>
							<option value="0">김직원</option>
							<option value="1">이직원</option>
							<option value="2" selected>박직원</option>
						</select>
					</c:when>
					<c:otherwise>
						<select name="staff" disabled>
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
				우편번호 : ${detail.juso1 } <p>
				주소 : ${detail.juso2 } <p>
				<c:choose>
					<c:when test="${detail.jusochk eq '0' }">
						<input type="checkbox" name="jusochk" value="0" checked disabled> 자택주소 정보 동의
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="jusochk" value="0" disabled> 자택주소 정보 동의
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>	
			<td>프로필사진</td>
			<td colspan="3">
				<input type="file" name="profile"> <p>
				<c:choose>
					<c:when test="${detail.profilechk eq '0'}">
						<input type="checkbox" name="profilechk" value="0" checked disabled> 프로필이미지 정보 동의						
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="profilechk" value="0" disabled> 프로필이미지 정보 동의
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>	
			<td>지원동기</td>
			<td colspan="3">
				<textarea cols=40 rows=5 name="content" disabled>
					${detail.content }
				</textarea>
			</td>
		</tr>
	</table>
	<c:choose>
		<c:when test="${detail.agree eq '0' }">
			<input type="checkbox" name="agree" value="0" checked disabled> 최소 6개월 이상 봉사활동을 성실히 할 것을 약속합니다.<p>
		</c:when>
		<c:otherwise>
			<input type="checkbox" name="agree" value="0" disabled> 최소 6개월 이상 봉사활동을 성실히 할 것을 약속합니다. <p>
		</c:otherwise>
	</c:choose>
	<div>
		<button type="button" onclick="updateBtn('${detail.id}')">수정</button>
		<button type="button" onclick="listBtn()">목록</button>
	</div>
</body>
</html>