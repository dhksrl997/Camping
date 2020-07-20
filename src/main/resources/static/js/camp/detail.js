//댓글삭제
$(".comment-delete").click(function(e) {
	e.preventDefault();
	console.log($(this).attr("data-rno"));
	let commentId = $(this).attr("data-rno");
	$.ajax({
		type : "get",
		url : "/camp/detail/delete?commentId="+commentId,
		success : function(data) {
			alert("삭제되었습니다.");
			location.reload();

			},
			error: function(){
				console.log("실패");
			}
	});
});







'use strict';

let img1 = $(".img1").find("img").attr("src");
let img2 = $(".img2").find("img").attr("src");
let img3 = $(".img3").find("img").attr("src");
let img4 = $(".img4").find("img").attr("src");
// console.log(img1);
$(".img1").hover(function(){
    $(".main-img").attr("src",img1);
});

$(".img2").hover(function(){
    $(".main-img").attr("src",img2);
});

$(".img3").hover(function(){
    $(".main-img").attr("src",img3);
});

$(".img4").hover(function(){
    $(".main-img").attr("src",img4);
});

window.addEventListener("load",function(){


var latitudeText = document.querySelector(".latitude");
var longitudeText = document.querySelector(".longitude");
var latitude = parseFloat(latitudeText.innerText);
var longitude = parseFloat(longitudeText.innerText);



var mapContainer = document.getElementById('map2'), // 지도를 표시할 div
    mapOption = { 
        center: new kakao.maps.LatLng(latitude, longitude),
        level: 11 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
    	var distanceOverlay; 
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를
															// geolocation으로 얻어온
															// 좌표로 생성합니다
    
        var locPosition2 = new kakao.maps.LatLng(latitude, longitude); // 마커가
																		// 표시될
																		// 위치를
																		// geolocation으로
																		// 얻어온
																		// 좌표로
																		// 생성합니다
      
        var startPosition = new kakao.maps.LatLng(lat, lon); 
        
        var startMarker = new kakao.maps.Marker({
            map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
            position: startPosition,
            draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
            image: startImage // 출발 마커이미지를 설정합니다
        });
        kakao.maps.event.addListener(startMarker, 'dragstart', function() {
            // 출발 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
            startMarker.setImage(startDragImage);
        });

        // 출발 마커에 dragend 이벤트를 등록합니다
        kakao.maps.event.addListener(startMarker, 'dragend', function() {
             // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
            startMarker.setImage(startImage);
        });
     // 도착 마커가 표시될 위치입니다
        var arrivePosition = new kakao.maps.LatLng(latitude, longitude);    
         
        // 도착 마커를 생성합니다
        var arriveMarker = new kakao.maps.Marker({  
            map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
            position: arrivePosition,
            draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
            image: arriveImage // 도착 마커이미지를 설정합니다
        });

        // 도착 마커에 dragstart 이벤트를 등록합니다
        kakao.maps.event.addListener(arriveMarker, 'dragstart', function() {
            // 도착 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
            arriveMarker.setImage(arriveDragImage);
        });

        // 도착 마커에 dragend 이벤트를 등록합니다
        kakao.maps.event.addListener(arriveMarker, 'dragend', function() {
             // 도착 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
            arriveMarker.setImage(arriveImage);  
        });
        var linePath = [
            new kakao.maps.LatLng(lat, lon),
            new kakao.maps.LatLng(latitude, longitude),
           
        ];

        // 지도에 표시할 선을 생성합니다
        var polyline = new kakao.maps.Polyline({
            path: linePath, // 선을 구성하는 좌표배열 입니다
            strokeWeight: 5, // 선의 두께 입니다
            strokeColor: 'red', // 선의 색깔입니다
            strokeOpacity: 1.0, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });
       
  
        // 지도에 선을 표시합니다
        polyline.setMap(map); 
        
        map.setCenter(locPosition);   
      });
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발
																						// 마커이미지의
																						// 주소입니다
    startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다
    startOption = { 
        offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를
												// 설정합니다 (기본값은 이미지의 가운데 아래입니다)
    };

// 출발 마커 이미지를 생성합니다
var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);

var startDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발
																							// 마커의
																							// 드래그
																							// 이미지
																							// 주소입니다
    startDragSize = new kakao.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다
    startDragOption = { 
        offset: new kakao.maps.Point(15, 54) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬
												// 좌표를 설정합니다 (기본값은 이미지의 가운데
												// 아래입니다)
    };

// 출발 마커의 드래그 이미지를 생성합니다
var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);

// 출발 마커가 표시될 위치입니다


// 출발 마커를 생성합니다


// 출발 마커에 dragstart 이벤트를 등록합니다


var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착
																						// 마커이미지
																						// 주소입니다
arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다
arriveOption = { 
    offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다
											// (기본값은 이미지의 가운데 아래입니다)
};

// 도착 마커 이미지를 생성합니다
var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

var arriveDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착
																								// 마커의
																								// 드래그
																								// 이미지
																								// 주소입니다
    arriveDragSize = new kakao.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다
    arriveDragOption = { 
        offset: new kakao.maps.Point(15, 54) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬
												// 좌표를 설정합니다 (기본값은 이미지의 가운데
												// 아래입니다)
    };
 
// 도착 마커의 드래그 이미지를 생성합니다
var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);


});