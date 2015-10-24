<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%-- ClassCat(R) WebConference v1.0                            --%>
<%-- Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved. --%>

<%-- 31-jan-15 : Display Japanese msgs in action. --%>
<%-- 31-jan-15 : Increase height of canvas and grid. --%>
<%-- 28-jan-15 : Add a scroll bar --%>
<%-- 25-Jan-15 : 0.9.0 Fixed. --%>

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

<title>録画された会議セッションのリスト [ClassCat&reg; WebConference]</title>

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

<% int ccmenu2_num = 3; %>

<%@ include file="cc-hbar2.jsp"%>


<!-- ##################### -->
<!-- ### Main / Canvas ### -->
<!-- ##################### -->

<div style="background:lightyellow;margin:0;padding:16px;">  <!-- main -->

<div style="background:mintcream;padding:16px;border-style:double;border-color:slateblue;border-width:3px;border-radius:20px;overflow:scroll;height:480px;">  <!-- canvas -->

<div style="margin:0;padding:0;margin-left:4pc;font-size:14pt;font-weight:bold;color:slateblue;"><img src="images/arrow039_02.png" width="24"> 録画された会議セッション</div>

<div align="right">
  <select id="actionscmb" name="actions" onchange="recordedAction(this.value);">
    <option value="novalue" selected>アクション...</option>
    <option value="publish">公開</option>
    <option value="unpublish">非公開</option>
    <option value="delete">削除</option>
  </select>
</div>

<p/>

<center>
  <table id="recordgrid"></table>
</center>

<div id="pager"></div> 

<!--
<div align="right">
Note: New recordings will appear in the above list after processing.  Refresh your browser to update the list.
</div> -->

<script>
<!--
function onChangeMeeting(meetingID){
		isRunningMeeting(meetingID);
}

function recordedAction(action){
		if(action=="novalue"){
			return;
		}
		
		var s = jQuery("#recordgrid").jqGrid('getGridParam','selarrrow');
		if(s.length==0){
			alert("少なくとも１行を選んでください");
			// alert("Select at least one row");
			$("#actionscmb").val("novalue");
			return;
		}
		var recordid="";
		for(var i=0;i<s.length;i++){
			var d = jQuery("#recordgrid").jqGrid('getRowData',s[i]);
			recordid+=d.id;
			if(i!=s.length-1)
				recordid+=",";
		}
		if(action=="delete"){
			var answer = confirm ("選択された録画セッションを削除して良いですか？");
			// var answer = confirm ("Are you sure to delete the selected recordings?");
			if (answer)
				sendRecordingAction(recordid,action);
			else{
				$("#actionscmb").val("novalue");
				return;
			}
		}else{
			sendRecordingAction(recordid,action);
		}
		$("#actionscmb").val("novalue");
}
	
function sendRecordingAction(recordID,action){
		$.ajax({
			type: "GET",
			url: 'cc-record_helper.jsp',
			data: "command="+action+"&recordID="+recordID,
			dataType: "xml",
			cache: false,
			success: function(xml) {
				window.location.reload(true);
				$("#recordgrid").trigger("reloadGrid");
			},
			error: function() {
				alert("Failed to connect to API.");
			}
		});
}
	
function isRunningMeeting(meetingID) {
		$.ajax({
			type: "GET",
			url: 'cc-record_helper.jsp',
			data: "command=isRunning&meetingID="+meetingID,
			dataType: "xml",
			cache: false,
			success: function(xml) {
				response = $.xml2json(xml);
				if(response.running=="true"){
					$("#meta_description").val("An active session exists for "+meetingID+". This session is being recorded.");
					$("#meta_description").attr("readonly","readonly");
					$("#meta_description").attr("disabled","disabled");
				}else{
					$("#meta_description").val("");
					$("#meta_description").removeAttr("readonly");
					$("#meta_description").removeAttr("disabled");
				}
				
			},
			error: function() {
				alert("Failed to connect to API.");
			}
		});
}

var meetingID="レコード用会議室（デフォルト）,レコード用会議室-201,レコード用会議室-202,レコード用会議室-203,レコード用会議室-204";
// var meetingID="*";
// var meetingID="Record-Room-Default,Record-Room-201";
// var meetingID="Record-Room-Default,Record-Room-201,English 101,English 102,English 103,English 104,English 105,English 106,English 107,English 108,English 109,English 110,record-test,record-test";

$(document).ready(function(){
		isRunningMeeting("レコード用会議室（デフォルト）");
		// isRunningMeeting("English 232");
		$("#formcreate").validate();
		$("#meetingID option[value='レコード用会議室（デフォルト）']").attr("selected","selected");
		jQuery("#recordgrid").jqGrid({
			url: "cc-record_helper.jsp?command=getRecords&meetingID="+meetingID,
			datatype: "xml",
			height: 320,
			loadonce: true,
			sortable: true,
			colNames:['Id','会議室','説明', '録画日時', '公開', '再生', '長さ'],
			colModel:[
				{name:'id',index:'id', width:50, hidden:true, xmlmap: "recordID"},
				{name:'course',index:'course', width:180, xmlmap: "name", sortable:true},
				{name:'description',index:'description', width:300, xmlmap: "description",sortable: true},
				// {name:'daterecorded',index:'daterecorded', width:180, xmlmap: "startTime", sortable: true, sorttype: "date", align:'center', datefmt:"Y/m/d h:i:s"},
				{name:"daterecorded",index:'daterecorded', width:180, xmlmap: "startTime", formatter:'date', formatoptions:{ srcformat:'d/m/Y H:i:s', newformat:'m/d/Y H:i:s' }, sorttype: "date", datefmt: "m/d/Y H:i:s", align:'center' }, 

				{name:'published',index:'published', width:80, xmlmap: "published", sortable:true, align:'center' },
				{name:'playback',index:'playback', width:150, xmlmap:"playback", sortable:false, align:'center'},
				{name:'length',index:'length', width:80, xmlmap:"length", sortable:true, align:'center'}
			],
				/* {name:'daterecorded',index:'daterecorded', width:200, xmlmap: "startTime", sortable: true, sorttype: "datetime", datefmt: "y-m-d h:i:s"}, */
			xmlReader: {
				root : "recordings",
				row: "recording",
				repeatitems:false,
				id: "recordID"
			},
			pager : '#pager',
			emptyrecords: "Nothing to display",
			multiselect: true,
			caption: "録画されたセッション",
			loadComplete: function(){
				$("#recordgrid").trigger("reloadGrid");
			}
		});
});

// -->	
</script>


</div> <!-- canvas -->

</div> <!-- main -->

<%@ include file="cc-footer.jsp"%>

</body>
</html>
