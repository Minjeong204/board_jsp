<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
<title>글쓰기창</title>
<link href="${contextPath}/resources/css/reset.css" rel="stylesheet"
	type="text/css">
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/default.css" rel="stylesheet"
	type="text/css">
<style type="text/css">
.btn-primary {
	width: 100%;
	margin-left: 0px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	function backToList(obj) {
		obj.action = "${contextPath}/board/listArticles.do";
		obj.submit();
	}
</script>
<title>새글 쓰기 창</title>
</head>
<body>
	<div class="wrap">
		<h2>글쓰기</h2>
		<form name="articleForm" method="post"
			action="${contextPath}/board/addArticle.do"
			enctype="multipart/form-data">
			<div class="form-group">
				<label for="exampleInputTitle" class="form-label mt-4">글제목</label> <input
					type="text" class="form-control" id="exampleInputTitle"
					aria-describedby="emailHelp" placeholder="제목을 입력하세요" size="67"
					maxlength="500" name="title">
			</div>
			<div class="form-group">
				<label for="exampleTextarea" class="form-label mt-4">글 내용</label>
				<textarea class="form-control" id="exampleTextarea" rows="10"
					cols="65" maxlength="4000" name="content"></textarea>
			</div>
			<div class="form-group">
				<label for="formFile" class="form-label mt-4">이미지 파일 첨부</label> <input
					class="form-control" type="file" id="formFile" name="imageFileName"
					onchange="readURL(this);">
			</div>
			<br>


			<div id="d_file"></div>

			<button type="submit" class="btn btn-secondary btn-lg">글쓰기</button>
			<div class="d-grid gap-2">
				<button type="button" class="btn btn-lg btn-primary"
					onClick="backToList(this.form)">목록보기</button>
			</div>


		</form>
	</div>
</body>
</html>
