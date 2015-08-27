<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/plain; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<c:set var="totidx" value="${page}"></c:set>
				<c:set var="five" value="${5}"></c:set>
				<c:set var="four" value="${4}"></c:set>
				<c:set var="totalB" value="${totalBlock}"></c:set>
				<c:if test="${totalIdx<6 }">
					<c:forEach var="idx" begin="1" end="${totalIdx}">
						<a onclick="review_load('${idx*10-10}','10')"
							style="cursor: pointer;">[${idx }]</a>
					</c:forEach>
				</c:if>
				<c:if test="${b!=1 }">
					<a onclick="review_load('${b*50-100}','10','${b-1}')"
						style="cursor: pointer;">[����]</a>
				</c:if>
				<c:if test="${totalIdx>5 }">
					<c:if test="${b*five-totalIdx>=0 }">
						<c:forEach var="idx" begin="${(b*5)-4}" end="${totalIdx}">
							<a onclick="review_load('${idx*10-10}','10','${b}')"
								style="cursor: pointer;">[${idx }]</a>
						</c:forEach>
					</c:if>
					<c:if test="${b*five-totalIdx<0}">
						<c:forEach var="idx" begin="${(b*5)-4}" end="${b*5}">
							<a onclick="review_load('${idx*10-10}','10','${b}')"
								style="cursor: pointer;">[${idx }]</a>
						</c:forEach>
					</c:if>
				</c:if>
				<c:if test="${b!=totalB}">
					<a onclick="review_load('${b*50}','10','${b+1}')"
						style="cursor: pointer;">[����]</a>
				</c:if>
			</center>
		</td>
	</tr>
</c:if>