<%@page import="kr.co.gildongmu.model.join.dao.JoinDAO"%>
<%@page import="kr.co.gildongmu.model.login.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div id="outer">
<div id="first"></div>
<div id="second"></div>
<div id="third">
<%
	Integer result = (Integer) request.getAttribute("result");	
%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>menu</title>
<script type="text/javascript">
	function confirm_id(ud) {
		if (ud == 'd') {
			window.close();
			opener.document.getElementById("u_pass1").value;
			opener.document.getElementById("u_pass1").focus();
		} else {
			opener.document.getElementById("write_id").value = "";
			opener.document.getElementById("write_id").focus();
			window.close();
		}
	}
</script>
</head>

<center>
	<body>
		<form>
			<%
				if (result != 0) {
			%>
			<h3>�̹� <font color="red">�������</font> ���̵��Դϴ�.</h3>
			<br>
			<input type="button" value="Ȯ��" onclick="confirm_id('u')">
			<%
				} else {
			%>
			<h3>��� <font color="red">������</font> ���̵��Դϴ�.</h3>
			<br>
			<input type="button" value="Ȯ��" onclick="confirm_id('d')">
			<%
				}
			%>

		</form>
		<div id="fourth"></div>
		<div id="fifth"></div>
	</body>
	</div>
</center>

</html>