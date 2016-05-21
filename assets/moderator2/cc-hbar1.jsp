<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%-- ClassCat(R) WebConference v1.0                            --%>
<%-- Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved. --%>

<%-- 12-Feb-15 : 0.9.1 : Embed a link to the guide -->
<%-- 25-Jan-15 : 0.9.0 Fixed. --%>

<!-- ######################## -->
<!-- ### Horizontal Bar 1 ### -->
<!-- ######################## -->

<div style="margin:0;text-align:right;padding:6px;background:lavenderblush;border-style:solid;border-width:0px 3px 3px 0px;border-color:lightgreen;">

<%@ include file="cc-about.jsp"%>

<style type="text/css">   
<!--
div#menu1 {
        font-family: 'Times New Roman', serif;
        font-size: 9pt;
        font-weight: bold;
}

div#menu1 a {
        color: forestgreen;
}
// -->
</style>

<div id="menu1">

<a href="/moderator.html">モデレータ・トップページ</a>
&nbsp;&nbsp;

<!-- 21-may-16 : changed. -->
<a href="http://www.classcat.com/products/telework-2/webconference/webconf-mguide-overview/" target="_blank">Guide</a>
<!-- <a href="http://cute.classcat.com/index.php/webcon-moderator-guide.html" target="_blank">Guide</a> -->
&nbsp;&nbsp;

<input type="button" id="btn_about" value="About"/>
&nbsp;&nbsp;

<!--
<a href="/logout">Logout</a>
&nbsp;&nbsp;
-->

</div>

</div>  <!-- Horizontal Bar 1 -->
