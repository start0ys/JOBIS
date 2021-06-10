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
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			location.href="bview.do?b_idx=${b_idx }&pageNum=${pageNum}&b_type=${b_type}";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("댓글 등록 실패");
			history.back();
		</script>
	</c:if>
</body>
</html>