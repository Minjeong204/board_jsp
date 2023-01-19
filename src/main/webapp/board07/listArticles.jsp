<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="articlesList" value="${articlesMap.articlesList}" />
<c:set var="totArticles" value="${articlesMap.totArticles}" />
<c:set var="section" value="${articlesMap.section}" />
<c:set var="pageNum" value="${articlesMap.pageNum}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<style>
.wrap {
	margin-top: 50px;
	width: 80%;
	margin-left: auto;
	margin-right: auto;
	width: 70%;
	margin-bottom: 50px;
}

.paging {
	float: right;
}

.cls1 {
	float: right;
	margin-top: 10px;
}
</style>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/reset.css" rel="stylesheet"
	type="text/css">
<meta charset="UTF-8">
<title>글목록창</title>
</head>
<body>
	<div class="wrap">
		<table class="table table-hover">
			<tr class="table-primary" align="center">
				<th>글번호</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:choose>
				<c:when test="${articlesList ==null }">
					<tr height="10">
						<td colspan="4">
							<p align="center">
								<b><span style="font-size: 9pt;">등록된 글이 없습니다.</span></b>
							</p>
						</td>
					</tr>
				</c:when>
				<c:when test="${articlesList !=null }">
					<c:forEach var="article" items="${articlesList }"
						varStatus="articleNum">
						<tr align="center">
							<td width="5%">${articleNum.count}</td>
							<td align='center' width="35%"><span
								style="padding-right: 30px"></span> <c:choose>
									<c:when test='${article.level > 1 }'>
										<c:forEach begin="1" end="${article.level }" step="1">
											<span style="padding-left: 10px"></span>
										</c:forEach>
										<span style="font-size: 12px;">[답변]</span>
										<a 
											href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
									</c:when>
									<c:otherwise>
										<a
											href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
									</c:otherwise>
								</c:choose></td>
							<td width="10%"><fmt:formatDate value="${article.writeDate}" /></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>

		<%-- 		<div class="cls2">
			<c:if test="${totArticles != null }">
				<c:choose>
					<c:when test="${totArticles >100 }">
						<!-- 글 개수가 100 초과인경우 -->
						<c:forEach var="page" begin="1" end="10" step="1">
							<c:if test="${section >1 && page==1 }">
								<a class="no-uline"
									href="${contextPath }/board/listArticles.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp;
									pre </a>
							</c:if>
							<a class="no-uline"
								href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">${(section-1)*10 +page }
							</a>
							<c:if test="${page ==10 }">
								<a class="no-uline"
									href="${contextPath }/board/listArticles.do?section=${section+1}&pageNum=${section*10+1}">&nbsp;
									next</a>
							</c:if>
						</c:forEach>
					</c:when>
					<c:when test="${totArticles ==100 }">
						<!--등록된 글 개수가 100개인경우  -->
						<c:forEach var="page" begin="1" end="10" step="1">
							<a class="no-uline" href="#">${page } </a>
						</c:forEach>
					</c:when>

					<c:when test="${totArticles< 100 }">
						<!--등록된 글 개수가 100개 미만인 경우  -->
						<c:forEach var="page" begin="1" end="${totArticles/10 +1}"
							step="1">
							<c:choose>
								<c:when test="${page==pageNum }">
									<a class="sel-page"
										href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">${page }
									</a>
								</c:when>
								<c:otherwise>
									<a class="no-uline"
										href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">${page }
									</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
				</c:choose>
			</c:if>
		</div> --%>
		<div class="paging">
			<ul class="pagination pagination-sm">
				<c:if test="${totArticles != null }">
					<c:choose>
						<c:when test="${totArticles >100 }">
							<!-- 글 개수가 100 초과인경우 -->
							<c:forEach var="page" begin="1" end="10" step="1">
								<c:if test="${section >1 && page==1 }">
									<li class="page-item disabled"><a class="page-link"
										href="#">&laquo;</a></li>
								</c:if>
								<li class="page-item active"><a class="page-link"
									href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">${(section-1)*10 +page}</a>
								</li>
								<c:if test="${page ==10 }">
									<li class="page-item"><a class="page-link"
										href="${contextPath }/board/listArticles.do?section=${section+1}&pageNum=${section*10+1}">&raquo;</a>
									</li>
								</c:if>
							</c:forEach>
						</c:when>
						<c:when test="${totArticles ==100 }">
							<c:forEach var="page" begin="1" end="10" step="1">
								<li class="page-item active"><a class="page-link" href="#">${page }
								</a></li>
							</c:forEach>
						</c:when>
						<c:when test="${totArticles< 100 }">
							<!--등록된 글 개수가 100개 미만인 경우  -->
							<c:forEach var="page" begin="1" end="${totArticles/10 +1}"
								step="1">
								<c:choose>
									<c:when test="${page==pageNum }">
										<li class="page-item active"><a class="page-link"
											href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">${page }
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item active"><a class="page-link"
											href="${contextPath }/board/listArticles.do?section=${section}&pageNum=${page}">${page }
										</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
					</c:choose>
				</c:if>
			</ul>
		</div>


		<br> <br> <a class="cls1"
			href="${contextPath}/board/articleForm.do"><p class="cls2">글쓰기</p></a>




	</div>

</body>
</html>