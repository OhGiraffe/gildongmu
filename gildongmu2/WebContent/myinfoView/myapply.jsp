<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function userInfo(u_id) {
	window.open("userinfo?u_id="+u_id, "get", "height=450, width=420");
}

function move(num){
	location.href = "view_board?b_num="+num+"&view=view";
}

</script>
</head>
<%
	ArrayList<BoardBean> list = new ArrayList<BoardBean>();
	list = (ArrayList<BoardBean>)request.getAttribute("myapply");

%>

<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="myBar">
<ul class="side" style="margin-top: 24px;">
<ul>
		<li type="none" style="font-weight: bold; font-size: 16px; color: #ffffff;
		width: 160px; height: 26px; background-color: #22becc;">
		내정보
		</li>
		<a href="myinfo.do" style="text-decoration: none; margin: -10px 0 0 250px" >내정보</a>
		<a href="mylist.do" style="text-decoration: none; margin: -30px 0 0 410px">내가 쓴 글</a>
		<a href="myapply.do" style="text-decoration: none; margin: -30px 0 0 570px">신청현황</a>
		<a href="receiveMessage.do" style="text-decoration: none; margin: -30px 0 0 730px">쪽지함</a>
</ul>		 
</ul>
</div>
<div id="myMain">
<div id="myMenu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">MyApply</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">내가 신청한 목록</font>
</div>
	<center>
	<div class="t3" style="margin-right: 150px; margin-top: -30px;">
			<div class="tblWrap topmargin">
				<table>
					<colgroup>
						<col width="50px">
						<col width="70px">
						<col width="120px">
						<col width="80px">
						<col width="180px">
						<col width="50px">
						<col width="70px">
						<col width="50px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">글번호</th>
							<th scope="col">지역</th>
							<th scope="col">일정</th>
							<th scope="col">테마</th>		
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">모집인원</th>
							<th scope="col">조회</th>
						</tr>
					</thead>
					<tbody>
					<% for(int i=0; i < list.size(); i++) {%>
						<tr>
							<td class="ty4"><%= i+1 %></td>
							<td class="ty2"><%= list.get(i).getL_name() %></td>
							<td><%= list.get(i).getB_sdate() %> ~ <%= list.get(i).getB_edate() %></td>
							<td><%= list.get(i).getB_thema() %></td>
							<td>
							<a href='javascript:move("<%= list.get(i).getB_num() %>")'
			style='color: black; text-decoration: none; font-weight: bold;'>
							<%= list.get(i).getB_title() %></td>
							<td>
							<a href='javascript:userInfo("<%= list.get(i).getU_id() %>")'style='color: black; text-decoration: none; font-weight: bold;'>
							<%= list.get(i).getU_id() %></td>
							<td><%= list.get(i).getB_recruit() %></td>
							<td class="ty2"><%= list.get(i).getB_count() %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
			<br>
		</div>

		<br>
	</center>
	</div>
</div>
</body>
</html>