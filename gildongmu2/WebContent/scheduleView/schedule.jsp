<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<title>Insert title here</title>
<link href="http://ts.daumcdn.net/custom/blog/0/606/skin/images/nanumgothic.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function() {
	var clareCalendar = {
							monthNamesShort : [ '1��', '2��', '3��', '4��', '5��',
												'6��', '7��', '8��', '9��', '10��', '11��', '12��' ],
							dayNamesMin : [ '��', '��', 'ȭ', '��', '��', '��', '��' ],
							dateFormat : 'yy-mm-dd', //����(20120303)
							changeMonth : true, //�����氡��
							changeYear : true, //�⺯�氡��
							showMonthAfterYear : true, //�� �ڿ� �� ǥ��
							yearRange : '1990:2020', //1990����� 2020�����
							minDate: '+0'
						};
						$("#b_sdate").datepicker(clareCalendar);
						$("#b_edate").datepicker(clareCalendar);
	});
</script>

<script type="text/javascript">
	function print() {
		var sdate = $("#b_sdate").datepicker().val();
		var edate = $("#b_edate").datepicker().val();

		load(sdate, edate, 0, 10);
	}

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
		function load(sdate, edate,start, end, block) {//��������û
			xhr = getXMLHttpRequest();
			xhr.onreadystatechange = loaded;//�ݹ��Լ�(open,send�� ������ �Լ�)����
			xhr.open('POST', 'schedule/search.do', true);//HTTP��û���, ��ûURL, �񵿱�
	        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			xhr.send('sdate='+ sdate +"&edate="+edate+'&start='+start+'&end='+end+'&block='+block);//�����Ķ����
		}
		function loaded() {//���䵥���� ó��
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var data = xhr.responseText;
					document.getElementById('tablearea').innerHTML=data;
				}
			}
		}
		function move(num){
			location.href = "bview.do?b_num="+num+"&view=view";
		}
		
		function write_movepage(){
	    	location.href = "write_board.do";
	    }
		function userInfo(u_id) {
			window.open("loginView/user_userinfo.jsp?u_id="+u_id, "get", "height=450, width=420");
		}
</script>
</head>
<div id="myBar">
<ul class="side">
			<ul>
				<li type="none" style="font-weight: bold; font-size: 16px; color: #ffffff;
				width: 160px; height: 26px; background-color: #22becc;">
				����
				</li>
				<form id="check">
				<li type="none" style="margin-top: -16px; font-size: large;"><img src="./image/cal.jpg" style="width: 25px ; height: 25px">
				<input type="text" name="sdate" id="b_sdate" 
				size="8" maxlength="8" value="�����" onchange="print()"
				style="background-color: #EAEAEA; text-align: center;
				width: 90px ; height: 30px;">
				  ~
				<img src="./image/cal.jpg" style="width: 25px ; height: 25px">
				<input type="text" name="edate" id="b_edate" 
				size="8" maxlength="8" value="������" onchange="print()"
				style="background-color: #EAEAEA; text-align: center;
				width: 90px ; height: 30px"
				></li><br>
				</form>

			</ul>
	</ul>
</div>
<div id="myMain">
<div id="myMenu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">Schedule</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">����</font>
</div>
<body onload="javascript:print()">
	<center>
		<div class="t3" style="margin-right: 170px;margin-top: -50px;">
			<div class="tblWrap topmargin">
				<table>
					<colgroup>
						<col width="50px">
						<col width="70px">
						<col width="120px">
						<col width="80px">
						<col width="200px">
						<col width="50px">
						<col width="70px">
						<col width="50px">
						<col width="80px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">�۹�ȣ</th>
							<th scope="col">����</th>
							<th scope="col">����</th>
							<th scope="col">�׸�</th>		
							<th scope="col">����</th>
							<th scope="col">�ۼ���</th>
							<th scope="col">�����ο�</th>
							<th scope="col">��ȸ</th>
							<th scope="col">����</th>
						</tr>
					</thead>
					<tbody id="tablearea">
					<tr>
					<td colspan="9"></td>
					</tr>
					</tbody>
				</table>
				<span id="pageN"></span>
			</div>
			<br>
		</div>
		<input type="button" value="�۾���" name="write" class="myButton" 
		style="position: relative; left: 365px"
		onclick="write_movepage()">
	</center>
</div>
</div>
</body>
</html>
