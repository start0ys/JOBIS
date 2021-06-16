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
#down {float: right;}
</style>
<style type="text/css">
	textarea{
		width: 90%;
		resize: none;
	}
	
	.fileBox .fileName {
		display:inline-block;
		width:170px;
		height:30px;
		padding-left:10px;
		margin-right:5px;
		line-height:30px;
		border:1px solid #aaa;
		background-color:#fff;
		vertical-align:middle;
		border-radius: 10px;
	}
	.fileBox .btn_file {
		display:inline-block;
		border:1px solid #000;
		width:100px;
		height:30px;
		font-size:0.8em;
		line-height:30px;
		text-align:center;
		vertical-align:middle;
		border: 1 solid white;
		background-color: black;
		color:white;
		border-radius: 10px;
	}
	.fileBox input[type="file"] {
		position:absolute;
		width:1px;
		height:1px;
		padding:0;
		margin:-1px;
		overflow:hidden;
		clip:rect(0,0,0,0);
		border:0
	}
	.btn{
		background: black;
		color: white;
		border-radius: 10px;
	}
	.fileBox{
		position: absolute; 
		right: 20%;
	}
	#bttn{
		text-align: initial; 
		margin-left: 46px;
	}
	
	@media screen and (max-width: 680px) {
		.fileBox{
			position: relative;
			right: 0;
		}
		#bttn{
			text-align: center;
		    margin-left: 0;
		    margin-top: 12px;
		}
	
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
      <h1 class="w3-text-teal">게시판</h1>
      	<div style="margin: 0 auto; margin:35px 0 70px 0; text-align: center; margin: 0 auto;">
			<div style="margin: 50px 0px;">
				<form action="bupdatePro.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="pageNum" value="${pageNum }">
					<input type="hidden" name="m_num" value="${board.m_num }">
					<input type="hidden" name="b_idx" value="${board.b_idx }">
					<input type="hidden" name="b_type" value="${b_type }">
					<input type="hidden" name="m_nickname" value="${board.m_nickname }">
					<input type="hidden" name="filedel" value="0" id="filedel">
					
					<c:if test="${b_type == 0 }">
						<select name="t_type" style="height: 40px;width: 10%;">
							<option value="${fn:substringBefore(board.b_title, ']')}]" selected="selected">${fn:substringBefore(fn:substringAfter(board.b_title, '['), ']')}</option>
							<c:if test="${fn:substringBefore(board.b_title, ']') == '[합격후기'}">
								<option value="[면접후기]">면접후기</option>
							</c:if>
							<c:if test="${fn:substringBefore(board.b_title, ']') == '[면접후기'}">
								<option value="[합격후기]">합격후기</option>
							</c:if>
						</select>
						<input type="text" placeholder="글 제목" name="b_title" id="b_title" maxlength="50" style="height:40px; width: 80%; margin-bottom: 20px;" required="required" value="${fn:substringAfter(board.b_title, ']')}"><p>
					<pre><textarea  placeholder="글 내용" name="b_content" id="b_content" maxlength="4000" style="height:350px;" required="required">${board.b_content }</textarea></pre><p>
					</c:if>
					<c:if test="${b_type == 1 }">
						<select name="t_type" style="height: 40px;width: 10%;">
							<option value="${fn:substringBefore(board.b_title, ']')}]" selected="selected">${fn:substringBefore(fn:substringAfter(board.b_title, '['), ']')}</option>
							<c:if test="${fn:substringBefore(board.b_title, ']') == '[스펙'}">
								<option value="[이직]">이직</option>
								<option value="[국비]">국비</option>
								<option value="[외국어]">외국어</option>
								<option value="[자격증]">자격증</option>
								<option value="[대외활동]">대외활동</option>
								<option value="[이것저것]">이것저것</option>
							</c:if>
								<c:if test="${fn:substringBefore(board.b_title, ']') == '[이직'}">
								<option value="[스펙]">스펙</option>
								<option value="[국비]">국비</option>
								<option value="[외국어]">외국어</option>
								<option value="[자격증]">자격증</option>
								<option value="[대외활동]">대외활동</option>
								<option value="[이것저것]">이것저것</option>
							</c:if>
								<c:if test="${fn:substringBefore(board.b_title, ']') == '[국비'}">
								<option value="[스펙]">스펙</option>
								<option value="[이직]">이직</option>
								<option value="[외국어]">외국어</option>
								<option value="[자격증]">자격증</option>
								<option value="[대외활동]">대외활동</option>
								<option value="[이것저것]">이것저것</option>
							</c:if>
								<c:if test="${fn:substringBefore(board.b_title, ']') == '[외국어'}">
								<option value="[스펙]">스펙</option>
								<option value="[이직]">이직</option>
								<option value="[국비]">국비</option>
								<option value="[자격증]">자격증</option>
								<option value="[대외활동]">대외활동</option>
								<option value="[이것저것]">이것저것</option>
							</c:if>
								<c:if test="${fn:substringBefore(board.b_title, ']') == '[자격증'}">
								<option value="[스펙]">스펙</option>
								<option value="[이직]">이직</option>
								<option value="[국비]">국비</option>
								<option value="[외국어]">외국어</option>
								<option value="[대외활동]">대외활동</option>
								<option value="[이것저것]">이것저것</option>
							</c:if>
								<c:if test="${fn:substringBefore(board.b_title, ']') == '[대외활동'}">
								<option value="[스펙]">스펙</option>
								<option value="[이직]">이직</option>
								<option value="[국비]">국비</option>
								<option value="[외국어]">외국어</option>
								<option value="[자격증]">자격증</option>
								<option value="[이것저것]">이것저것</option>
							</c:if>
								<c:if test="${fn:substringBefore(board.b_title, ']') == '[이것저것'}">
								<option value="[스펙]">스펙</option>
								<option value="[이직]">이직</option>
								<option value="[국비]">국비</option>
								<option value="[외국어]">외국어</option>
								<option value="[자격증]">자격증</option>
								<option value="[대외활동]">대외활동</option>
							</c:if>
						</select>
						<input type="text" placeholder="글 제목" name="b_title" id="b_title" maxlength="50" style="height:40px; width: 80%; margin-bottom: 20px;" required="required" value="${fn:substringAfter(board.b_title, ']')}"><p>
						<pre><textarea  placeholder="글 내용" name="b_content" id="b_content" maxlength="4000" style="height:350px;" required="required">${board.b_content }</textarea></pre><p>
					</c:if>
					<c:if test="${b_type == 2 }">
						<input type="text" placeholder="글 제목" name="b_title" id="b_title" maxlength="50" style="height:40px; width: 90%; margin-bottom: 20px;" required="required" value="${board.b_title }"><p>
						<pre><textarea  placeholder="글 내용" name="b_content" id="b_content" maxlength="4000" style="height:350px;" required="required">${board.b_content }</textarea></pre><p>
					</c:if>
					<div class="fileBox">
						<input type="text" class="fileName" readonly="readonly" value="${board.b_img }">
						<label for="uploadBtn" class="btn_file">업로드 수정</label>
						<input type="file" id="uploadBtn" class="uploadBtn" name="uploadFile">
						<input type="button" class="btn" value="제거" onclick="fd()" style="font-size: 0.8em; width: 50px; height: 30px; border:1px solid #000;">
					</div>
					<div id="bttn"><input type="submit" value="수정하기" class="btn"></div>
				</form>
			</div>
		</div>	
      	


	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		var uploadFile = $('.fileBox .uploadBtn');
		uploadFile.on('change', function(){
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$(this).siblings('.fileName').val(filename);
			$('#filedel').val('1');
		});
	 	function fd() {
			$('.fileName').val(''); 
			$('#filedel').val('2');
		} 
	</script>

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
    