<%@page import="kr.co.gildongmu.model.board.bean.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="EUC-KR"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

</head>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
<div id="menu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">Review</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">�ı�Խ���</font>
</div>
<%
	ReviewBean reviewbean = (ReviewBean)request.getAttribute("bean");
%>
<center>
		<div class="t4">
 			 <div class="tblWrap topmargin">
				<form action="modify_r" method="post" name="updateForm">
				<input type="hidden" name="num" value="<%= reviewbean.getR_num() %>">
			<hr>
				<table border="1">
					<tr>
						<td style="text-align: left;">����
						<input type="text" id="r_title" size="75" name="title" value="<%= reviewbean.getR_title() %>" >
						</td>
					</tr>
					
					<tr>
						<td class="ty2" colspan="1">
						<textarea name="content" id="content" rows="10" cols="93" style="padding: 3px">
						<%= reviewbean.getR_content() %></textarea>
						</td>	
					</tr>
					
					<tr align="center">
						<td class="ty2" colspan="2">
							<input class="myButton" type="submit" value="�����Ϸ�" onclick="submitContents(this)"> 
							<input class="myButton" type="reset" value="���">
						</td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</center>
	<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "./se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

//�����塯 ��ư�� ������ �� ������ ���� �׼��� ���� �� submitContents�� ȣ��ȴٰ� �����Ѵ�.
function submitContents(elClickedObj) {
    // �������� ������ textarea�� ����ȴ�.
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
 
    // �������� ���뿡 ���� �� ������ �̰�����
    // document.getElementById("ir1").value�� �̿��ؼ� ó���Ѵ�.
 
    try {
        elClickedObj.updateForm.submit();
    } catch(e) {
    	
    }
}
</script>
	</div>
</div>
</body>
</html>