<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script> 
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

div#sermain{
	position: absolute;
	margin-left: 300px;
	margin-top: 150px;
}

div#sertitle{
	position: absolute;
	width: 500px;
	margin-left: 500px;
	margin-top: 200px;
}

div#tel{
	position: absolute;
	margin-top: 420px;
	margin-left: 300px;
	width: 200px;
	color: #8C8C8C;
}

div#email{
	position: absolute;
	margin-top: 420px;
	margin-left: 550px;
	width: 300px;
	color: #8C8C8C;
}

div#addr{
	position: absolute;
	margin-top: 420px;
	margin-left: 900px;
	width: 300px;
	color: #8C8C8C;
}

</style>
</head>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
<body>
<div id="menu3">
	<div id="logo">
	<img src="./image/service.png">
	</div>
	
	<div id="sidetext">
		<ul class="side" style="margin-top: 24px;">
		<ul>
			<a href="faq.do" style="text-decoration: none; margin: -10px 0 0 300px" >FAQ</a>
			<a href="notice.do" style="text-decoration: none; margin: -30px 0 0 460px">공지사항</a>
			<a href="contact" style="text-decoration: none; margin: -30px 0 0 620px">CONTACT</a>
		</ul>		 
	</ul>
	</div>
</div>
	
	<div id="myMain">

	</div>
	
	<div id="sermain">
		<img src="./image/hello.png">
	</div>
	
	<div id="sertitle">
		<h1>Trips feel free to Contact Us on</h1>
	</div>
	
	<div id="info">
		<ul>
			<li type="none">
				<div id="tel">
				<h3 style="font-style: inherit;">고객센터 전화번호</h3>
				<br> ☎ : 031-2210-1234
				</div>
			</li>
		
			<li type="none">
				<div id="email">
				<h3 style="font-style: inherit;">입사 지원</h3>
				<br> e-mail : gildongmu@gildongmu.com
				</div>
			</li>
			
			<li type="none">
				<div id="addr">
				<h3 style="font-style: inherit;">회사 위치</h3>
				<br>경기도 성남시 분당구 삼평동 
				<br>유스페이스몰2 B동 8층 KOSTA
				</div>
			</li>
			
		</ul>
	</div>
</div>
</body>
</div>	
</html>