<%@page import="java.util.List"%>
<%@page import="kr.co.gildongmu.model.board.bean.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function write_movepage() {
		location.href = "write_review";
	}

	function userInfo(u_id) {
		window.open("userinfo?u_id=" + u_id, "get", "height=450, width=420");
	}
</script>
</head>

<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
<% 
	List<ReviewBean> list = (List<ReviewBean>)request.getAttribute("reviewList"); 
%>
<body>
<div id="menu2">
	<div id="logo">
	<img src="./image/review.png">
	</div>
	
	<div id="sidetext">
	<h4><font style="font-size:14pt; font-weight: bolder;">Tell Us Your Favorite Travel Experiences</font></h4>
	</div>
</div>
	<center>
	<form action="resultreview.do" method="post" name="reviewForm">
		<div class="t4" style="margin-left: 20px;">
			<div class="tblWrap topmargin">
				<table>
					<colgroup>
						<col width="50px">
						<col width="180px">
						<col width="80px">
						<col width="50px">
						<col width="50px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">글번호</th>		
							<th scope="col">제목</th>
							<th scope="col">작성일</th>
							<th scope="col">작성자</th>	
							<th scope="col">조회</th>
						</tr>
					</thead>
					<tbody>
					<% for(int i=0; i<list.size(); i++) { %>
						<tr>
							<td class="ty4"><%= list.get(i).getR_num() %></td>						
							<td><a style="font-style: inherit; font-family: monospace; color:gray; text-decoration: none" href="view_review?num=<%= list.get(i).getR_num() %>"><%= list.get(i).getR_title() %></a></td>
						
							<td><%= list.get(i).getR_date() %></td>
							<td><a style="font-style: inherit; font-family: monospace; color:gray; text-decoration: none" href="javascript:userInfo('<%=list.get(i).getU_id() %>')"><%= list.get(i).getU_id() %></a></td>		
							<td class="ty2"><%= list.get(i).getR_count() %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
			<br>
		</div>	
	<% 
		String result_id = (String)session.getAttribute("result_id");
		if(result_id != null) {
	%>	
	</center>
		<input type="button" value="글쓰기" name="write" class="myButton" onclick="write_movepage()" style="margin-left: 1025px">	
		<br>
	<center>
	<% } %>
	
		<%
			int totalPage =(Integer)request.getAttribute("totalPage");
			int p =(Integer)request.getAttribute("page"); 		
		%>		
		<% if (p==1) { %>
			◀◀
		<% }else { %>
			<a style="font-style: inherit; font-family: monospace; color:black; text-decoration: none" href="review.do?page=<%= p-1 %>">◀◀</a>&nbsp;&nbsp;
		<% } %>
		<% for (int i=1; i <=totalPage; i++) { %>
			<a style="font-style: inherit; font-family: monospace; color:black; text-decoration: none" href="review.do?page=<%=i%>">[<%=i%>]</a>
		<% } %>
		
		<% if (p == totalPage) {%>
			▶▶
		<% }else { %>
			<a style="font-style: inherit; font-family: monospace; color:black; text-decoration: none" href="review.do?page=<%= p+1 %>">▶▶</a>
		<% } %>
			
		<br>
		<input type="text" size="65" name="keyword" style="background-color: #dedede; margin-left: 100px;">
		<input type="submit" value="검색" class="myButton" style="margin-left: 10px;">
	</center>
	</form>
	 	<br>
</div>
</div>
</body>
</html>