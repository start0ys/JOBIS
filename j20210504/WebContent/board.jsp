<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
<style type="text/css">
	a{
		text-decoration: none;
		color:black;
	}
</style>
</head>
<body>
	${m_nickname }님 반갑습니다.<p>

	<table style="text-align: center;">
		<tr><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="board" items="${list }">
				<tr>
					<td style="width: 55%; font-weight: bold; font-size: 18px;">
						<a href="view.do?b_idx=${board.b_idx }&pageNum=${currentPage}">${board.b_title }</a>
					</td>
					<td style="width: 15%;">👤${board.m_nickname }</td>
					<td style="width: 15%;">${board.b_regdate }</td>
					<td style="width: 15%;">${board.b_count }</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${toCnt == 0 }">
			<tr>
				<td colspan="7">데이터가 없습니다</td>
			</tr>
		</c:if>

	</table>
	<div style="text-align: center; margin-top: 20px;">
		<c:if test="${startPage > blockSize }">
			<a href="board.do?pageNum=${startPage-blockSize }&b_type=${b_type }">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${pageNum == i }">
				<a href="board.do?pageNum=${i }&b_type=${b_type }" style="color: red;">[${i }]</a>
			</c:if>
			<c:if test="${pageNum != i }">
				<a href="board.do?pageNum=${i }&b_type=${b_type }">[${i }]</a>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href="board.do?pageNum=${startPage+blockSize }&b_type=${b_type }">[다음]</a>
		</c:if>
	</div>
	<div>
		<input type="button" value="글쓰기" onclick="location.href = 'bwrite.do?b_type=${b_type}'">
	</div>
</body>
</html>