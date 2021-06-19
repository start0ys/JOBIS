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
	<c:if test="${result == 1 }">
		<script type="text/javascript">
			alert("활동회원으로 변경했습니다.");
			location.href = 'aduserlist.do';
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("오류");
			history.go(-1);
		</script>
	</c:if>
</body>
</html>