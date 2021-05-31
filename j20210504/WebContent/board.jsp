<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
<link rel="stylesheet" type="text/css" href="commons.css">
<link rel="stylesheet" type="text/css" href="header.css?ver4">
<link rel="stylesheet" type="text/css" href="menus.css">
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
</style>
</head>
<body>
	<header>
	
		<!------ 밑의 a태그의 #부분에는 소연님이 메인페이지 만들어주시면 메인페이지.do를 넣어주면됩니다.--- -->
		
	   <a href="#"><img id="logo" src="images/main.png" width="240px" height="90"></a>
	
	
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
		            <li><input type="button" value="삼성"></li>
		            <li><input type="button" value="쿠팡"></li>
		            <li><input type="button" value="배달의 민족"></li>
		            <li><input type="button" value="라인"></li>
		            <li><input type="button" value="카카오"></li>
		            <li><input type="button" value="토스"></li>
		            <li><input type="button" value="네이버"></li>
		            <li><input type="button" value="당근마켓"></li>
	        	</ul>
		    </li>
		    <li class="menu1"><a style="color: white;">마이페이지</a></li>
		  
		  </ul>
		  
		  <div id="log">
		  	  <span style="margin-right: 5px; font-size: 14px; font-weight: bold;">👤${m_nickname } 님 반갑습니다.</span>
			  <input type="button" value="로그아웃" class="btn">
		  </div>
		
		</nav>
	</header>  
	<script src="menu.js"></script>
	
	
	<div style="width: 90%; margin: 0 auto; margin-top:30px; color:black; border: 2px solid #4d6083;">
		<c:if test="${b_type==0 }"><h2 class="btn" style="margin:30px; display: inline-block;">면접 게시판</h2></c:if>
		<c:if test="${b_type==1 }"><h2>Q&A 게시판</h2></c:if>
		<c:if test="${b_type==2 }"><h2>자유 게시판</h2></c:if>
		<div style="margin: 0 auto; margin:35px 0 70px 0; text-align: center;">
	
			<table style="text-align: center;margin: 0 auto; width: 90%; ;">
				<tr><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
				<c:forEach var="board" items="${best }">
					<tr>
						<td style="width: 55%; font-weight: bold; font-size: 18px;background-color: #cdddf9;">
							<img src="images/hot.gif">
							<a href="bview.do?b_idx=${board.b_idx }&pageNum=${currentPage}&b_type=${b_type }">${board.b_title }</a>
						</td>
						<td style="width: 15%;background-color: #cdddf9;">👤${board.m_nickname }</td>
						<td style="width: 15%;background-color: #cdddf9;">${board.b_regdate }</td>
						<td style="width: 15%;background-color: #cdddf9;">${board.b_count }</td>
					</tr>
				</c:forEach>
				<c:if test="${totCnt > 0 }">
					<c:forEach var="board" items="${list }">
						<tr>
							<td style="width: 55%; font-weight: bold; font-size: 18px;">
								<a href="bview.do?b_idx=${board.b_idx }&pageNum=${currentPage}&b_type=${b_type }">${board.b_title }</a>
							</td>
							<td style="width: 15%;">👤${board.m_nickname }</td>
							<td style="width: 15%;">${board.b_regdate }</td>
							<td style="width: 15%;">${board.b_count }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${toCnt == 0 }">
					<tr>
						<td colspan="7">데이터가 없습니다</td>
					</tr>
				</c:if>
		
			</table>
			<div style="text-align: center; margin-top: 20px;">
				<c:if test="${startPage > blockSize }">
					<a href="board.do?pageNum=${startPage-blockSize }&b_type=${b_type }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${pageNum == i }">
						<a href="board.do?pageNum=${i }&b_type=${b_type }" style="color: red;">[${i }]</a>
					</c:if>
					<c:if test="${pageNum != i }">
						<a href="board.do?pageNum=${i }&b_type=${b_type }">[${i }]</a>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
					<a href="board.do?pageNum=${startPage+blockSize }&b_type=${b_type }">[다음]</a>
				</c:if>
			</div>
			<div style="margin-top: 30px;">
				<input type="button" value="글쓰기" class="btn" onclick="location.href = 'bwrite.do?b_type=${b_type}'">
			</div>	
		</div>
		
	</div>
</body>
</html>