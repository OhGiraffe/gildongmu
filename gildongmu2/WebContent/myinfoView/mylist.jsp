<%@page import="java.util.List"%>
<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function move(num){
	location.href = "bview?b_num="+num+"&view=view";
}
function userInfo(u_id) {
	window.open("userinfo?u_id="+u_id, "get", "height=450, width=420");
}
</script>
</head>
<%
	List<BoardBean> list = (List<BoardBean>) request.getAttribute("mylist");
%>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
<body>
<div id="menu3">
	<div id="logo">
	<img src="./image/user.png">
	</div>
	
	<div id="sidetext">
		<ul class="side" style="margin-top: 24px;">
		<ul>
				<a href="myinfo.do" style="text-decoration: none; margin: -10px 0 0 250px" >내정보</a>
				<a href="mylist.do" style="text-decoration: none; margin: -30px 0 0 410px">내가 쓴 글</a>
				<a href="myapply.do" style="text-decoration: none; margin: -30px 0 0 570px">신청현황</a>
				<a href="message_receive" style="text-decoration: none; margin: -30px 0 0 730px">쪽지함</a>
		</ul>		 
		</ul>
	</div>
</div>

</div>
<div id="myMain">
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
							<a href='javascript:move("<%=list.get(i).getB_num() %>")' style ='color: black; text-decoration: none;font-weight: bold;'><%=list.get(i).getB_title()%></a>
							</td>
							<td><a style="color:black; text-decoration: none; font-weight: bold;" href="javascript:userInfo('<%=list.get(i).getU_id() %>')"><%= list.get(i).getU_id() %></a></td>
							<td><%= list.get(i).getB_recruit() %></td>
							<td class="ty2"><%= list.get(i).getB_count() %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
			<br>
		</div>
	</div>
</center>
</div>
<div id="fourth"></div>
<div id="fifth"><%@include file="/mainView/footer.jsp"%></div>
</div>
</body>
</html>