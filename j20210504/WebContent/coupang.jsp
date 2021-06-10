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
	            			<li><input type="button" value="이력서관리"    onclick="location.href = 'erContent.do'"></li>
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
			
	
				<img src="images/logo_coupang.jpg" width="500" height="200" align=center/>
			<a href="https://rocketyourcareer.kr.coupang.com/?gclid=Cj0KCQjw--GFBhDeARIsACH_kdawf_iOfMxwaEB-UbRUgilHzElYti9Q6QDwht9MSk2h9AvqIVxLkrcaAq1hEALw_wcB">쿠팡 채용사이트 바로가기</a>
			<br>
				<button onclick="back()">돌아가기</button>
				<table border=1 >
					<tr align=center><td colspan="4"><h2>기업정보</h2></td></tr>
					
					<tr align=center >
					<td width="100" height="50"><h2>산업</h2></td>
					<td width="300" height="50">쇼핑몰</td>
					<td width="100" height="50"><h2>사원수</h2></td>
					<td width="300" height="50">6,372명</td>
					</tr>
					<tr  align=center >
					<td width="100" height="50"><h2>기업구분</h2></td>
					<td width="300" height="50">대기업</td>
					<td width="100" height="50"><h2>설립연도</h2></td>
					<td width="300" height="50">2010년</td>
					</tr>
					<tr  align=center >
					<td width="100" height="50"><h2>대표자</h2></td>
					<td width="300" height="50">강한승,박대준</td>
					<td width="100" height="50"><h2>매출액</h2></td>
					<td width="300" height="50">4조 4227억원</td>
					</tr>
					<tr  align=center >
					<td width="100" height="50"><h2>자본금</h2></td>
					<td width="300" height="50">99억원</td>
					<td width="100" height="50"><h2>4대보험</h2></td>
					<td width="300" height="50">국민연금, 건강보험, 고용보험, 산재보험</td>
					</tr>
				</table>

<br>
<br>

		<table border=1 >
			     <tr align=center ><td colspan="4"><h2>문화 & 복지</h2></td></tr>
					     <tr align=center>
					     <td><h2>열린문화</h2></td>
					     <td><h2>휴게공간 & 카페</h2></td>
					     <td><h2>유연근무제</h2></td>
					     <td><h2>해외근무 기회</h2></td>
					     </tr>
					<tr align=center >
						<td width="200" height="100">
						쿠팡의 업무공간은 파티션과 위쿠팡의 업무공간은 파티션과 위계질서, 
						직책 대신 열린 공간, 창의력 그리고 시너지로 채워져 있습니다.
						</td>
						<td width="200" height="100">
						자유롭게 일하거나 협업할 수 있는 공간과, 커피와 차,
						 간식을 즐길 수 있는 카페테리아가 있습니다.
						</td>
						<td width="200" height="100">
						근무시간을 유연하게 조정할 수 있으며 주 1회 재택근무가 가능합니다.
						</td>
						<td width="200" height="100">
						쿠팡의 한국, 중국, 미국 오피스 중 어느 곳에서든 
						근무할 수 있는 기회가 열려 있습니다.
						</td>
					</tr>
						 <tr align=center>
					     <td><h2>사내 이벤트</h2></td>
					     <td><h2>교육프로그램</h2></td>
					     <td><h2>건강보험</h2></td>
					     <td><h2>휴가 제도</h2></td>
					     </tr>
				<tr align=center >
							<td width="200" height="100">
							열심히 일하고 마음껏 즐기세요. 
							사내 이벤트에서 게임과 음식을 통해 서로 친해질 수 있습니다.
							</td>
							<td width="200" height="100">
							외국어 및 기타 유용한 업무 스킬에 관한 강좌를 수강할 수 있습니다.
							</td>
							<td width="200" height="100">
							임직원 및 직계 가족에 대한 임직원 단체상해보험이 제공됩니다.
							</td>
							<td width="200" height="100">
							경조사와 가족모임 등에 가족과 시간을 보낼 수 있도록 유급휴가를 지원합니다.
							</td>
				</tr>
	</table>
	
	
	
	
	
	
	
</table>
			</div>	
		</div>
	</div>
</body>
</html>