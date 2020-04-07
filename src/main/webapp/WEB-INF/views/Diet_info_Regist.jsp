<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
Cookie[] cookies = request.getCookies(); 
    String id=null;
    String usertype=null;
for(int i = 0 ; i<cookies.length; i++){                        
	if(cookies[i].getName().equals("id")){
		 id=cookies[i].getValue();
	}
	if(cookies[i].getName().equals("usertype")){
		usertype=cookies[i].getValue();
	}
}
%>
    <% Date date; %>
    <jsp:include page="include/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    
    <style >
    .body{
    text-align: center;
    }
    </style>
    </head>
    


   <div class="body">
    <div class="container">
<form action="Diet_info_Regist" method="POST">
<input type="hidden" name="user" id="user" value="<%= id %>"/>
<table class="table table-striped">
<tr>
<td><label>날짜 :</label></td>
  <td colspan="4"><input name="dates" id="dates" type="datetime-local"  /></td>
</tr>
<tr>
<td><label>음식 종류: </label></td>
<td colspan="4"><select name="foodtype">
    <option value="한식">한식</option>
    <option value="중식">중</option>
    <option value="일식">일</option>
    <option value="양식">양</option>
    </select></td>
</tr>
<tr>
    <td><label>음식 : </label></td>
    <td colspan="4">
    	<select name="foodname">
        <option value="1">1</option>
        <option value="2">중</option>
        <option value="3">일</option>
        <option value="4">양</option>
        </select></td>
    </tr>
    <tr>
        <td><label>섭취량: </label></td>
        <td colspan="4">
        	<select name="eat">
            <option value="1/4">1/4</option>
            <option value="1/3">1/3</option>
            <option value="1/2">1/2</option>
            <option value="1">1</option>
            </select></td>
        </tr>
        <tr>
        <td colspan="5"> <input type="submit" value="등록"  id="searchBtn"  onclick="send()"/></td>
        </tr>
</table>
<script >

function send() {
	alert('저장완료');
	document.bmiform.submit();
	}
	
window.onload = function () {

	document.getElementById('dates').value=new Date().toISOString().slice(0, 16);
	}	
</script>
</form>
</div>
</div>
</html>
<jsp:include page="include/footer.jsp"></jsp:include>