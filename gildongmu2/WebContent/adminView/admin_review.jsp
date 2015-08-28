<%@page import="kr.co.gildongmu.model.board.bean.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function getXMLHttpRequest() {//XMLHttpRequest객체생성
		if (window.ActiveXObject) {//IE경우6
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
	function review_load(start, end, block) {//페이지요청
		xhr = getXMLHttpRequest();
		xhr.onreadystatechange = review_loaded;//콜백함수(open,send후 실행할 함수)정의
		xhr.open('POST', 'admin_review_paging', true);//HTTP요청방식, 요청URL, 비동기
		xhr.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		xhr.send('start=' + start + '&end=' + end + '&block=' + block);//전달파라미터
	}

	function review_loaded() {//응답데이터 처리
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var data = xhr.responseText;
				document.getElementById('tablearea').innerHTML = data;
			}
		}
	}

	function write_movepage() {
		location.href = "write_review";
	}
	
	function userInfo(u_id) {
		window.open("userinfodetail?u_id="+u_id, "get", "height=450, width=420");
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
		관리자
		</li>
		<a href="admin_user" style="text-decoration: none; margin: -10px 0 0 250px" >회원 관리</a>
		<a href="admin_board" style="text-decoration: none; margin: -30px 0 0 410px">게시판 관리</a>
		<a href="admin_review" style="text-decoration: none; margin: -30px 0 0 570px">후기 게시판 관리</a>
		<a href="adminnotice" style="text-decoration: none; margin: -30px 0 0 730px">공지사항</a>
</ul>		 
</ul>
</div>
<div id="myMain">
<div id="myMenu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">AdminReview</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">후기 게시판 관리</font>
</div>
	<center>
	<div class="t3" style="margin-right: 150px; margin-top: -30px;">
			<div class="tblWrap topmargin">
						<table>
							<colgroup>
								<col width="30px">
								<col width="180px">
								<col width="50px">
								<col width="40px">
								<col width="30px">
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
							<tbody id="tablearea">
								<c:forEach var="list" items="${reviewList}">
									<tr>
										<td class="ty4">${list.r_num}</td>
										<td><a
											style="font-style: inherit; font-family: monospace; color: gray; text-decoration: none"
											href="view_review?num=${list.r_num}">${list.r_title}</td>
										<td>${list.r_date}</td>
										<td><a
											style="font-style: inherit; font-family: monospace; color: gray; text-decoration: none"
											href="javascript:userInfo('${list.u_id}')">${list.u_id}</td>
										<td class="ty2">${list.r_count}</td>
									</tr>
								</c:forEach>
								<c:if test="${ totalIdx > 0 }">
									<tr>
										<td colspan="5">
											<center>
												<c:set var="b" value="${block}"></c:set>
												<c:set var="totalB" value="${totalBlock}"></c:set>
												<c:if test="${totalIdx<6 }">
													<c:forEach var="idx" begin="1" end="${totalIdx}">
														<a onclick="review_load('${idx*10-10}','10')"
															style="cursor: pointer;">[${idx }]</a>
													</c:forEach>
												</c:if>
												<c:if test="${b!=1 }">
													<a onclick="review_load('${b*50-100}','10','${b-1}')"
														style="cursor: pointer;">[이전]</a>
												</c:if>
												<c:if test="${totalIdx>5 }">
													<c:if test="${b*5-totalIdx>=0 }">
														<c:forEach var="idx" begin="${(b*5)-4}" end="${totalIdx}">
															<a onclick="review_load('${idx*10-10}','10','${b}')"
																style="cursor: pointer;">[${idx }]</a>
														</c:forEach>
													</c:if>
													<c:if test="${b*5-totalIdx<0}">
														<c:forEach var="idx" begin="${(b*5)-4}" end="${b*5}">
															<a onclick="review_load('${idx*10-10}','10','${b}')"
																style="cursor: pointer;">[${idx }]</a>
														</c:forEach>
													</c:if>
												</c:if>
												<c:if test="${b!=totalB}">
													<a onclick="review_load('${b*50}','10','${b+1}')"
														style="cursor: pointer;">[다음]</a>
												</c:if>
								</c:if>
								<br>
								<input type="text" size="65" name="keyword"
									style="background-color: #dedede; margin-left: 200px;">
								<input type="submit" value="검색" class="myButton"
									style="margin-left: 50px;">
			</form>
			<br>
</body>
</div>
</div>
</body>
</html>