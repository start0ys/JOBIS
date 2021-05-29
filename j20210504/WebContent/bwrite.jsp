<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
<style type="text/css">
	/* CSS */
</style>
</head>

<body>
	${m_nickname }님 반갑습니다.<p>
	<form action="bwritePro.do" method="post">
		<input type="hidden" name="b_type" value="${b_type }">
		<input type="hidden" name="m_num" value="${m_num }">
		<input type="hidden" name="m_nickname" value="${m_nickname }">
		<input type="text" placeholder="글 제목" name="b_title" maxlength="50" style="height:40px;" required="required"><p>
		<textarea placeholder="글 내용" name="b_content" id="b_content" maxlength="4000" style="height:350px;" required="required"></textarea>"<p>
		<input type="submit" value="글쓰기" id="btn">	
	</form>
</body>
</html>