<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
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
		
		
	
		
		<div style="width: 90%; margin: 0 auto; margin-top:30px; color:black; border: 2px solid #4d6083;">
			<div style="margin: 0 auto; margin:35px 0 70px 0; text-align: center;">
					<h1>이력서</h1>
					<table>
						<tr><td><input type="hidden" name="m_num" value="${m_num }"></td></tr>
						<tr><td colspan="3"><h2>기본정보</h2></td></tr>
						<tr><th>이름</th><td>${erboard.m_name }</td>
						<td rowspan="2">
							<c:if test="${not empty erboard.photo }">
								<img width="200" height="200" src="${erboard.photo }">
							</c:if></td></tr>
						<tr><th>이메일</th><td>${erboard.mail }</td></tr>
						<tr><th>기타사항</th><td>${erboard.additions }</td></tr>
						<tr><td colspan="3"><h2>학력</h2></td></tr>
						<tr><th>학교</th><td>${erboard.college }</td></tr>
						<tr><th>전공</th><td>${erboard.major }</td></tr>
						<tr><th>기간</th><td>${erboard.date1 }~${erboard.date2 }</td>
						<tr><th>학점</th><td>${erboard.credit }</td>
						<tr><td colspan="3"><h2>병역</h2></td></tr>
						<tr><th>군벌</th><td>${erboard.millitary }</td></tr>
						<tr><th>병과</th><td>${erboard.m_dept }</td></tr>
						<tr><th>계급</th><td>${erboard.m_class }</td></tr>
						<tr><th>기간</th><td>${erboard.m_date1 }~${erboard.m_date2 }</td></tr>
						<tr><td colspan="3"><h2>경력</h2></td></tr>
						<tr><th>회사</th><td>${erboard.ename }</td></tr>
						<tr><th>기간</th><td>${erboard.edate1 }~${erboard.edate2 }</td></tr>
						<tr><th>직무</th><td>${erboard.ejob }</td></tr>
						<tr><th>기타사항</th><td>${erboard.econtent }</td></tr>
						<tr><td colspan="3"><h2>대외활동</h2></td></tr>
						<tr><th>활동명</th><td>${erboard.aname }</td></tr>
						<tr><th>기간</th><td>${erboard.adate1 }~${erboard.adate2 }</td></tr>
						<tr><td colspan="3">기타사항</td><td>${erboard.acontent }</td></tr>
						<tr><th colspan="3"><h2>어학성적</h2></td></tr>
						<tr><th>시험명</th><td>${erboard.tname }</td></tr>
						<tr><th>취득날짜</th><td>${erboard.tdate }</td></tr>
						<tr><th>점수</td><th>${erboard.tscore }</td></tr>
						<tr><th>수험번호</th><td>${erboard.tnumber }</td></tr>
						<tr><td colspan="3"><h2>자격증</h2></td></tr>
						<tr><td>자격증명</th><td>${erboard.lname }</td></tr>
						<tr><td>자격증번호</th><td>${erboard.col }</td></tr>
						<tr><td>발급기관</th><td>${erboard.ldept }</td></tr>
						<tr><td>취득날짜</th><td>${erboard.ldate }</td></tr>
						<tr><td colspan="3"><h2>수상</h2></td></tr>
						<tr><th>대회명</td><th>${erboard.pname }</td></tr>
						<tr><th>상</td><th>${erboard.price }</td></tr>
						<tr><th>상일련번호</th><td>${erboard.p_id }</td></tr>
						<tr><th>수상기관</th><td>${erboard.pdept }</td></tr>
						<tr><th>수상날짜</th><td>${erboard.pdate }</td></tr>
						<tr><th>기타사항</th><td>${erboard.pcontent }</td></tr>
						<%-- <tr><td><a href="erWriteForm.do?m_num=${m_num }">작성하기</a></td></tr> --%>
						<tr><td><a href="erUpdateForm.do?m_num=${m_num }">수정하기</a></td></tr>
					</table>
			</div>	
		</div>
	</div>
</body>
</html>