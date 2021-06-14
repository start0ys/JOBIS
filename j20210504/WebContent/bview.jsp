<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
	.hiddenText {
   		display: none;

	}
	textarea{
		width: 90%;
		resize: none;
	}
	.btn1{
		background-color: white;
		border: 0;
		font-weight: bold;
	}
	.btn{
		background: black;
		color: white;
		border-radius: 10px;
	}
</style>
<c:if test="${ empty m_nickname}">
	<script type="text/javascript">
		alert("커뮤니티는 로그인 후 이용할수있습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${empty content }">
	<script type="text/javascript">
		location.href = document.referrer; 
	</script>
</c:if>
<script type="text/javascript">
	var b = "a";
	function re(id) {
		var content2 = document.getElementById(b);
        content2.style.display = "none";
		var a = "a" + id;
		var content = document.getElementById(a);
        content.style.display = "block";
		b=a;
	}
	function del() {
		const del =  confirm("해당 게시글을 삭제하시겠습니까?");
		if(del){
			location.href='bdelete.do?b_idx=${board.b_idx }&pageNum=${pageNum }';
		}
	}
	function redel(id) {
		const redel =  confirm("해당 댓글을 삭제하시겠습니까?");
		var c_idx = id;
		if(redel){
			location.href='reDelete.do?c_idx='+c_idx+'&pageNum=${pageNum }&b_idx=${board.b_idx }&b_type=${b_type}';
		}
	}
	
	function remd(id) {
		var popupX = (document.body.offsetWidth / 2) - (200 / 2);
		//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY= (window.screen.height / 2) - (300 / 2);
		//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		var c_idx = id;
		window.open("reUpdate.do?c_idx="+c_idx,"","width=500,height=300, left="+ popupX + ", top="+ popupY);
	}
	
</script>
<body>
<div id="a"></div> 
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
      <div style="margin: 0 auto; margin:35px 0 70px 0; padding-left: 50px;">
			<h2>${board.b_title }</h2>
			<div style="margin-top: 10px;">
				<span>👤${board.m_nickname }</span>
			</div>
			<div style="border: 0; border-bottom: 2px solid black; width: 96%;">
				<span style=" font-size: 13px; color: gray;">${board.b_regdate }</span>
				<span style=" font-size: 13px; color: gray;">조회수 : ${board.b_count }</span>
				<c:if test="${board.m_num > 0 }">
					<span style=" font-size: 13px;"><a href="bseContent.do?bm_num=${board.m_num }" style="text-decoration: none; color: gray;"><b>${fn:substringAfter(board.m_nickname, ']')}님의 자소서 보러가기</b></a></span>
				</c:if>
				<span style=" font-size: 15px; color: gray; position: absolute; right: 20%;">댓글 <b>${c_tot }</b></span>
			</div>

			<div style="margin-top: 5px; position: absolute; right: 21%;">
				<c:if test="${board.m_num == m_num }">
					<input style="padding: 5px;" type="button" class="btn" value="수정" onclick="location.href='bupdate.do?b_idx=${board.b_idx }&pageNum=${pageNum }&b_type=${b_type }'">
				</c:if>
				<c:if test="${board.m_num == m_num || m_num == 0}">
					<input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del()">
				</c:if>
			</div>
			<div style="margin: 20px 0 0 20px; width: 75%;">
				<c:if test="${not empty board.b_img }">
					 <div style="margin-bottom: 50px; text-align: center; margin-left: 16%;">
						 <form action = "fileDownload.do" method = "post">
							<input type = "hidden" name = "fileName" value="${board.b_img }">
							📁 ${board.b_img } <input type = "submit" value = "다운로드" class="btn">
						 </form>
					 </div>
				</c:if>
				${content } 
			</div>

	
			<div style="margin-top: 123px;position: absolute; right: 20%;"><input style="padding: 5px;" class="btn" type="button" value="목록" onclick="location.href = 'board.do?b_type=${b_type}'"></div>
			<div style="margin-top: 160px; width: 96%; border-top: 2px dotted black;">
				<c:forEach var="comment" items="${list }">
					<c:if test="${comment.re_level > 0 }">
						<img src="images/level.gif" width="${comment.re_level*10 }">
						<img src="images/re.gif">
						<span style="margin: 11px 0 0 0;">👤${comment.nickname }</span>
					</c:if> 
					<c:if test="${comment.re_level == 0 }">
						<div style="margin: 11px 0 0 11px;">👤${comment.nickname }</div>
					</c:if> 
					<div style="margin-left: ${comment.re_level*15 }px; ">
						<div style="margin: 5px 0 0 11px;">${comment.c_content }</div>
						<div style="font-size: 13px; color: gray; margin: 0  0 5px 11px;">${comment.c_regdate }</div>
					    <div style="margin: 0  0 11px 0; border-bottom: 1px dotted;">
						    <input style="margin-left: 11px" class="btn1" type="button" value="답글" onclick="re(${comment.c_idx})">
							<c:if test="${comment.m_num == m_num }">
								<input class="btn1" type="button" value="수정" onclick="remd(${comment.c_idx })">
							</c:if>
							<c:if test="${comment.m_num == m_num || m_num == 0}">
								<input class="btn1" type="button" value="삭제" onclick="redel(${comment.c_idx })">
							</c:if>
					    </div>
		
						<div class="hiddenText" id="a${comment.c_idx }">
							<form action="reWrite.do?pageNum=${pageNum }" method="post" name="frm1" id="frm1">
								<input type="hidden" name="m_nickname" value="${m_nickname }">
								<input type="hidden" name="m_num" value="${m_num }">
								<input type="hidden" name="b_idx" value="${board.b_idx }">
								<input type="hidden" name="c_idx" value="${comment.c_idx }">
								<input type="hidden" name="b_type" value="${b_type }">
								<input type="hidden" name="ref" value="${comment.ref }">
								<input type="hidden" name="re_level" value="${comment.re_level }">
								<input type="hidden" name="re_step" value="${comment.re_step }">
						       	<span><img src="images/re.gif"></span>
								<span style="margin: 11px 0 0 0;">👤${m_nickname }</span>
								<div style="margin: 11px 0 0 11px;"><textarea name="c_content" id="c_content" maxlength="2000" style="height:100px;" required="required"
								                 placeholder="댓글을 입력해주세요"></textarea></div>
								<div style="margin: 0  0 11px 11px;"><input style="padding: 5px;" class="btn" type="submit" value="등록"></div>
							 </form>
						</div>	     
					</div>
				</c:forEach>

 
	 

				<form action="reWrite.do?pageNum=${pageNum }" method="post" name="frm2">  
					<input type="hidden" name="m_nickname" value="${m_nickname }">
					<input type="hidden" name="m_num" value="${m_num }">
					<input type="hidden" name="b_idx" value="${board.b_idx }">
					<input type="hidden" name="c_idx" value="${c_idx }">
					<input type="hidden" name="b_type" value="${b_type }">
					<input type="hidden" name="ref" value="${ref }">
					<input type="hidden" name="re_level" value="${re_level }">
					<input type="hidden" name="re_step" value="${re_step }">
					<div style="border: 1px dotted black; ">
						<div style="margin: 11px 0 0 11px;">👤${m_nickname }</div>
					    <div style="margin: 20px 0 0 20px;"><textarea name="c_content" id="c_content" maxlength="2000" style="height:100px; border: 0px;" required="required"
				                               placeholder="댓글을 입력해주세요"></textarea></div>        
					    <div style="margin: 0  0 11px 11px; width: 56px; border: 1px dotted; padding: 5px; border-radius: 10px;"><input style="padding: 5px;" class="btn" type="submit" value="등록"></div>
					</div>
				
				</form>
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
    