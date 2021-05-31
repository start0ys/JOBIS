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
	
	<h2>글수정하기</h2>
	

	<form action="reUpdatePro.do" method="post" name="frm1" id="frm1">
		<input type="hidden" name="c_idx" value="${comment.c_idx }">
		<div>👤${comment.nickname }</div>
		<div><pre><textarea name="c_content" id="c_content" maxlength="2000" style="height:100px;" required="required"
		                 placeholder="댓글을 입력해주세요">${comment.c_content }</textarea></pre></div>
		<div><input type="submit" value="수정"></div>
	 </form>
		


	

	

</body>
</html>