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
			alert("작성완료");
			location.href = "board.do?b_type=${b_type}";  //해당 게시판으로 이동시켜주기
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("글쓰기에 실패하였습니다.")
			history.back();
		</script>
	</c:if>
</body>
</html>