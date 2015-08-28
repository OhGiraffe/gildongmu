<%@page import="kr.co.gildongmu.model.board.bean.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글쓰기</title>
<script type="text/javascript" src="./se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script language = "javascript" type = "text/javascript">
$(document).ready(function() {
 
  //******************************************************************************
  // 상세검색 달력 스크립트
  //******************************************************************************
  var clareCalendar = {
   monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
   dayNamesMin: ['일','월','화','수','목','금','토'],
   weekHeader: 'Wk',
   dateFormat: 'yy-mm-dd', //형식(20120303)
   autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
   changeMonth: true, //월변경가능
   changeYear: true, //년변경가능
   showMonthAfterYear: true, //년 뒤에 월 표시
   buttonImageOnly: false, //이미지표시
   buttonText: '달력선택', //버튼 텍스트 표시
   //showOn: "both", //엘리먼트와 이미지 동시 사용(both,button)
   yearRange: '1990:2020' //1990년부터 2020년까지
  };
  $("#b_sdate").datepicker(clareCalendar);
  $("#b_edate").datepicker(clareCalendar);
  $("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
  $("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김  
 });
</script>
<style>
table.boardtbl{
border-spacing: 0;
margin-left: 0px;
height: 300px;
width: 600px;
margin-top: 10px;
}

table.boardtbl td.title{
position: relative;
width: 70px;
height: 25px;
font-size: 13px;
font-family: 'Nanum Gothic';
font-weight: 400;
border-top: 1px solid #e2e2e2;
border-spacing: 0;
border-right: 1px solid #e2e2e2;
background: #f4f4f4;
}
table.boardtbl td.content{
position: relative;
width: 520px;
height: 25px;
font-size: 13px;
font-family: 'Nanum Gothic';
font-weight: 400;
border-top: 1px solid #e2e2e2;
border-spacing: 0;
}

</style>
</head>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="second"></div>
<div id="third">
<%
	String url = (String)request.getAttribute("url");
	BoardBean bbean = (BoardBean)request.getAttribute("bean");
	String lname[] = {"","","","","","","","","",""};
	String llname[] = bbean.getL_name().split(",");
	String tname[] = {"","","","",""};
	String ttname[] = bbean.getB_thema().split(",");
	
	for(int i=0; i<llname.length; i++){
		lname[i]=llname[i];
	}
	
	for(int i=0; i<ttname.length; i++){
		tname[i]=ttname[i];
	}
%>
	<center>
		<h3>글수정</h3>
		<form action="modify_b" method="post" name="frm">
		<input type="hidden" name="url" value="<%=url%>">
		<input type="hidden" name="b_num" value="<%=bbean.getB_num()%>">
		<input type="hidden" name="b_count" value="<%=bbean.getB_count()%>">
		<input type="hidden" name="b_date" value="<%=bbean.getB_date()%>">
			<table class="boardtbl" >
				<tr>
					<td class="title">지역</td>
					<td class="content">
						<div class="l_name_checkbox">
						<% 
							String lcheck[]={"안성","여주","화성","평택","가평","양평","성남","과천","파주","연천"};
							for(int i=0; i<lcheck.length; i++){ 
								for(int j=0; j<lname.length; j++){
									if(lcheck[i].equals(lname[j])){%>
										<input type="checkbox" name="l_checkbox" value="<%=lcheck[i] %>" checked="checked"> <label><%=lcheck[i] %></label>
									<% break;
									}
									else if(lname.length == j+1){%>
										<input type="checkbox" name="l_checkbox" value="<%=lcheck[i] %>"> <label><%=lcheck[i] %></label>
									<%}
								}
								
							}%>
						</div>
					</td>
				</tr>
				<tr>
					<td class="title">일정</td>
					<td class="content">
						<input name="b_sdate" type="text" id="b_sdate" size="8" maxlength="8"  value = "${bean.b_sdate}"
						style="text-align: center;">
						~
						<input name="b_edate" type="text" id="b_edate" size="8" maxlength="8" value="${bean.b_edate }"
						style="text-align: center;">
					</td>
				</tr>
				<tr>
					<td class="title">테마</td>
					<td class="content">
						<div class="b_thema_checkbox">
						<% 
							String tcheck[]={"레저","먹방","힐링","무전","관광"};
							for(int i=0; i<tcheck.length; i++){
								for(int j=0; j<tname.length; j++){
									if(tcheck[i].equals(tname[j])){%>
										<input type="checkbox" name="t_checkbox" value="<%=tcheck[i] %>" checked="checked"> <label><%=tcheck[i] %></label>
									<%	break;
									}
									else if(tname.length == j+1){%>
									<input type="checkbox" name="t_checkbox" value="<%=tcheck[i] %>"> <label><%=tcheck[i] %></label>
									<%}
								}
							}%>
						</div>
					</td>
				</tr>
				<tr>
					<td class="title">모집인원</td>
					<td class="content"><input type="text" name="b_recruit" value="${bean.b_recruit}"><label>명</label>
					</td>
				</tr>
				<tr>
					<td class="title">상태</td>
					<td class="content"><input type="text" name="b_status" value="모집중" readonly="readonly" value="${bean.b_status}">
				</tr>				
				<tr>
					<td class="title">제목</td>
					<td class="content"><input type="text" id="b_title" name="b_title" value="${bean.b_title}">
				</tr>
				<tr>
					<td colspan="3" class="content">
					<textarea name="b_content" id="ir1" name="content" cols="83" rows="20">${bean.b_content }</textarea>
					 </td>
				</tr>
				<tr align="center">
					<td colspan="2">
					<input type="button" value="수정완료" class="myButton" onclick="modifyContents()">
					<input type="reset" value="취소" class="myButton">
					</td>
				</tr>
			</table>	
		</form>
	</center>
				</div>
		<div id="fourth"></div>
		<div id="fifth"></div>
		</div>
<script type="text/javascript"> 
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "./se2/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});
	
function modifyContents() {
	var l_cnt = 0;
	for (i=0; i<document.frm.l_checkbox.length; i++ ) {
	    if (document.frm.l_checkbox[i].checked==true){
	    	l_cnt++;
	    }
	}
	var b_sdate = document.frm.b_sdate.value;
	var b_edate = document.frm.b_edate.value;
	var t_cnt = 0;
	for (i=0; i<document.frm.t_checkbox.length; i++ ) {
	    if (document.frm.t_checkbox[i].checked==true){
	    	t_cnt++;
	    }
	}
	var b_recruit = document.frm.b_recruit.value;
	var b_title = document.frm.b_title.value;
	
	if(l_cnt == 0) {
		alert("지역을 선택해주세요.");
		return;
	}
	
	if(b_sdate == "출발") {
		alert("출발일을 입력해주세요.");
		document.frm.b_sdate.focus();
		return;
	}
	
	if(b_edate == "종료") {
		alert("도착일을 입력해주세요.");
		document.frm.b_edate.focus();
		return;
	}
	
	if(t_cnt == 0) {
		alert("테마를 선택해주세요.");
		return;
	}
	
	if(b_recruit.trim() == "") {
		alert("모집인원을 입력해주세요.");
		document.frm.b_recruit.focus();
		return;
	}
	
	if(b_title.trim() == "") {
		alert("제목을 입력해주세요.");
		document.frm.b_title.focus();
		return;
	}
	
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		frm.submit();
	} catch(e) {}
}
</script>
</body>
</html>