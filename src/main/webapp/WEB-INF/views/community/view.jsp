<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="box-body">
	<span><b>글번호:</b> ${view.bno}</span>	
	<div class="form-group">
		<label for="title">Title</label>
		<input type="text" id="title" name="title" class="form-control" value="${view.title}" readonly="readonly"/>		
	</div>
	<div class="form-group">
		<label for="content">Content</label>
		<textarea name="content" id="content" class="form-control" rows="3" readonly="readonly">${view.content}</textarea>		
	</div>
	<div class="form-group">
		<label for="writer">Writer</label>
		<input type="text" id="writer" name="writer" class="form-control" value="${view.writer}" readonly="readonly"/>		
	</div>
	<div class="form-group">
		<label for="download">첨부파일</label> 
		<a class="form-control "
			href="/fileDownload.do?fileName=${view.fileName}">${view.fileName}</a>
	</div>
</div>
	
<div>
	<a href="/community/listPage${cri.makeQuery()}" class="btn btn-primary">목록으로 돌아가기</a>
	<a href="/community/modify${cri.makeQuery()}&bno=${view.bno}" class="btn btn-warning">수정</a>
	<button id="btn-remove" class="btn btn-danger">삭제</button>
</div>
	
<script>
	var result = '${result}';
	$(function(){
		$('#btn-remove').click(function(){
			if(confirm("Are u sure?")){
				self.location.href = "/community/delete?${cri.makeQuery()}&bno=${view.bno}";
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
