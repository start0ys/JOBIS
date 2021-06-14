<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>JOBIS</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="main2.css">
<style>
#main {margin-top: 40px;}
#About, #Home {float: left;}
#Login {float: right;} 
#SignUp {float: right;}
</style>
<body>
<!-- Navigation (Stays on Top) -->
<div class="w3-top w3-bar w3-black" id="navTop">
<c:if test="${empty m_nickname}">
<div id="Home"><a href="#home" class="w3-bar-item w3-button">Home</a></div>
</c:if>
<c:if test="${not empty m_nickname}">
	<div id="About"><a href="main.do" class="w3-bar-item w3-button">Main</a></div>
</c:if>
<c:if test="${empty m_nickname}">
	<div id="SignUp"><a href="joinform.do" class="w3-bar-item w3-button" >Sign Up</a></div>
	<div id="Login"><a href="login.do" class="w3-bar-item w3-button" >Login</a></div>
</c:if>
<c:if test="${not empty m_nickname}">
	<div id="SignUp"><a href="logout.do" class="w3-bar-item w3-button" >LogOut</a></div>
	<div id="Login"><span class="w3-bar-item w3-button" ><small>👤${m_nickname } 님 반갑습니다.</small></span></div>
</c:if>
</div>
<img src="images/main5.png" alt="main" style="width:100%; height: 100vh" id="main">

<div class="w3-container w3-center w3-teal">
  <h1>This is a Heading</h1>
  <p>This is a paragraph.</p>
  <p>This is another paragraph.</p>
</div>

</body>
</html>
