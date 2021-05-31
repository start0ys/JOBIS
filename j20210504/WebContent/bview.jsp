<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
<link rel="stylesheet" type="text/css" href="menus.css">
<style type="text/css">
	.hiddenText {
   		display: none;

	}
</style>
<script type="text/javascript">
	var b = "a";
	function re(id) {
		var content2 = document.getElementById(b);
        content2.style.display = "none";
		var a = "a" + id;
		var content = document.getElementById(a);
        content.style.display = "block";
		b=a;
	}
	function del() {
		const del =  confirm("해당 게시글을 삭제하시겠습니까?");
		if(del){
			location.href='delete.do?b_idx=${board.b_idx }&pageNum=${pageNum }';
		}
	}
	function redel(id) {
		const redel =  confirm("해당 댓글을 삭제하시겠습니까?");
		var c_idx = id;
		if(redel){
			location.href='reDelete.do?c_idx='+c_idx+'&pageNum=${pageNum }&b_idx=${board.b_idx }';
		}
	}
	
	function remd(id) {
		var c_idx = id;
		window.open("reUpdate.do?c_idx="+c_idx,"","width=500 height=300");
	}
	
</script>
</head>

<body>
	<div id="a"></div>  <!-- 답변 글쓰기 form을 보였다가 안보였다가 할때  자바스크립트의 re()에서 사용하기위한 id="a"태그  -->

	${m_nickname }님 반갑습니다.
	<ul>
	    <li>
	        <span class="menu">커뮤니티</span>
	        <ul class="subMenu">
	            <li><input type="button" value="면접게시판" onclick="location.href = 'board.do?b_type=0'"></li>
	            <li><input type="button" value="Q&A게시판" onclick="location.href = 'board.do?b_type=1'"></li>
	            <li><input type="button" value="자유게시판" onclick="location.href = 'board.do?b_type=2'"></li>
	
	        </ul>
	    </li>
	
	</ul>
	<script src="menu.js"></script>


	<h2>${board.b_title }</h2>

	<span>👤${board.m_nickname }</span>
	<span>조회수 : ${board.b_count }</span>
	<span>${board.b_regdate }</span>

	
	<c:if test="${board.m_num == m_num }">
		<input type="button" value="수정" onclick="location.href='update.do?b_idx=${board.b_idx }&pageNum=${pageNum }'">
		<input type="button" value="삭제" onclick="del()">
	</c:if>
	<div>
		${content }
	</div>
	
	<!-- ----------------------------댓글---------------------------------- -->
	<div style="margin: 50px 0 ;">-----------------------댓글 테스트-------------------------------------</div>

	<c:forEach var="comment" items="${list }">
		<c:if test="${comment.re_level > 0 }">
			<img src="images/level.gif" width="${comment.re_level*10 }">
			<img src="images/re.gif">
		</c:if>
		<span>👤${comment.nickname }</span>
		<div style="margin-left: ${comment.re_level*15 }px; ">
			<div>${comment.c_content }</div>
			<div>${comment.c_regdate }</div>
		    <input type="button" value="답글" onclick="re(${comment.c_idx})">
			<c:if test="${comment.m_num == m_num }">
				<input type="button" value="삭제" onclick="redel(${comment.c_idx })">
				<input type="button" value="수정" onclick="remd(${comment.c_idx })">
			</c:if>
		
			<div class="hiddenText" id="a${comment.c_idx }">
				<form action="reWrite.do?pageNum=${pageNum }" method="post" name="frm1" id="frm1">
					<input type="hidden" name="m_nickname" value="${m_nickname }">
					<input type="hidden" name="m_num" value="${m_num }">
					<input type="hidden" name="b_idx" value="${board.b_idx }">
					<input type="hidden" name="c_idx" value="${comment.c_idx }">
					<input type="hidden" name="ref" value="${comment.ref }">
					<input type="hidden" name="re_level" value="${comment.re_level }">
					<input type="hidden" name="re_step" value="${comment.re_step }">
			       	<img src="images/re.gif">
					<div>👤${m_nickname }</div>
					<div><textarea name="c_content" id="c_content" maxlength="2000" style="height:100px;" required="required"
					                 placeholder="댓글을 입력해주세요"></textarea></div>
					<div><input type="submit" value="등록"></div>
				 </form>
			</div>	     
		</div>
	</c:forEach>


	

	<form action="reWrite.do?pageNum=${pageNum }" method="post" name="frm2">
		<input type="hidden" name="m_nickname" value="${m_nickname }">
		<input type="hidden" name="m_num" value="${m_num }">
		<input type="hidden" name="b_idx" value="${board.b_idx }">
		<input type="hidden" name="c_idx" value="${c_idx }">
		<input type="hidden" name="ref" value="${ref }">
		<input type="hidden" name="re_level" value="${re_level }">
		<input type="hidden" name="re_step" value="${re_step }">

		<div>👤${m_nickname }</div>
	    <textarea name="c_content" id="c_content" maxlength="2000" style="height:100px;" required="required"
	                               placeholder="댓글을 입력해주세요"></textarea>        
	    <input type="submit" value="등록">
	
	</form>

</body>
</html>