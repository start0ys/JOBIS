<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">
<title>JOBIS</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="main2.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<style>
#main {margin-top: 10px;}
#About, #Home {float: left;}
#Login {float: right;} 
#SignUp {float: right;}
.img-size {
  position: relative;
  width: 100%;
  height: 750px;
  background-color: rgb(242,242,242);
}
.img-center {
  text-align: center;
  position: absolute;
  top: 0;
  right: -200%;
  bottom: 0;
  left: -200%;
}
.img {
  max-width: 100%;
  max-height: 100%;
}
#license{
	color: #999999; 
	text-decoration: none;
}
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
<div class="img-size"><div class="img-center"><img src="images/main5.png" alt="main" id="main"></div></div>

<footer id="myFooter">
  <div class="w3-container w3-theme-l1" style="font-size: 6px;">
    <p>Design Sourced by<a href="https://www.w3schools.com/w3css/w3css_templates.asp" target="_blank" id="license">w3.css</a>/
    <a href="https://kor.pngtree.com/so/환대" target="_blank" id="license">kor.pngtree.com</a></p>
  </div>
</footer>
</body>
</html>
