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
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
	<div id="menu">
		<font style="border-style: solid; background-color: #f5f5f5 ;font-size: large; color: #3a5795;">����</font>
		<font style="font-size: small;"></font>
	</div>
<body onload="local_load('����')">
	<center>
		<div class="t4">
		<div class="topmargin">
		<form action="localboard" >
		<input type="hidden" name="l_name" value="����">
		<input type="hidden" name="start" value="0">
		<input type="hidden" name="end" value="10">
		<input type="hidden" name="block" value="undefined">
			<table width="900" border="0">
				<tr>
					<td width="500" height="522" align="center" valign="middle">
					<img src="./ltimage/����.png" height="500"usemap="#map" border="0" align="middle">
						<map name="map">
							<area shape="rect" coords="159,243,213,259" onmouseOver="tour_load('����','���̵尡��')" onmouseOut="local_load('����')">
   							<area shape="rect" coords="150,402,213,425" onmouseOver="tour_load('����','�������̽�')" onmouseOut="local_load('����')">
    						<area shape="rect" coords="144,336,197,352" onmouseOver="tour_load('����','�ڶ�������')" onmouseOut="local_load('����')">
    						<area shape="rect" coords="36,271,94,289" onmouseOver="tour_load('����','�����Ǫ����')" onmouseOut="local_load('����')">
    						<area shape="rect" coords="125,294,171,311" onmouseOver="tour_load('����','ȣ��ȣ��')" onmouseOut="local_load('����')">
    						<area shape="rect" coords="67,313,135,328" onmouseOver="tour_load('����','��ħ�������')" onmouseOut="local_load('����')">
					  </map>
					</td>
					<td width="475" height="522"  align="center">
							<img id="sideimg" width="350" height="403" border="0">
					</td>
				</tr>
				<tr>
					<td height="42" align="center" valign="middle">&nbsp;</td>
					<td align="center"><input class="myButton" style="width: 100px; margin-left: 230px" type="submit" value="�Խ�������"></td>
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