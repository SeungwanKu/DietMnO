<%@page import="com.spring.mno.ht.domain.HtVO"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
	<%
HtVO vo=(HtVO) request.getAttribute("view");
%>
<div id="saveOK" class="alert alert-warning hidden" role="alert">글이 수정되었습니다.</div>
<div class="box-body">
	<span><b>글번호:</b> ${view.hbno}</span>	
	<div class="form-group">
		<label for="title">Title</label>
		<input type="text" id="title" name="title" class="form-control" value="${view.title}" readonly="readonly"/>		
	</div>
	<div class="form-group">
		<label for="content">Content</label>
		<textarea name="content" id="content" class="form-control" rows="3" readonly="readonly">${view.content}</textarea>		
	</div>
	
	<div class="form-group">
		<label for="writer" >Writer</label>
		<input type="text" id="writer" name="writer" class="form-control" value="${view.writer}" readonly="readonly"/>		
	</div>
	<%if(vo.getFileName()!=null) {%>
	<div>
	<img src="/fileDownload.do?fileName=${view.fileName}" width="500px" height="auto" />
	</div>
	<%} %>
</div>
	
<div>
	<a href="/ht/listPage${cri.makeQuery()}" class="btn btn-primary">목록으로 돌아가기</a>
	<%if(id.equals(vo.getWriter()) || usertype.equals("2") ){ %>
	<a href="/ht/modify${cri.makeQuery()}&hbno=${view.hbno}" class="btn btn-warning">수정</a>

	<button id="btn-remove" class="btn btn-danger">삭제</button>
	<%} %>
</div>
	
<script>
	var result = '${result}';
	$(function(){
		$('#btn-remove').click(function(){
			if(confirm("삭제하시겠습니까??")){
				self.location.href = "/ht/delete?${cri.makeQuery()}&hbno=${view.hbno}";
			}
		});
			
		//수정 성공시 문구 나타났다 사라짐
		if(result === 'saveOK'){
			$('#saveOK').removeClass('hidden');
			$('#saveOK').fadeOut(2000);
		}
	})
	</script>
	<%@include file="../include/footer.jsp" %>