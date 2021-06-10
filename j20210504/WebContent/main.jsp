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
<link rel="stylesheet" type="text/css" href="main.css?ver8.1.1">

</head>

<body>
	<div id="wrapper">
		<header>
		
			<!------ 밑의 a태그의 #부분에는 소연님이 메인페이지 만들어주시면 메인페이지.do를 넣어주면됩니다.--- -->
			
		   <a href="main.do"><img id="logo" src="images/main.png" width="200px" height="90"></a>
		
		  
			<nav id="main_menu"></nav>
			
		</header>  
		
		
						  
			  
			  <aside>
		       <article id="login_box">
   
		<c:if test="${ empty m_nickname}">
		
               <div><button class="btn1" type="button" onclick="location.href= 'login.do'">로그인</button></div>
			  <button class="btn2" type="button" onclick="location.href= 'joinform.do'">회원가입</button>
  		
		 </c:if>
  		
  		<c:if test="${not empty m_nickname}">
  					  
			 <div style="margin-top:24px; text-align:center; color:black; margin-right: 5px; font-size: 13px; font-weight: bold; ;">👤${m_nickname } 님 반갑습니다.</div>
			 <div><button class="btn7" type="button" onclick = "location.href = 'logout.do'">로그아웃</button></div>
			
			<c:if test="${m_num == 0 }">
			
			<div id="sys"><a href="#" style="color: white;">관리자페이지</a></div>
			</c:if>
            <c:if test="${m_num > 0 }">
           
				<button class="btn3" type="button" onclick="location.href = 'updatePage.do'">회원관리</button>
				<button class="btn4" type="button" onclick="location.href = 'myboard.do?search=${m_num}'">작성게시글보기</button>
				<button class="btn5" type="button" onclick="location.href = 'myse.do'">자소서관리</button>
	            <button class="btn6" type="button" onclick="location.href = 'erContent.do'">이력서관리</button>
	     
			 </c:if>
		 </c:if>
		 
  </article>
  <br>
  <br>
  <article id="sub_menu">
    <h4 style="background-color:#5f6caf;">기업 바로가기</h4>
                 <ul>
            <li><a href="mycom.do?comType=1" >삼성</a></li>
            <li><a href="mycom.do?comType=2" >쿠팡</a></li>
            <li><a href="mycom.do?comType=3" >배달의 민족</a></li>
            <li><a href="mycom.do?comType=4" >라인</a></li>
            <li><a href="mycom.do?comType=5" >카카오</a></li>
            <li><a href="mycom.do?comType=6" >토스</a></li>
            <li><a href="mycom.do?comType=7" >네이버</a></li>
            <li><a href="mycom.do?comType=8" >당근마켓</a></li>
        </ul>
  </article>
  </aside>
				
		 <script src="menu.js"></script>
		
		
	
		
		<div style="width: 80%; margin: 0 auto; margin-top:30px; margin-left:250px; color:black; border: 2px solid #4d6083;">
			<div style="margin: 0 auto; margin:35px 0 70px 0; ">
				<c:if test="${not empty m_nickname}"><div><h1 style="color: #5f6caf;">게시판 Best3</h1></div></c:if>
				<a href="board.do?b_type=0"><h2 class="btn" style="margin:30px; display: inline-block; background-color: #4d6083;">면접게시판 바로가기</h2></a>
				<c:if test="${not empty m_nickname}">
					<table style="text-align: center;margin: 0 auto; width: 90%;">
						<tr>
							<c:if test="${m_num == 0}">
								<th>삭제</th>
							</c:if>
							<th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
						</tr>
						<c:forEach var="board" items="${best0 }">
							<tr>
								<c:if test="${m_num == 0}">
										<td><input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del(${board.b_idx})"></td>
								</c:if>
								<td style="width: 55%; font-weight: bold; font-size: 18px;">
									<img src="images/hot.gif">
									<a href="bview.do?b_idx=${board.b_idx }&pageNum=1&b_type=0">${board.b_title }</a>
								</td>
								<td style="width: 15%;">👤${board.m_nickname }</td>
								<td style="width: 15%;">${board.b_regdate }</td>
								<td style="width: 15%;">${board.b_count }</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				
				<a href="board.do?b_type=1"><h2 class="btn" style="margin:30px; display: inline-block; background-color: #4d6083;">Q&A게시판 바로가기</h2></a>
				
					<c:if test="${not empty m_nickname}">
					<table style="text-align: center;margin: 0 auto; width: 90%;">
						<tr>
							<c:if test="${m_num == 1}">
								<th>삭제</th>
							</c:if>
							<th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
						</tr>
						<c:forEach var="board" items="${best0 }">
							<tr>
								<c:if test="${m_num == 0}">
										<td><input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del(${board.b_idx})"></td>
								</c:if>
								<td style="width: 55%; font-weight: bold; font-size: 18px;">
									<img src="images/hot.gif">
									<a href="bview.do?b_idx=${board.b_idx }&pageNum=1&b_type=1">${board.b_title }</a>
								</td>
								<td style="width: 15%;">👤${board.m_nickname }</td>
								<td style="width: 15%;">${board.b_regdate }</td>
								<td style="width: 15%;">${board.b_count }</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				
				<a href="board.do?b_type=2"><h2 class="btn" style="margin:30px; display: inline-block; background-color: #4d6083;">자유게시판 바로가기</h2></a>
				
					<c:if test="${not empty m_nickname}">
					<table style="text-align: center;margin: 0 auto; width: 90%;">
						<tr>
							<c:if test="${m_num == 0}">
								<th>삭제</th>
							</c:if>
							<th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
						</tr>
						<c:forEach var="board" items="${best2 }">
							<tr>
								<c:if test="${m_num == 0}">
										<td><input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del(${board.b_idx})"></td>
								</c:if>
								<td style="width: 55%; font-weight: bold; font-size: 18px;">
									<img src="images/hot.gif">
									<a href="bview.do?b_idx=${board.b_idx }&pageNum=1&b_type=2">${board.b_title }</a>
								</td>
								<td style="width: 15%;">👤${board.m_nickname }</td>
								<td style="width: 15%;">${board.b_regdate }</td>
								<td style="width: 15%;">${board.b_count }</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				    
			</div>	
		</div>
				<div style="width: 80%; margin: 0 auto; margin-top:30px; margin-left:250px; color:black; border: 2px solid #4d6083;">
			<div style="margin: 0 auto; margin:35px 0 70px 0; text-align: center;">
				
		   
		<p>윤주님 일정</p>
		<p>윤주님 일정</p>
		<p>윤주님 일정</p>
		<p>윤주님 일정</p>
		<p>윤주님 일정</p>
		<p>윤주님 일정</p>
		<p>윤주님 일정</p>
		
			</div>	
		</div>
		</div>			  
			  
</body>
	 
    
	

