<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
						<a onclick="user_load('${idx*10-10}','10')"
							style="cursor: pointer;">[${idx }]</a>
					</c:forEach>
				</c:if>
				<c:if test="${b!=1 }">
					<a onclick="user_load('${b*50-100}','10','${b-1}')"
						style="cursor: pointer;">[이전]</a>
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
						style="cursor: pointer;">[다음]</a>
				</c:if>
			</center>
		</td>
	</tr>
</c:if>