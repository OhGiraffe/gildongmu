<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>menu</title>
<link href="http://ts.daumcdn.net/custom/blog/0/606/skin/images/nanumgothic.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" 
	type="text/css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.0/animate.min.css">
<link href="./Modal2/jquery.modalBox.css" rel="stylesheet" type="text/css">
<style>
.at1, .at2, .at3, .at4, .at5 {
	 transition:0.5s;
	-webkit-transition:0.5s;
	-moz-transition:0.5s;
	-o-transition:0.5s;
	-ms-transition:0.5s;
}
.at1:hover{
	border-bottom: 3px solid #22becc;
}
.at2:hover{
	border-bottom: 3px solid #22becc;
}
.at3:hover{
	border-bottom: 3px solid #22becc;
}
.at4:hover{
	border-bottom: 3px solid #22becc;
}
.at5:hover{
	border-bottom: 3px solid #22becc;
}

</style>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="./Modal2/jquery.modalBox.js"></script>
<script type="text/javascript">
function login() {
	var id = document.loginForm.id.value;
	var pass = document.loginForm.pass.value;
	load(id, pass); 
}

function getXMLHttpRequest() {//XMLHttpRequest객체생성
	if (window.ActiveXObject) {//IE경우
		try {
			return new ActiveXObject('Msxml2.XMLHTTP');
		} catch (e) {
			return new ActiveXObject('Microsoft.XMLHTTP');
		}
	} else if (window.XMLHttpRequest) {//비IE경우
		return new XMLHttpRequest();
	} else
		return null;
}//getXMLHttpRequest()
var xhr;
function load(id, pass) {//페이지요청
	xhr = getXMLHttpRequest();
	xhr.onreadystatechange = loaded;//콜백함수(open,send후 실행할 함수)정의
	xhr.open('POST', 'login', true);//HTTP요청방식, 요청URL, 비동기
    xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	xhr.send('id='+ id +'&pass='+ pass);//전달파라미터
}

function loaded() {//응답데이터 처리
	if (xhr.readyState == 4) {
		if (xhr.status == 200) {
			var data = xhr.responseText.split(',');

			var r_id = data[0];
			var r_name = data[1];
			var r_check = data[2];
			
			if(r_check.indexOf('i') == 1){
				alert('로그인되어 있습니다.');
			}
			else if(r_check.indexOf('f') == 1){
				alert('ID/PW를 확인하세요.');
			}
			else if(r_check.indexOf('t') == 1){
				location.href = "main";
			}
			
		}
	}
}

function textclear(msg) {
	if(msg == 'id'){
		var id = document.loginForm.id.value;
		var pass = document.loginForm.pass.value;
		if(id == '아이디'){
			document.loginForm.id.value = '';
		}
		if(pass == ''){
			document.loginForm.pass.value = '비밀번호';
		}
		
	}
	if(msg == 'pass'){
		var id = document.loginForm.id.value;
		var pass = document.loginForm.pass.value;
		if(pass == '비밀번호'){
			document.loginForm.pass.value = '';
		}
		if(id == ''){
			document.loginForm.id.value = '아이디';
		}
	}
}

function logout() {
	location.href = "logout";
}

function logincheck(check, id){
	if(id=='null'){
		alert('로그인을 하세요.');
	}
	else{
		if(check == 'location'){
			location.href = 'gyeonggido';
		}
		else if(check == 'schedule'){
			location.href = 'schedule';
		}
		else if(check == 'thema'){
			location.href = 'thema';
		}
	}
		
}


</script>
</head>
<body onunload="logout()">
<%
	String id = (String)session.getAttribute("result_name");
%>
<center>
<form name="form" >
	<table width="1366px" height="45px" id="tob">
		<tr>
			<td width="1px" height="45"><a href="main">
				<img src="./image/logo.jpg" width="60" height="30" style="margin-top: 0px; margin-left: 55px;'"/></a>
			</td>				 
			<td width="40px" height="45px" align="center" valign="middle">
				<article class="at1">
				<a href="javascript:logincheck('location','<%=id %>')" class="text" >지역</a>
				</article>
			</td>
			<td width="40px" height="45px" align="center" valign="middle">
			<article class="at2">
				<a href="javascript:logincheck('schedule','<%=id %>')" class="text">일정</a>
				</article>
			</td>
			<td width="40px" height="45px" align="center" valign="middle" class="text">
			<article class="at3">
				<a href="javascript:logincheck('thema','<%=id %>')" class="text">테마</a>
				</article>
			</td>
			<td width="40px" height="45px" align="center" valign="middle" class="text">
			<article class="at4">
				<a href="review" class="text">후기</a>
				</article>
			</td>
			<td width="40px" height="45px" align="center" valign="middle" class="text">
			<article class="at5">
				<a href="faq" class="text">고객센터</a>
			</article>
			</td>
			<td width="300px" height="45px" align="center">
			</td>
			
			<td width="140px" height="45px" align="center" valign="middle">
			
			<table id="logintable" width="206px" align="center" >
			<%
				if(session.getAttribute("result_id")==null){ %>
	
					<tr>
						<td rowspan="2" style="text-align: center; vertical-align: top;">
						</td>
						<td>
						<a href="#modal-content" class="modal-box"><input type="button" value="로그인" class="mybutton4"></a>
						</td>
						<td>
						<a href="join"><input type="button" value="회원가입" class="mybutton4" id="mybutton4"></a>
						</td>		
						<td>
						<a href="searchmyid"><input type="button" value="ID/비번찾기" class="mybutton4" id="mybutton4" ></a>
						</td>
					</tr>
						

				</table>
				<%}else if(session.getAttribute("result_id").equals("admin")) {%>
				
		<table width="206px" align="center">
		<tr>
			<td>
			<font color="#3a5795" size="14" style="font-family: inherit; font-size: 14px; color: #22becc; width: 169px; height: 12px; font-weight: bold;">
			<%=session.getAttribute("result_name") %></font>
			<font color="#3a5795" size="14" style="font-family: inherit; font-size: 11px; color: #f5f5f5; width: 169px; height: 12px;">님 <br>환영합니다.
			</font>
			</td>
			<td>
				<a href="logout"><input type="button" value="로그아웃" class="mybutton4"></a> 
			</td>
			<td>
			<a href="admin_user"><input type="button" value="관리자" class="mybutton4"></a>
			</td>
			</tr>
	</table>
				<%}else {%>	
	<table width="206px" align="center">
		<tr>
			<td>
			<font color="#3a5795" size="14" style="font-family: inherit; font-size: 14px; color: #22becc; width: 169px; height: 12px; font-weight: bold;">		
				<%=session.getAttribute("result_name")%>
			</font>
			<font color="#3a5795" size="14" style="font-family: inherit; font-size: 11px; color: #f5f5f5; width: 140px; height: 12px;">
			님 <br>환영합니다
			</font>
			</td>
			<td>
			<a href="logout"><input type="button" value="로그아웃" class="mybutton4"></a> 
			</td>
			<td>
			<a href="myinfo"><input type="button" value="내정보" class="mybutton4"></a>
			</td>
		</tr>
	</table>
				<%
				}
	 			%>
			</td>
		</tr>
		
	</table>
	</form>
	</center>
	<div class="modal-box" id="modal-content">
	<div class="inner"">
		<button class="close">&times;</button>
		<form name="loginForm" method="post">
		<div style="background-color: #f5f5f5; height: 35px; width: 100%;">
			<font style="border-style: solid;background-color: #f5f5f5;font-size: large; color: #3a5795;">Login</font>
			<font style="font-size: small;">로그인</font>
		</div>
		<center>
		<table>
		<tr>
			<td height="30px">
			</td>	
		</tr>
		<tr>
			<td>
				<input type="text" name="id" id="id" size="12" border="1" value="아이디" onfocus="textclear('id')" onblur="textclear('id')" 
						style="font-size: 5px; color: #353535; width: 160px; height: 19px; background-color: #f1f1f1;">
			</td>
			<td rowspan="2" style="text-align: center; vertical-align: top;">
			<input type="button" value="로그인" class="mybutton5" style="width: 45px; height: 12mm;" onclick="login()">
			</td>
		</tr>
		<tr>
			<td>
				<input type="password" name="pass" id="pass" size="12" value="비밀번호" onfocus="textclear('pass')" onblur="textclear('pass')"
						style="font-size: 5px; color: #353535; width: 160px; height: 19px; background-color: #f1f1f1;">
			</td>	
			</tr>
			<tr height="40px;">
			</tr>
			<tr>
			<td align="left" colspan="2">
				<a href="join"><input type="button" value="회원가입" class="mybutton6" id="mybutton4"></a>
				<font style="border-style: solid;background-color: #f5f5f5;font-size: small; color: #3a5795;">&nbsp;&nbsp;&nbsp;&nbsp;아이디가 없다면</font>
			</td>
			</tr>
			<tr>	
				<td align="center" colspan="2">
				<a href="searchmyid"><input type="button" value="ID/비번찾기" class="mybutton6" id="mybutton4" ></a>
					<font style="border-style: solid;background-color: #f5f5f5;font-size: small; color: #3a5795;">아이디나 비번을 잊어버렸다면</font>
				</td>
			</tr>
		</table>
		</form>
		</center>
	</div>
	</div>
	<script>
$('a.modal-box').click(function(e){
    e.preventDefault();
    $('#modal-content').modalBox("open",{openAnimationEffect:'bounceIn',closeAnimationEffect:'bounceOut'});
});
</script>
</body>
</html>
