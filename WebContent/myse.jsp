<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
<link rel="stylesheet" type="text/css" href="commons.css">
<link rel="stylesheet" type="text/css" href="headerss.css?ver4">
<link rel="stylesheet" type="text/css" href="menus.css">
</head>
<body>
	<div id="wrapper">
		<header>
		
			<!------ 밑의 a태그의 #부분에는 소연님이 메인페이지 만들어주시면 메인페이지.do를 넣어주면됩니다.--- -->
			
		  <a href="main.do"><img id="logo" src="images/main.png" width="200px" height="90"></a>
		
		
			<nav id="main_menu">
			  <ul>
			    <li class="menu1">
			    	<span class="menu" style="margin-left: 25px;">커뮤니티</span>
		       		<ul class="subMenu">
			            <li><input type="button" value="면접게시판" onclick="location.href = 'board.do?b_type=0'"></li>
			            <li><input type="button" value="Q&A게시판" onclick="location.href = 'board.do?b_type=1'"></li>
			            <li><input type="button" value="자유게시판" onclick="location.href = 'board.do?b_type=2'"></li>
	
		        	</ul>
			    </li>
			    <li class="menu1">
			    	<span class="menu">기업 바로가기</span>
		       		<ul class="subMenu">
			            <li><input type="button" value="삼성" onclick="location.href = 'mycom.do?comType=1'"></li>
			            <li><input type="button" value="쿠팡" onclick="location.href = 'mycom.do?comType=2'"></li>
			            <li><input type="button" value="배달의 민족" onclick="location.href = 'mycom.do?comType=3'"></li>
			            <li><input type="button" value="라인" onclick="location.href = 'mycom.do?comType=4'"></li>
			            <li><input type="button" value="카카오" onclick="location.href = 'mycom.do?comType=5'"></li>
			            <li><input type="button" value="토스" onclick="location.href = 'mycom.do?comType=6'"></li>
			            <li><input type="button" value="네이버" onclick="location.href = 'mycom.do?comType=7'"></li>
			            <li><input type="button" value="당근마켓" onclick="location.href = 'mycom.do?comType=8'"></li>
		        	</ul>
			    </li>
			    <li class="menu1">
			    	<c:if test="${m_num == 0 }"><span class="menu"><a href="#">관리자페이지</a></span></c:if>
			    	<c:if test="${m_num > 0 }">
				    	<span class="menu">마이페이지</span>
			       		<ul class="subMenu">
			       			<li><input type="button" value="회원관리"      onclick="location.href = 'updatePage.do'"></li>
	            			<li><input type="button" value="이력서관리"    onclick="location.href = 'ercontent.do'"></li>
	            			<li><input type="button" value="자소서관리"    onclick="location.href = 'myse.do'"></li>
							<li><input type="button" value="작성게시글보기" onclick="location.href = 'myboard.do?search=${m_num}'"></li>
			        	</ul>
			    	</c:if>
			    </li>
			  
			  </ul>
			  
			  <div id="log">
			  	  <span style="margin-right: 5px; font-size: 14px; font-weight: bold;">👤${m_nickname } 님 반갑습니다.</span>
				  <input type="button" value="로그아웃" class="btn" onclick = "location.href = 'logout.do'">
			  </div>
			
			</nav>
		</header>  
		<script src="menu.js"></script>
		
		
	
		
		<div style="width: 90%; margin: 0 auto; margin-top:30px; color:black; border: 2px solid #4d6083;">
			<div style="margin: 0 auto; margin:35px 0 70px 0; text-align: center;">
				<h2 style="text-align: center;">나의 자기소개서</h2>
	<table style="text-align: center;margin: 0 auto; width: 90%;"> 
		<tr align="center">
			<th style="width: 55%; font-weight: bold; font-size: 18px;background-color:#4d6083;">회사이름</th>
			<th style="width: 15%;background-color:#4d6083;">작성자</th>
			<th style="width: 15%;background-color:#4d6083;">작성일</th>
		</tr>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="Seboard" items="${list }">
				<tr>
<%-- 					<td>${startNum }</td> --%>
					<td style="width: 55%; font-weight: bold; font-size: 18px;background-color: #cdddf9;">
						 <a href='Secontent.do?s_idx=${Seboard.s_idx}&pageNum=${currentPage}'>
							${Seboard.s_companyname}</a>
					</td>
					<td style="width: 15%;background-color: #cdddf9;">${Seboard.m_nickname}</td>
					<td style="width: 15%;background-color: #cdddf9;">${Seboard.s_regdate}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
		<c:if test="${totCnt == 0 }">
			<tr>
				<td colspan=7>데이터가 없네</td>
			</tr>
		</c:if>
	</table>
	
	<div style="text-align: center;">
<%-- 		<c:if test="${startPage > blockSize }"> --%>
<%-- 			<a href='Selist.do?pageNum=${startPage-blockSize}'>[이전]</a> --%>
<%-- 		</c:if> --%>
<%-- 		<c:forEach var="i" begin="${startPage}" end="${endPage}"> --%>
<%-- 			<a href='Selist.do?pageNum=${i}'>[${i}]</a> --%>
<%-- 		</c:forEach> --%>
<%-- 		<c:if test="${endPage < pageCnt }"> --%>
<%-- 			<a href='Selist.do?pageNum=${startPage+blockSize}'>[다음]</a> --%>
<%-- 		</c:if> --%>
		<c:if test="${startPage > blockSize }">
			<a href='myse.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='myse.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='myse.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>
	<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<td><button type="button" class="btn" onclick="location.href='SewriteForm.do'">글쓰기</button></td>
				<td><button type="button" class="btn" onclick="location.href='Selist.do'">목록</button></td>
			</tr>
	</table>		
			</div>	
		</div>
	</div>
</body>
</html>