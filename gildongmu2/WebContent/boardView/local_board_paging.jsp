<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<c:set var="totidx" value="${page}"></c:set>
				<c:set var="five" value="${5}"></c:set>
				<c:set var="four" value="${4}"></c:set>
				<c:set var="totalB" value="${totalBlock}"></c:set>
				<c:if test="${totalIdx<6 }">
					<c:forEach var="idx" begin="1" end="${totalIdx}">
						<a onclick="load('${l_name}','${idx*10-10}','10')"
							style="cursor: pointer;">[${idx }]</a>
					</c:forEach>
				</c:if>
				<c:if test="${b!=1 }">
					<a onclick="load('${l_name}','${b*50-100}','10','${b-1}')"
						style="cursor: pointer;">[����]</a>
				</c:if>
				<c:if test="${totalIdx>5 }">
					<c:if test="${b*five-totalIdx>=0 }">
						<c:forEach var="idx" begin="${(b*5)-4}" end="${totalIdx}">
							<a onclick="load('${l_name}','${idx*10-10}','10','${b}')"
								style="cursor: pointer;">[${idx }]</a>
						</c:forEach>
					</c:if>
					<c:if test="${b*five-totalIdx<0}">
						<c:forEach var="idx" begin="${(b*5)-4}" end="${b*5}">
							<a onclick="load('${l_name}','${idx*10-10}','10','${b}')"
								style="cursor: pointer;">[${idx }]</a>
						</c:forEach>
					</c:if>
				</c:if>
				<c:if test="${b!=totalB}">
					<a onclick="load('${l_name}','${b*50}','10','${b+1}')"
						style="cursor: pointer;">[����]</a>
				</c:if>
			</center>
		</td>
	</tr>
</c:if>