<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="erukwritePro.do" method="post">
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
					
					
</body>
</html>