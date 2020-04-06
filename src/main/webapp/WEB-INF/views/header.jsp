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

<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<title> Am I fat? </title>
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
	
		div{
			margin: auto;
			text-align: center;
			background-color: chartreuse;
			width: 50%;
		}
		
		</style>
		</head>
		
<header><%= id %>님 <button onClick="location.href='memberinfo?id=<%=id%>' ">마이페이지</button>
    <a href="loginform"><img src="jsp.jpg" width="15px" height="15px" ></a><br>
    <ul>
        <li><a href="#home"><img src="jsp.jpg" width="20px" height="20px"></a></li>
        <li><a href="#news">BMI</a></li>
        <li><a href="#news">식단등록</a></li>
        <li><a href="#contact">추천식단</a></li>
        <li><a href="#about">커뮤니티</a></li>
        <li><a href="#news">홈 트레이닝</a></li>
        <li><a href="#contact">음식사전</a></li>
        <li><a href="#about">일일운동미션</a></li>
      </ul>
<%if(id==null){ %>
<script>
location.href='/MnOBmi/loginform';
</script>
<%} %>
</header>
<body>
      

</body>
</html>