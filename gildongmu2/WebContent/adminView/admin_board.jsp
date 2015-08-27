<%@page import="java.util.List"%>
<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function getXMLHttpRequest() {//XMLHttpRequest객체생성
		if (window.ActiveXObject) {//IE경우
			try {
				return new ActiveXObject('Msxml2.XMLHTTP');
			} catch (e) {
				return new ActiveXObject('Microsoft.XMLHTTP');
			}
		} else if (window.XMLHttpRequest) {//비IE경우
			return new XMLHttpRequest();
		} else
			return null;
	}//getXMLHttpRequest()

	var xhr;
	function board_load(start, end, block) {//페이지요청
		xhr = getXMLHttpRequest();
		xhr.onreadystatechange = board_loaded;//콜백함수(open,send후 실행할 함수)정의
		xhr.open('POST', 'admin_board_paging', true);//HTTP요청방식, 요청URL, 비동기
		xhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		xhr.send('start=' + start + '&end=' + end + '&block=' + block);//전달파라미터
	}

	function board_loaded() {//응답데이터 처리
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var data = xhr.responseText;
				document.getElementById('tablearea').innerHTML = data;
			}
		}
	}
	
	function move(num){
		location.href = "view_board?b_num="+num;
	}
</script>
</head>
<body>
	<div id="outer">
		<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
		<div id="myBar">
			<ul class="side">
				<ul>
					<li type="none"
						style="font-weight: bold; font-size: 16px; color: #ffffff; width: 160px; height: 26px; background-color: #004080;">
						관리자</li>
					<br>
					<a href="admin_user" style="text-decoration: none">회원 관리</a>
					</li>
					<li type="none"><a href="admin_board"
						style="text-decoration: none">게시판 관리</a></li>
					<li type="none"><a href="admin_review"
						style="text-decoration: none">후기 게시판 관리</a></li>
					<li type="none"><a href="adminnotice"
						style="text-decoration: none;">기타 공지사항</a></li>
				</ul>
			</ul>
		</div>
		<div id="myMain">
			<div id="myMenu">
				<font
					style="border-style: solid; background-color: #f5f5f5; font-size: large; color: #3a5795;">AdminBoard</font>
				<font style="font-size: small;">게시판 관리</font>
			</div>

			<div id="board" class="board">
				<div class="t3">
					<div class="tblWrap topmargin" style="margin-left: 50px;">
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
									<th scope="col">글번호</th>
									<th scope="col">지역</th>
									<th scope="col">일정</th>
									<th scope="col">테마</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">모집인원</th>
									<th scope="col">조회</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody id="tablearea">
								<c:forEach var="list" items="${boardList}">
									<tr>
										<td class="ty4">${list.b_num}</td>
										<td class="ty2">${list.l_name}</td>
										<td>${list.b_sdate}<br>${list.b_edate}</td>
										<td>${list.b_thema}</td>
										<td><a href='javascript:move(${list.b_num})'
											style='color: black; text-decoration: none; font-weight: bold;'>${list.b_title}</a>
										</td>
										<td><a href='javascript:userInfo("${list.u_id}")'
											style='color: black; text-decoration: none; font-weight: bold;'>${list.u_id}</a>
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
												<c:set var="totalB" value="${totalBlock}"></c:set>
												<c:if test="${totalIdx<6 }">
													<c:forEach var="idx" begin="1" end="${totalIdx}">
														<a onclick="board_load('${idx*10-10}','10')"
															style="cursor: pointer;">[${idx }]</a>
													</c:forEach>
												</c:if>
												<c:if test="${b!=1 }">
													<a onclick="board_load('${b*50-100}','10','${b-1}')"
														style="cursor: pointer;">[이전]</a>
												</c:if>
												<c:if test="${totalIdx>5 }">
													<c:if test="${b*5-totalIdx>=0 }">
														<c:forEach var="idx" begin="${(b*5)-4}" end="${totalIdx}">
															<a onclick="board_load('${idx*10-10}','10','${b}')"
																style="cursor: pointer;">[${idx }]</a>
														</c:forEach>
													</c:if>
													<c:if test="${b*5-totalIdx<0}">
														<c:forEach var="idx" begin="${(b*5)-4}" end="${b*5}">
															<a onclick="board_load('${idx*10-10}','10','${b}')"
																style="cursor: pointer;">[${idx }]</a>
														</c:forEach>
													</c:if>
												</c:if>
												<c:if test="${b!=totalB}">
													<a onclick="board_load('${b*50}','10','${b+1}')"
														style="cursor: pointer;">[다음]</a>
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
	</div>
</body>
</html>