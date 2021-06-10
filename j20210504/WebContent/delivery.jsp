<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>JOBIS</title>
<link rel="stylesheet" type="text/css" href="commons.css?ver2">
<link rel="stylesheet" type="text/css" href="headerss.css?ver4">
<link rel="stylesheet" type="text/css" href="menus.css?ver2">
<style > 
table{
margin-left:auto;

margin-right:auto;
border-collapse:collapse




}</style>
</head>
<body>
<c:if test="${ empty m_nickname}">
	<script type="text/javascript">
		alert("기업바로 가기는 로그인 후 이용할수있습니다.");
		history.go(-1);
	</script>
</c:if>
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
			
	
				<img src="images/delivery.png" width="500" height="200" align=center/>
			<table border=1>
			<tr>
			<td width="100" height="50"  align=center >위치</td>
			<td width="300" height="50">서울 송파구 위례성대로 2 (방이동) 우아한형제들</td>
			<td width="400" height="50" align=center>
			<a href="https://www.woowahan.com/">우아한 형제들 채용사이트 바로가기</a>
			</td></tr></table>
				<br><br>
				<table border=1 >
					<tr c><td colspan="4"><h2>기업정보</h2></td></tr>
					
					<tr align=center >
					<td width="100" height="50"><h2>산업</h2></td>
					<td width="300" height="50">모바일,APP</td>
					<td width="100" height="50"><h2>사원수</h2></td>
					<td width="300" height="50">1050명</td>
					</tr>
					<tr  align=center >
					<td width="100" height="50"><h2>기업구분</h2></td>
					<td width="300" height="50">중소기업</td>
					<td width="100" height="50"><h2>설립연도</h2></td>
					<td width="300" height="50">2011년</td>
					</tr>
					<tr  align=center >
					<td width="100" height="50"><h2>대표자</h2></td>
					<td width="300" height="50">김봉진,김범준</td>
					<td width="100" height="50"><h2>매출액</h2></td>
					<td width="300" height="50">5611억3천만원</td>
					</tr>
					<tr  align=center >
					<td width="100" height="50"><h2>자본금</h2></td>
					<td width="300" height="50">1억 8000만원</td>
					<td width="100" height="50"><h2>4대보험</h2></td>
					<td width="300" height="50">국민연금, 건강보험, 고용보험, 산재보험</td>
					</tr>
				</table>

<br>
<br>

		<table border=1 >
			     <tr align=center ><td colspan="4"><h2>문화 & 복지</h2></td></tr>
					   
					<tr align=center >
						<td width="200" height="100">
						<h2>4.5일 근무제</h2>
						</td>
						<td width="200" height="100">
						<h2>개인 노트북 지원</h2>
						</td>
						<td width="200" height="100">
						<h2>도서비 무한지원</h2>
						</td>
						<td width="200" height="100">
						<h2>단체 상해보험지원</h2>
						</td>
					</tr>
					<tr>
						<td width="200" height="100">
						<h2>우수사원 포상제도</h2>
						</td>
						<td width="200" height="100">
						<h2>각종 경조사 지원</h2>
						</td>
						<td width="200" height="100">
						<h2>우아한휴가/휴무제도</h2>
						</td>
						<td width="200" height="100">
						<h2>설/추석 명절선물 지급</h2>
						</td>
					</tr>
						 
	</table>
	
	
	
	
	
	
	
</table>
			</div>	
		</div>
	</div>
</body>
</html>