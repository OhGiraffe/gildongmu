<%@page import="java.util.List"%>
<%@page import="kr.co.gildongmu.model.login.bean.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
	List<UserBean> list = (List<UserBean>)request.getAttribute("userList");
%>
<script type="text/javascript">
	function getXMLHttpRequest() {//XMLHttpRequest��ü����
		if (window.ActiveXObject) {//IE���
			try {
				return new ActiveXObject('Msxml2.XMLHTTP');
			} catch (e) {
				return new ActiveXObject('Microsoft.XMLHTTP');
			}
		} else if (window.XMLHttpRequest) {//��IE���
			return new XMLHttpRequest();
		} else
			return null;
	}//getXMLHttpRequest()

	var xhr;
	function user_load(start, end, block) {//��������û
		xhr = getXMLHttpRequest();
		xhr.onreadystatechange = user_loaded;//�ݹ��Լ�(open,send�� ������ �Լ�)����
		xhr.open('POST', 'admin_user_paging', true);//HTTP��û���, ��ûURL, �񵿱�
		xhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		xhr.send('start=' + start + '&end=' + end + '&block=' + block);//�����Ķ����
	}

	function user_loaded() {//���䵥���� ó��
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var data = xhr.responseText;
				document.getElementById('tablearea').innerHTML = data;
			}
		}
	}
	function userInfo(u_id) {
		window.open("userinfodetail?u_id=" + u_id, "get",
				"height=450, width=420");
	}
</script>
</head>

<body>
	<div id="outer">
		<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
		<div id="myBar">
<ul class="side" style="margin-top: 24px;">
<ul>
		<li type="none" style="font-weight: bold; font-size: 16px; color: #ffffff;
		width: 160px; height: 26px; background-color: #22becc;">
		������
		</li>
		<a href="admin_user" style="text-decoration: none; margin: -10px 0 0 250px" >ȸ�� ����</a>
		<a href="admin_board" style="text-decoration: none; margin: -30px 0 0 410px">�Խ��� ����</a>
		<a href="admin_review" style="text-decoration: none; margin: -30px 0 0 570px">�ı� �Խ��� ����</a>
		<a href="adminnotice" style="text-decoration: none; margin: -30px 0 0 730px">��������</a>
</ul>		 
</ul>
</div>
<div id="myMain">
<div id="myMenu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">AdminUser</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">ȸ�� ����</font>
</div>
	<center>
	<div class="t3" style="margin-right: 150px; margin-top: -30px;">
			<div class="tblWrap topmargin">
						<table>
							<colgroup>
								<col width="50">
								<col width="70">
								<col width="100">
								<col width="60">
								<col width="60">
								<col width="180">
								<col width="40">
								<col width="40">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">�۹�ȣ</th>
									<th scope="col">ID</th>
									<th scope="col">�̸�</th>
									<th scope="col">����</th>
									<th scope="col">����</th>
									<th scope="col">�ڵ�����ȣ</th>
									<th scope="col">����</th>
									<th scope="col">�⼮��</th>
								</tr>
							</thead>
							<tbody id="tablearea">
								<c:forEach var="list" items="${userList}">
									<tr>
										<td class="ty4"></td>
										<td><a style="text-decoration: none"
											href="javascript:userInfo('${list.u_id}')">${list.u_id}</a></td>
										<td>${list.u_name}</td>
										<td>${list.u_age}</td>
										<td>${list.u_gen}</td>
										<td>${list.u_tel}</td>
										<td>${list.u_grade}</td>
										<td class="ty2">${list.u_attend}</td>
									</tr>
								</c:forEach>
								<c:if test="${ totalIdx > 0 }">
									<tr>
										<td colspan="9">
											<center>
												<c:set var="b" value="${block}"></c:set>
												<c:set var="totidx" value="${page}"></c:set>
												<c:set var="five" value="${5}"></c:set>
												<c:set var="four" value="${4}"></c:set>
												<c:set var="totalB" value="${totalBlock}"></c:set>
												<c:if test="${totalIdx<6 }">
													<c:forEach var="idx" begin="1" end="${totalIdx}">
														<a onclick="user_load('${idx*10-10}','10')"style="cursor: pointer;">[${idx }]</a>
													</c:forEach>
												</c:if>
												<c:if test="${b!=1 }">
													<a onclick="user_load('${b*50-100}','10','${b-1}')"
														style="cursor: pointer;">[����]</a>
												</c:if>
												<c:if test="${totalIdx>5 }">
													<c:if test="${b*five-totalIdx>=0 }">
														<c:forEach var="idx" begin="${(b*5)-4}" end="${totalIdx}">
															<a onclick="user_load('${idx*10-10}','10','${b}')"
																style="cursor: pointer;">[${idx }]</a>
														</c:forEach>
													</c:if>
													<c:if test="${b*five-totalIdx<0}">
														<c:forEach var="idx" begin="${(b*5)-4}" end="${b*5}">
															<a onclick="user_load('${idx*10-10}','10','${b}')"
																style="cursor: pointer;">[${idx }]</a>
														</c:forEach>
													</c:if>
												</c:if>
												<c:if test="${b!=totalB}">
													<a onclick="user_load('${b*50}','10','${b+1}')"
														style="cursor: pointer;">[����]</a>
												</c:if>
											</center>
										</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
</body>
</html>