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
			opener.window.location.reload();;
			window.close();
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("수정을 실패했습니다.");
			location.href = 'reUpdate.do?c_idx=${c_idx }';
		</script>
	</c:if>
</body>
</html>