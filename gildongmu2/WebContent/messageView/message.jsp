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
	ArrayList<MessageBean> list = new ArrayList<MessageBean>();
	list = (ArrayList<MessageBean>)request.getAttribute("receiveReceiveMessage");
	
	ArrayList<MessageBean> list2 = new ArrayList<MessageBean>();
	list2 = (ArrayList<MessageBean>)request.getAttribute("receiveSendMessage");
%>
<script type="text/javascript">
	function deleteMessage(m_num) {
		location.href = "message_delete?m_num=" + m_num;
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
		<form action="message_send" name="messageForm" method="post">
		<div id="sendMessage" style="margin: 0 0 0 0;">
		<table>
		<tr>
			보내는 ID<input type="text" name="m_receiveID" style="background-color: gray;">
			<br>
			쪽지내용<input type="text" name="m_message" style="background-color: gray;">
			<input class="myButton" type="submit" value="입력">							
			</tr>
		</table>
		</div>
		<div id="receiveReceiveMessage" style="margin: 20px 0 0 0; width: 500px; position: absolute;">
		<h3>받은편지함</h3>
		<table border="1">
								<tr>
									<td width="100px">보낸사람</td>
									<td width="100px">보낸날짜</td>
									<td width="250px">내용</td>									
								</tr>	
								<% for(int i=0; i < list.size(); i++) { %>
									<% if(list.get(i).getM_read().equals("N")) {%>
									<tr style="background-color: #F6F6F6;">
										<td width="100px"style="color: gray;"><%= list.get(i).getM_sendID() %></td>
										<td width="100px" style="color: gray;"><%= list.get(i).getM_date()%></td>
										<td width="250px" style="color: silver;"><a style="text-decoration: none;" href="message_receiveDetail?m_num=<%= list.get(i).getM_num() %>"><%= list.get(i).getM_message() %></a></td>
										<td><input type="button" value="X" onclick=" deleteMessage(<%=list.get(i).getM_num()%>)"></td>					
									</tr>
									<% } else {%>
									<tr style="background-color: #F6F6F6;" >
										<td width="100px"style="color: silver;"><%= list.get(i).getM_sendID() %></td>
										<td width="100px" style="color: silver;"><%= list.get(i).getM_date()%></td>
										<td width="250px" style="color: silver;"><a style="text-decoration: none;" href="message_receiveDetail?m_num=<%= list.get(i).getM_num() %>"><%= list.get(i).getM_message() %></a></td>
										<td><input type="button" value="X" onclick=" deleteMessage(<%=list.get(i).getM_num()%>)">	</td>					
									</tr>
									<% } %>
								<% } %>
								
							</table>				
							</div>
				
				<div id="receiveSendMessage" style="margin: 20px 0 0 515px; width: 500px; position: absolute;">
				<h3>보낸편지함</h3>
				<table border="1">
					<tr>
									<td width="100px">받은사람</td>
									<td width="100px">받은날짜</td>
									<td width="250px">내용</td>									
								</tr>	
								<% for(int i=0; i < list2.size(); i++) { %>
									<% if(list2.get(i).getM_read().equals("N")) {%>
									<tr style="background-color: #F6F6F6;" >
										<td width="100px"style="color: gray;"><%= list2.get(i).getM_receiveID() %></td>
										<td width="100px" style="color: gray;"><%= list2.get(i).getM_date()%></td>
										<td width="250px" style="color: silver;"><a style="text-decoration: none;" href="message_sendDetail?m_num=<%= list2.get(i).getM_num() %>"><%= list2.get(i).getM_message() %></a></td>
										<td><input type="button" value="X" onclick=" deleteMessage(<%=list2.get(i).getM_num()%>)">	</td>					
									</tr>
									<% } else {%>
									<tr style="background-color: #F6F6F6;" >
										<td width="100px"style="color: silver;"><%= list2.get(i).getM_receiveID() %></td>
										<td width="100px" style="color: silver;"><%= list2.get(i).getM_date()%></td>
										<td width="250px" style="color: silver;"><a style="text-decoration: none;" href="message_sendDetail?m_num=<%= list2.get(i).getM_num() %>"><%= list2.get(i).getM_message() %></a></td>
										<td><input type="button" value="X" onclick=" deleteMessage(<%=list2.get(i).getM_num()%>)">	</td>					
									</tr>
									<% } %>
								<% } %>
				</table>
				</form>

</div>
</div>
</body>
</html>