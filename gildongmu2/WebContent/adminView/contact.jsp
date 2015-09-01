<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-2.1.4.min.js"></script> 
<% for(int i=1; i<11; i++) { %>
<script>
$(document).ready(function(){
    $("#flip<%= i%>").click(function(){
        $("#panel<%= i%>").slideToggle("slow");
    });
});
</script>
<% } %>
<style> 
#panel1, #flip1 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}
#panel1 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}
#panel2, #flip2 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}
#panel2 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}
#panel3, #flip3 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}
#panel3 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}
#panel4, #flip4 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}
#panel4 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}
#panel5, #flip5 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}
#panel5 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}
#panel6, #flip6 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}
#panel6 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}
#panel7, #flip7 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}
#panel7 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}
#panel8, #flip8 {
    padding: 5px;
    text-align: left;
    background-color: #f5f5f5;
    border: solid 1px #c3c3c3;
    width: 550px;
    height: 20px;
}
#panel8 {
    padding: 5px;
    display: none;
    background-color: white;
    width: 550px;
    height: 35px;
}
div#sermain{
	position: absolute;
	margin-left: 300px;
	margin-top: 300px;
}
div#sertitle{
	position: absolute;
	width: 500px;
	margin-left: 500px;
	margin-top: 350px;
}
div#tel{
	position: absolute;
	margin-top: 520px;
	margin-left: 300px;
	width: 200px;
	color: #8C8C8C;
}
div#email{
	position: absolute;
	margin-top: 520px;
	margin-left: 550px;
	width: 300px;
	color: #8C8C8C;
}
div#addr{
	position: absolute;
	margin-top: 520px;
	margin-left: 900px;
	width: 300px;
	color: #8C8C8C;
}
</style>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
  <!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<script type="text/javascript">
	
	var x = '37.40284506572648';
	var y = '127.10582435131073';
	var title = '허허허';
	var content = '가자고';
	var image = '/image/rank1.png';

      function initialize() {
        var mapLocation = new google.maps.LatLng('37.40284506572648', '127.10582435131073'); // 지도에서 가운데로 위치할 위도와 경도
        var markLocation = new google.maps.LatLng(x, y); // 마커가 위치할 위도와 경도
        var markLocation2 = new google.maps.LatLng('37.40284506572648', '127.10782435131073'); // 마커가 위치할 위도와 경도
        var mapOptions = {
          center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
          zoom: 16, // 지도 zoom단계
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map-canvas"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
            mapOptions);
         
        var size_x = 60; // 마커로 사용할 이미지의 가로 크기
        var size_y = 60; // 마커로 사용할 이미지의 세로 크기
         
        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                            new google.maps.Size(size_x, size_y),
                            '',
                            '',
                            new google.maps.Size(size_x, size_y));
         
        var marker;
        marker = new google.maps.Marker({
               position: markLocation, // 마커가 위치할 위도와 경도(변수)
               map: map,
               icon: 'image/rank1.png', // 마커로 사용할 이미지(변수)
//             info: '말풍선 안에 들어갈 내용',
               title: title // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
        });
    
       	 	
       	
        
       	var marker2;   
        marker2 = new google.maps.Marker({
            position: markLocation2, // 마커가 위치할 위도와 경도(변수)
            map: map,
            icon: image, // 마커로 사용할 이미지(변수)
          	info: 'KOSTA 길동무',
            title: 'KOSTA 길동무' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
     });
         
        var content2 = "KOSTA 길동무"; // 말풍선 안에 들어갈 내용
        
        
     	// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow = new google.maps.InfoWindow({ content: content});
 
        google.maps.event.addListener(marker, "click", function() {
            infowindow.open(map,marker);
        });
        
     // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
        var infowindow2 = new google.maps.InfoWindow({ content: content2});
        
        google.maps.event.addListener(marker2, "click", function() {
            infowindow2.open(map,marker2);
        });
         
 
         
      }
      google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<div id="outer">
<div id="first"><%@include file="/mainView/tobmenu.jsp"%></div>
<body>
	<div id="myBar">
		<ul class="side" style="margin-top: 24px;">
			<ul>
			<li type="none" style="font-weight: bold; font-size: 16px; color: #ffffff;
			width: 160px; height: 26px; background-color: #22becc;">
			고객센터
			</li>
			<a href="faq" style="text-decoration: none; margin: -10px 0 0 300px" >FAQ</a>
			<a href="notice" style="text-decoration: none; margin: -30px 0 0 460px">공지사항</a>
			<a href="contact" style="text-decoration: none; margin: -30px 0 0 620px">CONTACT</a>
			</ul>		 
		</ul>
	</div>
	
	<div id="myMain">
		<div id="myMenu" style="border-bottom: 2px solid #dedede;">
			<font style="border-style: solid; font-size:24pt; color: #22becc; font-weight: bolder; ">CONTACT</font>
			<font style="font-size:14pt; font-weight: bolder; color: #17838C; ">Contact us</font>
		</div>
	</div>
	<div id="sermain">
		<img src="./image/hello.png">
	</div>
	
	<div id="sertitle">
		<h1>Trips feel free to Contact Us on</h1>
	</div>
	<div id="map-canvas" style="width: 600px; height: 400px; margin: 650px 0 0 400px; position: absolute;"></div>
	<div id="info">
		<ul>
			<li type="none">
				<div id="tel">
				<h3 style="font-style: inherit;">고객센터 전화번호</h3>
				<br> ☎ : 031-2210-1234
				</div>
			</li>
		
			<li type="none">
				<div id="email">
				<h3 style="font-style: inherit;">입사 지원</h3>
				<br> e-mail : gildongmu@gildongmu.com
				</div>
			</li>
			
			<li type="none">
				<div id="addr">
				<h3 style="font-style: inherit;">회사 위치</h3>
				<br>경기도 성남시 분당구 삼평동 
				<br>유스페이스몰2 B동 8층 KOSTA
				</div>
			</li>		
		</ul>
		
	</div>
</body>
</div>	

</html>