<%@page import="kr.co.gildongmu.model.board.bean.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="UTF-8"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>

</head>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
<div id="menu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">Review</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">후기게시판</font>
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
						<td style="text-align: left;">제목
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
							<input class="myButton" type="submit" value="수정완료" onclick="submitContents(this)"> 
							<input class="myButton" type="reset" value="취소">
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

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
	var title = document.updateForm.title.value;	
	
	if(title.trim() == "") {
		alert("제목을 입력해주세요.");
		document.updateForm.title.focus();
	}
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("ir1").value를 이용해서 처리한다.
 
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