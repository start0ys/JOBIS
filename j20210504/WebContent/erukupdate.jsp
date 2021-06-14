<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="w3-twothird w3-container" style="margin-left: 44px; margin-top: 18px; width: 78%;">
      <h1 class="w3-text-teal">이력서 수정</h1>
      	<form action="erUpdatePro.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="m_num" value="${m_num }">
			<table width="600">
				<tr>
					<th colspan="2" height="40"><h2>기본정보</h2></th>
					<th width="220" rowspan="4" class="image-container">
						<img id="preview-image" src="https://dummyimage.com/200x200/ffffff/000000.png&text=preview+image" width="200" height="200">
						<input style="display: block;" type="file" name="uploadFile" id="input-image">
					</th>
				</tr>
				<tr>
					<th width="100">이름</th>
					<td><input type="text" name="m_name" value="${erboard.m_name }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="mail" value="${erboard.mail }"></td>
				</tr>
				<tr></tr>
				<tr>
					<th>추가사항</th>
					<td colspan="2"><pre><textarea style="width: 500px; height: 50px;" name="additions"> ${erboard.additions }</textarea></pre>
				</tr>
			</table>
			<div style="margin: 30px;"></div>
			<table width="600">
				<tr>
					<th colspan="2" height="40"><h2>학력</h2></th>
				</tr>
				<tr>
					<th>학교</th>
					<td><input type="text" name="college" value="${erboard.college }"></td>
				</tr>
				<tr>
					<th>전공</th>
					<td><input type="text" name="major" value="${erboard.major }"></td>
				</tr>
				<tr>
					<th>기간</th>
					<td><input type="text" name="date1" value="${erboard.date1 }">~<input type="text" name="date2" value="${erboard.date2 }"></td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input type="text" name="credit" value="${erboard.credit }"></td>
				</tr>
			</table>
			<div style="margin: 30px;"></div>
			<table width="600">
				<tr>
					<th colspan="2" height="40"><h2>병역</h2></th>
				</tr>
				<tr>
					<th>군벌</th>
					<td><input type="text" name="millitary" value="${erboard.millitary }"></td>
				</tr>
				<tr>
					<th>병과</th>
					<td><input type="text" name="m_dept" value="${erboard.m_dept }"></td>
				</tr>
				<tr>
					<th>계급</th>
					<td><input type="text" name="m_class" value="${erboard.m_class }"></td>
				</tr>
				<tr>
					<th>기간</th>
					<td><input type="text" name="m_date1" value="${erboard.m_date1 }">~<input type="text" name="m_date2" value="${erboard.m_date2 }"></td>
				</tr>
			</table>
			<div style="margin: 30px;"></div>
			<table width="600">
				<tr>
					<th colspan="2" height="40"><h2>경력</h2></th>
				</tr>
				<tr>
					<th>회사</th>
					<td><input type="text" name="ename" value="${erboard.ename }"></td>
				</tr>
				<tr>
					<th>근무기간</th>
					<td><input type="text" name="edate1" value="${erboard.edate1 }">~<input type="text" name="edate2" value="${erboard.edate2 }"></td>
				</tr>
				<tr>
					<th>직무</th>
					<td><input type="text" name="ejob" value="${erboard.ejob }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="1"><pre><textarea style="width: 500px; height: 50px;" name="econtent">${erboard.econtent }</textarea></pre>
				</tr>
			</table>
			<div style="margin: 30px;"></div>
			<table width="600">
				<tr>
					<th colspan="2" height="40"><h2>대외활동</h2></th>
				</tr>
				<tr>
					<th>활동명</th>
					<td><input type="text" name="aname" value="${erboard.aname }"></td>
				</tr>
				<tr>
					<th>활동기간</th>
					<td><input type="text" name="adate1" value="${erboard.adate1 }">~<input type="text" name="adate2" value="${erboard.adate2 }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="1"><pre><textarea style="width: 500px; height: 50px;" name="acontent">${erboard.acontent }</textarea></pre>
				</tr>
			</table>
			<div style="margin: 30px;"></div>
			<table width="600">
				<tr>
					<th colspan="2" height="40"><h2>어학성적</h2></th>
				</tr>
				<tr>
					<th>시험명</th>
					<td><input type="text" name="tname" value="${erboard.tname }"></td>
				</tr>
				<tr>
					<th>취득날짜</th>
					<td><input type="text" name="tdate" value="${erboard.tdate }"></td>
				</tr>
				<tr>
					<th>점수</th>
					<td><input type="text" name="tscore" value="${erboard.tscore }"></td>
				</tr>
				<tr>
					<th>수험번호</th>
					<td><input type="text" name="tnumber" value="${erboard.tnumber }"></td>
				</tr>
			</table>
			<div style="margin: 30px;"></div>
			<table width="600">
				<tr>
					<th colspan="2" height="40"><h2>자격증</h2></th>
				</tr>
				<tr>
					<th>자격증명</th>
					<td><input type="text" name="lname" value="${erboard.lname }"></td>
				</tr>
				<tr>
					<th>자격증번호</th>
					<td><input type="text" name="col" value="${erboard.col }"></td>
				</tr>
				<tr>
					<th>발급기관</th>
					<td><input type="text" name="ldept" value="${erboard.ldept }"></td>
				</tr>
				<tr>
					<th>취득날짜</th>
					<td><input type="text" name="ldate" value="${erboard.ldate }"></td>
				</tr>
			</table>
			<div style="margin: 30px;"></div>
			<table width="600">
				<tr>
					<th colspan="2" height="40"><h2>수상</h2></th>
				</tr>
				<tr>
					<th>대회명</th>
					<td><input type="text" name="pname" value="${erboard.pname }"></td>
				</tr>
				<tr>
					<th>상</th>
					<td><input type="text" name="price" value="${erboard.price }"></td>
				</tr>
				<tr>
					<th>상일련번호</th>
					<td><input type="text" name="p_id" value="${erboard.p_id }"></td>
				</tr>
				<tr>
					<th>수상기관</th>
					<td><input type="text" name="pdept" value="${erboard.pdept }"></td>
				</tr>
				<tr>
					<th>수상날짜</th>
					<td><input type="text" name="pdate" value="${erboard.pdate }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="1"><pre><textarea style="width: 500px; height: 50px;" name="pcontent">${erboard.pcontent }</textarea></pre>
				</tr>
				<tr><td><input type="submit" value="수정하기"></td></tr>
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
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})
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
    