<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result1 > 0 or result2 > 0 or result3 > 0 or result4 > 0 or result5 > 0 }">
	<script type="text/javascript">
		alert("이력서 수정 완료");
		location.href="erContent.do";
	</script>
</c:if>
<c:if test="${result1 == 0 and result2 == 0 and result3 == 0 and result4 == 0 and result5 == 0}">
	<script type="text/javascript">
		alert("이력서 수정 실패");
		location.href="erUpdateForm.do";
	</script>
</c:if>
</body>
</html>