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
<body onload="local_load('성남')">
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
	<div id="menu">
		<img src="./image/map.png" style="margin-left: 65px">
		<font style="font-size:large ; color: #949391; font-weight: bold;">성남</font>
	</div>
	<center>
	<div id="maptable" class="t4">
		<div class="topmargin">
		<form action="localboard" >
		<input type="hidden" name="l_name" value="성남">
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
					<img src="./ltimage/성남.png" width="500" height="400"usemap="#anseong_area_map" border="0" align="middle">
						<map name="anseong_area_map">
						<area shape="rect"  coords="295,257,365,277" onmouseOver="tour_load('성남','율동공원')" onmouseOut="local_load('성남')">
						<area shape="rect"  coords="372,27,442,51" onmouseOver="tour_load('성남','남한산성')" onmouseOut="local_load('성남')">
						<area shape="rect" coords="209,277,308,297" onmouseOver="tour_load('성남','분당중앙공원')" onmouseOut="local_load('성남')">
						<area shape="rect"coords="141,259,207,280" onmouseOver="tour_load('성남','잡월드')" onmouseOut="local_load('성남')">
						<area shape="rect"  coords="234,233,332,257" onmouseOver="tour_load('성남','성남아트센터')" onmouseOut="local_load('성남')">
						</map>
					</td>
					<td width="475" height="407"  align="center">
							<img id="sideimg" width="350" height="403" border="0" >
					</td>
				</tr>
			</table>
		</form>
	</center>
</div>
</div>
</body>
</html>