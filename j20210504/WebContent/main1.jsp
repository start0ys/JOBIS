<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html lang="en">
<title>JOBIS</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
.w3-sidebar {
  z-index: 3;
  width: 250px;
  top: 43px;
  bottom: 0;
  height: inherit;
}
#Community {float: right;}
#Company {float: right;}
BODY {
    FONT-SIZE: 9pt; FONT-FAMILY: tahoma
}
TABLE {
    FONT-SIZE: 9pt; COLOR: black; FONT-FAMILY: tahoma
}
A {
    COLOR: #103740; TEXT-DECORATION: none
}
A:hover {
    COLOR: #F2B705; TEXT-DECORATION: none
}
TD.main {
    FONT-WEIGHT: bold; TEXT-ALIGN: right
}
TD.uline {
    FONT-SIZE: 7pt; COLOR: #999999; BACKGROUND-COLOR: #ffffff
}
TD.r_uline {
    FONT-SIZE: 7pt; COLOR: #999999; BACKGROUND-COLOR: #f4f4f4
}
INPUT {
    MARGIN: -5px
}
#down {float: right;}
</style>
<script type="text/javascript">
function cWrite() {	
	var w = (window.screen.width/2) - 200;
	var h = (window.screen.height/2) - 200;
	var url = "cwriteView.do";
	window.open(url,"cPlanWrite","width=400,height=400,left="+w+",top="+h);
}
function dWrite(y,m,d){
	var w = (window.screen.width/2) - 200;
	var h = (window.screen.height/2) - 200;
	var url = "cpForm.do?curYear="+y+"&curMonth="+m+"&curDay="+d;
	window.open(url,"cPlanList","width=400,height=400,left="+w+",top="+h);
}
</script>
<c:set var="type"        value="${type}"/>
<c:set var="curYear"    value="${curYear}"/>
<c:set var="curMonth"    value="${curMonth}"/>
<c:set var="curDay"        value="${curDay}"/>
<body>

<!-- Navbar -->
<div class="w3-top">
  <div class="w3-bar w3-theme w3-top w3-left-align w3-large">
  <div><a class="w3-bar-item w3-button w3-right w3-hide-large w3-hover-white w3-large w3-theme-l1" href="javascript:void(0)" onclick="w3_open()"><i class="fa fa-bars"></i></a></div>
  <div><a href="index.do" class="w3-bar-item w3-button w3-theme-l1">JOBIS</a></div>
  <div id="Community"><a href="logout.do" class="w3-bar-item w3-button w3-hide-small w3-hover-white">LogOut</a></div>
  <c:if test="${not empty m_nickname}">
 	<div id="Company"><span class="w3-bar-item w3-button w3-hide-small w3-hover-white"><small>????${m_nickname } ??? ???????????????.</small></span></div>
  </c:if>  
  </div>
</div>

<!-- Sidebar -->
<nav class="w3-sidebar w3-bar-block w3-collapse w3-large w3-theme-l5 w3-animate-left" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-right w3-xlarge w3-padding-large w3-hover-black w3-hide-large" title="Close Menu">
    <i class="fa fa-remove"></i>
  </a>
  <c:if test="${m_num == 0 }">
  	<h4 class="w3-bar-item"><b>Administrator Page</b></h4>
	<a class="w3-bar-item w3-button w3-hover-black" href="aduserlist.do">??????????????????</a>
	<a class="w3-bar-item w3-button w3-hover-black" href="main.do">????????????</a>
  </c:if>
  <c:if test="${m_num > 0 }">
	  <h4 class="w3-bar-item"><b>My Page</b></h4>
	  <a class="w3-bar-item w3-button w3-hover-black" href="main.do">????????????</a>
	  <a class="w3-bar-item w3-button w3-hover-black" href="erContent.do">???????????????</a>
	  <a onclick="listFunc1()" href="javascript:void(0)" class="w3-bar-item w3-button w3-hover-black">??????????????? <i class="fa fa-caret-down" id="down"></i>
	</a>
	<div id="list1" class="w3-bar-block w3-hide w3-padding-large w3-medium">
	  <a href="SewriteForm.do" class="w3-bar-item w3-button w3-light-grey">??????????????? ??????</a>
	  <a href="myse.do" class="w3-bar-item w3-button">??????????????? ??????</a>
	</div>  
	  <a onclick="listFunc2()" href="javascript:void(0)" class="w3-bar-item w3-button w3-hover-black">??? ???????????? <i class="fa fa-caret-down" id="down"></i>
	</a>
	<div id="list2" class="w3-bar-block w3-hide w3-padding-large w3-medium">
	  <a href="updatePage.do" class="w3-bar-item w3-button w3-light-grey">????????????</a>
	  <a href="myboard.do?search=${m_num}" class="w3-bar-item w3-button">????????? ????????? ??????</a>
	</div>  
</c:if> 
 <h4 class="w3-bar-item"><b>Community</b></h4> 
 <a class="w3-bar-item w3-button w3-hover-black" href="board.do?b_type=0">???????????????</a>
 <a class="w3-bar-item w3-button w3-hover-black" href="board.do?b_type=1">Q&A?????????</a>
 <a class="w3-bar-item w3-button w3-hover-black" href="board.do?b_type=2">???????????????</a>
 <h4 class="w3-bar-item"><b>Company Info</b></h4>
<a onclick="listFunc3()" href="javascript:void(0)" class="w3-bar-item w3-button w3-hover-black">?????? ????????????<i class="fa fa-caret-down" id="down"></i></a>
 <div id="list3" class="w3-bar-block w3-hide w3-padding-large w3-medium">
  <a href="mycom.do?comType=1" class="w3-bar-item w3-button w3-light-grey">??????</a>
  <a href="mycom.do?comType=2" class="w3-bar-item w3-button w3-light-grey">??????</a>
  <a href="mycom.do?comType=3" class="w3-bar-item w3-button w3-light-grey">????????? ??????</a>
  <a href="mycom.do?comType=4" class="w3-bar-item w3-button w3-light-grey">??????</a>
  <a href="mycom.do?comType=5" class="w3-bar-item w3-button w3-light-grey">?????????</a>
  <a href="mycom.do?comType=6" class="w3-bar-item w3-button w3-light-grey">??????</a>
  <a href="mycom.do?comType=7" class="w3-bar-item w3-button w3-light-grey">?????????</a>
  <a href="mycom.do?comType=8" class="w3-bar-item w3-button w3-light-grey">????????????</a>
</div> 
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:250px;"> 

  <div class="w3-row w3-padding-64">
    <div class="w3-twothird w3-container" style="margin-left: 44px; margin-top: 18px; width: 85%;">
      <h1 class="w3-text-teal">??????  <a href="javascript:cWrite()"><i class="fa fa-pencil-square-o" ></i></a></h1>
      <div style="margin:0 auto">
<FORM name="theForm">
<%-- base table --%>
<TABLE cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff" width="800" height="650">
    <TR>
          <TD align="center" width="365" style="font-size: 15pt">
              <A href="main.do?type=MONTH&curYear=<c:out value="${curYear}"/>&curMonth=<c:out value="${curMonth-1}"/>&curDay=<c:out value="${curDay}"/>">???</a>
                  <c:out value="${curYear}"/> ??? &nbsp;&nbsp;  <c:out value="${curMonth}"/> ??? 
              <A href="main.do?type=MONTH&curYear=<c:out value="${curYear}"/>&curMonth=<c:out value="${curMonth+1}"/>&curDay=<c:out value="${curDay}"/>">???</a>
          </TD>
    </TR>
    <TR height="3">
        <TD colspan="2"></TD>
    </TR>
    <TR>
          <TD align="center" colspan="3" valign="top">
          <%-- body table --%>
          <TABLE border="0" cellspacing="0" cellpadding="0">
              <TR>
                  <TD valign="top" style="border:#666666 1px solid; padding:5px" align="center">
                  <%-- month outline table --%>
                    <TABLE border="0" cellspacing="0" cellpadding="0">
                    <TR height="30">
                        <TD align=center>
                            <FONT color=red>?????????</FONT>
                        </TD>
                        <TD align=center width="110">?????????</TD>
                        <TD align=center width="110">?????????</TD>
                        <TD align=center width="110">?????????</TD>
                        <TD align=center width="110">?????????</TD>
                        <TD align=center width="110">?????????</TD>
                        <TD align=center width="110">?????????</TD>
                    </TR>
                    <TR><TD colspan=7 bgcolor=#888888 height=1></TD></TR>
                    <TR><TD colspan=7 bgcolor=#ffffff height=5></TD></TR>
                    <TR>
                          <TD colspan=7>
                          <%-- month content table --%>
                          <TABLE border='0' cellspacing='1' cellpadding='0' bgcolor=#dddddd>
                              <TR>
                                <c:if test="${firstDayOfWeek != '1'}">
                                  <%-- ?????? ?????? ?????? ???????????? ?????? ??????????????? ????????? ????????????.--%>
                                  <c:forEach var="i" begin="1" end="${firstDayOfWeek-1}">
                                    <TD width="110" height="120" class="uline" valign="top" align="right" style="padding:5">
                                    </TD>
                                </c:forEach>
                                </c:if>
                                
                                <%-- ??? ?????? ???????????? ????????? ????????? ??????(??????)??? ???????????? --%>
                                <c:set var="dbIndex" value="0"/>
                                  <c:forEach var="currentDay" begin="1" end="${lastDayOfMonth}">                                    
                                    <TD bgcolor="#ffffff" style="padding:5; cursor: pointer;" onclick='dWrite("${curYear}","${curMonth}","${currentDay}")'>
                                        <TABLE cellpadding="0" cellsping="0" border="0" width="110">
                                        <TR>
                                            <TD height="10" width="110" class="uline" valign="top" align="right">
                                            <%-- <A href='javascript:dWrite("${curYear}","${curMonth}","${currentDay}")'> --%>
                                                <!-- ????????? -->
                                                <%-- <c:if test="${((currentDay-(8-firstDayOfWeek)) % 7) == 1}">
                                                    <FONT color="red">                                                    
                                                        <c:out value="${currentDay}"/>
                                                    </FONT>
                                                </c:if>
                                                <c:if test="${((currentDay-(8-firstDayOfWeek)) % 7) != 1}">
                                                    <c:out value="${currentDay}"/>
                                                </c:if> --%>
                                                
                                                <c:choose>
                                                
                                                    <c:when test="${((currentDay-(8-firstDayOfWeek)) % 7) == 1}">
                                                        <!-- ????????? -->
                                                        <FONT color="red">                                                    
                                                            <c:out value="${currentDay}"/>  
                                                        </FONT>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:out value="${currentDay}"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            <!-- </A> -->                                            
                                            </TD>
                                        </TR> 
                                        <TR>
                                            <TD height="110" width="110" valign="top"> 
                                            <TABLE>
                                                <c:forEach var="dayIndex" items="${list}">
                                                    <c:if test="${currentDay == dayIndex.cal_date}">
                                                        <TR><TD>                                                        
                                                            <i class="fa fa-circle" style="color: ${dayIndex.cal_bgcolor};"></i>  ${dayIndex.cal_title}                                        
                                                        <c:set var="dbIndex" value='${dbIndex + 1}'/> 
                                                        </TD></TR>
                                                    </c:if>
                                                </c:forEach>
                                            </TABLE>
                                            </TD>
                                        </TR>
                                        </TABLE>        
                                    </TD>
                                    <%-- ?????? ????????? ????????????(?????????)?????? ??? ?????? ????????? ?????? ???????????? ?????? ?????? ????????????. --%>
                                    <c:if test="${((currentDay-(8-firstDayOfWeek)) % 7) == 0}">
                                        </TR>
                                        <TR>
                                    </c:if>
                                </c:forEach>

                                <%-- ?????? ?????? ?????? ????????? ?????? ?????? ??????????????? ????????? ????????????.--%>
                                <c:if test="${lastDayOfLastWeek != '7'}">
                                <c:forEach var="i" begin="1" end="${7-lastDayOfLastWeek}">
                                    <TD width=110 height=120 class=uline valign=top align=right style='padding:5'>
                                    </TD>
                                </c:forEach>
                                </c:if>                            
                            </TR>
                        </TABLE>
                        <%-- end month content table --%>
                        </TD>
                    </TR>
                  </TABLE>
                  <%-- end month outline table --%>
                  </TD>
            </TR>
        </TABLE>
        <%-- end body table --%>
        </TD>
    </TR>
      <TR height=10><TD></TD></TR>
    <TR>
        <TD align=right></TD>
    </TR>
</table>
<%-- end base table --%>
</FORM>
</div>	
      	
      	
    </div>
    
  </div>

 


<!-- END MAIN -->
</div>

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

function listFunc1() {
	  var x = document.getElementById("list1");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else {
	    x.className = x.className.replace(" w3-show", "");
	  }
	}
function listFunc2() {
	  var x = document.getElementById("list2");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else {
	    x.className = x.className.replace(" w3-show", "");
	  }
	}
function listFunc3() {
	  var x = document.getElementById("list3");
	  if (x.className.indexOf("w3-show") == -1) {
	    x.className += " w3-show";
	  } else {
	    x.className = x.className.replace(" w3-show", "");
	  }
	}

// Click on the "Jeans" link on page load to open the accordion for demo purposes //id="myBtn"
document.getElementById("myBtn").click();


// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>
</body>
</html>
    