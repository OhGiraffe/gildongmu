<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
p.joinresult{
font-size: 20px;
margin-top: 200px;
margin-left: 200px;
vertical-align: middle;
}

p.gomain{
margin-left: 340px;
margin-top: 40px;
font-size: 13px;
}

p.gomain a{
font-size: 20px;
text-align: center;

}
</style>
</head>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
	<div id="menu" style="border-bottom: 2px solid #dedede;">	
		<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">Join</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">ȸ������</font>
	</div>
			<div class="t4">
		<div class="topmargin">
<p class="joinresult">
<%
	String name = (String)request.getAttribute("u_name");
%>
	<font color="#BDBDBD"; style="font-size: 30px; font-weight: bold;">�����մϴ�.</font><br>
	<font color="black" ; style="font-size: 30px"><%=name%></font>
	<font color="#BDBDBD">��</font>
	<font color="3b5998">�浿��</font>
	<font color="#BDBDBD">ȸ�������� �Ϸ�Ǿ����ϴ�.</font><br>
</p>	
<p class="gomain">
	<font color="#BDBDBD">���������� ��ܿ���</font>
	<a href="main" style="text-decoration: none; color:#3b5998; font-weight: bold;">�α���</a>
	<font color="#BDBDBD">���ֽñ� �ٶ��ϴ�.</font>
</p>

</div>
</div>
</body>
</html>