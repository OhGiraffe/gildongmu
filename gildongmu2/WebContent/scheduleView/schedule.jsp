<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<title>Insert title here</title>
<link href="http://ts.daumcdn.net/custom/blog/0/606/skin/images/nanumgothic.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function() {
	var clareCalendar = {
							monthNamesShort : [ '1월', '2월', '3월', '4월', '5월',
												'6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
							dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
							dateFormat : 'yy-mm-dd', //형식(20120303)
							changeMonth : true, //월변경가능
							changeYear : true, //년변경가능
							showMonthAfterYear : true, //년 뒤에 월 표시
							yearRange : '1990:2020', //1990년부터 2020년까지
							minDate: '+0'
						};
						$("#b_sdate").datepicker(clareCalendar);
						$("#b_edate").datepicker(clareCalendar);
	});
</script>

<script type="text/javascript">
	function print() {
		var sdate = $("#b_sdate").datepicker().val();
		var edate = $("#b_edate").datepicker().val();

		load(sdate, edate, 0, 10);
	}

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
		function load(sdate, edate,start, end, block) {//페이지요청
			xhr = getXMLHttpRequest();
			xhr.onreadystatechange = loaded;//콜백함수(open,send후 실행할 함수)정의
			xhr.open('POST', 'schedule/search.do', true);//HTTP요청방식, 요청URL, 비동기
	        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
			xhr.send('sdate='+ sdate +"&edate="+edate+'&start='+start+'&end='+end+'&block='+block);//전달파라미터
		}
		function loaded() {//응답데이터 처리
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					var data = xhr.responseText;
					document.getElementById('tablearea').innerHTML=data;
				}
			}
		}
		function move(num){
			location.href = "bview.do?b_num="+num+"&view=view";
		}
		
		function write_movepage(){
	    	location.href = "write_board.do";
	    }
		function userInfo(u_id) {
			window.open("loginView/user_userinfo.jsp?u_id="+u_id, "get", "height=450, width=420");
		}
</script>
</head>
<div id="myBar">
<ul class="side">
			<ul>
				<li type="none" style="font-weight: bold; font-size: 16px; color: #ffffff;
				width: 160px; height: 26px; background-color: #22becc;">
				일정
				</li>
				<form id="check">
				<li type="none" style="margin-top: -16px; font-size: large;"><img src="./image/cal.jpg" style="width: 25px ; height: 25px">
				<input type="text" name="sdate" id="b_sdate" 
				size="8" maxlength="8" value="출발일" onchange="print()"
				style="background-color: #EAEAEA; text-align: center;
				width: 90px ; height: 30px;">
				  ~
				<img src="./image/cal.jpg" style="width: 25px ; height: 25px">
				<input type="text" name="edate" id="b_edate" 
				size="8" maxlength="8" value="도착일" onchange="print()"
				style="background-color: #EAEAEA; text-align: center;
				width: 90px ; height: 30px"
				></li><br>
				</form>

			</ul>
	</ul>
</div>
<div id="myMain">
<div id="myMenu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">Schedule</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">일정</font>
</div>
<body onload="javascript:print()">
	<center>
		<div class="t3" style="margin-right: 170px;margin-top: -50px;">
			<div class="tblWrap topmargin">
				<table>
					<colgroup>
						<col width="50px">
						<col width="70px">
						<col width="120px">
						<col width="80px">
						<col width="200px">
						<col width="50px">
						<col width="70px">
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
					<tr>
					<td colspan="9"></td>
					</tr>
					</tbody>
				</table>
				<span id="pageN"></span>
			</div>
			<br>
		</div>
		<input type="button" value="글쓰기" name="write" class="myButton" 
		style="position: relative; left: 365px"
		onclick="write_movepage()">
	</center>
</div>
</div>
</body>
</html>
