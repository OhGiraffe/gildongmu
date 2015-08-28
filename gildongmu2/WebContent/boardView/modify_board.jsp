<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
 
  //******************************************************************************
  // �󼼰˻� �޷� ��ũ��Ʈ
  //******************************************************************************
  var clareCalendar = {
   monthNamesShort: ['1��','2��','3��','4��','5��','6��','7��','8��','9��','10��','11��','12��'],
   dayNamesMin: ['��','��','ȭ','��','��','��','��'],
   weekHeader: 'Wk',
   dateFormat: 'yy-mm-dd', //����(20120303)
   autoSize: false, //���丮������(body�� �����±��� ������ ������)
   changeMonth: true, //�����氡��
   changeYear: true, //�⺯�氡��
   showMonthAfterYear: true, //�� �ڿ� �� ǥ��
   buttonImageOnly: false, //�̹���ǥ��
   buttonText: '�޷¼���', //��ư �ؽ�Ʈ ǥ��
   //showOn: "both", //������Ʈ�� �̹��� ���� ���(both,button)
   yearRange: '1990:2020' //1990����� 2020�����
  };
  $("#b_sdate").datepicker(clareCalendar);
  $("#b_edate").datepicker(clareCalendar);
  $("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //�̹�����ư style����
  $("#ui-datepicker-div").hide(); //�ڵ����� �����Ǵ� div��ü ����  
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
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="second"></div>
<div id="third">
<%
	String url = (String)request.getAttribute("url");
	BoardBean bbean = (BoardBean)request.getAttribute("bean");
	String lname[] = {"","","","","","","","","",""};
	String llname[] = bbean.getL_name().split(",");
	String tname[] = {"","","","",""};
	String ttname[] = bbean.getB_thema().split(",");
	
	for(int i=0; i<llname.length; i++){
		lname[i]=llname[i];
	}
	
	for(int i=0; i<ttname.length; i++){
		tname[i]=ttname[i];
	}
%>
	<center>
		<h3>�ۼ���</h3>
		<form action="modify_b" method="post" name="frm">
		<input type="hidden" name="url" value="<%=url%>">
		<input type="hidden" name="b_num" value="<%=bbean.getB_num()%>">
		<input type="hidden" name="b_count" value="<%=bbean.getB_count()%>">
		<input type="hidden" name="b_date" value="<%=bbean.getB_date()%>">
			<table class="boardtbl" >
				<tr>
					<td class="title">����</td>
					<td class="content">
						<div class="l_name_checkbox">
						<% 
							String lcheck[]={"�ȼ�","����","ȭ��","����","����","����","����","��õ","����","��õ"};
							for(int i=0; i<lcheck.length; i++){ 
								for(int j=0; j<lname.length; j++){
									if(lcheck[i].equals(lname[j])){%>
										<input type="checkbox" name="l_checkbox" value="<%=lcheck[i] %>" checked="checked"> <label><%=lcheck[i] %></label>
									<% break;
									}
									else if(lname.length == j+1){%>
										<input type="checkbox" name="l_checkbox" value="<%=lcheck[i] %>"> <label><%=lcheck[i] %></label>
									<%}
								}
								
							}%>
						</div>
					</td>
				</tr>
				<tr>
					<td class="title">����</td>
					<td class="content">
						<input name="b_sdate" type="text" id="b_sdate" size="8" maxlength="8"  value = "${bean.b_sdate}"
						style="text-align: center;">
						~
						<input name="b_edate" type="text" id="b_edate" size="8" maxlength="8" value="${bean.b_edate }"
						style="text-align: center;">
					</td>
				</tr>
				<tr>
					<td class="title">�׸�</td>
					<td class="content">
						<div class="b_thema_checkbox">
						<% 
							String tcheck[]={"����","�Թ�","����","����","����"};
							for(int i=0; i<tcheck.length; i++){
								for(int j=0; j<tname.length; j++){
									if(tcheck[i].equals(tname[j])){%>
										<input type="checkbox" name="t_checkbox" value="<%=tcheck[i] %>" checked="checked"> <label><%=tcheck[i] %></label>
									<%	break;
									}
									else if(tname.length == j+1){%>
									<input type="checkbox" name="t_checkbox" value="<%=tcheck[i] %>"> <label><%=tcheck[i] %></label>
									<%}
								}
							}%>
						</div>
					</td>
				</tr>
				<tr>
					<td class="title">�����ο�</td>
					<td class="content"><input type="text" name="b_recruit" value="${bean.b_recruit}"><label>��</label>
					</td>
				</tr>
				<tr>
					<td class="title">����</td>
					<td class="content"><input type="text" name="b_status" value="������" readonly="readonly" value="${bean.b_status}">
				</tr>				
				<tr>
					<td class="title">����</td>
					<td class="content"><input type="text" id="b_title" name="b_title" value="${bean.b_title}">
				</tr>
				<tr>
					<td colspan="3" class="content">
					<textarea name="b_content" id="ir1" name="content" cols="83" rows="20">${bean.b_content }</textarea>
					 </td>
				</tr>
				<tr align="center">
					<td colspan="2">
					<input type="button" value="�����Ϸ�" class="myButton" onclick="modifyContents()">
					<input type="reset" value="���" class="myButton">
					</td>
				</tr>
			</table>	
		</form>
	</center>
				</div>
		<div id="fourth"></div>
		<div id="fifth"></div>
		</div>
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
	
function modifyContents() {
	var l_cnt = 0;
	for (i=0; i<document.frm.l_checkbox.length; i++ ) {
	    if (document.frm.l_checkbox[i].checked==true){
	    	l_cnt++;
	    }
	}
	var b_sdate = document.frm.b_sdate.value;
	var b_edate = document.frm.b_edate.value;
	var t_cnt = 0;
	for (i=0; i<document.frm.t_checkbox.length; i++ ) {
	    if (document.frm.t_checkbox[i].checked==true){
	    	t_cnt++;
	    }
	}
	var b_recruit = document.frm.b_recruit.value;
	var b_title = document.frm.b_title.value;
	
	if(l_cnt == 0) {
		alert("������ �������ּ���.");
		return;
	}
	
	if(b_sdate == "���") {
		alert("������� �Է����ּ���.");
		document.frm.b_sdate.focus();
		return;
	}
	
	if(b_edate == "����") {
		alert("�������� �Է����ּ���.");
		document.frm.b_edate.focus();
		return;
	}
	
	if(t_cnt == 0) {
		alert("�׸��� �������ּ���.");
		return;
	}
	
	if(b_recruit.trim() == "") {
		alert("�����ο��� �Է����ּ���.");
		document.frm.b_recruit.focus();
		return;
	}
	
	if(b_title.trim() == "") {
		alert("������ �Է����ּ���.");
		document.frm.b_title.focus();
		return;
	}
	
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// �������� ������ textarea�� ����˴ϴ�.
	
	// �������� ���뿡 ���� �� ������ �̰����� document.getElementById("ir1").value�� �̿��ؼ� ó���ϸ� �˴ϴ�.
	
	try {
		frm.submit();
	} catch(e) {}
}
</script>
</body>
</html>