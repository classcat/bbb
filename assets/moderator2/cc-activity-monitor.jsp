<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
%>

<%@page import="org.w3c.dom.*"%>

<html>

<%-- ClassCat(R) WebConference v1.0                            --%>
<%-- Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved. --%>

<%-- 28-jan-15 : Add a scroll bar --%>
<%-- 25-Jan-15 : 0.9.0 Fixed. --%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会議室アクティビティ・モニタ [ClassCat&reg; WebConference]</title>
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/demo4/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/cc-activity-monitor.js"></script>
<script type="text/javascript" src="js/md5.js"></script>
<script type="text/javascript" src="js/jquery.xml2json.js"></script>
<style type="text/css">
.hiddenDiv {display:none;}
.hor-minimalist-b{font-family:"Lucida Sans Unicode", "Lucida Grande", Sans-Serif;font-size:12px;background:#fff;width:480px;border-collapse:collapse;text-align:left;margin:20px;}.hor-minimalist-b th{font-size:14px;font-weight:normal;color:#039;border-bottom:2px solid #6678b1;padding:10px 8px;}.hor-minimalist-b td{border-bottom:1px solid #ccc;color:#669;padding:6px 8px;width:100px;}.hor-minimalist-b tbody tr:hover td{color:#009;}</style>

<link rel="icon" href="images/ccm-favicon.png">

<style type="text/css">
<!--
body  {
  font-family:'Times New Roman'; font-size:10pt; background:lavender; margin:0; margin-left:4pc; margin-right:4pc;
}
table {font-size:10pt;}

a:link    {color:royalblue;}
a:visited {color:navy;}
a:active  {color:red;}

div.h2 {color:royalblue;font-family:'Times New Roman';font-size:14pt;font-style:italic;font-weight:900;}
span.font-tnr {font-family:'Times New Roman';}
span.f-tnr {font-family:'Times New Roman';}
// -->
</style>

</head>

<body>

<%@ include file="bbb_api.jsp"%>

<div align="center" style="background:lightgreen;padding:12px;">
<img src="images/ccwebcon_logo_blue.png" alt="ClassCat WebConference"/>
</div>


<%@ include file="cc-hbar1.jsp"%>

<% int ccmenu2_num = 4; %>

<%@ include file="cc-hbar2.jsp"%>


<!-- ##################### -->
<!-- ### Main / Canvas ### -->
<!-- ##################### -->

<div style="background:lightyellow;margin:0;padding:16px;">  <!-- main -->

<div style="background:mintcream;padding:16px;border-style:double;border-color:slateblue;border-width:3px;border-radius:20px;overflow:scroll;height:480px;">  <!-- canvas -->

<!-- <%@ include file="demo_header.jsp"%> -->

<div style="margin:0;padding:0;margin-left:4pc;font-size:14pt;font-weight:bold;color:slateblue;"><img src="images/arrow039_02.png" width="24"> 会議室アクティビティ・モニタ</div>

<%
if (request.getParameterMap().isEmpty()) {
%>

<div id="no_meetings" style="text-align:center;color:red;font-size:14pt;font-weight:bold;text-decoration:underline;"></div>

<center>
<div id="meetings"></div>
</center>

<% 
} else if (request.getParameter("action").equals("end")) {
	 
	String mp = request.getParameter("moderatorPW");
	String meetingID = request.getParameter("meetingID");
	
	String result = endMeeting(meetingID, mp);
	
	if ( result.equals("true") ){

%>

<!-- <h2>Activity Monitor</h2> -->

<%=meetingID%> has been terminated.

<p id="no_meetings"></p>

<div id="meetings"></div>

<% } else { %>

<!-- <h2>Activity Monitor</h2> -->


Unable to end meeting: <%=meetingID%>

<%=result%>


<% 		}
	}%>
	
</div>  <!-- canvas -->

</div> <!-- main -->

<%@ include file="cc-footer.jsp"%>

</body>
</html>

 

