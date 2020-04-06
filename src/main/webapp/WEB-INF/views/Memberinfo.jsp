<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateform" method="POST">
<table border="1">
	<tr>
	 <td>아이디</td>
	 <td>이름</td>
	 <td>이메일</td>
	 <td>전화번호</td>
	 <td>주소</td>
	 <td>주민번호</td>
	</tr>
	<tr>
	
		<td><input type="hidden" name="id" value="${member.id}"/>
		${member.id}</td>
		<td>${member.name}</td>
		<td>${member.email}</td>
		<td>${member.phone}</td>
		<td>${member.addr}</td>
		<td>${member.ssn}</td>
	</tr>
		<tr><td colspan="6"><input type="submit" value="수정"/></td></tr>
</table>
</form>
</body>
</html>