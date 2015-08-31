<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>성민 숙제</title>
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<%
	List<BoardBean> list = (List<BoardBean>) request.getAttribute("boardlist");
%>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
<div id="menu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">Review</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">후기게시판</font>
</div>
<center>
	<div class="t4">
  		<div class="tblWrap topmargin">
			<form action="write_r" method="post" name="submitForm" enctype="multipart/form-data">
			<hr>
				<table border="1">
					<tr>
						<td class="ty2" style="text-align: left;">제목 
						<input type="text" id="r_title" size="70" name="title"
						style="width: 630px; height:25px; background-color: #EAEAEA; 
						margin: 3px; border-style: solid #000000; "
						></td>
					</tr>
					<tr>
						<select name="select">
						<%
							for(int i=0; i<list.size(); i++){%>
							<option value="<%=list.get(i).getB_num() %>"><%=list.get(i).getB_num() %>번-<%=list.get(i).getB_title() %></option>
						<% }%>
						</select>
					</tr>
					<tr>
						<td class="ty2" style="text-align: left;">사진  
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
						<input class="myButton" type="submit" value="등록" onclick="submitContents(this)"> 
						<input class="myButton" type="reset" value="취소"></td>
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

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
	var title = document.submitForm.title.value;
	var r_image = document.submitForm.r_image.value;
	var content = document.submitForm.content.value;
	var select = document.submitForm.select.value;
	
	
	if(title.trim() == "") {
		alert("제목을 입력해주세요.");
		document.submitForm.title.focus();
		return;
	}
	
	if(r_image.trim() == "") {
		alert("사진을 입력해주세요.");
		document.submitForm.r_image.focus();
		return;
	}
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("ir1").value를 이용해서 처리한다.
 
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