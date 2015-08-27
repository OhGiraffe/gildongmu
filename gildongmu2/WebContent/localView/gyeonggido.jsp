<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<div id="main">
	<div id="menu" style="border-bottom: 2px solid #dedede;">	
		<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">Local</font>
	<font style="font-size:14pt; font-weight: bolder; color: #999; ">지역선택</font>
	</div>
	<center>
	<table>
		<tr>
		<td>
		<img src="./ltimage/gyeongido.jpg" width="400" height="460" border="0" alt="경기도 지역 지도" usemap="#ggt_area_map">
			<map name="ggt_area_map">
					<area shape="rect" alt="안성" coords="207,392,250,421" href="anseong">
                    <area shape="rect" alt="가평" coords="240,146,283,175" href="gapyeong">
                    <area shape="rect" alt="화성" coords="109,348,152,377" href="hwaseong">
                    <area shape="rect" alt="평택" coords="131,397,174,426" href="pyeongtaek">
                    <area shape="rect" alt="연천" coords="147,66,184,91" href="yeoncheon">
                    <area shape="rect" alt="여주" coords="295,305,333,332" href="yeoju">
                    <area shape="rect" alt="양평" coords="273,244,316,273" href="yangpyeong">
                    <area shape="rect" alt="성남" coords="174,279,198,297" href="seongnam">
                    <area shape="rect" alt="과천" coords="147,271,169,287" href="gwacheon">
                    <area shape="rect" alt="파주" coords="89,143,129,168" href="paju">
			</map>
			</td>
			
			<td width="475" height="522"  align="center">
				<img src="./ltimage/경기도.png" width="350" height="450" border="0">
			</td>
			</tr>
	</table>
	</center>
</div>
</div>
</body>
</html>