<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
<link rel="stylesheet" type="text/css" href="commons.css">
<link rel="stylesheet" type="text/css" href="headerss.css?ver4">
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
			    <li class="menu1" id="mymenu"><span class="menu">마이페이지</span></li>
			  
			  </ul>
			  
			  <div id="log">
			  	  <span style="margin-right: 5px; font-size: 14px; font-weight: bold;">👤${m_nickname } 님 반갑습니다.</span>
				  <input type="button" value="로그아웃" class="btn">
			  </div>
			
			</nav>
		</header>  
		<script src="menu.js"></script>
		
		
		<div style="width: 90%; margin: 0 auto; margin-top:30px; color:black; border: 2px solid #4d6083;">
			<c:if test="${b_type==0 }"><h2 class="btn" style="margin:30px; display: inline-block; background-color: #4d6083;">면접 게시판</h2></c:if>
			<c:if test="${b_type==1 }"><h2 class="btn" style="margin:30px; display: inline-block; background-color: #4d6083;">Q&A 게시판</h2></c:if>
			<c:if test="${b_type==2 }"><h2 class="btn" style="margin:30px; display: inline-block; background-color: #4d6083;">자유 게시판</h2></c:if>
			<div style="margin: 0 auto; margin:35px 0 70px 0; text-align: center;">
				
				<c:if test="${b_type == 0 || b_type == 2 }">
					<table style="text-align: center;margin: 0 auto; width: 90%;">
						<tr>
							<c:if test="${m_num == 0}">
								<th>삭제</th>
							</c:if>
							<th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
						</tr>
						<c:forEach var="board" items="${best }">
							<tr>
								<c:if test="${m_num == 0}">
										<td><input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del()"></td>
								</c:if>
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
									<c:if test="${m_num == 0}">
										<td><input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del()"></td>
									</c:if>
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
				</c:if>
				
				<c:if test="${b_type == 1 }">
					<div style="text-align: left;margin: 0 auto; width: 80%;">
						<c:forEach var="board" items="${best }">
							<div style="border: 2px solid #4d6083; border-radius: 25px; padding: 28px;">
								<h3 style="width: 90%; font-weight: bold; font-size: 18px;">
									<img src="images/hot.gif">
									<a href="bview.do?b_idx=${board.b_idx }&pageNum=${currentPage}&b_type=${b_type }">${board.b_title }</a>
								</h3>
								<div class="boardCot">${board.b_content }</div>
								<div>
									<span>👤${board.m_nickname }</span>
									<span style=" font-size: 13px; color: gray;">조회수 ${board.b_count }</span>
									<span style=" font-size: 13px; color: gray;">${board.b_regdate }</span>
								</div>
							</div>
						</c:forEach>
						<c:if test="${totCnt > 0 }">
							<c:forEach var="board" items="${list }">
								<div style="border: 2px solid #4d6083; border-radius: 25px; padding: 28px; margin-top: 10px;">
									<h3 style="width: 90%; font-weight: bold; font-size: 18px;">
										<a href="bview.do?b_idx=${board.b_idx }&pageNum=${currentPage}&b_type=${b_type }">${board.b_title }</a>
									</h3>
									<div class="boardCot">${board.b_content }</div>
									<div>
										<span>👤${board.m_nickname }</span> 
										<span style=" font-size: 13px; color: gray;">조회수 ${board.b_count }</span>
										<span style=" font-size: 13px; color: gray;">${board.b_regdate }</span>
									</div>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${toCnt == 0 }">
							<tr>
								<td colspan="7">데이터가 없습니다</td>
							</tr> 
						</c:if> 
					</div>
				</c:if>
				
				
				<span style="position: absolute; right: 17%;"><input type="button" value="글쓰기" class="btn" onclick="location.href = 'bwrite.do?b_type=${b_type}'"></span>	
				<div style="text-align: center; margin-top: 20px;">
					<c:if test="${startPage > blockSize }">
						<a href="board.do?pageNum=${startPage-blockSize }&b_type=${b_type }&s_type=${s_type }&search=${search }">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${pageNum == i }">
							<a href="board.do?pageNum=${i }&b_type=${b_type }&s_type=${s_type }&search=${search }" style="color: #005dff;">[ <b style="color: red;">${i }</b> ]</a>
						</c:if>
						<c:if test="${pageNum != i }">
							<a href="board.do?pageNum=${i }&b_type=${b_type }&s_type=${s_type }&search=${search }" style="color: #005dff;">[ ${i } ]</a>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCnt }">
						<a href="board.do?pageNum=${startPage+blockSize }&b_type=${b_type }&s_type=${s_type }&search=${search }">[다음]</a>
					</c:if>
				</div>
				<div style="margin-top: 30px;">
					<form action="board.do">
						<select name="s_type">
							<option value="1">제목</option>
							<option value="2">글쓴이</option>
						</select>
						<input type="hidden" name="b_type" value="${b_type }">
						<input type="text" name="search">
						<input type="submit" value="검색" class="btn" style="padding: 3px 5px;">
					</form>
				</div>	
			</div>
			
		</div>
	</div>
</body>
</html>