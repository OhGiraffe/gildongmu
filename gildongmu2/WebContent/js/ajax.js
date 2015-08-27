
var xhr = null;	//XMLHttpRequest (비동기 서버통신)

function getXMLHttpRequest() {
	if (window.ActiveXObject) {	// 브라우저에서 ActiveXObject를 지원한다면 (IE라면)
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");			
		} catch(e) {
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
		
	} else if (window.XMLHttpRequest) {	// 비 IE라면
		return new XMLHttpRequest();		
	} else {	//XMLHttpRequest를 지원하지 않는다면
		return null;
	}
}

//xhr.open('HTTP요청방식', '요청URL', 비동기);
//xhr.send('파라미터');
//예) xhr.open('POST', getName.jsp, true);
//	  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//	  xhr.send('파라미터');


function sendRequest(url, params, callback, method) {		//사용자 정의 메소드(open, send메소드 호출)
	xhr = getXMLHttpRequest();
	var httpMethod = method ? method : 'GET';		//삼항연산자 : (조건식) ? A : B
	
	if(httpMethod != 'GET' && httpMethod != 'POST') {
		httpMethod='GET';
	}
	
	var httpParams = (params==null || params=='') ? null : params;
	
	var httpUrl = url;
	if (httpMethod=='GET' && httpParams != null) {
		httpUrl = httpUrl + "?" + httpParams;
	}
	
	xhr.open(httpMethod, httpUrl, true);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.onreadystatechange = callback;			// 요청후 응답데이터를 받아줄 함수를 정의
	xhr.send(httpMethod=='POST' ? httpParams : null);
		
}

