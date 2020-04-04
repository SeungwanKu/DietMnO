<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
	
<%@include file="include/header.jsp" %>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box">
					<div class="box-header with-border">
						<a href="/login">로그인</a>
						<a href="/community/listPage">커뮤니티</a>
						<a href="/diet/list">식단등록</a>

					</div>
				</div>
			</div>
		</div>
	</section>	
<%@include file="include/footer.jsp" %>