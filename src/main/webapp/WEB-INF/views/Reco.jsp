<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.mno.rec.domain.Recommendvo"%>
<%@page import="com.spring.mno.user.domain.MemberVO"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    body{
        background: rosybrown;
    }
.side{
	float: left;
  width: 30%;
  height: 700px; 
}
.list{
    margin-top: 100px;
    text-align: left ;
    font-size: 50px;
}

select{
    width: 80px;
    height: 50px;
    font-size: 30px;
}
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

table.blueTable {
  border: 1px solid #1C6EA4;
  border-radius: 20px;
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
 input{
    font-size: 20px;
    margin: 5px;
} 

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<body>
 <table class="blueTable">
    <thead><th>아침</th><th>점심</th><th>저녁</th><th>탄단지</th><th>칼로리</th><th>가격</th></thead>
   	 <c:forEach items="${recommends}" var="recommends">
		<tr>	
			<td>${recommends.rec_food1}</td>
			<td>${recommends.rec_food2}</td>
			<td>${recommends.rec_food3}</td>
			<td>${recommends.rec_nutrient}</td>
			<td>${recommends.rec_cal}</td>
			<td>${recommends.rec_price}</td>
		</tr>
	</c:forEach>
	</table>
	<c:if test="${not empty member}">
	<label>아이디 : </label>${member.id} 
	<label>이름 : </label>${member.name}
	<label>이메일 : </label>${member.email}
	<label>전화번호 : </label>${member.phone}
	<label>주소 : </label>${member.addr}
	<br>
	</c:if>
	<input type="button" value="창닫기" onClick="window.close()">
</body>
</html>