<%@page import="kr.co.gildongmu.model.login.bean.UserBean"%>
<%@page import="kr.co.gildongmu.model.message.bean.MessageBean"%>
<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	UserBean user = (UserBean)request.getAttribute("userinfo");
	float ratingnum = 0;
	String rating = null;
	if(user.getU_grade() != 0){
		ratingnum = (float)user.getU_grade()/ (float)user.getU_npeople();
		rating = String.format("%.1f", ratingnum);
	}
	else{
		rating = "0";
	}

%>
<script type="text/javascript">
	function message() {
		var m_receiveID = '<%=user.getU_id()%>';
		var m_message = document.messageForm.m_message.value;
		location.href = "message_sendUser?m_receiveID=" + m_receiveID + "&m_message=" +  m_message;
	}
	
	function back() {
		location.href = "message_receive";
	}
</script>
</head>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="myBar">
<ul class="side" style="margin-top: 24px;">
<ul>
		<li type="none" style="font-weight: bold; font-size: 16px; color: #ffffff;
		width: 160px; height: 26px; background-color: #22becc;">
		내정보
		</li>
		<a href="myinfo.do" style="text-decoration: none; margin: -10px 0 0 250px" >내정보</a>
		<a href="mylist.do" style="text-decoration: none; margin: -30px 0 0 410px">내가 쓴 글</a>
		<a href="myapply.do" style="text-decoration: none; margin: -30px 0 0 570px">신청현황</a>
		<a href="message_receive" style="text-decoration: none; margin: -30px 0 0 730px">쪽지함</a>
</ul>		 
</ul>
</div>
<div id="myMain">
<div id="myMenu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">Message</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">쪽지</font>
</div>
<%
	MessageBean message = new MessageBean();
	message = (MessageBean)request.getAttribute("messageReceiveDetail");
%>
	<h3>보낸쪽지 상세보기</h3>
	<table>
		<tr>
			<td><%= message.getM_sendID() %>가 내게 쓴 쪽지</td>
		</tr>
		<tr>
			<td>보낸시간 <%= message.getM_date() %></td>
		</tr>
		<tr>
			<td>내용 <%= message.getM_message() %></td>
		</tr>
		<tr>
		<input type="button" value="뒤로" class="myButton" style="margin-left: 220px; margin-top: -28px;" onclick="back()">
		</tr>
	</table>
</div>
</div>
</body>
</html>