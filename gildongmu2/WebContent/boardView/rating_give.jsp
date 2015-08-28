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
	function ratinginput(u_id, b_num) {
		
		var select = document.frm.select.selectedIndex;
		var selected = select + 1;
		window.close();
		opener.location.href = "/gildongmu2/ratinggive?u_id="+u_id+"&b_num="+b_num+"&select="+selected;
		
		
	}
</script>
</head>
<%
	String u_id = request.getParameter("u_id");
	int b_num = Integer.parseInt(request.getParameter("b_num"));
%>
<body>
	<center>
	<form name="frm">
			<select name="select">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select> 
			<input type="button" value="확인"
				onclick="ratinginput('<%=u_id%>','<%=b_num%>')">
				</form>
	</center>
</body>
</html>