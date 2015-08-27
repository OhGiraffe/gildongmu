<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
<body onload="local_load('연천')">
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
	<div id="menu">	
		<font style="border-style: solid;background-color: #f5f5f5;font-size: large; color: #3a5795;">연천</font>
		<font style="font-size: small;"></font>
	</div>
	<center>
						<div class="t4">
		<div class="topmargin">
		<form action="localboard" >
		<input type="hidden" name="l_name" value="연천">
		<input type="hidden" name="start" value="0">
		<input type="hidden" name="end" value="10">
		<input type="hidden" name="block" value="undefined">
			<table width="864" border="0">
				<tr>
					<td width="500" height="407" align="center" valign="middle">
					<img src="./ltimage/연천.png" width="500" height="400"usemap="#anseong_area_map" border="0" align="middle">
						<map name="anseong_area_map">
							<area shape="rect"  coords="291,287,404,307" onmouseOver="tour_load('연천','전곡선사박물관')" onmouseOut="local_load('연천')">
							<area shape="rect"  coords="352,230,424,248" onmouseOver="tour_load('연천','재인폭포')" onmouseOut="local_load('연천')">
							<area shape="rect"  coords="122,215,213,232" onmouseOver="tour_load('연천','석장리미술관')" onmouseOut="local_load('연천')">
							<area shape="rect" coords="171,250,243,268" onmouseOver="tour_load('연천','숭의전지')" onmouseOut="local_load('연천')">
							<area shape="rect"coords="224,219,307,236" onmouseOver="tour_load('연천','허브빌리지')" onmouseOut="local_load('연천')">
						  <area shape="rect"  coords="249,166,309,183" onmouseOver="tour_load('연천','임진강')" onmouseOut="local_load('연천')">
						</map>
					</td>
					<td width="475" height="407"  align="center">
							<img src="./images/anseong.jpg" id="sideimg" width="350" height="403" border="0" >
					</td>
				</tr>
				<tr>
					<td height="42" align="center" valign="middle">&nbsp;</td>
					<td align="center"><input class="myButton" style="width: 100px; margin-left: 230px" type="submit" value="게시판으로"></td>
				</tr>
			</table>
		</form>
	</center>
</div>
</div>
</body>
</html>