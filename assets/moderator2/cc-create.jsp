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
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<%
if (request.getParameterMap().isEmpty() || request.getParameter("action").equals("create")) {
%>
<title>会議室の作成 [ClassCat&reg; WebConference]</title>
<% } else if (request.getParameter("action").equals("enter")) { %>
<title>会議室への参加 [ClassCat&reg; WebConference]</title>
<% } else { %>
<title>会議室への招待 [ClassCat&reg; WebConference]</title>
<% } %>
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>

<script type="text/javascript" src="js/heartbeat.js"></script>

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
<%@ page import="java.util.regex.*"%>

<div align="center" style="background:lightgreen;padding:12px;">
<img src="images/ccwebcon_logo_blue.png" alt="ClassCat WebConference"/>
</div>


<%
if (request.getParameterMap().isEmpty() || request.getParameter("action").equals("create")) {
%>

<%@ include file="cc-hbar1.jsp"%>

<% int ccmenu2_num = 1; %>

<%@ include file="cc-hbar2.jsp"%>

<% } %>


<!-- ##################### -->
<!-- ### Main / Canvas ### -->
<!-- ##################### -->

<div style="background:lightyellow;margin:0;padding:16px;">  <!-- main -->

<div style="background:mintcream;padding:16px;border-style:double;border-color:slateblue;border-width:3px;border-radius:20px;">  <!-- canvas -->

<!-- <div style="margin:0;padding:0;margin-left:4pc;font-size:14pt;font-weight:bold;color:slateblue;"><img src="images/arrow039_02.png" width="24"> 会議室の作成</div> -->

<%
if (request.getParameterMap().isEmpty()) {
  //
  // Assume we want to create a meeting
  //
%>
<div style="margin:0;padding:0;margin-left:4pc;font-size:14pt;font-weight:bold;color:slateblue;"><img src="images/arrow039_02.png" width="24"> 会議室の作成</div>

<div align="center">
<div style="font-weight:bold;">
<img src="images/arrow072_04.png"/>&nbsp;あなたの会議室の作成
</div>

<p />
<FORM NAME="form1" METHOD="GET">

<table style="width:720px;padding:20px;border-style:solid;border-color:lime;border-width:1px;border-radius:10px;" border=0>
<!-- <table width=600 cellspacing="20" cellpadding="20" style="border-collapse: collapse; border-right-color: rgb(136, 136, 136);" border=3> -->
<tbody>
  <tr>
    <td width="50%">あなたの名前をモデレータとする会議室を作成します。<br/>
        <br/>
        ※ あなたの名前と会議名を入力してください。<br/>
        ※ 会議室名は「（入力名）-会議」になります。
		<!--	<p /> -->
			</td>
    <td width="50%" style="background:white;padding:8px;">
        <div style="margin:0;">
        <span style="color:royalblue;font-weight:bold;">【ステップ１】</span><br/>
        &nbsp;&nbsp;あなたの名前を入力してください:
        </div>
        <br/>

        <div style="text-align:center;margin:0;">
        <input type="text" autofocus required size="32" name="username1" style="margin:0;"/>
	<INPUT TYPE=hidden NAME=action VALUE="create"> 
        </div>
        <br/>

        <div style="margin:0;">
        &nbsp;&nbsp;会議名を入力してください:
        </div>
        <br/>

        <div style="text-align:center;margin:0;">
        <input type="text" autofocus required size="32" name="meetingid1" style="margin:0;"/>
        </div>
        <br/>

        <div style="text-align:right;margin:0;">
          <input id="submit-button" type="submit" value="会議室の作成" />
        </div>
    </td>
  </tr>
</tbody>
</table>

</FORM>

</div>

<script>
//
// We could have asked the user for both their name and a meeting title, but we'll just use their name to create a title
// We'll use JQuery to dynamically update the button
//
$(document).ready(function(){
    $("input[name='meetingid1']").keyup(function() {
        if ($("input[name='meetingid1']").val() == "") {
        	$("#submit-button").attr('value',"会議室の作成" );
        } else {
                $("#submit-button").attr('value', "'" + $("input[name='meetingid1']").val()+ "-会議' 室の作成" );
        }
    });
});
</script>


<%
} else if (request.getParameter("action").equals("create")) {
  //
  // 会議室作成のリクエスト
  // User has requested to create a meeting
  //

  String username = request.getParameter("username1");
  String meetingID = request.getParameter("meetingid1") + "-会議";
  // String meetingID = username + "-会議室";
  // String meetingID = username + "'s meeting";

  //
  // This is the URL for to join the meeting as moderator
  //
  String joinURL = getJoinURL(username, meetingID, "false", "<br>Welcome to %%CONFNAME%%.<br>", null, null);

  String url = BigBlueButtonURL.replace("bigbluebutton/","demo/");
  String inviteURL = url + "cc-create.jsp?action=invite&meetingID=" + URLEncoder.encode(meetingID, "UTF-8");
  // String inviteURL = url + "create.jsp?action=invite&meetingID=" + URLEncoder.encode(meetingID, "UTF-8");
%>
<div style="margin:0;padding:0;margin-left:4pc;font-size:14pt;font-weight:bold;color:slateblue;"><img src="images/arrow039_02.png" width="24"> 会議室の作成</div>

<div align="center">

<div style="font-weight:bold;">
<img src="images/arrow072_04.png"/>&nbsp;作成された会議室の利用
</div>

<p/>

<table style="width:80%;padding:20px;border-style:solid;border-color:lime;border-width:1px;border-radius:10px;" border=0>

<!-- <table width="800" cellspacing="20" cellpadding="20"
	style="border-collapse: collapse; border-right-color: rgb(136, 136, 136);"
	border=3> -->
<tbody>
<tr>
  <td style="text-align:center;color:#666;background:white;border-style:solid;border-color:lime;border-width:1px;border-radius:8px;">モデレータ : <span style="color:lime;"><b><%=username%></b></span> の会議室 ： <span style="color:orangered;"><b><%= meetingID %></b></span> が作成されました。
  </td>

<tr>
  <td height="8">

<tr>
  <td style="background:white;padding:8px;">
    <!-- <p>&nbsp;</p> -->
    <br/>

    <span style="color:royalblue;font-weight:bold;">【ステップ２】</span> 次の URL (<a href="<%=inviteURL%>" target="_blank">リンク</a>) を利用して他の参加者を招待しましょう：
<!-- Invite others using the following <a href="<%=inviteURL%>">link</a> (shown below): -->

    <form name="form2" method="POST">
    <!-- <textarea cols="64" rows="4" name="myname" style="overflow: hidden"> -->
    <br/>
    <center>
    <textarea cols="32" rows="4" name="myname" style="width:80%;overflow: hidden"><%=inviteURL%></textarea>
    <!-- <textarea cols="48" rows="5" name="myname" style="overflow: hidden"><%=inviteURL%></textarea> -->
    </center>


    <!-- <p>&nbsp;<p /> -->
    <br/>

    <span style="color:royalblue;font-weight:bold;">【ステップ３】</span> あなたの会議室を開始するには、次のリンクをクリックします：
    <!-- <p>&nbsp;</p> -->
    <br/><br/>
    <center><a href="<%=joinURL%>" target="_blank">会議の開始</a></center>

    <br/>
    ※ 会議室を開始するために、次の URL を利用することもできます。
    <br/><br/>
    <center>
    <textarea cols="32" rows="6" name="myname2" style="width:80%;overflow: hidden"><%= joinURL %></textarea>
    </center>
    
    <!-- <p>&nbsp;</p> -->
    </form>

    <br/>

  </td>
</tr>
</tbody>
</table>

</div>


<%
} else if (request.getParameter("action").equals("enter")) {
  //
  // 会議への参加
  // The user is now attempting to joing the meeting
  //
  String meetingID = request.getParameter("meetingID");
  String username = request.getParameter("username");

  String url = BigBlueButtonURL.replace("bigbluebutton/","demo/");
  String enterURL = url + "create.jsp?action=join&username="
  	 + URLEncoder.encode(username, "UTF-8") + "&meetingID="
	 + URLEncoder.encode(meetingID, "UTF-8");

  if (isMeetingRunning(meetingID).equals("true")) {
    //
    // 会議は始まっている - ユーザを会議室へ誘う。
    // The meeting has started -- bring the user into the meeting.
    //
%>
<script type="text/javascript">
	window.location = "<%=enterURL%>";
</script>
<%
  } else {
    //
    // 会議はまだ開始されていない、会議が始まるかステータス
    // The meeting has not yet started, so check until we get back the status that the meeting is running
    //
    String checkMeetingStatus = getURLisMeetingRunning(meetingID);
%>

<script type="text/javascript">
$(document).ready(function(){
		$.jheartbeat.set({
		   url: "<%=checkMeetingStatus%>",
		   delay: 5000
		}, function () {
			mycallback();
		});
	});


function mycallback() {
	// Not elegant, but works around a bug in IE8 
	var isMeetingRunning = ($("#HeartBeatDIV").text().search("true") > 0 );

	if (isMeetingRunning) {
		window.location = "<%=enterURL%>"; 
	}
}
</script>

<div style="margin:0;padding:0;margin-left:4pc;font-size:14pt;font-weight:bold;color:slateblue;"><img src="images/arrow039_02.png" width="24"> <%= meetingID %></div>

<p/>
<div align="center">

<div style="width:720px;font-weight:bold;color:orangered; border-style:solid;border-color:red;border-width:1px;border-radius:4px;">
<img src="images/arrow072_04.png"/>&nbsp;<span style="color:red;"><%= meetingID %></span> はまだ開始されていません。
</div>

<p/>

<table style="width:720px;padding:20px;border-style:solid;border-color:lime;border-width:1px;border-radius:10px;">
<!-- <table width=600 cellspacing="20" cellpadding="20"
	style="border-collapse: collapse; border-right-color: rgb(136, 136, 136);"
	border=3> -->
<tbody>
<tr>
  <td width="64%">
    <p/>
    To : <b><%= username %></b>
    <div>
    現在、モデレータが <b><%=meetingID%></b> を開始するのを待っています。<br/>
    <br/>
    会議が開始されると、ブラウザはリフレッシュされ<br/>
    自動的に会議に接続されます。
    </div>
    <p/>

<!--
			<p>Hi <%=username%>,</p>
			<p>Now waiting for the moderator to start <strong><%=meetingID%></strong>.</p>
			<br />
			<p>(Your browser will automatically refresh and join the meeting
			when it starts.)</p>
-->
  </td>

  <td width="36%" style="text-align:center;background:white;padding:8px;"><img src="polling.gif"/></td>
</tr>
</tbody>
</table>

</div>  <!-- center -->

<%
  } // 会議への参加リクエスト


} else if (request.getParameter("action").equals("invite")) {
  //
  // 会議への招待
  // We have an invite to an active meeting.  Ask the person for their name 
  // so they can join.
  //
  String meetingID = request.getParameter("meetingID");
%>

<div style="margin:0;padding:0;margin-left:4pc;font-size:14pt;font-weight:bold;color:slateblue;"><img src="images/arrow039_02.png" width="24"> 会議への招待</div>

<div align="center">

<div style="font-weight:bold;color:#666">
<img src="images/arrow072_04.png"/>&nbsp;<span style="color:black;"><%= meetingID %></span> への招待
</div>

<p/>
<FORM NAME="form3" METHOD="GET">

<table style="width:720px;padding:20px;border-style:solid;border-color:lime;border-width:1px;border-radius:10px;">
<!-- <table width=600 cellspacing="20" cellpadding="20"
	style="border-collapse: collapse; border-right-color: rgb(136, 136, 136);" 
	border=3> -->
<tbody>
<tr>
  <td width="50%">

  <div style="color:orangered;">
  <b><%=meetingID%></b>
  </div>
  <div style="margin-left:2pc;">
  への参加にあなたは招待されています。
  </div>
  
  <!-- <p />You have been invited to join<br />
  <strong><%=meetingID%></strong>. -->
  </td>

  <td width="50%" style="background:white;padding:8px;">
    <div style="margin:0;">
    &nbsp;&nbsp;あなたの名前を入力してください:
    </div>
    <br/>

    <div style="text-align:center;margin:0;">
    <input type="text" autofocus required name="username" size="32"/>
    <INPUT TYPE=hidden NAME=meetingID VALUE="<%=meetingID%>">
    <INPUT TYPE=hidden NAME=action VALUE="enter">
    </div>
    <br/>

    <div style="margin-left:1pc;">
    ※ この名前は会議のセッションの間、<br/>
    &nbsp;&nbsp;&nbsp;&nbsp;あなたを識別する目的でのみ使用されます。
    </div>
    <br/>

    <div style="text-align:right;margin:0;">
    <input type="submit" value="会議に参加する" />
    </div>
  </td>
</tr>
</tbody>
</table>

</FORM>

</div>  <!-- center -->


<%
	} else if (request.getParameter("action").equals("join")) {
		//
		// We have an invite request to join an existing meeting and the meeting is running
		//
		// We don't need to pass a meeting descritpion as it's already been set by the first time 
		// the meeting was created.
		String joinURL = getJoinURLViewer(request.getParameter("username"), request.getParameter("meetingID"));
			
		// classcat : 21-may-16
		if (joinURL.startsWith("http://") || joinURL.startsWith("https://")) { 
		// if (joinURL.startsWith("http://")) {
%>

<script language="javascript" type="text/javascript">
  window.location.href="<%=joinURL%>";
</script>

<%
	} else { 
%>

Error: getJoinURL() failed
<p /><%=joinURL%> 

<%
 	}
 }
%> 

</div>  <!-- canvas -->

</div> <!-- main -->

<%@ include file="cc-footer.jsp"%>

</body>
</html>
