<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./style_join.css">
<title>JOBIS</title>
</head>
<body>
<!-- header -->
        <div id="header">
            <a href="#" target="_blank" title="메인페이지로 이동"><img src="images/main.png" id="logo"></a>
        </div>
		<form action="join.do" method="post" id="join">
        <!-- wrapper -->
	        <div id="wrapper">
	
	            <!-- content-->
	            <div id="content">
	
	                <!-- ID -->
	                <div>
	                    <h3 class="join_title">
	                        <label for="id">아이디</label>
	                        <input type="button" id="chkid" value="중복확인" onclick="checkId()">
	                    </h3>
	                    <span class="box int_id">
	                        <input type="text" id="id" class="int" name="id" maxlength="20" required="required" onchange="rqDpId()">
	                        <input type="hidden" name="idDuplication" value="idUncheck">
	                    </span>
	                    <span class="error_next_box"></span>
	                </div>
	
	                <!-- PW1 -->
	                <div>
	                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
	                    <span class="box int_pass">
	                        <input type="text" id="pswd1" class="int" name="pw" maxlength="20" required="required">
	                    </span>
	                </div>
	
	                <!-- PW2 -->
	                <div>
	                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
	                    <span class="box int_pass_check">
	                        <input type="text" id="pswd2" class="int" name="chpw" maxlength="20" required="required" onchange="comparePw()">
	                    </span>
	                    <span class="error_next_box"></span>
	                </div>
	
	                <!-- NAME -->
	                <div>
	                    <h3 class="join_title"><label for="name">이름</label></h3>
	                    <span class="box int_name">
	                        <input type="text" id="name" class="int" name="name" maxlength="20" required="required">
	                    </span>
	                </div>
	
	                <!-- BIRTH -->
	                <div>
	                    <h3 class="join_title"><label for="birth">생년월일</label></h3>
						<span class="box int_birth">
	                        <input type="date" id="birth" class="int" name="birth" maxlength="20" required="required">
	                    </span>                  
	                </div>
	
	                <!-- GENDER -->
	                <div>
	                    <h3 class="join_title"><label for="gender">성별</label></h3>
	                    <span class="box gender_code">
	                        <select id="gender" class="sel" name="gender" required="required">
	                            <option disabled="disabled" selected="selected">성별</option>
	                            <option value="M">남자</option>
	                            <option value="F">여자</option>
	                        </select>                            
	                    </span>
	                </div>
	                
	                <!-- JOB -->
	                <div>
	                    <h3 class="join_title"><label for="nickname">닉네임</label></h3>
	                    <span class="box job_code">
	                        <select id="job" class="sel" name="job" required="required">
	                            <option disabled="disabled" selected="selected">취업여부</option>
	                            <option value="[취업자]">취업자</option>
	                            <option value="[취준생]">취준생</option>
	                        </select>                            
	                    </span>
	                    <span class="box int_nickname">
	                        <input type="text" id="nickname" class="int" name="nickname" maxlength="20" required="required">
	                    </span>
	                </div>
	
	                <!-- EMAIL -->
	                <div>
	                    <h3 class="join_title"><label for="email">이메일</label></h3>
	                    <span class="box int_email">
	                        <input type="email" id="email" class="int" name="email" maxlength="100">
	                    </span>   
	                </div>
	
	                <!-- JOIN BTN-->
	                <div class="btn_area">
	                	<input type="submit" id="btnJoin" value="가입하기">  
	                </div>
	
	                
	
	            </div> 
	            <!-- content-->
	
	        </div> 
        <!-- wrapper -->
		</form>
<script type="text/javascript">
var error = document.getElementsByClassName('error_next_box');
var birth = document.getElementById('birth');
birth.max = new Date().toISOString().split("T")[0];
var httpRequest = null;

//httpRequest 객체 생성
function getXMLHttpRequest(){
 var httpRequest = null;

 if(window.ActiveXObject){
     try{
         httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
     } catch(e) {
         try{
             httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
         } catch (e2) { httpRequest = null; }
     }
 }
 else if(window.XMLHttpRequest){
     httpRequest = new window.XMLHttpRequest();
 }
 return httpRequest;    
}

function checkId() {
	var id = document.getElementById("id").value; 
	if (!id) {
	 		 	 
		error[0].innerHTML ="아이디를 입력하지 않았습니다.";
		error[0].style.display = "block";
        return false;
     } else {
    	 httpRequest = getXMLHttpRequest();
         httpRequest.onreadystatechange = callback;
         httpRequest.open("POST", "joinIdChk.do", true);    
         httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
         httpRequest.send("id="+id);
         }  
}

function callback(){
         if(httpRequest.readyState == 4){
             // 결과값을 가져온다.
             var result = httpRequest.responseText;
             if(result == 0){
            	 error[0].innerHTML = "사용할수없는 아이디입니다.";
            	 error[0].style.display = "block";
             } 
             else if(result == 1){ 
            	 error[0].innerHTML = "사용가능한 아이디입니다."
            	 error[0].style.color = "#08A600";
            	 error[0].style.display = "block";
             }
         }
     }
function comparePw() {
	var pw1 = document.getElementById('pswd1').value;
	var pw2 = document.getElementById('pswd2').value;
    if(pw2 == pw1) {
    	error[1].innerHTML = "비밀번호가 일치합니다.";
    	error[1].style.color = "#08A600";
    	error[1].style.display = "block";
    } else if(pw2 != pw1) {
    	error[1].innerHTML = "비밀번호가 일치하지 않습니다.";
    	error[1].style.display = "block";
    } 
}
</script>	
</body>
</html>