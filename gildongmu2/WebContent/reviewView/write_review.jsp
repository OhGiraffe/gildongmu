<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>���� ����</title>
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
<div id="menu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">Review</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">�ı�Խ���</font>
</div>
<center>
	<div class="t4">
  		<div class="tblWrap topmargin">
			<form action="write_r" method="post" name="submitForm" enctype="multipart/form-data">
			<hr>
				<table border="1">
					<tr>
						<td class="ty2" style="text-align: left;">���� 
						<input type="text" id="r_title" size="70" name="title"
						style="width: 630px; height:25px; background-color: #EAEAEA; 
						margin: 3px; border-style: solid #000000; "
						></td>
					</tr>
					<tr>
						<td class="ty2" style="text-align: left;">����  
						<input type="file" name="r_image" id="r_image"
							style="BACKGROUND-COLOR: white"
							onMouseOver="this.style.backgroundColor = '#e6eff7'"
							onMouseOut="this.style.backgroundColor = 'white'" required>
						</td>
					</tr>
					
					<tr>
						<td class="ty2" colspan="1">
						<textarea name="content" id="content" rows="10" cols="93"></textarea>
						</td>
					</tr>
				
					<tr align="center">
						<td class="ty2" colspan="2">
						<input class="myButton" type="submit" value="���" onclick="submitContents(this)"> 
						<input class="myButton" type="reset" value="���"></td>
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
        elClickedObj.submitForm.submit();
    } catch(e) {
    	
    }
}
</script>
</div>
</div>
</body>
</html>