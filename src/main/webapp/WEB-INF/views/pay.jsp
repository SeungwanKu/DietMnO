<%@page import="java.util.ArrayList"%>
<%@page import="com.spring.mno.rec.domain.Recommendvo"%>
<%@page import="com.spring.mno.user.domain.MemberVO"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<%
String name ="";
String email = "";
String phone = "";
String addr ="";
	int sum=(int)request.getAttribute("sum");
	MemberVO member=(MemberVO)request.getAttribute("member");
  name = member.getName();
    email = member.getEmail();
     phone = member.getPhone();
     addr = member.getAddr();     
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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<header >  <jsp:include page="header.jsp" /></header>
<body>
<script>

window.onload = function () {
if(<%=id%>==null){
location.href='/MnOBmi/loginform';
}
}

    function pay(){
    	var IMP = window.IMP; // 생략가능
    	   IMP.init('imp34887078');  // 가맹점 식별 코드

    	   IMP.request_pay({
    	      pg : 'kakaopay', // 결제방식
    	       pay_method : 'card',	// 결제 수단
    	       merchant_uid : 'merchant_' + new Date().getTime(),
    	      name : '다이어트M&O',	// order 테이블에 들어갈 주문명 혹은 주문 번호
    	       amount :  <%=sum%>,	// 결제 금액
    	       buyer_email : "<%=email%>",	// 구매자 email
    	      buyer_name : "<%=name%>",		// 구매자 이름
    	       buyer_tel : "<%=phone%>",	// 구매자 전화번호
    	       buyer_addr : "<%=addr%>",	// 구매자 주소
    	       buyer_postcode :  '123-123',	// 구매자 우편번호  	       
    	       m_redirect_url : '/khx/payEnd.action'	// 결제 완료 후 보낼 컨트롤러의 메소드명
    	   }, function(rsp) {
    		if ( rsp.success ) { // 성공시
    			var msg = '결제가 완료되었습니다.';
    			msg += '고유ID : ' + rsp.imp_uid;
    			msg += '상점 거래ID : ' + rsp.merchant_uid;
    			msg += '결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;
    			 location.href='/MnOBmi/paySuccess?id=<%=id%>&sum=<%=sum%>';
    		} else { // 실패시
    			var msg = '결제에 실패하였습니다.';
    			msg += '에러내용 : ' + rsp.error_msg;
    			alert(msg);
    			location.href='/MnOBmi/paySuccess?id=<%=id%>&sum=<%=sum%>';
    		}
    	});
    }
    </script>
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
	<tr>
	<td colspan="3">총 가격 :</td><td colspan="3">${sum}</td>
	</tr>
	</table>
	<button onclick="pay()">결제하기</button>
</body>
</html>