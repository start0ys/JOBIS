<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
<link rel="stylesheet" type="text/css" href="commons.css">
<link rel="stylesheet" type="text/css" href="headerss.css?ver1.1.1">
<link rel="stylesheet" type="text/css" href="menus.css">
<link rel="stylesheet" type="text/css" href="main.css?ver10.1.7">
<style type="text/css">
	a{
		text-decoration: none;
		color:black;
	}
	th{
		border-top: solid 2px #aaaaaa;
    	background-color: #4d6083;
    	color:white;
	}
	tr{
		background-color: #e6efff;
	}
 	.boardCot{
		display: inline-block; 
		width: 80%; 
		white-space: nowrap; 
		overflow: hidden; 
		text-overflow: ellipsis; 
		
	} 
</style>
</head>

<body>
	<div id="wrapper">
		<header>
		
			<!------ 밑의 a태그의 #부분에는 소연님이 메인페이지 만들어주시면 메인페이지.do를 넣어주면됩니다.--- -->
			
		   <a href="main.do"><img id="logo" src="images/main.png" width="240px" height="90"></a>
		
		  
			<nav id="main_menu"></nav>
			
		</header>  
		
		
		 <aside id="left">
		
			<article id="login_box">
			   
						   <div id="testImg">
			  <img src="login-box.png" width="30%" height="25%" alt="테스트이미지" />
		<c:if test="${ empty m_nickname}">
			  <button class="btn1" type="button" onclick="location.href= 'login.do'">로그인</button>
			  <button class="btn2" type="button" onclick="location.href= 'joinform.do'">회원가입</button>
  		</c:if>
  		<c:if test="${not empty m_nickname}">
  			<span style="margin-right: 5px; font-size: 14px; font-weight: bold; color: black;">👤${m_nickname } 님 반갑습니다.</span>
			<input type="button" value="로그아웃" class="btn" onclick = "location.href = 'logout.do'">
			<c:if test="${m_num == 0 }"><span class="menu"><a href="#">관리자페이지</a></span></c:if>
            <c:if test="${m_num > 0 }">
				<input type="button" value="회원관리"onclick="location.href = 'updatePage.do'">
	            <input type="button" value="이력서관리"onclick="location.href = 'ercontent.do'">
	            <input type="button" value="자소서관리"onclick="location.href = 'myse.do'">
				<input type="button" value="작성게시글보기" onclick="location.href = 'myboard.do?search=${m_num}'">
				</c:if>
		 </c:if>
			<div style="position: absolute; left: 50%;">
		    <input type="button" value="면접게시판" onclick="location.href = 'board.do?b_type=0'">
			<input type="button" value="Q&A게시판" onclick="location.href = 'board.do?b_type=1'">
			<input type="button" value="자유게시판" onclick="location.href = 'board.do?b_type=2'">
			</div>
			</div>
			  <aside id="left">
        <h4>기업 바로가기</h4>
        <ul>
            <li><a href="./computer.html" target="iframe1">삼성</a></li>
            <li><a href="./clothing.html" target="iframe1">네이버</a></li>
            <li><a href="./music.html" target="iframe1">카카오</a></li>
            <li><a href="./movie.html" target="iframe1">라인</a></li>
            <li><a href="./computer.html" target="iframe1">쿠팡</a></li>
            <li><a href="./computer.html" target="iframe1">배달의 민족</a></li>
            <li><a href="./computer.html" target="iframe1">당근마켓</a></li>
            <li><a href="./computer.html" target="iframe1">토스</a></li>
        </ul>
    </aside>
			  
	 </article>
	 
    
			
		</div>
</body>
