<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOBIS</title></head><body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("입력 완료");  
		location.href="Selist.do?pageNum=${pageNum}";	//페이지이동
	</script>
</c:if>
<c:if test="${result == 0 }">  
	<script type="text/javascript">
		alert("입력오류");  
		location.href="SewriteForm.do?s_idx=${s_idx}&pageNum=${pageNum}";	//페이지이동
	</script>
</c:if>
</body>
</html>