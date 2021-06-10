<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="commons.css">
<link rel="stylesheet" type="text/css" href="headerss.css?ver4">
<link rel="stylesheet" type="text/css" href="menus.css">
</head>
<script type="text/javascript">
function chk(){
	var chk = false;
   	 	if   (!confirm("정말 회원 탈퇴하시겠습니까?"))  
   	 	{chk = false;}
	    else	 chk = true;
	    return chk;
}
</script>
<body>
<div id="wrapper">
<header>
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
	<div style="width: 90%; margin: 0 auto; margin-top:30px; text-align: center; color:black; ">
	<!-- 여기까지 상단 -->
	
	
	
	
	
	
	
	
	
	
	
	
<!-- 아이디, 비밀번호, 이름, 성별, 이메일, 학교, 전공, 군벌, 병과를 sql에서 불러온 상태로 ㄱㄱ -->
<div id="modify_container">
	<h1>회원정보 수정 화면</h1>
    <form action="userModify.do" method="post">
    	<table class="modify_table">
    	<tr>
    		<td class="text">아이디</td>
    		<td>${m_id }</td>
    	</tr>
    	<tr>
    		<td class="text">비밀번호</td>
    		<td><input type="password" name="m_pw" value="${m_pw}" required="required"></td>
    	</tr>
    	<tr>
    		<td class="text">비밀번호 확인</td>
    		<td><input type="password" name="m_pw2" value="${m_pw}" required="required"></td>
    	</tr>
    	<tr>
    		<td class="text">이름</td>
    		<td><input type="text" name="m_name" value="${m_name}" required="required"></td>
    	</tr>
    	<tr>
    		<td class="text">성별</td>
    		<td><input type="text" name="m_sex" value="${m_sex }" required="required"></td>
    	</tr>    	    	
    	<tr>
    		<td class="text">이메일</td>
    		<td><input type="email" name="mail" value="${mail }" required="required"></td>
    	</tr>
    	<tr>
    		<td>닉네임</td>
    		<td><input type="text" name="m_nickname" value="${m_nickname }" required="required"></td>
    	</tr>
    	<tr>
    		<td>학교</td>
    		<td><input type="text" name="college" value="${college}" required="required"></td>
    	</tr>
    	<tr>
    		<td>전공</td>
    		<td><input type="text" name="major" value="${major }" required="required"></td>
    	</tr>
    	<tr>
    		<td>군벌</td>
    		<td><input type="text" name="millitary" value="${millitary }" required="required"></td>
    	</tr>
    	<tr>
    		<td>병과</td>
    		<td><input type="text" name="m_dept" value="${m_dept }" required="required"></td>
    	</tr>
    	</table>
    	<input type="submit" value="수정" class="btn">
    	<button type="button" onclick="location.href='main.do'" class="btn">취소</button>
    </form>
</div>    


	
		<h1>회원탈퇴</h1>
		<form action = "delete.do?m_num=${m_num }"  name="frm"  onsubmit="return chk()">
			<input type="hidden" name="m_num" value="${m_num }" >
			<input type="submit" value="회원탈퇴" >
		</form> 
		
</div>
</div>
</body>
</html>