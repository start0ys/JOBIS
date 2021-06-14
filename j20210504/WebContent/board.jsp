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
i {float: right;}
</style>
<style type="text/css">
	a{
		text-decoration: none;
		color:black;
	}
	th{ 
	/* 	border-top: solid 2px #aaaaaa;
    	background-color: #4d6083;
    	color:white; */
    	background-color:#525252;
    	border-top:solid 2px #aaaaaa;
    	/* background-color:#eeeeee; */
    	color: white;
	}
	tr{
		height:30px; 
		/* background-color: #e6efff; */
	}
	td{
		border-bottom:solid 1px #dddddd;
	}
 	.boardCot{
		display: inline-block; 
		width: 80%; 
		white-space: nowrap; 
		overflow: hidden; 
		text-overflow: ellipsis; 
		
	}  
	.btn{
		background: black;
		color: white;
		border-radius: 10px;
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
<body>
<c:if test="${ empty m_nickname}">
	<script type="text/javascript">
		alert("커뮤니티는 로그인 후 이용할수있습니다.");
		history.go(-1);
	</script>
</c:if>

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
	<a class="w3-bar-item w3-button w3-hover-black" href="#">관리자페이지</a>
  </c:if>
  <c:if test="${m_num > 0 }">
	  <h4 class="w3-bar-item"><b>My Page</b></h4>
	  <a class="w3-bar-item w3-button w3-hover-black" href="#">일정관리</a>
	  <a class="w3-bar-item w3-button w3-hover-black" href="erContent.do">이력서관리</a>
	  <a onclick="listFunc1()" href="javascript:void(0)" class="w3-bar-item w3-button w3-hover-black">자기소개서 <i class="fa fa-caret-down"></i>
	</a>
	<div id="list1" class="w3-bar-block w3-hide w3-padding-large w3-medium">
	  <a href="SewriteForm.do" class="w3-bar-item w3-button w3-light-grey">자기소개서 작성</a>
	  <a href="myse.do" class="w3-bar-item w3-button">자기소개서 관리</a>
	</div>  
	  <a onclick="listFunc2()" href="javascript:void(0)" class="w3-bar-item w3-button w3-hover-black">내 정보관리 <i class="fa fa-caret-down"></i>
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
<a onclick="listFunc3()" href="javascript:void(0)" class="w3-bar-item w3-button w3-hover-black">기업 바로가기<i class="fa fa-caret-down"></i></a>
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
      <c:if test="${b_type==0 }"><h1 class="w3-text-teal">면접 게시판</h1></c:if>
	  <c:if test="${b_type==1 }"><h1 class="w3-text-teal">Q&A 게시판</h1></c:if>
	  <c:if test="${b_type==2 }"><h1 class="w3-text-teal">자유 게시판</h1></c:if>
     
      	
		<div style="margin: 0 auto; margin:35px 0 70px 0; text-align: center;">
			
			<c:if test="${b_type == 0 || b_type == 2 }">
				<table style="text-align: center;margin: 0 auto; width: 100%; border-collapse:collapse;">
					<tr>
						<th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
						<c:if test="${m_num == 0}">
							<th>삭제</th>
						</c:if>
					</tr>
					<c:forEach var="board" items="${best }">
						<tr>
							<td style="width: 60%; font-weight: bold; font-size: 18px;background-color: #eeeeee; text-align: initial;">
								<img src="images/hot.gif" style="margin-left: 20px;">
								<a href="bview.do?b_idx=${board.b_idx }&pageNum=${currentPage}&b_type=${b_type }">${board.b_title }</a>
							</td>
							<td style="width: 20%;background-color: #eeeeee;">👤${board.m_nickname }</td>
							<td style="width: 10%;background-color: #eeeeee;">${board.b_regdate }</td>
							<td style="width: 10%;background-color: #eeeeee;">${board.b_count }</td>
							<c:if test="${m_num == 0}">  
									<td><input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del(${board.b_idx})"></td>
							</c:if>
						</tr>
					</c:forEach>
					<c:forEach var="board" items="${notice }">
						<tr>
							<td style="width: 60%; font-weight: bold; font-size: 18px;background-color: #eeeeee; text-align: initial;">
								<a style="color: red; margin-left: 20px;" href="bview.do?b_idx=${board.b_idx }&pageNum=${currentPage}&b_type=3">${board.b_title }</a>
							</td>
							<td style="width: 20%;background-color: #eeeeee;">👤${board.m_nickname }</td>
							<td style="width: 10%;background-color: #eeeeee;">${board.b_regdate }</td>
							<td style="width: 10%;background-color: #eeeeee;">${board.b_count }</td>
							<c:if test="${m_num == 0}">
									<td><input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del(${board.b_idx})"></td>
							</c:if>
						</tr>
					</c:forEach>
					<c:if test="${totCnt > 0 }">
						<c:forEach var="board" items="${list }"> 
							<tr>
								<td style="width: 60%;  font-size: 16px; text-align: initial;">
									<a style="margin-left: 20px;" href="bview.do?b_idx=${board.b_idx }&pageNum=${currentPage}&b_type=${b_type }">${board.b_title }</a>
								</td>
								<td style="width: 20%;">👤${board.m_nickname }</td>
								<td style="width: 10%;">${board.b_regdate }</td>
								<td style="width: 10%;">${board.b_count }</td>
								<c:if test="${m_num == 0}"> 
									<td><input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del(${board.b_idx})"></td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${toCnt == 0 }">
						<tr>
							<td colspan="7"></td>
						</tr>
					</c:if>
				</table>
			</c:if>
			
			<c:if test="${b_type == 1 }">
				<div style="text-align: left;margin: 0 auto; width: 80%;">
					<c:if test="${not empty notice }">
						<div style="border: 2px solid black; border-radius: 25px; padding: 28px;">
							<table style="text-align: center;margin: 0 auto; width: 90%;">
								<c:forEach var="board" items="${notice }">
									<tr>
										<td style="width: 55%; font-weight: bold; font-size: 18px;background-color: white; border-bottom: 0px;">
											<a style="color: red;" href="bview.do?b_idx=${board.b_idx }&pageNum=${currentPage}&b_type=3">${board.b_title }</a>
										</td>
										<td style="width: 15%;background-color: white; border-bottom: 0px;">👤${board.m_nickname }</td>
										<td style="width: 15%;background-color: white; border-bottom: 0px;">${board.b_regdate }</td>
										<c:if test="${m_num == 0}">
												<td style="background-color: white;"><input style="padding: 5px; " type="button" class="btn" value="삭제" onclick="del(${board.b_idx})"></td>
										</c:if>
									</tr>
								</c:forEach>
							</table>
						</div> 
					</c:if>
					<c:forEach var="board" items="${best }">
						<div style="border: 2px solid black; border-radius: 25px; padding: 28px;">
							<h3 style="width: 90%; font-weight: bold; font-size: 18px;">
								<img src="images/hot.gif">
								<a href="bview.do?b_idx=${board.b_idx }&pageNum=${currentPage}&b_type=${b_type }">${board.b_title }</a>
								<c:if test="${m_num == 0}">
									<span style="position: absolute; right: 23%;"><input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del(${board.b_idx})"></span>
								</c:if>
							</h3>
							<div class="boardCot">${board.b_content }</div>
							<div>
								<span style=" font-size: 14px;">👤${board.m_nickname }</span>
								<span style=" font-size: 13px; color: gray;">조회수 ${board.b_count }</span>
								<span style=" font-size: 13px; color: gray;">${board.b_regdate }</span>
							</div>
						</div>
					</c:forEach>
					
					
					<c:if test="${totCnt > 0 }">
						<c:forEach var="board" items="${list }">
							<div style="border: 2px solid black; border-radius: 25px; padding: 28px; margin-top: 10px;">
								<h3 style="width: 90%; font-weight: bold; font-size: 18px;">
									<a href="bview.do?b_idx=${board.b_idx }&pageNum=${currentPage}&b_type=${b_type }">${board.b_title }</a>
									<c:if test="${m_num == 0}">
										<span style="position: absolute; right: 23%;"><input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del(${board.b_idx})"></span>
									</c:if>
								</h3>
								<div class="boardCot">${board.b_content }</div>
								<div>
									<span style=" font-size: 14px;">👤${board.m_nickname }</span> 
									<span style=" font-size: 13px; color: gray;">조회수 ${board.b_count }</span>
									<span style=" font-size: 13px; color: gray;">${board.b_regdate }</span>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${toCnt == 0 }">
						<tr>
							<td colspan="7"></td>
						</tr> 
					</c:if> 
				</div>
			</c:if>
			
			
			<span style="position: absolute; right: 17%; margin-top: 4px;"> 
				<c:if test="${m_num == 0}">
					<input type="button" value="공지작성" class="btn" onclick="location.href = 'bwrite.do?b_type=3'">
				</c:if>
				<input type="button" value="글쓰기" class="btn" onclick="location.href = 'bwrite.do?b_type=${b_type}'">
			</span>	
			<div style="margin-top: 30px;">
				<form action="board.do">
					<select name="s_type" style="height: 29px;">
						<option value="1">제목</option>
						<option value="2">글쓴이</option>
					</select>
					<input type="hidden" name="b_type" value="${b_type }">
					<input type="text" name="search">
					<input type="submit" value="검색" class="btn" style="padding: 3px 5px;">
				</form>
			</div>	
			<div style="text-align: center; margin-top: 20px;">
				 <div class="w3-center w3-padding-32">
   					 <div class="w3-bar">
						<c:if test="${startPage > blockSize }">
							<a href="board.do?pageNum=${startPage-blockSize }&b_type=${b_type }&s_type=${s_type }&search=${search }"class="w3-button w3-hover-black">«</a>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${pageNum == i }">
								<a href="board.do?pageNum=${i }&b_type=${b_type }&s_type=${s_type }&search=${search }" class="w3-button w3-black">${i }</a>
							</c:if>
							<c:if test="${pageNum != i }">
								<a href="board.do?pageNum=${i }&b_type=${b_type }&s_type=${s_type }&search=${search }" class="w3-button w3-hover-black">${i }</a>
							</c:if>
						</c:forEach>
						<c:if test="${endPage < pageCnt }">
							<a href="board.do?pageNum=${startPage+blockSize }&b_type=${b_type }&s_type=${s_type }&search=${search }" class="w3-button w3-hover-black">»</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
      	


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
    