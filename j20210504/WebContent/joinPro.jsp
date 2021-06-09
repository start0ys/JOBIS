<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
</head>
<body>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("회원가입이 완료되었습니다.");
		location.href="main.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("오류가 발생하였습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>