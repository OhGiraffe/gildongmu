<%@page import="java.util.List"%>
<%@page import="kr.co.gildongmu.model.login.bean.SearchPostBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.gildongmu.model.join.dao.SearchPostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="zCodeStyle.css" rel="stylesheet" type="text/css">
<script>
	function inputPost(post1, post2, addr) {
		opener.joinForm.u_zipcode1.value = post1;
		opener.joinForm.u_zipcode2.value = post2;
		opener.joinForm.u_addr.focus();
		opener.joinForm.u_addr.value = addr;
		window.close();
	}
</script>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
%>
	<form name="frm" method="post" action="/gildongmu2/joinView/search_post.jsp">
		<table align="center" width="340" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td align="center">
					<table width="100%" class="join_table">
						<tr align="center" height="20">
							<th>우편번호검색</th>
						</tr>
						<tr align="center" height="20">
							<td>◈ 동이름 <input type="text" name="dong"> <input
								type="submit" value="검색"></td>
						</tr>
						<tr align="center" height="20">
							<td>※ 검색 후 아래 링크를 클릭하시면<br> 자동으로 입력 됩니다.
							</td>
						</tr>
					</table> 
<!-- ------------------------------------------------------------------------------------ -->
					<br> <%
	String dongStr=request.getParameter("dong");
	if(dongStr != null){
		SearchPostDAO dao = new SearchPostDAO();
		List<SearchPostBean> list = dao.searchPostSelect(dongStr);
		if(list != null){
%>
					<table width="100%" class="join_table">
						<tr align="center">
							<th align="center">우편번호</th>
							<th align="center">주소</th>
						</tr>
						<% for(int i=0; i<list.size(); i++) { 
							
							if(list.get(i).getSido()==null){
								list.get(i).setSido("");
							}
							if(list.get(i).getGugun()==null){
								list.get(i).setGugun("");
							}
							if(list.get(i).getDong()==null){
								list.get(i).setDong("");
							}
							if(list.get(i).getRi()==null){
								list.get(i).setRi("");
							}
							if(list.get(i).getBunji()==null){
								list.get(i).setBunji("");
							}
							//seq    zipcode   sido  gugun dong   ri    bunji
							//  1         2          3        4         5      6       7
							
							                     // or   rs.getString("ZIPCODE").split("-");    
							String []zCode=list.get(i).getZipcode().split("-");
							String addr=list.get(i).getSido() + "  " +list.get(i).getGugun() + "  "
									           + list.get(i).getDong() + "  " +list.get(i).getRi();
  %>
						<tr height="20">
							<td style="width: 60px;"><%=list.get(i).getZipcode()  /*우편번호*/ %>
							</td>
							<td><a href="#"
								onclick="inputPost('<%=zCode[0]%>','<%=zCode[1]%>','<%=addr%>')">
									<%=addr + "  " +list.get(i).getBunji()  /*주소*/ %>
							</a></td>
						</tr>
						<%}//for
						} //if
						
				} //if
%>
					</table>
			</tr>
		</table>
	</form>
</body>

</body>
</html>