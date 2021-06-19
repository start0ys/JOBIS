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
		
		
	
		
		<div style="width: 90%; margin: 0 auto; margin-top:30px; color:black; border: 2px solid #4d6083;">
			<div style="margin: 30px; margin-top: 30px;">
				<form action="erWritePro.do" method="post">
					<table>
						<tr><td colspan="4"><h1>이력서</h1></td></tr>
						<tr><td><input type="hidden" name="m_num" value="${m_num }"></td></tr>
						<tr><th>이름</th><td><input type="text" placeholder="이름" 
							name="m_name" id="m_name" required="required"></td></tr>
						<tr><th>이메일</th><td><input type="text"  placeholder="이메일" 
							name="mail" id="mail" required="required"></td></tr>
						<tr><th>추가사항</th><td colspan="6"><textarea placeholder="추가사항(전화번호/간단한 자기소개 등)" 
									style=" width:700px; height:100px;" name="additions" id="addiotions" 
									maxlength="4000" required="required"></textarea></td></tr>
						<tr><td><h3>학력</h3></td><td colspan="3"><input type="button" name="add1" value="추가"></td></tr>		
						<tr><th>학교</th><td><input type="text" placeholder="학교" 
								name="collage" id="collage"></td></tr>
						<tr><th>전공</th><td><input type="text" placeholder="전공" 
								name="major" id="major"></td></tr>
						<tr><th>기간</th><td><input type="text" placeholder="기간" 
								name="date1" id="date1"></td>
						<td>~</td>
						<td><input type="text" placeholder="기간" 
								name="date2" id="date2"></td></tr>
						<tr><th>학점</th><td colspan="6"><input type="text" placeholder="학점" 
								name="credit" id="credit"></td><td><input type="button" name="del1" value="삭제"></td></tr>
						<tr><td colspan="6"><h3>병역</h3></td></tr>
						<tr><th>군벌</th><td><input type="text" placeholder="군벌" 
								name="millitary" id="millitary"></td></tr>
						<tr><th>병과</th><td><input type="text" placeholder="병과" 
								name="m_dept" id="m_dept"></td></tr>
						<tr><th>계급</th><td><input type="text" placeholder="계급" 
								name="m_class" id="m_class"></td></tr>
						<tr><th>기간</th><td><input type="text" placeholder="기간" 
								name="m_date1" id="m_date1"></td>
						<td>~</td>
						<td><input type="text" placeholder="기간" 
								name="m_date2" id="m_date2"></td></tr>
						<tr><td><h3>경력</h3></td><td colspan="3"><input type="button" name="add2" value="추가"></td></tr>
						<tr><th>회사</th><td><input type="text" placeholder="회사" 
								name="ename" id="ename"></td></tr>
						<tr><th>근무기간</th><td><input type="text" placeholder="복무기간" 
								name="edate1" id="edate1"></td><td>~</td><td><input type="text" placeholder="복무기간" 
								name="edate2" id="edate2"></td></tr>
						<tr><th>직무</th><td><input type="text" placeholder="직무" 
								name="ejob" id="ejob"></td></tr>
						<tr><th>내용</th><td colspan="6">><textarea placeholder="내용" 
								style="width: 700px; height: 100px;" name="econtent" id="econtent" 
								maxlength="4000"></textarea></td><td><input type="button" name="del2" value="삭제"></td></tr>
						<tr><td><h3>대외활동</h3></td><td colspan="3"><input type="button" name="add3" value="추가"></td></tr>
						<tr><th>활동명</th><td><input type="text" placeholder="활동명" 
								name="aname" id="aname"></td></tr>
						<tr><th>활동기간</th><td><input type="text" placeholder="활동기간" 
								name="adate1" id="adate1"></td><td>~</td><td><input type="text" placeholder="활동기간" 
								name="adate2" id="adate2"></td></tr>
						<tr><th>내용</th><td colspan="6"><textarea placeholder="내용" 
								style="width: 700px; height: 100px;" name="acontent" id="acontent" 
								maxlength="4000"></textarea></td><td><input type="button" name="del3" value="삭제"></td>
						<tr><td><h3>어학성적</h3></td><td><input type="button" name="add4" value="추가"></td></tr>						
						<tr><th>시험명</th><td><input type="text" placeholder="시험명" 
								name="tname" id="tname"></td></tr>
						<tr><th>취득날짜</th><td><input type="text" placeholder="취득날짜" 
								name="tdate" id="tdate"></td></tr>
						<tr><th>점수</th><td><input type="text" placeholder="점수" 
								name="tscore" id="tscore"></td></tr>
						<tr><th>수험번호</th><td><input type="text" placeholder="수험번호" 
								name="tnumber" id="tnumber"></td>
							<td><input type="button" name="del4" value="삭제"></td></tr>
						<tr><td><h3>자격증</h3></td><td><input type="button" name="add5" value="추가"></td></tr>
						<tr><th>자격증명</th><td><input type="text" placeholder="자격증명" 
								name="iname" id="iname"></td></tr>
						<tr><th>자격증번호</th><td><input type="text" placeholder="자격증번호"
								name="COL" id="COL"></td></tr>
						<tr><th>발급기관</th><td><input type="text" placeholder="발급기관" 
								name="idept" id="idept"></td></tr>
						<tr><th>취득날짜</th><td><input type="text" placeholder="취득날짜" 
								name="idate" id="idate"></td>
							<td><input type="button" name="del5" value="삭제"></td></tr>
						<tr><td><h3>수상</h3></td><td><input type="button" name="add6" value="추가"></td></tr>
						<tr><th>대회명</th><td><input type="text" placeholder="대회명" 
								name="pname" id="pname"></td></tr>
						<tr><th>상</th><td><input type="text" placeholder="상" 
								name="price" id="price"></td></tr>
						<tr><th>상일련번호</th><td><input type="text" placeholder="상일련번호"
								name="p_id" id="p_id"></td></tr>
						<tr><th>수상기관</th><td><input type="text" placeholder="수상기관" 
								name="pdept" id="pdept"></td></tr>
						<tr><th>수상날짜</th><td><input type="text" placeholder="수상날짜" 
								name="pdate" id="pdate"></td></tr>
						<tr><th>수상내용</th><td colspan="6"><textarea placeholder="수상내용" 
								style="width: 700px; height: 100px;" name="pcontent" id="pcontent" 
								maxlength="4000"></textarea></td>
							<td><input type="button" name="del6" value="삭제"></td></tr>
						<tr><td><input type="submit" value="저장하기"></td></tr>
						<tr><td><input type="reset" value="다시작성"></td></tr>
					</table>				
				</form>
			</div>	
		</div>
	</div>
</body>
</html>