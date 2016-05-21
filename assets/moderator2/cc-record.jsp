<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- ClassCat(R) WebConference v1.0                                   --%>
<%-- Copyright (C) 2015 - 2016 ClassCat Co.,Ltd. All rights reserved. --%>

<%-- 21-may-15 : 0.1.0 : for https. --%>
<%-- 25-Jan-15 : 0.9.0 : Fixed. --%>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="css/redmond/jquery-ui-redmond.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script src="js/grid.locale-en.js" type="text/javascript"></script>
<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="js/jquery.xml2json.js" type="text/javascript"></script>

<title>録画可能な会議室の開始 [ClassCat&reg; WebConference]</title>

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

<style type="text/css">
 #formcreate{
	margin-bottom:30px;
 }
 #formcreate label.labform{
	 	display:block;
	 	float:left;
	 	width:100px;
	 	text-align:right;
		margin-right:5px;
 }
 #formcreate div{
		margin-bottom:5px;
		clear:both;
 }
 #formcreate .submit{
		margin-left:100px;
		margin-top:15px;
 }
 #descript{
	 	vertical-align:top;
 }
 #meta_description , #username1{
		float:left;
 }
 .ui-jqgrid{
		font-size:0.7em
}
label.error{
		float: none; 
		color: red; 
		padding-left: .5em; 
		vertical-align: top;
		width:200px;
		text-align:left;
}
</style>

</head>

<body>

<%@ include file="bbb_api.jsp"%>
<%@ page import="java.util.regex.*"%>

<div align="center" style="background:lightgreen;padding:12px;">
<img src="images/ccwebcon_logo_blue.png" alt="ClassCat WebConference"/>
</div>


<%@ include file="cc-hbar1.jsp"%>

<% int ccmenu2_num = 2; %>

<%@ include file="cc-hbar2.jsp"%>


<%
if (request.getParameterMap().isEmpty()) {
	//
	// Assume we want to create a meeting
	//
%>

<!-- ##################### -->
<!-- ### Main / Canvas ### -->
<!-- ##################### -->

<div style="background:lightyellow;margin:0;padding:16px;">  <!-- main -->

<div style="background:mintcream;padding:16px;border-style:double;border-color:slateblue;border-width:3px;border-radius:20px;">  <!-- canvas -->

<div style="margin:0;padding:0;margin-left:4pc;font-size:14pt;font-weight:bold;color:slateblue;"><img src="images/arrow039_02.png" width="24"> 録画可能な会議室の開始</div>

<br/>
<div align="center">

<form id="formcreate" name="formcreate" method="get" action=""> 		

<table style="width:720px;padding:20px;border-style:solid;border-color:lime;border-width:1px;border-radius:10px;" border=0>
<tbody>
<tr><td width="40%">セッションの録画ができる会議室です。
<p/>
会議室を選択し、説明を記述し、<br/>
あなたの名前を入力してください。

<td width="60%" style="background:white;padding:8px;">
  <table border=0 style="width:100%;" cellspacing="4">
  <tr>
    <td width="20%">会議室：
    <td>
    <select name="meetingID" onchange="onChangeMeeting(this.value);">
    <option value="レコード用会議室（デフォルト）">レコード用会議室（デフォルト）</option>
    <option value="レコード用会議室-201">レコード用会議室 201</option>
    <option value="レコード用会議室-202">レコード用会議室 202</option>
    <option value="レコード用会議室-203">レコード用会議室 203</option>
    <option value="レコード用会議室-204">レコード用会議室 204</option>
    </select>

  <tr>
    <td>説明：
    <td>
    <textarea id="meta_description" name="meta_description" style="width:100%;" rows="6" autofocus required></textarea>

  <tr>
    <td>名前：
    <td>
    <input id="meta_email" name="meta_email" type="text" required size="32" />

  <tr><td colspan="2" align="right">
    <input class="submit" type="submit" value="会議室作成・参加" style="margin:0;">
    <input type="hidden" name="action" value="create" />
  </table>

</tbody>
</table>

</form>
</div> <!-- center -->

</div> <!-- canvas -->

</div> <!-- main -->

<%
} else if (request.getParameter("action").equals("create")) {
		
	String meetingID = request.getParameter("meetingID");
	String username = request.getParameter("meta_email");
		
	//metadata
	Map<String,String> metadata=new HashMap<String,String>();
		
	metadata.put("description", request.getParameter("meta_description"));
	metadata.put("email", request.getParameter("meta_email"));
	// Use the meetingID (e.g English 101) as the title as slides playback
	// uses the title to display the link.
	metadata.put("title", request.getParameter("meetingID"));

	//
	// This is the URL for to join the meeting as moderator
	//
	String welcomeMsg = "<br>%%CONFNAME%% へようこそ！<br><br>この会議の音声ブリッジに参加するには、左上隅のヘッドセット・アイコンをクリックしてください<b>（マイク・アイコンであなたの音声をミュートすることもできます）</b>。<br><br>この会議はレコードされます。";
	// String welcomeMsg = "<br>Welcome to %%CONFNAME%%!<br><br>For help see our <a href=\"event:http://www.bigbluebutton.org/content/videos\"><u>tutorial videos</u></a>.<br><br>To join the voice bridge for this meeting click the headset icon in the upper-left <b>(you can mute yourself in the Listeners window)</b>.<br><br>This meeting is being recorded.";
	String joinURL = getJoinURL(username, meetingID, "true", welcomeMsg, metadata, null);

	// classcat : 21-may-16
	if (joinURL.startsWith("http://") || joinURL.startsWith("https://")) { 
	// if (joinURL.startsWith("http://")) {
%>
<script language="javascript" type="text/javascript">
  window.location.href="<%=joinURL%>";
</script>
<%
	}else{
%>
Error: getJoinURL() failed
<p /><%=joinURL%> <%
	}
}
%> 

<%@ include file="cc-footer.jsp"%>

</body>
</html>
