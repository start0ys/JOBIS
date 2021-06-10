<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<head>
<meta charset="UTF-8">
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
<style type="text/css">
	textarea{
		width: 90%;
		resize: none;
	}
</style>
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
<link rel="stylesheet" type="text/css" href="commons.css">
<link rel="stylesheet" type="text/css" href="headerss.css?ver4">
<link rel="stylesheet" type="text/css" href="menus.css">
</head>
<body>
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

		<div  style="width: 90%; margin: 0 auto; margin-top:30px; color:black; border: 2px solid #4d6083;">
			<div style="margin: 0 auto; margin:35px 0 70px 0; text-align: center;">
	<form action="SewritePro.do?pageNum=${pageNum}" method="post">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="m_nickname" value="${m_nickname }">
		<input type="hidden" name="m_num" value="${m_num }">
		<input type="hidden" name="s_idx" value="0">
		
		<table border="1" style="text-align: center; background-color:#838ea3; margin: 0 auto; width: 70%">
			<caption><h2>자기소개서 작성</h2></caption>
			<tr>
				<td>공개여부</td>
				<td>
					<input type="checkbox" name="s_type" value="1" onclick="checkOnlyOne(this)">공개 
					<input type="checkbox" name="s_type" value="0" onclick="checkOnlyOne(this)">비공개
				</td>
			</tr>
			<tr><td>회사이름</td><td><input type="text" placeholder="회사이름" name="s_companyname" maxlength="50" style="height:40px; width: 90%; margin-bottom: 20px;" required="required"></td></tr>
			<tr><td>내용작성</td><td><textarea placeholder="내용작성" name="s_content" id="s_content" maxlength="4000" style="height:350px;" onKeyUp="javascript:fnChkByte(this,'4000')" required="required"></textarea>
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
			</div>	
		</div>
	</div>
</body>
</html>