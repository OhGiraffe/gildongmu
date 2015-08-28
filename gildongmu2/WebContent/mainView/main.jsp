<%@page import="java.util.List"%>
<%@page import="kr.co.gildongmu.model.board.bean.ReviewBean"%>
<%@page import="kr.co.gildongmu.model.login.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="http://ts.daumcdn.net/custom/blog/0/606/skin/images/nanumgothic.css"
	rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="style.css">
<link href="./ihover/src/ihover.css" rel="stylesheet">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

ul, ul li {
	list-style: none;
	margin: 0;
}

.container {
	position: absolute;
	padding:0;
	margin: 20px 0 0  400px;
	width: 100%;
	height: 200px;
	margin: 0 auto;
	background: url(http://s25.postimg.org/5hj00pwu7/image.png) no-repeat 0
		0;
	border: maroon;
}

.btn_box {
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 10
}

.btn_box a {
	display: block;
	position: absolute;
	width: 35px;
	height: 35px;
	top: 50%;
	text-indent: -9999em;
}

.btn_box a.prev {
	left: 0px
}

.btn_box a.prev:hover {
	background-position: 0 100%
}

.btn_box a.next {
	right: 0px;
	background-position: 100% 0
}

.btn_box a.next:hover {
	background-position: 100% 100%
}

.slider {
	overflow: hidden;
	position: relative;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.slider li {
	float: left;
}

.img_list {
	position: relative;
	height: auto;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		var img_wd = $(".img_list li img").width();
		var img_ht = $(".img_list li img").height();
		$(".img_list").width(
				$(".img_list li").width() * $(".img_list li").size())
		$(".img_list li:last").prependTo(".img_list");
		$(".img_list").css({
			"margin-left" : -img_wd,
			"top" : -img_ht
		});

		$(".next").click(
				function() {
					$(".next").hide();
					$(".img_list").animate(
							{
								marginLeft : parseInt($(".img_list").css(
										"margin-left"))
										- img_wd + "px"
							}, function() {
								$(".img_list li:first").appendTo(".img_list");
								$(".img_list").css("margin-left", -img_wd)
								$(".next").show();
							})
				});

		$(".prev").click(
				function() {
					$(".prev").hide();
					$(".img_list").animate(
							{
								marginLeft : parseInt($(".img_list").css(
										"margin-left"))
										+ img_wd + "px"
							}, function() {
								$(".img_list li:last").prependTo(".img_list");
								$(".img_list").css("margin-left", -img_wd)
								$(".prev").show();
							});
				});

		var timer = setInterval(function() {
			$(".next").click();
		}, 8000);

		$(".container").on("mouseenter", function() {
			clearInterval(timer)
		}).on("mouseleave", function() {
			timer = setInterval(function() {
				$(".next").click();
			}, 8000);
		});
	});
</script>
<script type="text/javascript">
function userInfo(u_id) {
		window.open("userinfo?u_id="+u_id, "get", "height=450, width=420");
}
</script>
</head>
<%
	List<UserBean> rankList = (List<UserBean>)request.getAttribute("rankList");
	
	List<ReviewBean> reviewList = (List<ReviewBean>)request.getAttribute("reviewList");
%>
<body>
	<div id="outer">
		<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
	</div>
	<div id="third">
		<center>
			<div class="container">
				<div class="slider">
					<div class="btn_box">
						<a href="#" class="prev">prev</a> <a href="#" class="next">next</a>
					</div>
					<ul class="img_list">
						<li><img src="./image/1.jpg" alt="1" /></li>
						<li><img src="./image/2.jpg" alt="2" /></li>
						<li><img src="./image/3.jpg" alt="3" /></li>
						<li><img src="./image/4.jpg" alt="4" /></li>
						<li><img src="./image/5.jpg" alt="5" /></li>
						<li><img src="./image/6.jpg" alt="6" /></li>
					</ul>
				</div>
			</div>
		</center>
		<div id="tablesection">
			<div id="mboard1">
				<div class="t3">
					<h3>
					<font style="border-style: solid;background-color: #f5f5f5;font-size: large; color: #3a5795;">Best Member</font>
					<font style="font-size: small; border-style: solid;background-color: #f5f5f5;">최고의 길동무</font>
					</h3>
					<div class="tblWrap">
						<table>
							<colgroup>
								<col width="15px">
								<col width="35px">
								<col width="35px">
								<col width="35px">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">순위</th>
									<th scope="col">아이디</th>
									<th scope="col">평점</th>
									<th scope="col">참석률</th>
								</tr>
							</thead>
							<tbody>
							<% for(int i=0; i< rankList.size(); i++) {
								float ratingnum = 0;
								String rating = null;
								if(rankList.get(i).getU_grade() != 0){
									ratingnum = (float)rankList.get(i).getU_grade()/ (float)rankList.get(i).getU_npeople();
									rating = String.format("%.1f", ratingnum);
								}
								else{
								rating = "0";
								}%>
								<tr>
									<td style="padding: 5px;"><%=i+1 %></td>
									<td><a style="text-decoration: none" href="javascript:userInfo('<%=rankList.get(i).getU_id() %>')"><%=rankList.get(i).getU_id() %></a></td>
									<td class="ty4"><%= rating%></td>
									<td class="ty2"><%= (int) ((double)rankList.get(i).getU_attend()/ (double)rankList.get(i).getU_apply() * 100) %>%</td>
								</tr>
								<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
												
			<div id="mboard2">
			<% for(int i=0; i< reviewList.size(); i++) {%>
			<%if(i==0) { %>
				<div id="mboard22">
			<% } else if (i >5){ %>
				<div id="mboard22">
			<% } else if(i==5) { %>
				<div id="mboard22" style="margin-left: -1px;" >
			<% } else {%>
				<div id="mboard22" style="margin-top: 40px;">
			<% } %>
			<div class="t5">
				<%if(i==0) { %>
					<h3>
					<font style="border-style: solid;background-color: #f5f5f5;font-size: large; color: #3a5795;">My Trip</font>
					<font style="font-size: small; border-style: solid;background-color: #f5f5f5;">나만의 여행</font>
					</h3>
				<% } %>
			<div class="tblWrap2">
				<table style="background-color: #f5f5f5;">
					<tr>
						<td>
							<div class="ih-item square effect6 from_top_and_bottom"><a href="view_review?num=<%= reviewList.get(i).getR_num() %>&cnt=<%=reviewList.get(i).getR_count()%>">
							<div class="img"><img src="<%= reviewList.get(i).getR_image() %>"></div>
							<div class="info">
								<h3><%= reviewList.get(i).getR_title() %></h3>
								<p><%= reviewList.get(i).getR_content() %></p>
							</div></a></div>
							<!-- end normal -->								
						</td>
					</tr>
					<tr>
						<td><a style="font-style: inherit; font-family: monospace; font-size: medium; color:gray; text-decoration: none" href="view_review?num=<%= reviewList.get(i).getR_num() %>&cnt=<%=reviewList.get(i).getR_count()%>"><%= reviewList.get(i).getR_title() %></a></td>
					</tr>
					<tr>
						<td><a style="font-style: inherit; font-family: monospace; font-size: small; color: #004080; text-decoration: none" href="javascript:userInfo('<%=reviewList.get(i).getU_id() %>')"><%= reviewList.get(i).getU_id() %></a></td>
					</tr>
				</table>
			</div>
			</div>
			</div>
			<% } %>
			</div>
		</div>
	</div>
</body>
</html>
