<%@ page contentType="text/xml; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="bbb_api.jsp" %>
<?xml version="1.0" ?>

<%
String reqIP=request.getHeader("x-forwarded-for");
String locIP=request.getLocalAddr();
%>

<% if (request.getParameter("command").equals("isRunning")){ %>
<response>
	<running><%= isMeetingRunning(request.getParameter("meetingID")) %></running>
</response>
<% } else if(request.getParameter("command").equals("getRecords")){%>
      <%= getRecordings("レコード用会議室（デフォルト）,レコード用会議室-201,レコード用会議室-202,レコード用会議室-203,レコード用会議室-204")%>
<% } else if(request.getParameter("command").equals("publish")||request.getParameter("command").equals("unpublish")){%>
	<%= setPublishRecordings( (request.getParameter("command").equals("publish")) ? true : false , request.getParameter("recordID"))%>
<% } else if(request.getParameter("command").equals("delete")){%>
	<%= deleteRecordings(request.getParameter("recordID"))%>
<% } %>
