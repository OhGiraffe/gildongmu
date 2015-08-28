<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

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
			고객센터
			</li>
			<a href="faq.do" style="text-decoration: none; margin: -10px 0 0 300px" >FAQ</a>
			<a href="notice.do" style="text-decoration: none; margin: -30px 0 0 460px">공지사항</a>
			<a href="contact.do" style="text-decoration: none; margin: -30px 0 0 620px">CONTACT</a>
			</ul>		 
		</ul>
	</div>
	
	<div id="myMain">
		<div id="myMenu" style="border-bottom: 2px solid #dedede;">
			<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">CONTACT</font>
			<font style="font-size:14pt; font-weight: bolder; color: #17838C; ">Contact us</font>
		</div>
	</div>
	
	<div id="sermain">
		<div id="serhead">
			<div id="sergrip">
				<div id="serimg">
					<img src="./image/hello.png">
				</div>
			</div>
		</div>
	</div>


</body>
</div>	
</html>