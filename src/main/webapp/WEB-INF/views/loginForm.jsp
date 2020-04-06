<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri= "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인</title>
    <link rel="stylesheet" href="style.css" />
     <link href="style.css" rel="stylesheet" type="text/css">
  </head>
  <body class="loginForm">
    <header></header>
    <nav></nav>
    <section>
      <article>
        <form class="login_box" action="login" method="post">
          <h1>로그인</h1>
          <hr>
          <input type="text" name="id" id="id" required="required" placeholder="userId" />
          <input type="password" name="passwd1" id="passwd1" required="required" placeholder="userPw" />
          <input type="submit" value="로그인"/>
          <a href="memberRegform">회원가입하기</a>
          <a href="findidform">아이디 찾기</a>
          <a href="findpwform">비밀번호 찾기</a>
        </form>
       <c:if test="${loginSuccess eq 'false'}">
        	<script>alert("로그인 실패");</script>
       </c:if>
      </article>
    </section>
    <footer></footer>
  </body>
</html>
