<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.gildongmu.model.message.dao.MessageDAO"%>
<%@page import="kr.co.gildongmu.model.login.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="http://ts.daumcdn.net/custom/blog/0/606/skin/images/nanumgothic.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" 
	type="text/css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.0/animate.min.css">
<link href="./Modal2/jquery.modalBox.css" rel="stylesheet" type="text/css">
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
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="./Modal2/jquery.modalBox.js"></script>
<script type="text/javascript">
	
	window.onload = function () {
		var gen = '<%=user.getU_gen()%>';
		if(gen=='남'){
			document.getElementsByName('u_gen')[0].checked=true;
		}else{
			document.getElementsByName('u_gen')[1].checked=true;
		}
		
	}
	
	function exit() {
		window.close();
	}
	
	function message() {
		var m_receiveID = '<%=user.getU_id()%>';
		var m_message = document.messageForm.m_message.value;
		location.href = "message_sendUser?m_receiveID=" + m_receiveID + "&m_message=" +  m_message;
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
<center>
	<form method="POST" action="myupdate.do" name="myinfo">
	<div style="margin-right: 200px">
	
		<table class="table_data1 topmargin">
		<legend> 회원정보</legend>
		<tbody>
			<tr>
			<th>사진:</th>
			<td><img src="<%=user.getU_image()%>" width="30" height="30"></td>
			</tr>
			<tr>
				<th>아이디:</th>
				<td><input type="text" size="20" name="u_id" disabled="disabled" value="<%=user.getU_id()%>" style="BACKGROUND-COLOR: white"></td>
			</tr>
			<tr>
				<th>평점</th>
				<td><input disabled="disabled" type="text" size="20" name="u_tel" 
				value="<%=rating%>"
									style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'"> <%=user.getU_npeople() %>명이 평가를 했습니다.</td>
			</tr>
			<tr>
				<th>신청수</th>
				<td>
				<input disabled="disabled" type="text" size="20" name="u_tel" value="<%= user.getU_apply() %>"
				style="BACKGROUND-COLOR: white"onMouseOver="this.style.backgroundColor = '#e6eff7'"
				onMouseOut="this.style.backgroundColor = 'white'">
				</td>
			</tr>
			<tr>
				<th>참석수</th>
				<td>
				<input disabled="disabled" type="text" size="20" name="u_tel" value="<%= user.getU_attend() %>"
				style="BACKGROUND-COLOR: white"onMouseOver="this.style.backgroundColor = '#e6eff7'"
				onMouseOut="this.style.backgroundColor = 'white'">
				</td>
			</tr>
			</tbody>
			<tfoot>
			</tfoot>		
		</table>
		<br><br>
		<a href="#modal-content" class="modal-box"><input type="button" value="쪽지" class="myButton" style="margin-left: 100px;"></a>
		<input type="button" value="닫기" class="myButton" style="margin-left: 220px; margin-top: -28px;" onclick="exit()">
	</div>
	</form>


<div class="modal-box" id="modal-content">
	<div class="inner"">
		<button class="close">&times;</button>
		<form name="messageForm" method="post" action="">
		<div style="background-color: #f5f5f5; height: 35px; width: 100%;">
			<font style="border-style: solid;background-color: #f5f5f5;font-size: large; color: #3a5795;">Message</font>
			<font style="font-size: small;">쪽지</font>
		</div>
		<center>
		<table>
		<tr>
			<td height="30px">
			</td>	
		</tr>
		<tr>
			<td>
			받는 사람<input type="text" name="m_receiveID" id="m_receiveID" size="12" border="1" value="<%=user.getU_id() %>" readonly="readonly" 
						style="font-size: 5px; color: #353535; width: 230px; height: 19px; background-color: #f1f1f1;">
			</td>
		</tr>	
		<tr height="10px;">
		</tr>
		<tr>
			<td>
			쪽지 내용<br>
			<textarea rows="6" cols="40" name="m_message" id="m_message" size="12"
					style="font-size: 5px; color: #353535; width: 300px; height: 50px; background-color: #f1f1f1;"></textarea>
			</td>	
			</tr>
			<tr height="40px;">
			</tr>
			<tr>
			<td rowspan="2" style="text-align: center; vertical-align: top;">
			<input type="button" value="보내기" class="mybutton5" style="width: 45px; height: 12mm;" onclick="message()">
			</td>
			</tr>
		</table>
		</form>
		</center>
	</div>
	<script>
$('a.modal-box').click(function(e){
    e.preventDefault();
    $('#modal-content').modalBox("open",{openAnimationEffect:'bounceIn',closeAnimationEffect:'bounceOut'});
});
</script>


</body>
</center>
