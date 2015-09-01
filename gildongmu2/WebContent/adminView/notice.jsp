<%@page import="java.util.List"%>
<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="javascript">
            function write_movepage(){
            	location.href = "write_board";
            }
        	function move(num){
        		location.href = "bview?b_num="+num+"&view=view";
        	}
</script>
</head>
<%
	
	List<BoardBean> list = (List<BoardBean>)request.getAttribute("noticeList");

%>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
<body>
<div id="menu3">
	<div id="logo">
	<img src="./image/service.png">
	</div>
	
	<div id="sidetext">
		<ul class="side" style="margin-top: 24px;">
		<ul>
			<a href="faq.do" style="text-decoration: none; margin: -10px 0 0 300px" >FAQ</a>
			<a href="notice.do" style="text-decoration: none; margin: -30px 0 0 460px">공지사항</a>
			<a href="contact" style="text-decoration: none; margin: -30px 0 0 620px">CONTACT</a>
		</ul>		 
	</ul>
	</div>
</div>
<div id="myMain">
		<div class="t3">
			<div class="tblWrap topmargin" style="margin-left: 20px; margin-top: -60px;">
				<table>
					<colgroup>
						<col width="50px">
						<col width="180px">
						<col width="50px">
						<col width="50px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">글번호</th>		
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">조회</th>
						</tr>
					</thead>
					<tbody>
					<% for(int i=0; i<list.size(); i++) {%>
						<tr>
							<td class="ty4"><%= list.get(i).getB_num() %></td>
							<td class="adminnotice">
							<a href='javascript:move("<%= list.get(i).getB_num() %>")'
			style='color: #22BECC; text-decoration: none; font-weight: bold;'>
							<%= list.get(i).getB_title() %></a></td>
							<td><%= list.get(i).getU_id() %></td>
							<td class="ty2"><%= list.get(i).getB_count() %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
			<br>
		</div>
	</div>
</div>
</body>
</div>
</html>