<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
<script language="javascript">
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
function load(l_name, start, end, block) {//��������û
	xhr = getXMLHttpRequest();
	xhr.onreadystatechange = loaded;//�ݹ��Լ�(open,send�� ������ �Լ�)����
	xhr.open('POST', 'localboard', true);//HTTP��û���, ��ûURL, �񵿱�
    xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	xhr.send('l_name='+ l_name +'&start='+start+'&end='+end+'&block='+block);//�����Ķ����
}

function loaded() {//���䵥���� ó��
	if (xhr.readyState == 4) {
		if (xhr.status == 200) {
			var data = xhr.responseText;
			document.getElementById('tablearea').innerHTML=data;
		}
	}
}

function write_movepage(){
	location.href = "write_board";
}
function move(num){
	location.href = "view_board?b_num="+num;
}
function userInfo(u_id) {
	window.open("userinfo?u_id="+u_id, "get", "height=450, width=420");
}
</script>
</head>

<body>

	<div id="menu" style="border-bottom: 2px solid #dedede;">	
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">Local</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">����</font>
	</div>
	<center>
		<div class="t4" style="margin-left: 20px;">
			<div class="tblWrap topmargin">
				<table>
					<colgroup>
						<col width="50px">
						<col width="70px">
						<col width="120px">
						<col width="80px">
						<col width="200px">
						<col width="50px">
						<col width="50px">
						<col width="50px">
						<col width="80px">
					</colgroup>
					<thead>
						<tr>
							<th scope="col">�۹�ȣ</th>
							<th scope="col">����</th>
							<th scope="col">����</th>
							<th scope="col">�׸�</th>		
							<th scope="col">����</th>
							<th scope="col">�ۼ���</th>
							<th scope="col">�����ο�</th>
							<th scope="col">��ȸ</th>
							<th scope="col">����</th>
							
						</tr>
					</thead>
					<tbody id="tablearea">
						<c:forEach var="list" items="${adminlist}">
							<tr>
								<td colspan="9"><a href='javascript:move(${list.b_num})'
									style='color: black; text-decoration: none; font-weight: bold;'>${list.b_title}</a>
								</td>
							</tr>
						</c:forEach>
						<c:forEach var="list" items="${list}">
							<tr>
							<td class="ty4">${list.b_num}</td>
							<td class="ty2">${list.l_name}</td>
							<td>${list.b_sdate}<br>${list.b_edate}</td>
							<td>${list.b_thema}</td>
							<td>
								<a href='javascript:move(${list.b_num})'style='color: black; text-decoration: none; font-weight: bold;'>${list.b_title}</a>
							</td>
							<td>
								<a href='javascript:userInfo("${list.u_id}")' style='color: black; text-decoration: none; font-weight: bold;'>${list.u_id}</a>
							</td>
							<td>${list.b_recruit}</td>
							<td>${list.b_count}</td>
							<td>${list.b_status}</td>
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
										<a onclick="load('${l_name}','${idx*10-10}','10')"style="cursor: pointer;">[${idx }]</a>
									</c:forEach>
								</c:if>
								<c:if test="${b!=1 }">
									<a onclick="load('${l_name}','${b*50-100}','10','${b-1}')"style="cursor: pointer;">[����]</a>
								</c:if>
								<c:if test="${totalIdx>5 }">
								<c:if test="${b*five-totalIdx>=0 }">
									<c:forEach var="idx" begin="${(b*5)-4}" end="${totalIdx}">
										<a onclick="load('${l_name}','${idx*10-10}','10','${b}')"style="cursor: pointer;">[${idx }]</a>
									</c:forEach>
								</c:if>
								<c:if test="${b*five-totalIdx<0}">
									<c:forEach var="idx" begin="${(b*5)-4}" end="${b*5}">
										<a onclick="load('${l_name}','${idx*10-10}','10','${b}')"style="cursor: pointer;">[${idx }]</a>
									</c:forEach>
								</c:if>
								</c:if>
								<c:if test="${b!=totalB}">
									<a onclick="load('${l_name}','${b*50}','10','${b+1}')"style="cursor: pointer;">[����]</a>
								</c:if>
							</center>
							</td>
							</tr>
							</c:if>
					</tbody>
				</table>
				<br>
				<input type="button" value="�۾���" name="write" class="myButton" style="position: relative; left: 365px;"
					onclick="write_movepage()">
			</div>
		</div>
	</center>
</div>
</div>
</body>

</html>