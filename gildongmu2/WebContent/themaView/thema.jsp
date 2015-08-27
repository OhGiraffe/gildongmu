<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<script type="text/javascript">
function check() {
	var thema = "테마,";
	if (document.check_form.c1.checked) thema += "레저,";
	if (document.check_form.c2.checked) thema += "먹방,";
	if (document.check_form.c3.checked) thema += "힐링,";
	if (document.check_form.c4.checked) thema += "무전,";
	if (document.check_form.c5.checked) thema += "관광,";

	load(thema, 0, 10); 
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
	function load(thema, start, end, block) {//페이지요청
		xhr = getXMLHttpRequest();
		xhr.onreadystatechange = loaded;//콜백함수(open,send후 실행할 함수)정의
		xhr.open('POST', 'themasearch', true);//HTTP요청방식, 요청URL, 비동기
        xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		xhr.send('thema='+thema+'&start='+start+'&end='+end+'&block='+block);//전달파라미터
	}

	function loaded() {//응답데이터 처리
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var data = xhr.responseText;
				//var data = eval('('+xhr.responseText+')');
				
				document.getElementById('tablearea').innerHTML=data;
				/* 
				while (tablearea.hasChildNodes()) {   
					tablearea.removeChild(tablearea.firstChild);
				}
				
				for(var i=0; i<=data.length; i++){
					var tr = document.createElement('tr');
					
					var td1 = document.createElement('td'); 
					var td2 = document.createElement('td'); 
					var td3 = document.createElement('td'); 
					td1.setAttribute("class",'ty4');
					td2.setAttribute("class",'ty2');
					td3.setAttribute("class",'ty2');
					
					
					tr.appendChild( td1 );
				    tr.appendChild( td2 );
				    tr.appendChild( document.createElement('td') );
				    tr.appendChild( document.createElement('td') );
				    tr.appendChild( document.createElement('td') );
				    tr.appendChild( document.createElement('td') );
				    tr.appendChild( document.createElement('td') );
				    tr.appendChild( td3 );
				    
				    tr.cells[0].innerHTML = data[i].num;
				    tr.cells[1].innerHTML = data[i].l_name;
				    tr.cells[2].innerHTML = data[i].sdate +"<br>"+data[i].edate;
				    tr.cells[3].innerHTML = data[i].thema;
				    tr.cells[4].innerHTML = "<a href='javascript:move("+data[i].num+")' style ='color: black; text-decoration: none;font-weight: bold;'>"+data[i].title+"</a>";
				    tr.cells[5].innerHTML = "<a href='javascript:userinfo("+"\""+data[i].id+"\""+")' style ='color: black; text-decoration: none;font-weight: bold;'>"+data[i].id+"</a>";
				    tr.cells[6].innerHTML = data[i].recruit;
				    tr.cells[7].innerHTML = data[i].count;

				    tablearea.appendChild(tr);
				}	 */
			}
		}
	}

	function goPage(num){
		check(num);
	}
	
	function userInfo(u_id) {
		window.open("loginView/userinfo?u_id="+u_id, "get", "height=450, width=420");
	}
	
	function move(num){
		location.href = "view_board?b_num="+num;
	}
	
	function write_movepage(){
    	location.href = "write_board";
    }
</script>
</head>
<body onload="javascript:check()">
<div id="myBar">
<ul class="side">
<ul>
				<li type="none" style="font-weight: bold; font-size: 16px; color: #ffffff;
				width: 160px; height: 26px; background-color: #22becc;">
				테마
				</li>
				<form name="check_form" style="color: #8C8C8C; font-size: 13px">
				<font style="font-size:12pt; font-weight: bolder; color: #3a5795; ">레저</font>
				<input type="checkbox" name="c1" id="c1"  onclick="check()" value="레저" style="margin-left: 10px; font-size: large;">&nbsp;&nbsp;
				<font style="font-size:12pt; font-weight: bolder; color: #3a5795; ">먹방</font>
				<input type="checkbox" name="c2" id="c2" onclick="check()" value="먹방" style="margin-left: 10px">&nbsp;&nbsp;
				<font style="font-size:12pt; font-weight: bolder; color: #3a5795; ">힐링</font>
				<input type="checkbox" name="c3" id="c3" onclick="check()" value="힐링" style="margin-left: 10px">&nbsp;&nbsp;
				<font style="font-size:12pt; font-weight: bolder; color: #3a5795; ">무전</font>
				<input type="checkbox" name="c4" id="c4" onclick="check()" value="무전" style="margin-left: 10px">&nbsp;&nbsp;
				<font style="font-size:12pt; font-weight: bolder; color: #3a5795; ">관광</font>
				<input type="checkbox" name="c5" id="c5" onclick="check()" value="관광" style="margin-left: 10px">&nbsp;&nbsp;
				</form>
	</ul>
	</ul>
</div>
<div id="myMain">
<div id="myMenu" style="border-bottom: 2px solid #dedede";>
	<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">Thema</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">테마</font>
</div>
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
					</tbody>
				</table>
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
