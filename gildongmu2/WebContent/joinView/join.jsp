<%@page import="org.apache.catalina.User"%>
<%@page import="kr.co.gildongmu.model.join.dao.JoinDAO"%>
<%@page import="kr.co.gildongmu.model.login.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<style type="text/css">
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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function checkId() {
		if (document.joinForm.write_id.value == "") {
			alert("아이디를 입력하십시오");
		} else {
			var write_id = document.joinForm.write_id.value;
			window.open("idcheck?write_id=" + write_id, "get",
					"height=180, width=300");

		}

	}

	function id() {
		document.joinForm.u_pass1.focus();
	}

	function pass() {
		document.joinForm.write_id.focus();
	}
	
	function success(){
		var name = document.u_name.value;
		location.href = "joinAction.do?u_name="+ name;
	}
</script>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
	<div id="menu" style="border-bottom: 2px solid #dedede";>	
	<font style="border-style: solid; font-size:24pt; color: #3a5795; font-weight: bolder; ">Join</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">회원가입</font>
	</div>
	<center>
		<div class="t4">
		<div class="topmargin">
		<!-- <div id="t3"> -->
		<form action="joinAction" name="joinForm" method="post" enctype="multipart/form-data">
			<!-- <div class="tblWrap"> -->
			<table class="table_data1">
				<tbody>
					<tr>
						<th align="left">아이디 </th>
						<td><input type="text" name="write_id" id="write_id" maxlength="20"
							size="20" placeholder="20자 이하 입력" required style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'">
							<input class="myButton1" type="button" value="ID 중복체크" onclick="checkId()"></td>
					</tr>
					<tr>
						<th align="left">비밀번호 </th>
						<td><input type="password" name="u_pass1" id="u_pass1"
							maxlength="20" size="20" style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'" required></td>
					</tr>
					<tr>
						<th align="left">비밀번호(확인) </th>
						<td><input type="password" name="u_pass2" maxlength="20"
							size="20" style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'" required></td>
					</tr>

					<tr>
						<th align="left">이름 </th>
						<td><input type="text" name="u_name" maxlength="10"
							style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'" required></td>
					</tr>
					<tr>
						<th align="left">나이 </th>
						<td><input type="number" name="u_age" min="20" max="60"
							value="20" style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'" required></td>
					</tr>
					<tr>
						<th align="left">성별 </th>
						<td><input type="radio" name="u_gen" value="남" checked
							required>남자 <input type="radio" name="u_gen" value="여"
							required>여자</td>
					</tr>
					<tr>
						<th align="left">사진 </th>
						<td><input type="file" name="u_image" id="u_image"
							style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'" required></td>
					</tr>
					<tr>
						<th align="left">메일 </th>
						<td><input type="email" name="u_email" size="20"
							maxlength="30" " style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'" required></td>
					</tr>
					<tr>
						<th align="left">우편번호 </th>
						<td><input type="text" id="u_zipcode1" name="u_zipcode1"
							maxlength="3" " size="3" style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'" required>-
							<input type="text" id="u_zipcode2" name="u_zipcode2"
							maxlength="3" " size="3" style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'" required>
							<input class="myButton1" type="button" value="우편번호찾기"
							onclick="javascript:window.open('searchPost','','width=400,height=500,scrollbars=yes')"
							required></td>
					</tr>
					<tr>
						<th align="left">주소 </th>
						<td><input type="text" id="u_addr" name="u_addr"
							maxlength="50" size="50" placeholder="우편번호검색시 자동입력"
							style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'" required></td>
					</tr>
					<tr>
						<th align="left">전화번호 </th>
						<td><input type="tel" id="u_tel" name="u_tel"
							placeholder="숫자만 입력" maxlength="11"
							style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'" required></td>
					</tr>
				</tbody>

				<!-- </div> -->
				<tfoot>
					<tr>
						<td colspan="2"><input type="submit" value="가입" class="myButton"></input> 
						<input type="reset" value="취소" class="myButton"></input></td>
					</tr>
				</tfoot>
				<!-- </div> -->
			</table>
		</form>
	</center>
	
</div>
</div>
</body>
</html>