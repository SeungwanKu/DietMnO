<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="include/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style >
    .body{
    text-align: center;
    }
    </style>
</head>
<div class="body">
<div class="container">
<form action="update" method="POST">
<table class="table table-striped">
	<tr>
	 <td>이름</td>
	 <td>이메일</td>
	 <td>전화번호</td>
	 <td>주소</td>
	</tr>
	<tr>
		<td><input type="hidden" name="id" value="${member.id}"/>
		 <input type="text" name="name" id="name" value="${member.name}"/></td>
		<td><input type="text" name="email" id="email" value="${member.email}"/></td>
		<td><input type="text" name="phone" id="phone" value="${member.phone}"/></td>
		<td><input type="text" name="addr" id="addr" value="${member.addr}"/></td>
	</tr>
		<tr><td colspan="4"><input  id="searchBtn" type="submit" value="수정"/></td></tr>
</table>

</form>
</div>
</div>
</html>
<jsp:include page="include/footer.jsp"></jsp:include>