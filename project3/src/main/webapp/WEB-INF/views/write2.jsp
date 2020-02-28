<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div> 회원정보 </div>
<form method="post" id="frm" name="frm" action="write_ok">
	<table width=700>
		<tr>	
			<td>이름</td>
			<td>
				<input type="text" name="name">
			</td>
			<td>영문이름</td>
			<td><input type="text" name="eng_name"></td>
		</tr>
		<tr>	
			<td>아이디</td>
			<td>
				<input type="text" name="userid">
			</td>
			<td>이메일</td>
			<td>
				<input type="text" name="email">
				<input type="checkbox" name="emailchk1" value="0"> 이메일 수신 동의
				<input type="checkbox" name="emailchk2" value="0"> 서신할당 알림메일 수신허용(해외거주 등 문자수신 불가한 경우)
			</td>
		</tr>
		<tr>	
			<td>생년월일</td>
			<td>
				<input type="text" name="birth">
			</td>
			<td colspan="2">
				<input type="radio" name="birthchk" value="0"> 음력
				<input type="radio" name="birthchk" value="1"> 양력
			</td>
		</tr>
		<tr>	
			<td>휴대폰 번호</td>
			<td>
				<input type="text" name="phone">
				<input type="checkbox" name="phonechk" value="0"> SMS 수신동의
			</td>
			<td>직업</td>
			<td>
				<input type="text" name="job">
				<input type="checkbox" name="jobchk" value="0"> 직업 정보 동의
			</td>
		</tr>
		<tr>
			<td>봉사단계</td>
			<td>
				<select name="bong">
					<option value="0">새싹</option>
					<option value="1">열매</option>
				</select>
			</td>
			<td>번역구분</td>
			<td>
				<select name="bun">
					<option value="0">모두</option>
					<option value="1">아동서신</option>
					<option value="2">후원자 서신</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>담당직원</td>
			<td colspan="3">
				<select name="staff">
					<option value="0">김직원</option>
					<option value="1">이직원</option>
					<option value="2">박직원</option>
				</select>
			</td>
		</tr>
		<tr>
			<td></td>
			<td colspan="3">
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
			</td>
		</tr>
		<tr>	
			<td>자택주소</td>
			<td colspan="3">
				우편번호 <input type="text" name="juso1"> <p>
				주소 <input type="text" name="juso2"> <p>
				<input type="text" name="jusochk">
			</td>
		</tr>
		<tr>	
			<td>프로필사진</td>
			<td colspan="3">
				<input type="file" name="profile"> <p>
				<input type="checkbox" name="profilechk" value="0"> 프로필이미지 정보 동의
			</td>
		</tr>
		<tr>	
			<td>지원동기</td>
			<td colspan="3">
				<textarea cols=40 rows=5 name="content">
					
				</textarea>
			</td>
		</tr>
	</table>
	<input type="checkbox" name="agree" value=0> 최소 6개월 이상 봉사활동을 성실히 할 것을 약속합니다. <p>
	
	<input type="submit" value="회원가입">
</form>
</body>
</html>















