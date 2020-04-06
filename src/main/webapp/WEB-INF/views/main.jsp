<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insert" method="POST">
<table border="1">
	<tr>
	 <td>이름</td>
	 <td>이메일</td>
	 <td>전화번호</td>
	 <td></td>
	</tr>
	<tr>
		<td><input type="text" name="name" id="name"/></td>
		<td><input type="text" name="email" id="email"/></td>
		<td><input type="text" name="phone" id="phone"/></td>
		<td><input type="submit" value="추가"/></td>
	</tr>
	<c:forEach items="${memberList}" var="member">
		<tr>
			<td>${member.name}</td>
			<td>${member.email}</td>
			<td>${member.phone}</td>
			<td><a href="delete?id=${member.id}">삭제</a>
			  <a href="updateForm?id=${member.id}">수정</a>
			</td>
		</tr>
	</c:forEach>
</table>
</form>
</body>
</html>