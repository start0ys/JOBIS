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
<link rel="stylesheet" href="UpdatePage.css">
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
	function chk(){
	var chk = false;
	if   (!confirm("회원 탈퇴시 작성한 게시글, 이력서, 자소서는 삭제되지 않습니다.\n정말 회원 탈퇴하시겠습니까?"))  
  	{chk = false;}
    else	 chk = true;
    return chk;
}

	function password() {
	var p1 = document.getElementById('m_pw').value;
	var p2 = document.getElementById('m_pw2').value;
    if(p1 != p2) {
    	alert("비밀번호가 일치하지 않습니다.");
    	return false;
    } else if(p1 == p2) {
    	return true;
	}
}

	function del(b_idx) {
		const del =  confirm("해당 게시글을 삭제하시겠습니까?");
		if(del){
			location.href='bdelete.do?b_idx='+b_idx+'&pageNum=${pageNum }';
		}
	}
</script>
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
      <c:if test="${b_type==0 }"><h1 class="w3-text-teal">면접 게시판</h1></c:if>
	  <c:if test="${b_type==1 }"><h1 class="w3-text-teal">Q&A 게시판</h1></c:if>
	  <c:if test="${b_type==2 }"><h1 class="w3-text-teal">자유 게시판</h1></c:if>
     
     
    <div id="modify_container">
    <form action="userModify.do" onsubmit="return password()" >
	<h1>회원정보 수정 화면</h1>
    		<div class="login_id">
                <h4>아이디</h4>
                <input type="text" name="id" value="${m_id }">
            </div>
            
    		<div class="login_id">
                <h4>비밀번호</h4>
    			<input type="password" name="m_pw" id="m_pw" value="${m_pw}" required="required">
            </div>	
    		
    		<div class="login_id">
                <h4>비밀번호 확인</h4>
    			<input type="password" name="m_pw2" id="m_pw2" value="${m_pw}" required="required">
            </div>
    		
    		<div class="login_id">
                <h4>이름</h4>
    			<input type="text" name="m_name" value="${m_name}" required="required">
            </div>
    		
			<div class="login_id">
                <h4>성별</h4>
    		<c:if test="${m_sex == 'm' }">
	    		<input type="radio" name="m_sex" autocomplete="off" value="m" checked>남자
	    		<input type="radio" name="m_sex" autocomplete="off" value="f">여자
    		</c:if>
	    		</div>
    	
    		<div class="login_id">
    			<h4>성별</h4>
    		<c:if test="${m_sex == 'f' }">
	    		<input type="radio" name="m_sex" autocomplete="off" value="m">남자
	    		<input type="radio" name="m_sex" autocomplete="off" value="f" checked>여자
    		</c:if>
            </div>
    	
    	   <div class="login_id">
                <h4>이메일</h4>
 		   		<input type="email" name="mail" value="${mail }" required="required">
           </div>
            
    		
    		<div class="login_id">
    		<c:if test="${fn:substringBefore(m_nickname, ']') == '[취준생'}">
				<h4>구직여부</h4>
				<select name="ed">
		          <option value="[취준생]" selected="selected">취준생</option>
		          <option value="[취업자]">취업자</option>
	            </select>
            </c:if>
            
       		<c:if test="${fn:substringBefore(m_nickname, ']') == '[취업자'}">
	           	<h4>구직여부</h4>
	           	<select name="ed">
		           <option value="[취업자]" selected="selected">취업자</option>
		           <option value="[취준생]">취준생</option>
	            </select>
       		</c:if>
       		</div>
       		
	    	<div class="login_id">
	                <h4>닉네임</h4>
	    			<input type="text" name="m_nickname" value="${fn:substringAfter(m_nickname, ']')}" required="required">
	       	</div>
	       	
	    	<div class="submit">
		    	<input type="submit" value="수정" class="btn">
	            </form>
		    	<button type="button" onclick="location.href='main.do'" class="btn">취소</button>    
			<form action = "delete.do?m_num=${m_num }"  name="frm"  onsubmit="return chk()">
				<input type="hidden" name="m_num" value="${m_num }" >
				<input type="submit" value="회원탈퇴" >
			</form> 
			</div>
	        </div>
	    </form>
			
    
	</div>
</div>
      	




<!-- END MAIN -->

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
    