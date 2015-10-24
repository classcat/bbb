<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%-- ClassCat(R) WebConference v1.0                            --%>
<%-- Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved. --%>

<%-- 25-Jan-15 : 0.9.0 Fixed. --%>

<!-- ######################## -->
<!-- ### Horizontal Bar 2 ### -->
<!-- ######################## -->

<div style="margin:0;text-align:right;padding:8px;background:lightcyan;border-style:solid; border-width: 0px 4px 4px 0px;border-color:cornflowerblue;">

<style type="text/css">   
<!--

div#menu2 {
        font-family: 'Times New Roman', serif;
        font-size: 10pt;
        font-weight: bold;
}

div#menu2 a {
        color: royalblue;
}
// -->
</style>

<div id="menu2">

<% if (ccmenu2_num==1) { %>
<span style="color:red;">会議室の作成</span>
<% } else { %>
<a href="/demo/cc-create.jsp">会議室の作成</a>
<% } %>
&nbsp;&nbsp;

<% if (ccmenu2_num==2) { %>
<span style="color:red;">録画可能な会議室</span>
<% } else { %>
<a href="/demo/cc-record.jsp">録画可能な会議室</a>
<% } %>
&nbsp;&nbsp;

<% if (ccmenu2_num==3) { %>
<span style="color:red;">録画セッションのリスト</span>
<% } else { %>
<a href="/demo/cc-record-list.jsp">録画セッションのリスト</a>
<% } %>
&nbsp;&nbsp;

<% if (ccmenu2_num==4) { %>
<span style="color:red;">アクティビティ・モニタ</span>
<% } else { %>
<a href="/demo/cc-activity-monitor.jsp">アクティビティ・モニタ</a>
<% } %>
&nbsp;&nbsp;

</div>

</div>
