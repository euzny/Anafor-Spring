<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=681e977067d98d095ccfda23ca7c463c"></script>
    <style>
 	#header {
	   width:100%;
	   height:60px;
	   padding: 20px;
	   background-color:#929292;
	   border-bottom: 1px solid white; 
	}
	
	#header h3{
	   font-size: 25px;
	   font-weight: bold;
	   text-align: left;
	   color: white;
	}
    </style>
</head>
<body>
<div id="header">
  	<h3>약통위치경로</h3>
</div>

<div id="webmap" style="width:80%; height:600px; margin:50px auto 5px auto;" ></div>    
<div style="width:90%; text-align:right; font-size:11px;">*해당 경로는 현재 기준 3일전까지만 확인 가능합니다.</div>
 
<script>
var json = JSON.parse('${list}');
var first_positions = [];
var textday ,texttime;
for (var i=0; i<json.length; i++){
	textday = json[i].gps_date.substr(0,10);
	texttime = json[i].gps_date.substr(11,18);
	
	first_positions[i] = {
			content: '<div id="title">'+textday+'<br/>'+texttime+'</div>',
			latlng: new kakao.maps.LatLng(json[i].latitude, json[i].longitude)
	};
} 

var mapContainer = document.getElementById('webmap'), // 지도를 표시할 div
 
mapOption = {

center: first_positions[0].latlng, // 지도의 중심좌표 */
level: 1// 지도의 확대 레벨
 
};
 
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다


var mapTypeControl = new kakao.maps.MapTypeControl(); // 지도에 컨트롤을 추가해야 지도위에 표시
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT); // 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 첫번째 마커 생성
 
for (var i = 0; i < first_positions.length; i ++) {
 
// 마커를 생성합니다
 
var marker = new kakao.maps.Marker({
 
map: map, // 마커를 표시할 지도
 
position: first_positions[i].latlng // 마커의 위치// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
 
});
 
 
// 마커에 표시할 인포윈도우를 생성합니다
 
var infowindow = new kakao.maps.InfoWindow({
 
content: first_positions[i].content, // 인포윈도우에 표시할 내용
 
removable : true
 
});
 
 
kakao.maps.event.addListener(marker, 'click', marker_click(map, marker, infowindow));
 
}
 

function marker_click(map, marker, infowindow){
 
return function() {
 
infowindow.open(map, marker);
 
};
 
}
 
// 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다

var first_polyline = new Array();

for (var i = 0; i < json.length; i ++) {
	
	first_polyline[i] = new kakao.maps.LatLng(json[i].latitude ,json[i].longitude);
}  
 
// 지도에 표시할 선을 생성합니다
 
var first_linePath = new kakao.maps.Polyline({
 
path: first_polyline, // 선을 구성하는 좌표배열 입니다
 
strokeWeight: 10, // 선의 두께 입니다
 
strokeColor: '#FFAE00', // 선의 색깔입니다
 
strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
 
strokeStyle: 'solid' // 선의 스타일입니다
 
});

 
// 지도에 선을 표시합니다
 
first_linePath.setMap(map);

</script>
</body>
</html>