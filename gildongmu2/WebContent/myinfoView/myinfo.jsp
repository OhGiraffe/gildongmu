<%@page import="kr.co.gildongmu.model.login.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
UserBean user = (UserBean)request.getAttribute("user");
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
	
	window.onload = function () {
		var gen = '<%=user.getU_gen()%>';
		if(gen=='남'){
			document.getElementsByName('u_gen')[0].checked=true;
		}else{
			document.getElementsByName('u_gen')[1].checked=true;
		}
		
	}
	
	function confirm_pass(){
		var pass = document.myinfo.u_pass.value;
		var age = document.myinfo.u_age.value;		
		var email = document.myinfo.u_email.value;
		var tel = document.myinfo.u_tel.value;
		
		location.href = "myinfoupdate?pass="+pass+"&age="+age+"&email="+email+"&tel="+tel;
	}
	
	function myInfoDelete() {
		location.href = "mydelete";
	}
</script>
<style>
.table_data1 {
	width: 400px;
	border-top: 2px solid #4080bb;
	border-bottom: 1px solid #4080bb;
}

.table_data1 input {
	BORDER-RIGHT: black 1px solid;
	BORDER-TOP: black 1px solid;
	BORDER-LEFT: black 1px solid;
	BORDER-BOTTOM: black 1px solid;
	FONT-FAMILY: gulim;
	FONT-SIZE: 9pt;
	HEIGHT: 20px;
}

.table_data1 caption {
	text-align: left;
	font-weight: bold;
	padding-bottom: 4px;
}

.table_data1 thead th {
	background: #cfdfee;
	padding: 2px 0 2px 0px;
	border-bottom: 1px solid #4080bb;
	color: #2c6eac;
	border-left: 1px solid #4080bb;
}

.table_data1 tfoot td {
	text-align: center;
	padding: 2px 0 2px 10px;
	border-left: 1px solid #cbd6e0;
	color: #2c6eac;
}

.table_data1 tbody th {
	text-align: left;
	padding: 2px 0 2px 10px;
	background: #e6eff7;
	border-bottom: 1px solid #cbd6e0;
}

.table_data1 tbody td {
	text-align: left;
	padding: 2px 0 2px 10px;
	border-left: 1px solid #cbd6e0;
	border-bottom: 1px solid #cbd6e0;
}
</style>
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
		<a href="receiveMessage.do" style="text-decoration: none; margin: -30px 0 0 730px">쪽지함</a>
</ul>		 
</ul>
</div>
<div id="myMain">
<div id="myMenu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">MyInfo</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">내정보</font>
</div>
<center>
	<form method="POST" action="myupdate.do" name="myinfo">
	<div style="margin: 10px 0 50px 0">
		<table class="table_data1">
		<tbody>
			<tr>
			<th class="ty2">사진</th>
			<td class="ty2"><img src="<%=user.getU_image()%>" width="30" height="30"></td>
			</tr>
			<tr>
				<th class="ty2">아이디</th>
				<td class="ty2"><input type="text" size="20" name="u_id"  disabled="disabled" value="<%=user.getU_id()%>"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td class="ty2"><input type="text" size="20" name="u_name" disabled="disabled" value="<%=user.getU_name()%>"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" size="20" name="u_pass" value="<%=user.getU_pass()%>"
									style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'"></td>
			</tr>
			<tr>
				<th>비밀번호확인</th>
				<td><input type="password" size="20" name="u_pass1" value="<%=user.getU_pass()%>"
									style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" size="20" name="u_age" value="<%=user.getU_age() %>"
									style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'"></td>
			</tr>
			
			<tr>
			<th>성별</th>
			<td><input type="radio" id="gen1" name="u_gen" value="남자" disabled="disabled">남자
				<input type="radio" id="gen2" name="u_gen" value="여자" disabled="disabled">여자 </td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" size="20" name="u_email" value="<%=user.getU_email()%>"
									style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'"></td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td><input type="text" size="20" name="u_tel" value="<%=user.getU_tel()%>"
									style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'"></td>
			</tr>
			<tr>
				<th>평점</th>
				<td><input type="text" size="20"value="<%=rating%>"
									style="BACKGROUND-COLOR: white" readonly="readonly">
							<br><%=user.getU_npeople() %>명이 평가를 했습니다.
							
							</td>
			</tr>
			<tr>
				<th>신청수</th>
				<td><input type="text" size="20" value="<%=user.getU_apply()%>"
									style="BACKGROUND-COLOR: white" readonly="readonly"></td>
			</tr>
			<tr>
				<th>참석수</th>
				<td><input type="text" size="20" value="<%=user.getU_attend()%>"
									style="BACKGROUND-COLOR: white" readonly="readonly"></td>
			</tr>
			
			</tbody>
			<tfoot>
			<tr>
				<td  class="ty2" colspan="5" align="right">
				<input type="button" value="수정" onclick="confirm_pass()" class="myButton">
				<input type="button" value="삭제" onclick="myInfoDelete()" class="myButton">
				</td>
			</tr>
			</tfoot>
		</table>
	</div>
	</form>
</div>
<div id="fourth"></div>
<div id="fifth"><%@include file="/mainView/footer.jsp"%></div>
</div>
</body>
</center>

</html>