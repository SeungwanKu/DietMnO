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
		.side{
	float: left;
  width: 30%;
  height: 700px; 
}
		</style>

</head><script>
window.onload = function () {
if(<%=id%>==null){
location.href='/';
}
}
</script>
<header>
   <jsp:include page="header.jsp" />
</header>
<body>
<div class="side">
    <h1>BMI</h1>
    <a href="bmi"><h2>BMI</h2></a>
    <a href="bmilistform"><h2>BMI내역</h2></a>
</div>
<form name="bmiform" action="BmiCalcs" method = "post">
	<div>
	<h2> 당신의 표준체중과 체질량지수(BMI)는? </h2>
	<br>
	<input type="hidden" name="userid" id="userid" value="<%= id %>"/>
	<input type="number" name="weight" id="weight"  placeholder="몸무게"> kg
	<br>
	<input type="number" name="height" id="height"  placeholder="키"> cm
	<br><br>
	<input type="button" value="계산하기"  onclick="bmicalc()"/>
	<br>
	</div>

		<div id="bmi2" style="display:none;">
		<h3 id="bmih3">나의 신체질량지수(BMI)</h3>
		<label id="bmila"></label><br>
		<img src="https://postfiles.pstatic.net/MjAyMDAzMTlfMTg1/MDAxNTg0NjE4MDY1MTEy.dE1f5FmuCx8XTW2LSW6GVwFOPmCg6ewva7ApJ93Cw30g.rfDLI1Ya-ovGCDzIEKIn8iXVTIEoH6pAyJ5KcpxZ-8Qg.PNG.tprb77021/bmi.PNG?type=w773" width="600px" height="auto">
		<br>
		<input type="submit" id="submit" value="저장하기" onclick="send()" disabled="disabled"/>
	</div>
	
</form>
	
	<script>
		function send() {
		alert('저장완료');
		document.bmiform.submit();
	
		}
	
		function bmicalc(){
			var w = weight.value;
			var h = height.value;
			document.getElementById('submit').disabled=false;
			 if(w.length==0 || w.length>3) {
				alert('몸무게를 옳바르게 입력하세요');
				}
			else if(h.length<3 || h.length>3) {
				alert('키를 옳바르게 입력하세요');
				}
			else{ 
			var img=document.getElementById('bmi2');
				img.style.display="block";
				standardWeight(w,h)	;
			}
		}

	

	function standardWeight(w, h){

		var bmila = document.getElementById('bmila');
		var bmi = w / (h*h / 10000);
		bmila.innerHTML=bmi.toFixed(2)+"%";
		
}


	</script>
</body>

</html>