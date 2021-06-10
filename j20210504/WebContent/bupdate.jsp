<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOBIS</title>
<link rel="stylesheet" type="text/css" href="commons.css">
<link rel="stylesheet" type="text/css" href="headerss.css?ver4">
<link rel="stylesheet" type="text/css" href="menus.css">
<style type="text/css">
	textarea{
		width: 90%;
		resize: none;
	}
	.fileBox .fileName {
		display:inline-block;
		width:170px;
		height:30px;
		padding-left:10px;
		margin-right:5px;
		line-height:30px;
		border:1px solid #aaa;
		background-color:#fff;
		vertical-align:middle;
		border-radius: 10px;
	}
	.fileBox .btn_file {
		display:inline-block;
		border:1px solid #000;
		width:100px;
		height:30px;
		font-size:0.8em;
		line-height:30px;
		text-align:center;
		vertical-align:middle;
		border: 1 solid white;
		background-color: #203864;
		color:white;
		border-radius: 10px;
	}
	.fileBox input[type="file"] {
		position:absolute;
		width:1px;
		height:1px;
		padding:0;
		margin:-1px;
		overflow:hidden;
		clip:rect(0,0,0,0);
		border:0
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
			<div style="margin: 0 auto; margin:35px 0 70px 0; text-align: center; margin: 0 auto;">
				<div style="margin: 50px 0px;">
					<form action="bupdatePro.do" method="post" enctype="multipart/form-data">
						<input type="hidden" name="pageNum" value="${pageNum }">
						<input type="hidden" name="m_num" value="${board.m_num }">
						<input type="hidden" name="b_idx" value="${board.b_idx }">
						<input type="hidden" name="b_type" value="${b_type }">
						<input type="hidden" name="m_nickname" value="${board.m_nickname }">
						<input type="hidden" name="filedel" value="0" id="filedel">
						
						<c:if test="${b_type == 0 }">
							<select name="t_type" style="height: 40px;width: 10%;">
								<option value="${fn:substringBefore(board.b_title, ']')}]" selected="selected">${fn:substringBefore(fn:substringAfter(board.b_title, '['), ']')}</option>
								<option value="[면접후기]">면접후기</option>
								<option value="[합격후기]">합격후기</option>
							</select>
							<input type="text" placeholder="글 제목" name="b_title" id="b_title" maxlength="50" style="height:40px; width: 80%; margin-bottom: 20px;" required="required" value="${fn:substringAfter(board.b_title, ']')}"><p>
						<pre><textarea  placeholder="글 내용" name="b_content" id="b_content" maxlength="4000" style="height:350px;" required="required">${board.b_content }</textarea></pre><p>
						</c:if>
						<c:if test="${b_type == 1 }">
							<select name="t_type" style="height: 40px;width: 10%;">
								<option value="${fn:substringBefore(board.b_title, ']')}]" selected="selected">${fn:substringBefore(fn:substringAfter(board.b_title, '['), ']')}</option>
								<option value="[스펙]">스펙</option>
								<option value="[이직]">이직</option>
								<option value="[국비]">국비</option>
								<option value="[자격증]">자격증</option>
								<option value="[대외활동]">대외활동</option>
								<option value="[이것저것]">이것저것</option>
							</select>
							<input type="text" placeholder="글 제목" name="b_title" id="b_title" maxlength="50" style="height:40px; width: 80%; margin-bottom: 20px;" required="required" value="${fn:substringAfter(board.b_title, ']')}"><p>
							<pre><textarea  placeholder="글 내용" name="b_content" id="b_content" maxlength="4000" style="height:350px;" required="required">${board.b_content }</textarea></pre><p>
						</c:if>
						<c:if test="${b_type == 2 }">
							<input type="text" placeholder="글 제목" name="b_title" id="b_title" maxlength="50" style="height:40px; width: 90%; margin-bottom: 20px;" required="required" value="${board.b_title }"><p>
							<pre><textarea  placeholder="글 내용" name="b_content" id="b_content" maxlength="4000" style="height:350px;" required="required">${board.b_content }</textarea></pre><p>
						</c:if>
						<div class="fileBox" style="position: absolute; right: 17%;">
							<input type="text" class="fileName" readonly="readonly" value="${board.b_img }">
							<label for="uploadBtn" class="btn_file">업로드 수정</label>
							<input type="file" id="uploadBtn" class="uploadBtn" name="uploadFile">
							<input type="button" class="btn" value="삭제" onclick="fd()">
						</div>
						<div style="position: absolute; left: 17%;"><input type="submit" value="수정하기" class="btn"></div>
					</form>
				</div>
			</div>	
		</div>
	</div>
	
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		var uploadFile = $('.fileBox .uploadBtn');
		uploadFile.on('change', function(){
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$(this).siblings('.fileName').val(filename);
			$('#filedel').val('1');
		});
	 	function fd() {
			$('.fileName').val(''); 
			$('#filedel').val('2');
		} 
	</script>
	
	
</body>
</html>