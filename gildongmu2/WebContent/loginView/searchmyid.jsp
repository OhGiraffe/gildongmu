<%@page import="kr.co.gildongmu.model.login.bean.UserBean"%>
<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="myBar">
<ul class="side" style="margin-top: 24px;">
<ul>
			<li type="none" style="font-weight: bold; font-size: 16px; color: #ffffff;
			width: 160px; height: 26px; background-color: #004080;">
			ID/PASS찾기
			</li>
			<a href="searchmyid.do" style="text-decoration: none; margin: -10px 0 0 300px" >ID 찾기</a>
			<a href="searchmypass.do" style="text-decoration: none; margin: -30px 0 0 460px">PASSWORD 찾기</a>
			<a href="#" style="text-decoration: none; margin: -30px 0 0 620px">기타</a>
</ul>		 
</ul>
</div>
<div id="myMain">
<div id="myMenu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #3a5795; font-weight: bolder; ">Search ID</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">ID 찾기</font>
</div>
	
<center>
		<div class="t4">
		<div class="topmargin" style="margin-right: 50px">
		<form method="POST" name="myid" action="searchidresult">
			<legend style="color: #004080;">이름과 전화번호를 입력해 주십시오.</legend><br>
			<div class="tblWrap">
			<p>
				<table cellpadding="10">
			
				<tr>
				<td>이름 :</td>
				<td><input type="text" name="u_name" 
				style="width: 300px; height:25px; background-color: #EAEAEA; margin: 3px;">
				</td>
				</tr>
				
				<tr>
				<td>전화번호 :</td>
				<td><input type="text" name="u_tel"
				style="width: 300px; height:25px; background-color: #EAEAEA; margin: 3px;"
				>
				</td>
				</tr>
				
				</table>
			</p>
			<br>
			<input type="submit" value="찾기" style="width: 8%; height: 8mm" class="myButton">
			</div>
		</form>
	</div>
</center>
</div>
</div>
</body>
</html>