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
<script type="text/javascript">
	function del(b_idx) {
		const del =  confirm("해당 게시글을 삭제하시겠습니까?");
		if(del){
			location.href='bdelete.do?b_idx='+b_idx+'&pageNum=${pageNum }';
		}
	}
</script>
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
			<h2 class="btn" style="margin:30px; display: inline-block; background-color: #4d6083;">작성한 게시글</h2>
			<div style="margin: 0 auto; margin:35px 0 70px 0; text-align: center;">
				
				
					<table style="text-align: center;margin: 0 auto; width: 90%;">
						<tr>
							
							<th>게시판</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th><th>삭제</th>
						</tr>
						
						<c:if test="${totCnt > 0 }">
							<c:forEach var="board" items="${list }">
								<tr>
									<c:if test="${board.b_type == 0 }">
										<td style="width: 15%;">면접게시판</td>
									</c:if>
									<c:if test="${board.b_type == 1 }">
										<td style="width: 15%;">Q&A게시판</td>
									</c:if>
									<c:if test="${board.b_type == 2 }">
										<td style="width: 15%;">자유게시판</td>
									</c:if>
									
									<td style="width: 40%; font-weight: bold; font-size: 18px;">
										<a href="bview.do?b_idx=${board.b_idx }&pageNum=${currentPage}&b_type=${board.b_type }">${board.b_title }</a>
									</td>
									<td style="width: 15%;">👤${board.m_nickname }</td>
									<td style="width: 10%;">${board.b_regdate }</td>
									<td style="width: 10%;">${board.b_count }</td>
									<td style="widows: 5%;"><input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del(${board.b_idx})"></td>
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
						<a href="myboard.do?pageNum=${startPage-blockSize }&search=${m_num }">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:if test="${pageNum == i }">
							<a href="myboard.do?pageNum=${i }&search=${m_num }" style="color: #005dff;">[ <b style="color: red;">${i }</b> ]</a>
						</c:if>
						<c:if test="${pageNum != i }">
							<a href="myboard.do?pageNum=${i }&search=${m_num }" style="color: #005dff;">[ ${i } ]</a>
						</c:if>
					</c:forEach>
					<c:if test="${endPage < pageCnt }">
						<a href="myboard.do?pageNum=${startPage+blockSize }&search=${m_num }">[다음]</a>
					</c:if>
				</div>
			
			</div>
			
		</div>
	</div>
</body>
</html>