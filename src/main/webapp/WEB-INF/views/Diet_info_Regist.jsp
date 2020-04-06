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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    header{
    text-align: right;
    background-color: skyblue;
    }
        ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        background-color: skyblue;
    }
    ul:after{
        content:'';
        display: block;
        clear:both;
    }
    li {
        float: left;
        position: relative;
    }
    li a {
        display: block;
        color: black;
        font-size: 20px;
        text-align: center;
        padding: 14px 36px;
        text-decoration: none;
    }
    li a:hover:not(.active) {
        background-color: yellowgreen;
    }
    .active {
        background-color: #4CAF50;
    }
    .side{
float: left;
  width: 30%;
  height: 700px; 
}
    table.blueTable {
        margin-top: 100px;
  border: 1px solid #1C6EA4;
  background-color: #EEEEEE;
  width: 100%;
  text-align: left;
  border-collapse: collapse;
  width: 700px;

}
table.blueTable td, table.blueTable th {
  border: 1px solid #AAAAAA;
  padding: 3px 2px;
  text-align: center;
 
}
table.blueTable tbody td {
  font-size: 20px;
}
table.blueTable tr:nth-child(even) {
  background: #D0E4F5;
}
table.blueTable thead {
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  border-bottom: 2px solid #444444;
}
table.blueTable thead th {
  font-size: 15px;
  font-weight: bold;
  color: #FFFFFF;
  border-left: 2px solid #D0E4F5;
}
table.blueTable thead th:first-child {
  border-left: none;
}

    body{
        background: rosybrown;
    }
select{
    width: auto;
    height: 50px;
    font-size: 30px;
  
}

 input{
    font-size: 30px;
    margin: 5px;
} 
    </style>
    
    
    </head>
    <header >  <jsp:include page="header.jsp" />
    </header>


    <body>
    <div class="side">
    <h1>식단 등록</h1>
    <a href="Diet"><h2>식단 등록</h2></a>
    <a href="Diet_info_List"><h2>식단 내역</h2></a>
    </div>
<form action="Diet_info_Regist" method="POST">
<input type="hidden" name="user" id="user" value="<%= id %>"/>
<table class="blueTable">
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
        <td colspan="5"> <input type="submit" value="등록"  onclick="send()"/></td>
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
</body>
</html>