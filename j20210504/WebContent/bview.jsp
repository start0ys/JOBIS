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
<style type="text/css">
	.hiddenText {
   		display: none;

	}
	textarea{
		width: 90%;
		resize: none;
	}
	.btn1{
		background-color: white;
		border: 0;
		font-weight: bold;
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
		var popupX = (document.body.offsetWidth / 2) - (200 / 2);
		//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
		var popupY= (window.screen.height / 2) - (300 / 2);
		//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
		var c_idx = id;
		window.open("reUpdate.do?c_idx="+c_idx,"","width=500,height=300, left="+ popupX + ", top="+ popupY);
	}
	
</script>
</head>
<body>
	<div id="a"></div>  <!-- 답변 글쓰기 form을 보였다가 안보였다가 할때  자바스크립트의 re()에서 사용하기위한 id="a"태그  -->
	<div id="wrapper">
		<header>
		
			<!------ 밑의 a태그의 #부분에는 소연님이 메인페이지 만들어주시면 메인페이지.do를 넣어주면됩니다.--- -->
			
		   <a href="#"><img id="logo" src="images/main.png" width="240px" height="90"></a>
		
		
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
			            <li><input type="button" value="삼성"></li>
			            <li><input type="button" value="쿠팡"></li>
			            <li><input type="button" value="배달의 민족"></li>
			            <li><input type="button" value="라인"></li>
			            <li><input type="button" value="카카오"></li>
			            <li><input type="button" value="토스"></li>
			            <li><input type="button" value="네이버"></li>
			            <li><input type="button" value="당근마켓"></li>
		        	</ul>
			    </li>
			    <li class="menu1" id="mymenu"><a >마이페이지</a></li>
			  
			  </ul>
			  
			  <div id="log">
			  	  <span style="margin-right: 5px; font-size: 14px; font-weight: bold;">👤${m_nickname } 님 반갑습니다.</span>
				  <input type="button" value="로그아웃" class="btn">
			  </div>
			
			</nav>
		</header>  
		<script src="menu.js"></script>
		
		
	
		
		<div style="width: 90%; margin: 0 auto; margin-top:30px; color:black; border: 2px solid #4d6083;">
			<div style="margin: 0 auto; margin:35px 0 70px 0; padding-left: 50px;">
				<h2>${board.b_title }</h2>
				<div style="margin-top: 10px;">
					<span>👤${board.m_nickname }</span>
				</div>
				<div style="border: 0; border-bottom: 2px solid #4d6083; width: 91%;">
					<span style=" font-size: 13px; color: gray;">${board.b_regdate }</span>
					<span style=" font-size: 13px; color: gray;">조회수 : ${board.b_count }</span>
					<span style=" font-size: 15px; color: gray; position: absolute; right: 20%;">댓글 <b>${c_tot }</b></span>
				</div>

				<div style="margin-top: 5px; position: absolute; right: 21%;">
					<c:if test="${board.m_num == m_num }">
						<input style="padding: 5px;" type="button" class="btn" value="수정" onclick="location.href='update.do?b_idx=${board.b_idx }&pageNum=${pageNum }'">
						<input style="padding: 5px;" type="button" class="btn" value="삭제" onclick="del()">
					</c:if>
				</div>
				<div style="margin: 20px 0 0 20px; width: 87%;">
					${content } 
				</div>
	
		
				<div style="margin-top: 123px;position: absolute; right: 20%;"><input style="padding: 5px;" class="btn" type="button" value="뒤로가기" onclick="history.go(-1);" ></div>
				<div style="margin-top: 160px; width: 91%; border-top: 2px dotted #4d6083;">
					<c:forEach var="comment" items="${list }">
						<c:if test="${comment.re_level > 0 }">
							<img src="images/level.gif" width="${comment.re_level*10 }">
							<img src="images/re.gif">
							<span style="margin: 11px 0 0 0;">👤${comment.nickname }</span>
						</c:if> 
						<c:if test="${comment.re_level == 0 }">
							<div style="margin: 11px 0 0 11px;">👤${comment.nickname }</div>
						</c:if> 
						<div style="margin-left: ${comment.re_level*15 }px; ">
							<div style="margin: 5px 0 0 11px;">${comment.c_content }</div>
							<div style="font-size: 13px; color: gray; margin: 0  0 5px 11px;">${comment.c_regdate }</div>
						    <div style="margin: 0  0 11px 0; border-bottom: 1px dotted;">
							    <input style="margin-left: 11px" class="btn1" type="button" value="답글" onclick="re(${comment.c_idx})">
								<c:if test="${comment.m_num == m_num }">
									<input class="btn1" type="button" value="수정" onclick="remd(${comment.c_idx })">
									<input class="btn1" type="button" value="삭제" onclick="redel(${comment.c_idx })">
								</c:if>
						    </div>
			
							<div class="hiddenText" id="a${comment.c_idx }">
								<form action="reWrite.do?pageNum=${pageNum }" method="post" name="frm1" id="frm1">
									<input type="hidden" name="m_nickname" value="${m_nickname }">
									<input type="hidden" name="m_num" value="${m_num }">
									<input type="hidden" name="b_idx" value="${board.b_idx }">
									<input type="hidden" name="c_idx" value="${comment.c_idx }">
									<input type="hidden" name="ref" value="${comment.ref }">
									<input type="hidden" name="re_level" value="${comment.re_level }">
									<input type="hidden" name="re_step" value="${comment.re_step }">
							       	<span><img src="images/re.gif"></span>
									<span style="margin: 11px 0 0 0;">👤${m_nickname }</span>
									<div style="margin: 11px 0 0 11px;"><textarea name="c_content" id="c_content" maxlength="2000" style="height:100px;" required="required"
									                 placeholder="댓글을 입력해주세요"></textarea></div>
									<div style="margin: 0  0 11px 11px;"><input style="padding: 5px;" class="btn" type="submit" value="등록"></div>
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
						<div style="border: 1px dotted #4d6083; ">
							<div style="margin: 11px 0 0 11px;">👤${m_nickname }</div>
						    <div style="margin: 20px 0 0 20px;"><textarea name="c_content" id="c_content" maxlength="2000" style="height:100px; border: 0px;" required="required"
					                               placeholder="댓글을 입력해주세요"></textarea></div>        
						    <div style="margin: 0  0 11px 11px; width: 43px; border: 1px dotted; padding: 5px; border-radius: 10px;"><input style="padding: 5px;" class="btn" type="submit" value="등록"></div>
						</div>
					
					</form>
				</div>
			</div>	
		</div>
	</div>
</body>
</html>