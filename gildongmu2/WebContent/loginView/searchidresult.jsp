<%@page import="kr.co.gildongmu.model.login.bean.UserBean"%>
<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<% 
String u_id = (String)request.getAttribute("u_id");
%>
</head>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="myBar">
<ul class="side" style="margin-top: 24px;">
<ul>
			<li type="none" style="font-weight: bold; font-size: 16px; color: #ffffff;
			width: 160px; height: 26px; background-color: #22becc;">
			ID/PASSã��
			</li>
			<a href="searchmyid.do" style="text-decoration: none; margin: -10px 0 0 300px" >ID ã��</a>
			<a href="searchmypass.do" style="text-decoration: none; margin: -30px 0 0 460px">PASSWORD ã��</a>
			<a href="#" style="text-decoration: none; margin: -30px 0 0 620px">Contact</a>
</ul>		 
</ul>
</div>
<div id="myMain">
	<div id="myMenu">	
		<font style="border-style: solid;background-color: #f5f5f5;font-size: large; color: #22becc;">Join</font>
		<font style="font-size: small;">��й�ȣã��</font>
	</div>
	
<center>
		<div class="t3">
		<div class="topmargin" style="margin-right: 50px; margin-left: -30px;">
		<form method="POST" name="myid">
			<p>
			<%if(u_id != null) {%>
				<table cellpadding="10">
				ã���� ���̵��<br>
				<td>${u_id }</td>
				</table>
				<%}else{%>
				<table cellpadding="10">
				ã���� ���̵��<br>
				<td>�������� �ʽ��ϴ�.</td>
				</table>
				<%} %>
			</p>
			</div>
		</form>
</center>
</div>
</div>
</body>
</html>