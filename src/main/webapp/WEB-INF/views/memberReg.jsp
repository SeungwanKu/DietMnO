<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입 양식</title>
    <link rel="stylesheet" type="text/css" href="C:\FrameWork\MnOBmi\WebContent\view\style.css" />
    <script>
    function ckeckPasswd() {
    	var passwd1=document.getElementById("passwd1");
    	var passwd2=document.getElementById("passwd2");
    	var passwdCheck=document.getElementById("passwdCheck");
    	if(passwd1.value != passwd2.value){
    		passwdCheck.innerHTML = "<font color='red'>비밀번호가 일치하지 않습니다.</font>";
    		passwd2.focus();
    		passwd2.select(); 
    	}
    	else{
    		passwdCheck.innerHTML = "";
    	}
    }
    
    function idcheck() {
    	var id=document.getElementById("id");
    	
    	var idCheck = true;
	    if(id.value!=""){
	     	<c:forEach items = "${memberlist}" var = "members">	
		    	 if("${members.id}"==id.value){
		    		 var idCheck = false;
		    		 alert(id.value+"는 사용 불가능합니다.");
		    		 id.value="";
			    	} 
			  </c:forEach> 
				  if(idCheck){
				    	alert(id.value+"는 사용 가능합니다.");
				    	document.getElementById('submit').disabled=false;
				    } 			
	    }
	    else{
	    	alert("id를 입력해주세요.");
	    }
    	
 
    
    }
    </script>
    
  </head>
  <body class="loginForm">
 
    <header>
      <nav></nav>
    </header>
    <section>
      <article>
        <form action="memberReg" method="post" class="memberReg">
          <h2>회원가입</h2>
          <hr />

          <div>아이디</div>
     
          <input type="text" name="id" id="id"  required="required"/>
          <input type="button" value="중복체크" onclick="idcheck()" />
          <div>비밀번호</div>
			<input type ="password" name= "passwd1" id="passwd1"
			 required="required"/> 
			 <div>비밀번호 확인</div>	
			<input type ="password" name= "passwd2" id="passwd2"
			required="required" onblur="ckeckPasswd()"/> 
			<div id=passwdCheck></div>
          <div>이름</div>
          <input type="text" name="name" id="name"  required="required"/>
          <div>주소</div>
          <input type="text" name="addr" id="addr"  required="required"/>

          <div>전화번호</div>
          <input type="number" name="phone" id="phone"  required="required"/>

          <div>주민번호</div>
          <input type="number" name="ssn" id="ssn"  required="required"/>
          <div>이메일</div>
          <input type="email" name="email" id="email"  required="required"/>
          <br>
          <input type="radio" name="usertype" value="1" checked="checked"/> 사용자
		  <input type="radio" name="usertype" value="2"  /> 관리자
          <input type="submit" value="회원가입하기" id="submit" disabled="disabled"/>
        	
        </form>
      </article>
    </section>
    <footer></footer>
  </body>
</html>
