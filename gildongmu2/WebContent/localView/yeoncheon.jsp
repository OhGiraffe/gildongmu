<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function getXMLHttpRequest() {//XMLHttpRequest��ü����
		if (window.ActiveXObject) {//IE���
			try {
				return new ActiveXObject('Msxml2.XMLHTTP');
			} catch (e) {
				return new ActiveXObject('Microsoft.XMLHTTP');
			}
		} else if (window.XMLHttpRequest) {//��IE���
			return new XMLHttpRequest();
		} else
			return null;
	}//getXMLHttpRequest()

	var xhr;
	function tour_load(l_name, t_name) {//��������û
		xhr = getXMLHttpRequest();
		xhr.onreadystatechange = tour_loaded;//�ݹ��Լ�(open,send�� ������ �Լ�)����
		xhr.open('POST', 'toursearch', true);//HTTP��û���, ��ûURL, �񵿱�
        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xhr.send('l_name='+ l_name +'&t_name='+ t_name);//�����Ķ����
	}
	
	function tour_loaded() {//���䵥���� ó��
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var t_image = xhr.responseText;

				document.getElementById('sideimg').src = "./ltimage/"+ t_image;
			}
		}
	}
	function local_load(l_name) {//��������û
		xhr = getXMLHttpRequest();
		xhr.onreadystatechange = local_loaded;//�ݹ��Լ�(open,send�� ������ �Լ�)����
		xhr.open('POST', 'localsearch', true);//HTTP��û���, ��ûURL, �񵿱�
        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xhr.send('l_name='+ l_name);//�����Ķ����
	}
	
	function local_loaded() {//���䵥���� ó��
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var l_image = xhr.responseText;//�ٽ��ڵ�

				document.getElementById('sideimg').src = "./ltimage/"+ l_image;
				
			}
		}
	}
</script>
</head>
<body onload="local_load('��õ')">
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
	<div id="menu">	
		<font style="border-style: solid;background-color: #f5f5f5;font-size: large; color: #3a5795;">��õ</font>
		<font style="font-size: small;"></font>
	</div>
	<center>
						<div class="t4">
		<div class="topmargin">
		<form action="localboard" >
		<input type="hidden" name="l_name" value="��õ">
		<input type="hidden" name="start" value="0">
		<input type="hidden" name="end" value="10">
		<input type="hidden" name="block" value="undefined">
			<table width="864" border="0">
				<tr>
					<td width="500" height="407" align="center" valign="middle">
					<img src="./ltimage/��õ.png" width="500" height="400"usemap="#anseong_area_map" border="0" align="middle">
						<map name="anseong_area_map">
							<area shape="rect"  coords="291,287,404,307" onmouseOver="tour_load('��õ','�����ڹ���')" onmouseOut="local_load('��õ')">
							<area shape="rect"  coords="352,230,424,248" onmouseOver="tour_load('��õ','��������')" onmouseOut="local_load('��õ')">
							<area shape="rect"  coords="122,215,213,232" onmouseOver="tour_load('��õ','���帮�̼���')" onmouseOut="local_load('��õ')">
							<area shape="rect" coords="171,250,243,268" onmouseOver="tour_load('��õ','��������')" onmouseOut="local_load('��õ')">
							<area shape="rect"coords="224,219,307,236" onmouseOver="tour_load('��õ','��������')" onmouseOut="local_load('��õ')">
						  <area shape="rect"  coords="249,166,309,183" onmouseOver="tour_load('��õ','������')" onmouseOut="local_load('��õ')">
						</map>
					</td>
					<td width="475" height="407"  align="center">
							<img src="./images/anseong.jpg" id="sideimg" width="350" height="403" border="0" >
					</td>
				</tr>
				<tr>
					<td height="42" align="center" valign="middle">&nbsp;</td>
					<td align="center"><input class="myButton" style="width: 100px; margin-left: 230px" type="submit" value="�Խ�������"></td>
				</tr>
			</table>
		</form>
	</center>
</div>
</div>
</body>
</html>