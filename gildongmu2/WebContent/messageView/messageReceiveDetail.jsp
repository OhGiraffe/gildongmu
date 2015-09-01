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
<link href="http://ts.daumcdn.net/custom/blog/0/606/skin/images/nanumgothic.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" 
	type="text/css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.0/animate.min.css">
<link href="./Modal2/jquery.modalBox.css" rel="stylesheet" type="text/css">
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
	function message() {
		var m_receiveID = '<%=user.getU_id()%>';
		var m_message = document.messageForm.m_message.value;
		location.href = "message_sendDetailUser?m_receiveID=" + m_receiveID + "&m_message=" +  m_message;
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
			<a href="#modal-contents" class="modal-box"><input type="button" value="답장" class="myButton" style="margin-left: 100px;"></a>
		<input type="button" value="뒤로" class="myButton" style="margin-left: 220px; margin-top: -28px;" onclick="back()">
		</tr>
		<tr>
			<td>뒤로</td>
		</tr>
	</table>
</div>
</div>
</body>
<div class="modal-box" id="modal-contents">
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
    $('#modal-contents').modalBox("open",{openAnimationEffect:'bounceIn',closeAnimationEffect:'bounceOut'});
});
</script>


</html>