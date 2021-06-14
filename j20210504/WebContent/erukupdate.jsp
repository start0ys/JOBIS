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
<style>
	table {
  		border-collapse: separate;
 		border-spacing: 0 10px;
	}
</style>
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
			<div style="margin: 30px; margin-top: 30px;">
			<div style="margin: 30px;">
			</div>
				<form action="erUpdatePro.do" method="post" enctype="multipart/form-data">
					<h1>이력서</h1>
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
			</div>	
		</div>
	</div>
	
	<script type="text/javascript">
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
	</script>
</body>
</html>