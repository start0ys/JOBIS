<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일정등록</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
body {
	font-size:9pt;
	font-family:맑은 고딕;
	color:#333333;
}
table {
	width:380px;
	border-collapse:collapse;  /* 셀간격을 없앰 */
}
th,td {
	border:1px solid #cccccc;
	padding:5px; 
}
caption {
	font-size:14pt;
	font-weight:bold;
	margin-bottom:5px;
}
.div1 {
	width:380px;
	text-align:center;
	margin-top:10px;
}

</style>

<body>

<form name="frm" method="post" action="cwrite.do">
<table>
	<caption>일정등록</caption>
	<tr>
		<th width="20%">날짜</th>
		<td width="80%"><input type="date" name="cal_date" id="pdate" style="width:98%" required="required"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="cal_title" style="width:98%" required="required"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="cal_contents" style="width:98%;height:150px;"></textarea></td>
	</tr>
	<tr>
		<th>구분</th>
		<c:choose>
		<c:when test="${m_num == 0 }">
			<td><input type="radio" name="cal_bgcolor" value="#3C3530" required="required"><label><i class="fa fa-circle fa-2x" style="color:#3C3530;"></i></label>
			</td></c:when> 
		<c:otherwise>
			<td>
				<input type="radio" name="cal_bgcolor" value="#F16B6F" required="required"><label><i class="fa fa-circle fa-2x" style="color:#F16B6F;"></i></label>
				<input type="radio" name="cal_bgcolor" value="#AACD6E"><label><i class="fa fa-circle fa-2x" style="color:#AACD6E;"></i></label>
				<input type="radio" name="cal_bgcolor" value="#FBFFB9"><label><i class="fa fa-circle fa-2x" style="color:#FBFFB9;"></i></label>
				<input type="radio" name="cal_bgcolor" value="#AAABD3"><label><i class="fa fa-circle fa-2x" style="color:#AAABD3;"></i></label>
			</td>
		</c:otherwise>
		</c:choose>
	</tr>
	
</table>
<div class="div1">
	<button type="submit">저장</button>
	<button type="button" onclick="self.close();">닫기</button>
</div>
</form>

</body>
</html>


