<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			고객센터
			</li>
			<a href="faq" style="text-decoration: none; margin: -10px 0 0 300px" >FAQ</a>
			<a href="notice" style="text-decoration: none; margin: -30px 0 0 460px">공지사항</a>
			<a href="contact" style="text-decoration: none; margin: -30px 0 0 620px">CONTACT</a>
</ul>		 
</ul>
</div>
	<div id="myMain">
<div id="myMenu" style="border-bottom: 2px solid #dedede;">
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">FAQ</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">자주 묻는 질문</font>
</div>
	<div style="margin-top: 20px; margin-left: 220px;">
				<div id="flip1" style="font-family: inherit;font-size: small;">아이디를 잊어버렸을 경우는 어떻게 하나요?</div>
				<div id="panel1" style="font-family: inherit;font-size: small;">로그인 창 밑에 아이디/비밀번호 찾기가 있습니다.
								 <br>회원가입시 등록된 이름과 전화번호를 입력하시면 찾을 수 있습니다.</div>
				<br style="height: 0.5px;">
				<div id="flip2" style="font-family: inherit;font-size: small;">비밀번호를 잊어버렸을 경우는 어떻게 하나요?</div>
				<div id="panel2" style="font-family: inherit;font-size: small;">로그인 창 밑에 아이디/비밀번호 찾기가 있습니다.
								 <br>회원가입시 등록된 아이디와 이메일을 입력하시면 찾을 수 있습니다.</div>
				<br>
				<div id="flip3" style="font-family: inherit;font-size: small;">모집인원이 여행에 중 참석하지 않으면 어떻게 하나요?</div>
				<div id="panel3" style="font-family: inherit;font-size: small;">여행 후 후기게시판을 이용하여 미참석 인원을 제외한 참석 인원들의 후기를 
								<br>올려주시면 됩니다.</div>
				<br>
				<div id="flip4" style="font-family: inherit;font-size: small;">회원 등급이 낮아지면 어떻게 되나요?</div>
				<div id="panel4" style="font-family: inherit;font-size: small;">회원등급이 낮아졌다는 것은 모집신청을 하고 참여하지 않은 것으로 운영진이 따로 관리하여
								 강제탈퇴 조치 및 사이트 사용 권한을 방침에 따라 조정할 것입니다.</div>
				<br>

				<div id="flip5" style="font-family: inherit;font-size: small;">관광지 정보는 경기도 지역만 되어 있는데 다른 지역을 여행모집을 하여도 상관없나요?</div>
				<div id="panel5" style="font-family: inherit;font-size: small;">네~ 이용해주셔서 감사합니다.</div>
				
				<br>
				<div id="flip6" style="font-family: inherit;font-size: small;">여행 할 날짜를 정하지 못하였는데 일정 게시판 전체를 보고싶으면 어떻게 해야하나요?</div>
				<div id="panel6" style="font-family: inherit;font-size: small;">여행에 가능하신 날짜나 원하는 날짜를 선택하여 주시고 이용해주시면 감사하겠습니다. 예)2015-07-29 ~ 2015-09-01을 선택. 최선을 다하는 길동무 되겠습니다.</div>
				
				<br>
				<div id="flip7" style="font-family: inherit;font-size: small;">여행지 정보가 부족한데 좀 더 많은 여행지 정보를 보여주실수는 없나요?</div>
				<div id="panel7" style="font-family: inherit;font-size: small;">원하시는 여행지를 알려주시면 저희가 조사 후 알려 드리겠습니다. 좀 더 많은 정보로 <br>이용하시는데 불편함을 없애겠습니다. 최선을 다하는 길동무 되겠습니다.</div>

				<br>
				<div id="flip8" style="font-family: inherit;font-size: small;">원하는 여행지가 게시판에 등록 됫을 때 연락은 어떻게하나요?</div>
				<div id="panel8" style="font-family: inherit;font-size: small;">회원정보 보호로 인해 연락처는 못드리고 댓글이나 이메일등을 이용하여 연락을 하시는 것이 좋을 것 같습니다. 최선을 다하는 길동무 되겠습니다.</div>
 	</div>
</body>
</div>	
</div>
</body>
</html>