<%@page import="java.util.List"%>
<%@page import="kr.co.gildongmu.model.application.bean.StatusBean"%>
<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@page import="kr.co.gildongmu.model.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글보기</title>
<script type="text/javascript">
function postpage(posturl, url) {
	if(url == 'null'){
		history.go(-1);
	}
	else if(posturl == 'http://localhost/gildongmu2/write_board' || posturl == 'http://localhost/gildongmu2/view_board'){
		if(url == 'http://localhost/gildongmu2/thema')
			location.href = '/gildongmu2/thema';
		if(url == 'http://localhost/gildongmu2/schedule')
			location.href = '/gildongmu2/schedule';
	}
}

function boarddelete(posturl, url, num){
	if(url == 'null'){
		location.href = 'delete_b?b_num='+num+'&posturl='+posturl;
	}
	else if(posturl == 'http://localhost/gildongmu2/write_board' || posturl == 'http://localhost/gildongmu2/view_board'){
		location.href = 'delete_b?b_num='+num+'&posturl='+url;
	}
}

function request(num, id){
	location.href = 'instatus?b_num='+num+'&r_id='+id;
}

function incruitsuccess(num , size){ //모집완료
	if(size == 0){
		alert('신청한 회원이 없습니다.');
	}
	else{
		location.href = 'upstatus?b_num='+num+'&check=incruit';
	}
}
function readysuccess(num){ //준비완료
	var check = document.getElementsByName("check");
	
	var checkid = "";
	for(i=0; i<check.length; i++){
		if(check[i].checked){
			checkid += check[i].value+",";
		}
	}

	if(checkid != ""){
		location.href = 'upstatus?b_num='+num+'&checkid='+checkid+'&check=ready';
	}
	else{
		alert('회원을 한 명 이상 선택하세요.');
	}
}
function toursuccess(num){ //여행완료
	var check = document.frm.check;
	
	var checkid = "";
	var j = 0;
	for(i=0; i<check.length; i++){
		if(check[i].checked){
			j += 1;
		}
		if(check[i].checked){
			checkid += check[i].value;
			if(i != j-1){
				checkid += ", "
			}
		}
	}
	var flag
	if(checkid == ""){
		flag = confirm("아무도 참석 하지 않았습니까?");
	}
	else{
		flag = confirm("참석자가 "+ checkid + " 맞습니까?");
	}
	
	if(flag){
		location.href = 'upstatus?b_num='+num+'&checkid='+checkid+'&check=tour';
	}
}

function give(num, u_id){
	window.open("view_ratinggive?b_num="+num+"&u_id="+u_id, "get", "height=450, width=420");
	window.close();
}

function userInfo(u_id) {
	window.open("userinfo?u_id="+u_id, "get", "height=450, width=420");
}
function userInfodetail(u_id) {
	window.open("userinfodetail?u_id="+u_id, "get", "height=450, width=420");
}
function LockF5(){
	if (event.keyCode == 116) {
		event.keyCode = 0;
		return false;
	}	
}
document.onkeydown = LockF5;
</script>
<style type="text/css">

table.board{
border-spacing: 0;
margin-left: 0px;
height: 300px;
width: 500px;
margin-top: 10px;
}

table.board tr{
position: relative;
font-size: 13px;
font-family: 'Nanum Gothic';
font-weight: 400;
}

table.board td.title{
position: relative;
width: 70px;
font-size: 13px;
font-family: 'Nanum Gothic';
font-weight: 400;
border-top: 1px solid #e2e2e2;
border-spacing: 0;
border-right: 1px solid #e2e2e2;
background: #f4f4f4;
text-align: center;
}

table.board td.content{
position: relative;
font-size: 13px;
font-family: 'Nanum Gothic';
font-weight: 400;
border-top: 1px solid #e2e2e2;
border-spacing: 0;
}

table.board td.con_content{
position: relative;
font-size: 13px;
font-family: 'Nanum Gothic';
font-weight: 400;
border-spacing: 0;
border-bottom: 1px solid #e2e2e2;
border-top: 3px solid #e2e2e2;
}

</style>
</head>
<body>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
	<div id="menu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">BoardView</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">글보기</font>
	</div>
	<%
		String posturl = (String) request.getHeader("referer");
		String url = (String) request.getAttribute("url");
		BoardBean writeBean = (BoardBean) request.getAttribute("bean");
		List<StatusBean> statuslist = (List<StatusBean>) request.getAttribute("statuslist");
		String r_id = (String)session.getAttribute("result_id");
		
		String statusid = null;
		StatusBean statusbean = null;
		if(statuslist.size() != 0){
			for(int i=0; i<statuslist.size(); i++){
				if(statuslist.get(i).getU_id().equals(r_id)){
					statusbean = statuslist.get(i);
					statusid = r_id;
				}
			}
		}
	%>
	<form action="modify_board" method="post" name="frm">
	<input type="hidden" name="b_num" value="<%= writeBean.getB_num() %>">
	<input type="hidden" name="posturl" value="<%= posturl %>">
	<center>
		<table class="board topmargin" style="margin-top: 50px;">
			<tr>
			<td class="title">글번호</td>
			<td class="content">${bean.b_num}</td>
			</tr>
			<tr>
			<td class="title">지역</td>
			<td class="content">${bean.l_name}</td>
			</tr>
			<tr>
			<td class="title">일정</td>
			<td class="content">${bean.b_sdate} ~ ${bean.b_edate }</td>
			</tr>
			<tr>
			<td class="title">테마</td>
			<td class="content">${bean.b_thema}</td>
			</tr>
			<tr>
			<td class="title">모집인원</td>
			<td class="content">${bean.b_recruit}</td>
			</tr>
			<tr>
			<td class="title">상태</td>
			<td class="content">${bean.b_status}</td>
			</tr>
			<tr>
			<td class="title">작성자</td>
			<td class="content">${bean.u_id}</td>
			</tr>
			<tr>
			<td class="title">제목</td>
			<td class="content">${bean.b_title}</td>
			</tr>
			<tr class="title">
			<td colspan="3"  class="con_content">
				${bean.b_content }
			</td>
			</tr>
			<tr>
			<%
			if(!r_id.equals("admin")){
				if(writeBean.getB_status().equals("모집중") || writeBean.getB_status().equals("모집완료")){%>
					<td class="title">신청현황</td>
				<%}
				if(writeBean.getB_status().equals("준비완료") || writeBean.getB_status().equals("여행완료")){%>
					<td class="title">선택결과</td>
				<%}
			}%>
			</tr>
			<%
			if(!r_id.equals("admin")){%>
			<tr>
			<td colspan="3"  class="con_content">
			
			<%	if(writeBean.getB_status().equals("모집중")){%>
					<%for(int i=0; i<statuslist.size(); i++){%>
						<a style="color:black; text-decoration: none" href="javascript:userInfo('<%=statuslist.get(i).getU_id() %>')"><%=statuslist.get(i).getU_id() %></a>
					<%}%>
				<%}
				if(writeBean.getB_status().equals("모집완료")){%>
					<%for(int i=0; i<statuslist.size(); i++){
						if(writeBean.getU_id().equals(r_id)){%>
							<input type="checkbox" name="check" value="<%=statuslist.get(i).getU_id()%>">
							<a style="color:black; text-decoration: none" href="javascript:userInfodetail('<%=statuslist.get(i).getU_id() %>')"><%=statuslist.get(i).getU_id() %></a>
						<%}
						else{%>
							<input type="checkbox" name="check" value="<%=statuslist.get(i).getU_id()%>">
							<a style="color:black; text-decoration: none" href="javascript:userInfo('<%=statuslist.get(i).getU_id() %>')"><%=statuslist.get(i).getU_id() %></a>
						<%}
					}%>
				<%}
				if(writeBean.getB_status().equals("준비완료") || writeBean.getB_status().equals("여행완료")){%>
					<%for(int i=0; i<statuslist.size(); i++){
						if(statuslist.get(i).getS_apply().equals("T")){
							if(writeBean.getU_id().equals(r_id)){%>
								<input type="checkbox" name="check" value="<%=statuslist.get(i).getU_id()%>" checked="checked">
								<a style="color:black; text-decoration: none" href="javascript:userInfodetail('<%=statuslist.get(i).getU_id() %>')"><%=statuslist.get(i).getU_id() %></a>
							<%}
							else{%>
								<input type="checkbox" name="check" value="<%=statuslist.get(i).getU_id()%>" checked="checked" onclick="return false;">
								<a style="color:black; text-decoration: none" href="javascript:userInfo('<%=statuslist.get(i).getU_id() %>')"><%=statuslist.get(i).getU_id() %></a>
							<%}
						}
						else if(statuslist.get(i).getS_apply().equals("F")){
							if(writeBean.getU_id().equals(r_id)){%>
								<input type="checkbox" name="check" value="<%=statuslist.get(i).getU_id()%>" onclick="return false;">
								<a style="color:black; text-decoration: none" href="javascript:userInfodetail('<%=statuslist.get(i).getU_id() %>')"><%=statuslist.get(i).getU_id() %></a>
							<%}
							else{%>
								<input type="checkbox" name="check" value="<%=statuslist.get(i).getU_id()%>" onclick="return false;">
								<a style="color:black; text-decoration: none" href="javascript:userInfo('<%=statuslist.get(i).getU_id() %>')"><%=statuslist.get(i).getU_id() %></a>
							<%}
						}	
					}%>
				<%}%>

			</td>
			</tr>
			
			<tr>
			<%if(writeBean.getB_status().equals("여행완료")){%>
				<td class="title">참석자</td>
			<%}%>
			</tr>
			
			<tr>
			<td>
			<%if(writeBean.getB_status().equals("여행완료")){%>
				<%for(int i=0; i<statuslist.size(); i++){
					if(statuslist.get(i).getS_apply().equals("T")){
						if(statuslist.get(i).getS_attend().equals("T")){%>
							<font color="blue"><%=statuslist.get(i).getU_id()%></font>
						<%}
						else if(statuslist.get(i).getS_attend().equals("F")){%>
							<font color="red"><%=statuslist.get(i).getU_id()%></font>
						<%}
					}%>
				<%}
			}%>
			</td>
			</tr>
			<%}%>
		</table>
			<!-- 모집자의 입장! -->	
			<%if(!r_id.equals("admin")){
			if(writeBean.getU_id().equals(r_id)){
				if(writeBean.getB_status().equals("모집중")){%>
					<input type="button" style="margin-top: 20px"class="myButton"value="모집완료" onclick="incruitsuccess('<%=writeBean.getB_num()%>','<%=statuslist.size()%>')">
				<%}
				else if(writeBean.getB_status().equals("모집완료")){%>
					<input type="button" style="margin-top: 20px"class="myButton"value="준비완료" onclick="readysuccess('<%=writeBean.getB_num()%>')">
				<%}
				else if(writeBean.getB_status().equals("준비완료")){%>
					<input type="button" style="margin-top: 20px" class="myButton"value="여행완료" onclick="toursuccess('<%=writeBean.getB_num()%>')">
				<%}
			}
			}%>
			
			<!-- 신청자의 입장! -->	
			<%
			if(!r_id.equals("admin")){
				
			if(!writeBean.getU_id().equals(r_id)){ 
				if(writeBean.getB_status().equals("준비완료") && statusbean.getS_apply().equals("T")){%>
				<label style="color: blue; margin-top: 100px">당첨</label>
				<% }
				if(writeBean.getB_status().equals("준비완료") && statusbean.getS_apply().equals("F")){%>
				<label style="color: red; margin-top: 20px">탈락</label>
				<% }
			}
			
			if(statusid == null){
				if(writeBean.getB_status().equals("모집중") && !writeBean.getU_id().equals(r_id)){%>
				<input type="button" style="margin-top: 20px" class="myButton"value="신청하기" onclick="request('<%=writeBean.getB_num()%>','<%=r_id%>')">
			<%}
			}
			if(statusid != null){
				if(writeBean.getB_status().equals("모집중") && statusbean.getS_apply().equals("N")){%>
					<input type="button" style="margin-top: 20px" class="myButton"value="선택중">
				<%}
				if(writeBean.getB_status().equals("여행완료") && statusbean.getS_give().equals("F")){%>
					<input type="button" style="margin-top: 20px" class="myButton" value="평가하기" onclick="give('<%=writeBean.getB_num()%>','<%=writeBean.getU_id()%>')">
				<%}
			}
			}%>

		
		<%if( writeBean.getB_status().equals("모집중") && writeBean.getU_id().equals(r_id) ) {%>
			<input type="submit" class="myButton" value="수정" style="margin-left: 200px; margin-top: 20px">
			<input type="button" class="myButton" value="삭제"  style="margin-top: 21px;" onclick="boarddelete('<%=posturl%>', '<%=url%>', '<%=writeBean.getB_num()%>')">
		<%}%>
		
		<%if(r_id.equals("admin")) {%>
			<input type="button" class="myButton" value="삭제"  style="margin-top: 21px;" onclick="boarddelete('<%=posturl%>', '<%=url%>', '<%=writeBean.getB_num()%>')">
		<%}%>
		<input type="button" class="myButton" value="이전" 
		onclick="postpage('<%=posturl%>','<%=url%>')" style="margin-top: 20px">
		</center>
		</form>
</div>
</div>
</body>
</html>