<%@page import="java.util.List"%>
<%@page import="kr.co.gildongmu.model.board.bean.ReviewReplyBean"%>
<%@page import="kr.co.gildongmu.model.board.bean.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js"
	charset="UTF-8"></script>
<%
	request.setCharacterEncoding("UTF-8");
	ReviewBean reviewBean = (ReviewBean) request.getAttribute("reviewBean");

	List<ReviewReplyBean> replyList = (List<ReviewReplyBean>) request.getAttribute("replyList");
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
<script type="text/javascript">
function writeReply(num) {
	var content = document.getElementById("replycontent").value;
	location.href = "write_re?r_num=" + num + "&content=" +content;

}

function deleteReply(r_num, rr_num) {
	location.href = "delete_re?r_num=" + r_num + "&rr_num=" +rr_num;
}

function back() {
	location.href = "review";
}
</script>

</head>
<%
	String result_id = (String)session.getAttribute("result_id");
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
				<form action="delete_r?num=<%=reviewBean.getR_num()%>" method="post" name="editForm">
					<hr>
					<table>
						<tr>
							<td class="reviewtitle" style="text-align: left;">제목
							<input type="text" id="r_title" size="50" disabled="disabled" value="<%=reviewBean.getR_title()%>"
							style="margin-left: 3px; background-color: #ffffff">
							</td>
							<%
							if(result_id != null){
							
								if(result_id.equals(reviewBean.getU_id())) {
							%>
								<td>
								<a href="modify_review?num=<%=reviewBean.getR_num()%>">
									<input class="myButton" type="button" value="수정"
									style="font-size: 12px; font-family: inherit; background-color: #ffffff; width: 50px">
								</a>
								<input class="myButton" type="submit" value="삭제" style="font-size: 12px; font-family: inherit;  background-color: #ffffff ;width: 50px" 
								onclick="submitContents(this)"> 
								<input class="myButton" type="reset" value="목록" style="font-size: 12px; font-family: inherit;  background-color: #ffffff ;width: 50px" 
								onclick="back()">
								</td>
								<% }
								else if(result_id.equals("admin")){%>
								<td>
								<input class="myButton" type="submit" value="삭제" style="font-size: 12px; font-family: inherit;  background-color: #ffffff ;width: 50px" 
								onclick="submitContents(this)"> 
								<input class="myButton" type="reset" value="목록" style="font-size: 12px; font-family: inherit;  background-color: #ffffff ;width: 50px" 
								onclick="back()">
								</td>
								<% }
								else{%>
								<td>
								<input class="myButton" type="reset" value="목록" style="font-size: 12px; font-family: inherit;  background-color: #ffffff ;width: 50px" 
								onclick="back()">
								</td>
								<% }
								
							}else if(result_id == null) { %>
							<td>
							<input class="myButton" type="reset" value="목록" style="font-size: 12px; font-family: inherit;  background-color: #ffffff ;width: 50px" 
							onclick="back()">
							</td>
							<% }%>
						</tr>
						<tr style="height: 250px">
							<td class="ty2" colspan="2" style="text-align: left;"><%=reviewBean.getR_content()%></td>
						</tr>
						
						<!-- ==================코멘트==================== -->
						<tr class="comment">
							<table>
								<tr>
									<td width="10%">작성자</td>
									<td width="10%">작성일</td>
									<td width="80%">내용</td>
								</tr>
									<%
										for(int i=0; i<replyList.size() ; i++) {
									%>
									<tr style="background-color: #F6F6F6;" >
										<td width="10%" style="color: gray;"><%=replyList.get(i).getU_id()%></td>
										<td width="10%" style="color: gray;"><%=replyList.get(i).getRr_date()%></td>
										<td width="65%" style="color: gray; text-align: left; padding-left: 20px"><%=replyList.get(i).getRr_content()%></td>
										<td width="5%" style="color: gray;">
											<%
												if(result_id != null){
													if(result_id.equals(replyList.get(i).getU_id()) || result_id.equals("admin")) {
											%>
											<input type="button" value="X" onclick=" deleteReply(<%= reviewBean.getR_num()%>,<%=replyList.get(i).getRr_num()%>)">
										</td>
													<% }
												}else { %>
										</td>
									<% } %>
									</tr>
									<%}%>
			
									<table>
										<tr style="background-color: #F6F6F6;">
											<td>내용</td>
											<td>
											<textarea name="replycontent" id="replycontent" style="width:560px; height:30px; resize: none;"></textarea>
											</td>
											<td>
											<input class="myButton" type="button" value="입력" onclick="writeReply(<%=reviewBean.getR_num()%>)">
											</td>
										</tr>
									</table>
							</table>
						</tr>
						<!-- end comment -->
					</table>
			</div>	
		</div>
	</form>
	</center>
	
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "content",
			sSkinURI : "./se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});

		//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
		function submitContents(elClickedObj) {
			// 에디터의 내용이 textarea에 적용된다.
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

			// 에디터의 내용에 대한 값 검증은 이곳에서
			// document.getElementById("ir1").value를 이용해서 처리한다.

			try {
				elClickedObj.editForm.submit();
			} catch (e) {

			}
		}
	</script>
	</div>
</div>
</body>
</html>