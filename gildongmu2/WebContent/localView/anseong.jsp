<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
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
	function tour_load(l_name, t_name) {//페이지요청
		xhr = getXMLHttpRequest();
		xhr.onreadystatechange = tour_loaded;//콜백함수(open,send후 실행할 함수)정의
		xhr.open('POST', 'toursearch', true);//HTTP요청방식, 요청URL, 비동기
        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xhr.send('l_name='+ l_name +'&t_name='+ t_name);//전달파라미터
	}
	
	function tour_loaded() {//응답데이터 처리
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var t_image = xhr.responseText;

				document.getElementById('sideimg').src = "./ltimage/"+ t_image;
			}
		}
	}
	function local_load(l_name) {//페이지요청
		xhr = getXMLHttpRequest();
		xhr.onreadystatechange = local_loaded;//콜백함수(open,send후 실행할 함수)정의
		xhr.open('POST', 'localsearch', true);//HTTP요청방식, 요청URL, 비동기
        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xhr.send('l_name='+ l_name);//전달파라미터
	}
	
	function local_loaded() {//응답데이터 처리
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var l_image = xhr.responseText;//핵심코드

				document.getElementById('sideimg').src = "./ltimage/"+ l_image;
				
			}
		}
	}
</script>
</head>
<body onload="local_load('안성')">
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
	<div id="menu">
		<img src="./image/map.png" style="margin-left: 65px">
		<font style="font-size:large ; color: #949391; font-weight: bold;">안성</font>
	</div>
	
	<center>
	<div id="maptable" class="t4">
	<div class="topmargin">
		<form action="localboard" >
		<input type="hidden" name="l_name" value="안성">
		<input type="hidden" name="start" value="0">
		<input type="hidden" name="end" value="10">
		<input type="hidden" name="block" value="undefined">
			<table width="864" border="0">
				<tr>
					<td height="42" align="center" valign="middle">&nbsp;</td>
					<td align="center"><input class="myButton" style="width: 150px; margin-left: 190px" type="submit" value="지역게시판"></td>
				</tr>
				<tr>
					<td width="500" height="407" align="center" valign="middle">
					<img src="./ltimage/안성.png" width="500" height="400"usemap="#map" border="0" align="middle">
						<map name="map">
							<area shape="rect" coords="158,59,226,84" onmouseOver="tour_load('안성','미리내성지')" onmouseOut="local_load('안성')">
   							<area shape="rect" coords="219,85,291,107" onmouseOver="tour_load('안성','고삼호수')" onmouseOut="local_load('안성')">
    						<area shape="rect" coords="369,98,446,123" onmouseOver="tour_load('안성','죽주산성')" onmouseOut="local_load('안성')">
    						<area shape="rect" coords="358,180,418,203" onmouseOver="tour_load('안성','칠장사')" onmouseOut="local_load('안성')">
    						<area shape="rect" coords="55,144,115,169" onmouseOver="tour_load('안성','석남사')" onmouseOut="local_load('안성')">
    						<area shape="rect" coords="72,256,155,282" onmouseOver="tour_load('안성','안성팜랜드')" onmouseOut="local_load('안성')">
    						<area shape="rect" coords="176,328,239,354" onmouseOver="tour_load('안성','서운산')" onmouseOut="local_load('안성')">
    						<area shape="rect" coords="202,222,285,248" onmouseOver="tour_load('안성','금광호수')" onmouseOut="local_load('안성')">
						</map>
					</td>
					<td width="475" height="407"  align="center">
							<img id="sideimg" width="350" height="403" border="0">
					</td>
				</tr>
			</table>
		</form>
		</div>
		</div>
	</center>
</div>
</div>
</body>
</html>