<%@page import="kr.co.gildongmu.model.login.bean.UserBean"%>
<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

</style>

</head>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">

<body>
<div id="menu3">
	<div id="logo">
	<img src="./image/pass.png">
	</div>
	
	<div id="sidetext">
	<ul class="side" style="margin-top: 24px;">
		<ul>
			<a href="searchmyid.do" style="text-decoration: none; margin: -10px 0 0 300px" >ID 찾기</a>
			<a href="searchmypass.do" style="text-decoration: none; margin: -30px 0 0 460px">PASSWORD 찾기</a>
			<a href="#" style="text-decoration: none; margin: -30px 0 0 620px">기타</a>
		</ul>		 
	</ul>
	</div>
</div>
<center>
		<div class="t4">
		<div class="topmargin" style="margin-right: 50px">
			<%-- 버튼
			<p>
				<input type="button" name="myid" value="아이디 찾기"
					style="width: 15%; height: 12mm" onclick="location.href='searchmyid.do'"
					id="bt1"> 
				<input type="button" name="mypass" value="비밀번호 찾기"
					style="width: 15%; height: 12mm" onclick="location.href='searchmypass.do'"
					id="bt1">
			</p>
			--%>
		<form method="POST" name="mypass" action="searchpassresult">
			<legend style="color: #004080;">아이디와 이메일 주소를 입력해주세요.</legend><br>
			<p>
				<table cellpadding="10" class="searching">
				<tr>
				<td>아이디 :</td>
				<td><input type="text" name="u_id" 
				style="width: 300px; height:25px; background-color: #EAEAEA; margin: 3px;"></td>
				</tr>
				
				<tr>
				<td>이메일 :</td>
				<td><input type="text" name="u_email"
				style="width: 300px; height:25px; background-color: #EAEAEA; margin: 3px;"></td>
				</tr>
				
				</table>
			</p><br>
			<input type="submit" value="찾기" style="width: 8%; height: 8mm" class="myButton">
		</form>
</center>
</div>
</div>
</body>
</html>