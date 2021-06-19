<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
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
a {color: black; text-decoration: none;}
a:hover { color: red;}

</style>
<script type="text/javascript">
function cDelete(c) {
	if(confirm("정말 삭제하시겠습니까?")) {
		location.href="cdelete.do?cal_num="+c;
	}else {
		return;
	}
}
</script>
</head>
<body>
<form name="frm">
<table>
	<caption>${curYear}년 ${curMonth}월 ${curDay}일</caption>
	<c:forEach var="listindex" items="${dlist}">
	<fmt:parseNumber value ='${listindex.cal_num}' pattern = "0000" var = "cal_num"/>
		<c:if test="${listindex.cal_cate == 1 }">
			<tr>
				<c:if test="${m_num == 0}">
					<td width="5%">
						<a href="javascript:cDelete(${cal_num})"><i class="fa fa-trash fa-2x" aria-hidden="true"></i></a>
					</td>
				</c:if>
				<c:if test="${m_num > 0}">
					<td width="5%">
					</td>
				</c:if>
				<td><i class="fa fa-circle" style="color:${listindex.cal_bgcolor};"></i> ${listindex.cal_title}</td>
			</tr> 
			<tr><td></td><td> ${listindex.cal_contents}</td></tr>
		</c:if>
		<c:if test="${listindex.cal_cate == 0 }">
			<tr>
				<td width="5%"><a href="javascript:cDelete(${cal_num})"><i class="fa fa-trash fa-2x" aria-hidden="true"></i></a></td>
				<td><i class="fa fa-circle" style="color:${listindex.cal_bgcolor};"></i> ${listindex.cal_title}</td>
			</tr> 
			<tr><td></td><td> ${listindex.cal_contents}</td></tr>
		</c:if>  
	</c:forEach>	
</table>
<div class="div1">
	<button type="button" onclick="self.close();">닫기</button>
</div>
</form>
</body>
</html>