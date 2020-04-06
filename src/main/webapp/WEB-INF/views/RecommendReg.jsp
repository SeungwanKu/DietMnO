<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%
Cookie[] cookies = request.getCookies(); 
    String id="";
    String usertype="";
for(int i = 0 ; i<cookies.length; i++){                        
	if(cookies[i].getName().equals("id")){
		 id=cookies[i].getValue();
	}
	if(cookies[i].getName().equals("usertype")){
		usertype=cookies[i].getValue();
	}
}
%>
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

  <header >  <jsp:include page="header.jsp" />
    </header>
    
<body>
<% if(!usertype.equals("2")){ %>
<script>
	location.href="http://localhost:8088/MnOBmi/";
</script>
<%} %>
<div class="side">
    <h1>식단 추천</h1>
    <a href="recform"><h2>식단 추천</h2></a>
    <a href="paylistform"><h2>결제 내역</h2></a>
    <%if(usertype.equals("2")){%>
    <a href="recRegform"><h2>식단등록</h2></a>
    <a href="allpaylistform"><h2>전체 결제 내역</h2></a>
    <%} %>
</div>

	<form action="recReg">
	<table>
	<tr>
	<td>아침식단 </td>
	<td>점심식단 </td>
	<td>저녁식단 </td>
	</tr>
	<tr>
	<td><textarea name="Rec_food1" cols="10px" rows="10px" ></textarea></td>
	<td><textarea name="Rec_food2" cols="10px" rows="10px" ></textarea></td>
	<td><textarea name="Rec_food3" cols="10px" rows="10px" ></textarea></td>
	</tr>
	<tr><td>탄단지 영양</td> <td colspan="2"><input type="text" name="Rec_nutrient"/></td></tr>
	<tr><td>칼로리 </td><td colspan="2"><input type="text" name="Rec_cal" /></td></tr>
	<tr><td>가격 </td><td colspan="2"><input type="number" name="Rec_price" />원</td></tr>
	<tr><td>식단 카테고리</td><td colspan="2"> 
	<input type="radio" name="Rec_category" value="1">잡식
	<input type="radio" name="Rec_category" value="2">육식
	<input type="radio" name="Rec_category" value="3">채식
	</td></tr>
	<tr><td colspan="3"><input type="submit" value="전송"/></td></tr>
	</table> 
	</form>
	
</body>


</html>