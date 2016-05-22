<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%-- ClassCat(R) WebConference v1.0                            --%>
<%-- Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved. --%>

<%-- 12-Feb-15 : 0.9.1 --%>
<%-- 25-Jan-15 : 0.9.0 Fixed. --%>

<script type="text/javascript">
<!--
$(function() {
        $("#btn_about").button();
});
// -->
</script>

<script type="text/javascript">
<!--
$(function() {
    $("#dlg_about").dialog({
        draggable: true,
                resizable: false,
        autoOpen: false,
        closeOnEscape: true,
        width: 480,
        height: 260,
        modal: false,
        title: '<span style="font-family:\'Times New Roman\',serif;font-size:8pt;">ClassCat&reg; WebConference について</span>',

        position:['center', 'center'],

        buttons:{
        'OK':function() {
                        $('#dlg_about').dialog('close');
                        }
            }

    });

    $('#btn_about').click(function() {
        $('#dlg_about').dialog('open');
    });
});
// -->
</script>

<style type="text/css">   
<!--
input#btn_about {
        margin-top: 4px;        
        padding: 2px;
        font-family: 'Times New Roman', serif;
        font-size:9pt;
        color:blue;
        color:forestgreen;
        font-weight:bold;
}

// -->
</style>

<div id="dlg_about" style="display:none;">

<div style="font-family:'Times New Roman',serif; font-size:10pt;color:#36c;font-weight:bold;">
ClassCat<sup><small>&reg;</small></sup> WebConference v1.0
</div>

<div align="center" style="font-family:'Times New Roman',serif; font-weight:bold; font-style:italic;">
<span style="font-size:10pt; color:#6f6;">1.0.0 release</span>
&nbsp;
<span style="font-size:9pt;color:#999">22-May-16 build</span>
</div>

<br/>
<div align="right" style="font-size:10pt;color:cornflowerblue;">
<b>(株)クラスキャット</b>
&nbsp;&nbsp;
<a href="http://www.classcat.com/" style="font-size:10pt;color:royalblue;">http://www.classcat.com/</a>
</div>

<div align="right" style="margin-top:4px;font-family:'Times New Roman',serif; font-size:8pt; color:#999;">
Copyright &copy; 2016 ClassCat&reg; Co.,Ltd. All rights reserved. 
</div>

</div>
