<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="/mainView/tobmenu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�۾���</title>
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script language = "javascript" type = "text/javascript">
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
							minDate: '+2'
						};
						$("#b_sdate").datepicker(clareCalendar);
						$("#b_edate").datepicker(clareCalendar);
	});
</script>
<style>
table.boardtbl{
border-spacing: 0;
margin-left: 0px;
height: 300px;
width: 600px;
margin-top: 10px;
}

table.boardtbl td.title{
position: relative;
width: 70px;
height: 25px;
font-size: 13px;
font-family: 'Nanum Gothic';
font-weight: 400;
border-top: 1px solid #e2e2e2;
border-spacing: 0;
border-right: 1px solid #e2e2e2;
background: #f4f4f4;
}
table.boardtbl td.content{
position: relative;
width: 520px;
height: 25px;
font-size: 13px;
font-family: 'Nanum Gothic';
font-weight: 400;
border-top: 1px solid #e2e2e2;
border-spacing: 0;
}

</style>
</head>
<body>
<%
	String url =  request.getHeader("referer");
%>
	<center>
		<h3>�۾���</h3>

		<form action="writing" method="post" name="frm">
		<input type="hidden" name="url" value="<%=url%>">
			<table class="boardtbl">
				<tr>
					<td class="title">����</td>
					<td class="content">
						<div class="l_name_checkbox">
							<input type="checkbox" name="l_checkbox" value="�ȼ�"> <label for="anseong">�ȼ�</label>
							<input type="checkbox" name="l_checkbox" value="����"> <label for="yeoju">����</label>
							<input type="checkbox" name="l_checkbox" value="ȭ��"> <label for="hwaseong">ȭ��</label>
							<input type="checkbox" name="l_checkbox" value="����"> <label for="pyeongtaek">����</label>
							<input type="checkbox" name="l_checkbox" value="����"> <label for="gapyeong">����</label>
							<input type="checkbox" name="l_checkbox" value="����"> <label for="yangpyeong">����</label>
							<input type="checkbox" name="l_checkbox" value="����"> <label for="seongnam">����</label>
							<input type="checkbox" name="l_checkbox" value="��õ"> <label for="gwacheon">��õ</label>
							<input type="checkbox" name="l_checkbox" value="����"> <label for="paju">����</label>
							<input type="checkbox" name="l_checkbox" value="��õ"> <label for="yeoncheon">��õ</label>
						</div>
					</td>
				</tr>
				<tr>
					<td class="title">����</td>
					<td class="content">
						<input name="b_sdate" type="text" id="b_sdate" size="8" maxlength="8"
						style="text-align: center;"  
						value = "���">
						~
						<input name="b_edate" type="text" id="b_edate" size="8" maxlength="8"
						style="text-align: center;"
						value="����">
					</td>
				</tr>
				<tr>
					<td class="title">�׸�</td>
					<td class="content">
						<div class="b_thema_checkbox">
							<input type="checkbox" name="t_checkbox" value="����" style=" margin: 3px;"> <label for="leisure">����</label>
							<input type="checkbox" name="t_checkbox" value="�Թ�"> <label for="eat">�Թ�</label>
							<input type="checkbox" name="t_checkbox" value="����"> <label for="healing">����</label>
							<input type="checkbox" name="t_checkbox" value="����"> <label for="moneyless">����</label>
							<input type="checkbox" name="t_checkbox" value="����"> <label for="tourist">����</label>
						</div>
					</td>
				</tr>
				<tr>
					<td class="title">�����ο�</td>
					<td class="content"><input type="text" name="b_recruit" style="width: 50px; background-color: #EAEAEA; margin: 3px; "><label>��</label>
					</td>
				</tr>
				<tr>
					<td class="title">����</td>
					<td class="content"><input type="text" name="b_status" value="������" readonly="readonly" >
				</tr>				
				<tr>
					<td class="title">����</td>
					<td class="content"><input type="text" id="b_title" name="b_title" style="width: 400px; background-color: #EAEAEA
					; margin: 3px; border-style: solid #000000; ">
				</tr>
				<tr>
					<td colspan="3">
					<textarea name="b_content" id="ir1" name="content" cols="83" rows="20" style="margin-top: 20px"></textarea>
					 </td>
				</tr>
				<tr align="center">
					<td colspan="2">
					<input type="button" value="���"  class="myButton"	onclick="submitContents()">
					<input type="reset" value="���" class="myButton">
					</td>
				</tr>
			</table>	
		</form>
	</center>
<script type="text/javascript"> 
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "./se2/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// ���� ��� ���� (true:���/ false:������� ����)
		bUseVerticalResizer : true,		// �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����)
		bUseModeChanger : true,			// ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����)
		//aAdditionalFontList : aAdditionalFontSet,		// �߰� �۲� ���
		fOnBeforeUnload : function(){
			//alert("�Ϸ�!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//���� �ڵ�
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["�ε��� �Ϸ�� �Ŀ� ������ ���ԵǴ� text�Դϴ�."]);
	},
	fCreator: "createSEditor2"
});
	
function submitContents() {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// �������� ������ textarea�� ����˴ϴ�.
	
	// �������� ���뿡 ���� �� ������ �̰����� document.getElementById("ir1").value�� �̿��ؼ� ó���ϸ� �˴ϴ�.
	
	try {
		frm.submit();
	} catch(e) {}
}
</script>
</body>
</html>