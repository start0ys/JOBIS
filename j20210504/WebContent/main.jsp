<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
</head>
<body>
	<c:if test="${empty m_nickname }">
		<h1>로그인 실패</h1>
	</c:if>
	<c:if test="${not empty m_nickname }">
		
		${m_nickname }님 반갑습니다.<p>

	</c:if> 
	
	<input type="button" value="면접게시판" onclick="location.href = 'board.do?b_type=0'">
	<input type="button" value="Q&A게시판" onclick="location.href = 'board.do?b_type=1'">
	<input type="button" value="자유게시판" onclick="location.href = 'board.do?b_type=2'">
</body>
</html>