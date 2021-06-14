<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="Seerror.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<%
	String context = request.getContextPath();
%>
<title>JOBIS</title>
<script type="text/javascript">
function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("s_type");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}
</script>
<script type="text/javascript">
		function fnChkByte(obj, maxByte)
		{
		    var str = obj.value;
		    var str_len = str.length;
		    var rbyte = 0;
		    var rlen = 0;
		    var one_char = "";
		    var str2 = "";
		    for(var i=0; i<str_len; i++)
		    {
		        one_char = str.charAt(i);
		        if(escape(one_char).length > 4)
		        {
		            rbyte += 2;                                         //한글2Byte
		        }
		        else
		        {
		            rbyte++;                                            //영문 등 나머지 1Byte
		        }


		        if(rbyte <= maxByte)
		        {
		            rlen = i+1;                                          //return할 문자열 갯수
		        }
		     }
		     if(rbyte > maxByte)
		     {
		  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
		  alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
		  str2 = str.substr(0,rlen);                                  //문자열 자르기
		  obj.value = str2;
		  fnChkByte(obj, maxByte);
		     }
		     else
		     {
		        document.getElementById('byteInfo').innerText = rbyte;		        
		     }
		}
		function fnChkByte1(obj, maxByte)
		{
		    var str = obj.value;
		    var str_len = str.length;
		    var rbyte = 0;
		    var rlen = 0;
		    var one_char = "";
		    var str2 = "";
		    for(var i=0; i<str_len; i++)
		    {
		        one_char = str.charAt(i);
		        if(escape(one_char).length > 4)
		        {
		            rbyte += 2;                                         //한글2Byte
		        }
		        else
		        {
		            rbyte++;                                            //영문 등 나머지 1Byte
		        }


		        if(rbyte <= maxByte)
		        {
		            rlen = i+1;                                          //return할 문자열 갯수
		        }
		     }
		     if(rbyte > maxByte)
		     {
		  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
		  alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
		  str2 = str.substr(0,rlen);                                  //문자열 자르기
		  obj.value = str2;
		  fnChkByte1(obj, maxByte);
		     }
		     else
		     {
		        document.getElementById('byteInfo1').innerText = rbyte;
		     }
		}
</script>
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
.btn {
	background: black;
	color: white;
	border-radius: 10px;
}
#Community {float: right;}
#Company {float: right;}
i {float: right;}
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
    <div class="w3-twothird w3-container" style="margin-left: 44px; margin-top: 18px; width: 80%;">
    
    <form action="SewritePro.do?pageNum=${pageNum}" method="post">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="m_nickname" value="${m_nickname }">
		<input type="hidden" name="m_num" value="${m_num }">
		<input type="hidden" name="s_idx" value="0">
      <h1 class="w3-text-teal" style="text-align: center;">자기소개서 작성</h1>
      	<table border="1" style="text-align: center; background-color:#ddd; margin: 0 auto; width: 100%">
			<tr>
				<td>공개여부</td>
				<td>
					<input type="checkbox" name="s_type" value="1" onclick="checkOnlyOne(this)">공개 
					<input type="checkbox" name="s_type" value="0" onclick="checkOnlyOne(this)" checked="checked">비공개
				</td>
			</tr>
			<tr><td>회사이름</td><td><input type="text" placeholder="회사이름" name="s_companyname" maxlength="50" style="height:40px; width: 90%; margin-bottom: 20px;" required="required"></td></tr>
			<tr><td>내용작성</td><td><textarea placeholder="내용작성" name="s_content" id="s_content" maxlength="4000" style="height:350px; width: 90%;" onKeyUp="javascript:fnChkByte(this,'4000')" required="required"></textarea>
			<br>
			<span id="byteInfo">0</span>/4000bytes</td></tr>
			<table style="margin: 0 auto;">
				<tr>
					<td><input type="submit" value="확인" class="btn"></td>
				    <td><input type="reset" value="다시작성" class="btn"></td>
				</tr>
			</table>
		</table>	
     </form>
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
    