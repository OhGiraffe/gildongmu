<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<% for(int i=1; i<11; i++) { %>
<script>
$(document).ready(function(){
    $("#flip<%= i%>").click(function(){
        $("#panel<%= i%>").slideToggle("slow");
    });
});
</script>
<% } %>
<style> 
#panel1, #flip1 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}

#panel1 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}

#panel2, #flip2 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}

#panel2 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}

#panel3, #flip3 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}

#panel3 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}

#panel4, #flip4 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}

#panel4 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}

#panel5, #flip5 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}

#panel5 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}

#panel6, #flip6 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}

#panel6 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}

#panel7, #flip7 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}

#panel7 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}

#panel8, #flip8 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}

#panel8 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}

#panel9, #flip9 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}

#panel9 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}

#panel10, #flip10 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}

#panel10 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}

</style>
</head>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<body>
<div id="myBar">
<ul class="side" style="margin-top: 24px;">
<ul>
			<li type="none" style="font-weight: bold; font-size: 16px; color: #ffffff;
			width: 160px; height: 26px; background-color: #22becc;">
			������
			</li>
			<a href="faq.do" style="text-decoration: none; margin: -10px 0 0 300px" >FAQ</a>
			<a href="notice.do" style="text-decoration: none; margin: -30px 0 0 460px">��������</a>
			<a href="contact" style="text-decoration: none; margin: -30px 0 0 620px">CONTACT</a>
</ul>		 
</ul>
</div>
	<div id="myMain">
<div id="myMenu" style="border-bottom: 2px solid #dedede;">
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">FAQ</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">���� ���� ����</font>
</div>
	<div style="margin-top: 20px; margin-left: 220px;">
				<div id="flip1" style="font-family: inherit;font-size: small;">���̵� �ؾ������ ���� ��� �ϳ���?</div>
				<div id="panel1" style="font-family: inherit;font-size: small;">�α��� â �ؿ� ���̵�/��й�ȣ ã�Ⱑ �ֽ��ϴ�.
								 <br>ȸ�����Խ� ��ϵ� �̸��� ��ȭ��ȣ�� �Է��Ͻø� ã�� �� �ֽ��ϴ�.</div>
				<br style="height: 0.5px;">
				<div id="flip2" style="font-family: inherit;font-size: small;">��й�ȣ�� �ؾ������ ���� ��� �ϳ���?</div>
				<div id="panel2" style="font-family: inherit;font-size: small;">�α��� â �ؿ� ���̵�/��й�ȣ ã�Ⱑ �ֽ��ϴ�.
								 <br>ȸ�����Խ� ��ϵ� ���̵�� �̸����� �Է��Ͻø� ã�� �� �ֽ��ϴ�.</div>
				<br>
				<div id="flip3" style="font-family: inherit;font-size: small;">�����ο��� ���࿡ �� �������� ������ ��� �ϳ���?</div>
				<div id="panel3" style="font-family: inherit;font-size: small;">���� �� �ı�Խ����� �̿��Ͽ� ������ �ο��� ������ ���� �ο����� �ı⸦ 
								<br>�÷��ֽø� �˴ϴ�.</div>
				<br>
				<div id="flip4" style="font-family: inherit;font-size: small;">ȸ�� ����� �������� ��� �ǳ���?</div>
				<div id="panel4" style="font-family: inherit;font-size: small;">ȸ������� �������ٴ� ���� ������û�� �ϰ� �������� ���� ������ ����� ���� �����Ͽ�
								 ����Ż�� ��ġ �� ����Ʈ ��� ������ ��ħ�� ���� ������ ���Դϴ�.</div>
				<br>

				<div id="flip5" style="font-family: inherit;font-size: small;">������ ������ ��⵵ ������ �Ǿ� �ִµ� �ٸ� ������ ��������� �Ͽ��� ���������?</div>
				<div id="panel5" style="font-family: inherit;font-size: small;">��~ �̿����ּż� �����մϴ�.</div>
				
				<br>
				<div id="flip6" style="font-family: inherit;font-size: small;">���� �� ��¥�� ������ ���Ͽ��µ� ���� �Խ��� ��ü�� ��������� ��� �ؾ��ϳ���?</div>
				<div id="panel6" style="font-family: inherit;font-size: small;">���࿡ �����Ͻ� ��¥�� ���ϴ� ��¥�� �����Ͽ� �ֽð� �̿����ֽø� �����ϰڽ��ϴ�. ��)2015-07-29 ~ 2015-09-01�� ����. �ּ��� ���ϴ� �浿�� �ǰڽ��ϴ�.</div>
				
				<br>
				<div id="flip7" style="font-family: inherit;font-size: small;">������ ������ �����ѵ� �� �� ���� ������ ������ �����ֽǼ��� ������?</div>
				<div id="panel7" style="font-family: inherit;font-size: small;">���Ͻô� �������� �˷��ֽø� ���� ���� �� �˷� �帮�ڽ��ϴ�. �� �� ���� ������ <br>�̿��Ͻôµ� �������� ���ְڽ��ϴ�. �ּ��� ���ϴ� �浿�� �ǰڽ��ϴ�.</div>

				<br>
				<div id="flip8" style="font-family: inherit;font-size: small;">���ϴ� �������� �Խ��ǿ� ��� ���� �� ������ ����ϳ���?</div>
				<div id="panel8" style="font-family: inherit;font-size: small;">ȸ������ ��ȣ�� ���� ����ó�� ���帮�� ����̳� �̸��ϵ��� �̿��Ͽ� ������ �Ͻô� ���� ���� �� �����ϴ�. �ּ��� ���ϴ� �浿�� �ǰڽ��ϴ�.</div>
 	</div>
</body>
</div>	
</div>
</body>
</html>