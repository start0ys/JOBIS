<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("이력서 저장 완료");  
		location.href="list.do";
	</script>
</c:if>
<c:if test="${result == 0 }">  
	<script type="text/javascript">
		alert("이력서 저장 실패");  
		location.href="erukwriteForm.do";
	</script>
</c:if>
</body>
</html>