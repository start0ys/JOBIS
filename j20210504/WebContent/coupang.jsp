<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html lang="en">
<title>JOBIS</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
.w3-sidebar {
  z-index: 3;
  width: 250px;
  top: 43px;
  bottom: 0;
  height: inherit;
}
#Community {float: right;}
#Company {float: right;}
#down {float: right;}



table.type04 {
  border-collapse: separate;
  border-spacing: 1px;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin: 20px 10px;
  text-align:center; 
}
table.type04 th {
  width: 150px;
  padding: 10px;
  border-bottom: 1px solid #ccc;
  background: #efefef;
  font-size: 20px;

}

table.type04 td {
  width: 425px;
  padding: 10px;
  border-bottom: 1px solid #ccc;
  font-size: 20px;
  align:center; 
}
table.type05 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin: 20px 10px;
}
table.type05 th {
  width: 150px;
  padding: 10px;
  border-bottom: 1px solid #ccc;
  background: #efefef;
  font-size: 20px;
}

table.type05 td {
  width: 350px;
  padding: 10px;
  border-bottom: 1px solid #ccc;
    font-size: 20px;
}

table.type06 {
  border-collapse: separate;
  border-spacing: 1px;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  margin: 20px 10px;
    font-size: 20px;
}
table.type06 th {
  width: 240px;
  padding: 10px;
  font-weight: bold;
  border-bottom: 1px solid #ccc;
  background: #efefef;
    font-size: 20px;
}

table.type06 td {
  width: 240px;
  padding: 10px;
  border-bottom: 1px solid #ccc;
    font-size: 20px;
}
</style>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-theme w3-top w3-left-align w3-large">
  <div><a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a></div>
  <div><a href="index.do" class="w3-bar-item w3-button w3-theme-l1">JOBIS</a></div>
  <c:if test="${not empty m_nickname}">
    <div id="Community"><a href="logout.do" class="w3-bar-item w3-button w3-hide-small w3-hover-white">LogOut</a></div>
 	<div id="Company"><span class="w3-bar-item w3-button w3-hide-small w3-hover-white"><small>👤${m_nickname } 님 반갑습니다.</small></span></div>
  </c:if>  
  </div>
</div>

<!-- Sidebar -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
    <i class="fa fa-remove"></i>
  </a>
  <c:if test="${m_num == 0 }">
  	<h4 class="w3-bar-item"><b>Administrator Page</b></h4>
	<a class="w3-bar-item w3-button w3-hover-black" href="aduserlist.do">관리자페이지</a>
	<a class="w3-bar-item w3-button w3-hover-black" href="main.do">일정관리</a>
  </c:if>
  <c:if test="${m_num > 0 }">
	  <h4 class="w3-bar-item"><b>My Page</b></h4>
	  <a class="w3-bar-item w3-button w3-hover-black" href="main.do">일정관리</a>
	  <a class="w3-bar-item w3-button w3-hover-black" href="erContent.do">이력서관리</a>
	  <a onclick="listFunc1()" href="javascript:void(0)" class="w3-bar-item w3-button w3-hover-black">자기소개서 <i class="fa fa-caret-down" id="down"></i>
	</a>
	<div id="list1" class="w3-bar-block w3-hide w3-padding-large w3-medium">
	  <a href="SewriteForm.do" class="w3-bar-item w3-button w3-light-grey">자기소개서 작성</a>
	  <a href="myse.do" class="w3-bar-item w3-button">자기소개서 관리</a>
	</div>  
	  <a onclick="listFunc2()" href="javascript:void(0)" class="w3-bar-item w3-button w3-hover-black">내 정보관리 <i class="fa fa-caret-down" id="down"></i>
	</a>
	<div id="list2" class="w3-bar-block w3-hide w3-padding-large w3-medium">
	  <a href="updatePage.do" class="w3-bar-item w3-button w3-light-grey">회원관리</a>
	  <a href="myboard.do?search=${m_num}" class="w3-bar-item w3-button">작성한 게시글 보기</a>
	</div>  
</c:if>
 <h4 class="w3-bar-item"><b>Community</b></h4> 
 <a class="w3-bar-item w3-button w3-hover-black" href="board.do?b_type=0">면접게시판</a>
 <a class="w3-bar-item w3-button w3-hover-black" href="board.do?b_type=1">Q&A게시판</a>
 <a class="w3-bar-item w3-button w3-hover-black" href="board.do?b_type=2">자유게시판</a>
 <h4 class="w3-bar-item"><b>Company Info</b></h4>
<a onclick="listFunc3()" href="javascript:void(0)" class="w3-bar-item w3-button w3-hover-black">기업 바로가기<i class="fa fa-caret-down" id="down"></i></a>
 <div id="list3" class="w3-bar-block w3-hide w3-padding-large w3-medium">
  <a href="mycom.do?comType=1" class="w3-bar-item w3-button w3-light-grey">삼성</a>
  <a href="mycom.do?comType=2" class="w3-bar-item w3-button w3-light-grey">쿠팡</a>
  <a href="mycom.do?comType=3" class="w3-bar-item w3-button w3-light-grey">배달의 민족</a>
  <a href="mycom.do?comType=4" class="w3-bar-item w3-button w3-light-grey">라인</a>
  <a href="mycom.do?comType=5" class="w3-bar-item w3-button w3-light-grey">카카오</a>
  <a href="mycom.do?comType=6" class="w3-bar-item w3-button w3-light-grey">토스</a>
  <a href="mycom.do?comType=7" class="w3-bar-item w3-button w3-light-grey">네이버</a>
  <a href="mycom.do?comType=8" class="w3-bar-item w3-button w3-light-grey">당근마켓</a>
</div> 
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:250px;"> 

  <div class="w3-row w3-padding-64">
    <div class="w3-twothird w3-container" style="margin-left: 44px; margin-top: 18px; width: 78%;">
     
      		
			
				<img src="images/logo_coupang.jpg" width="500" height="200" align=center/>
		
			<br>
				<table  class="type04">
			<tr>
			<th>위치</th>
			<td >서울특별시 송파구 송파대로 570 18층 (신천동)</td>
			<td style="background: #efefef;">
			<a href="https://rocketyourcareer.kr.coupang.com/?gclid=Cj0KCQjw--GFBhDeARIsACH_kdawf_iOfMxwaEB-UbRUgilHzElYti9Q6QDwht9MSk2h9AvqIVxLkrcaAq1hEALw_wcB">쿠팡 채용사이트 바로가기</a>
			</td>
			</tr>
			</table>
	
			
				<table  class="type05">
					<tr><td colspan="4">기업정보</td></tr>
					
					<tr>
					<th>산업</th>
					<td>쇼핑몰</td>
					<th>사원수</th>
					<td>6,372명</td>
					</tr>
					<tr>
					<th>기업구분</th>
					<td>대기업</td>
					<th>설립연도</th>
					<td>2010년</td>
					</tr>
					<tr>
					<th>대표자</th>
					<td>강한승,박대준</td>
					<th>매출액</th>
					<td>4조 4227억원</td>
					</tr>
					<tr>
					<th>자본금</th>
					<td>99억원</td>
					<th>4대보험</th>
					<td>국민연금, 건강보험, 고용보험, 산재보험</td>
					</tr>
				</table>

		<table  class="type06">
			     <tr><td colspan="4" align="center">문화 & 복지</td></tr>
					     <tr>
					     <th>열린문화</th>
					     <th>휴게공간 & 카페</th>
					     <th>유연근무제</th>
					     <th>해외근무 기회</th>
					     </tr>
					<tr>
						<td>
						쿠팡의 업무공간은 파티션과 위쿠팡의 업무공간은 파티션과 위계질서, 
						직책 대신 열린 공간, 창의력 그리고 시너지로 채워져 있습니다.
						</td>
						<td>
						자유롭게 일하거나 협업할 수 있는 공간과, 커피와 차,
						 간식을 즐길 수 있는 카페테리아가 있습니다.
						</td>
						<td >
						근무시간을 유연하게 조정할 수 있으며 주 1회 재택근무가 가능합니다.
						</td>
						<td>
						쿠팡의 한국, 중국, 미국 오피스 중 어느 곳에서든 
						근무할 수 있는 기회가 열려 있습니다.
						</td>
					</tr>
						 <tr>
					     <th>사내 이벤트</th>
					     <th>교육프로그램</th>
					     <th>건강보험</th>
					     <th>휴가 제도</th>
					     </tr>
				<tr>
							<td >
							열심히 일하고 마음껏 즐기세요. 
							사내 이벤트에서 게임과 음식을 통해 서로 친해질 수 있습니다.
							</td>
							<td>
							외국어 및 기타 유용한 업무 스킬에 관한 강좌를 수강할 수 있습니다.
							</td>
							<td>
							임직원 및 직계 가족에 대한 임직원 단체상해보험이 제공됩니다.
							</td>
							<td >
							경조사와 가족모임 등에 가족과 시간을 보낼 수 있도록 유급휴가를 지원합니다.
							</td>
				</tr>
	</table>
	
	
	
	
	
	
	
</table>
<!--   Pagination
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a class="w3-button w3-black" href="#">1</a>
      <a class="w3-button w3-hover-black" href="#">2</a>
      <a class="w3-button w3-hover-black" href="#">3</a>
      <a class="w3-button w3-hover-black" href="#">4</a>
      <a class="w3-button w3-hover-black" href="#">5</a>
      <a class="w3-button w3-hover-black" href="#">»</a>
    </div>
  </div>  -->

<!--   <footer id="myFooter">
    <div class="w3-container w3-theme-l2 w3-padding-32">
      <h4>Footer</h4>
    </div>

    <div class="w3-container w3-theme-l1">
      <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
    </div>
  </footer> -->

<!-- END MAIN -->
</div>

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

function listFunc1() {
	  var x = document.getElementById("list1");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else {
	    x.className = x.className.replace(" w3-show", "");
	  }
	}
function listFunc2() {
	  var x = document.getElementById("list2");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else {
	    x.className = x.className.replace(" w3-show", "");
	  }
	}
function listFunc3() {
	  var x = document.getElementById("list3");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else {
	    x.className = x.className.replace(" w3-show", "");
	  }
	}

// Click on the "Jeans" link on page load to open the accordion for demo purposes //id="myBtn"
document.getElementById("myBtn").click();


// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>

</body>
</html>
    