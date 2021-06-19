<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
<link rel="stylesheet" type="text/css" href="headerss.css?ver4">
<link rel="stylesheet" type="text/css" href="menus.css">
<style type="text/css">
	textarea{
		width: 90%;
		resize: none;
	}
	.btn{
		background: black;
		color: white;
		border-radius: 10px;
	}
</style>
</head>

<body>
	
	<h2 style="color:black;">댓글 수정하기</h2>
	
	<div style="color:black; border: 2px solid black;">
		<form action="reUpdatePro.do" method="post" name="frm1" id="frm1">
			<input type="hidden" name="c_idx" value="${comment.c_idx }">
			<div style="margin: 11px 0 0 11px;">👤${comment.nickname }</div>
			<div style="margin: 20px 0 0 20px;"><pre><textarea name="c_content" id="c_content" maxlength="2000" style="height:100px;" required="required"
			                 placeholder="댓글을 입력해주세요">${comment.c_content }</textarea></pre></div>
			<div style="margin: 0  0 11px 11px;"><input style="padding: 5px;" class="btn" type="submit" value="수정"></div>
		 </form>
	</div>


	

	

</body>
</html>