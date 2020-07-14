$(function(){
   let index=0;
    $(window).scroll(function(){
        let $window = $(this);
        let scrollTop = $window.scrollTop();
        let windowHeight = $window.height();
        let documentHeight = $(document).height();
        if( scrollTop + windowHeight +1>= documentHeight ){
           index++;
           setTimeout(fetchlist,200); 
// fetchImage();
// fetchlist();
        }
        function fetchlist(){
           $.ajax({
               type: "get",
               url : "/camp/getlist?reg="+searchParam('reg')+"&index="+index,
               success : function(camps) {
                  console.log(camps.lists[1]);
                  if (camps == null){
                     $(".camp-list").append(``);
                  }
                  if(camps != null)
                  for(var i=0; i<camps.lists.length; i++){
                     var camping = camps.lists[i];
                       $(".camp-list").append(`
                                      <section class="list">
			<div class="list-container">
				<div class="img">
					<img class="image" src="/images/${camping.img1}" width="200"
						height="150">
				</div>
				<div class="content-container">
					<div class="title">
						<a href="detail?id=${camping.id }">${camping.name }</a>
					</div>
					<div class="local" style="color: rgb(0, 140, 236);">${camping.address }</div>
					<div class="comfor">${camping.faclity }</div>
				</div>
				<div class="icon-list">
					<div class="icons list-map">
						<div class="icon">
							<i class="fas fa-map-marker-alt"></i> <span>지도</span>
							<div class="d-none latitude">${camping.latitude}</div>
                             <div class="d-none longitude">${camping.longitude}</div>
						</div>
					</div>
					<div class="icons">
						<div class="icon">
							<i class="fas fa-book"></i> <span>예약</span>
						</div>
					</div>
					
				</div>
				<div id="map" class="map hide">
                        <div class="maps-exit">Exit

                        </div>

                    </div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d381a3bf90a679a591c3eb39a8edfe8"></script>
			</div>
		</section>
                  `);
                     
                  }
               }
                 
           });
           };
           
           function searchParam(key) {
                return new URLSearchParams(location.search).get(key);
              };
           
    })    
});


window.addEventListener("load",function(){
    var mapTest = document.querySelector(".map");
    var mapsExit = document.querySelector(".maps-exit");
    var campList = document.querySelector(".camp-list");
    
campList.addEventListener("click",function(e){ 
  if (event.target.className == "icons list-map"
							  || event.target.className == "fas fa-map-marker-alt"
							  || event.target.className == "icon"
							  || event.target.className == "map-span") {
	// if (event.target.className == "icons list-map"
// ||"fas fa-map-marker-alt"
// ||"icon"
// ||"map-span") {

        var btnMap = event.target.parentElement;
        var latitudeText = btnMap.querySelector(".latitude");
        var longitudeText = btnMap.querySelector(".longitude");

      
        var latitude = parseFloat(latitudeText.innerText);
        var longitude = parseFloat(longitudeText.innerText);

        console.log(latitude);
        console.log(longitude);

        mapTest.classList.remove("hide");


            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        
                mapOption = {
                    center: new kakao.maps.LatLng(latitude, longitude), // 지도의
																		// 중심좌표
                    level: 3 // 지도의 확대 레벨
                };
        
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
            var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착
																									// 마커이미지
																									// 주소입니다
                arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다
                arriveOption = {
                    offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의
															// 좌표에 일치시킬 좌표를
															// 설정합니다 (기본값은 이미지의
															// 가운데 아래입니다)
                };
        
            // 도착 마커 이미지를 생성합니다
            var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);
        
        
            // 도착 마커가 표시될 위치입니다
            var arrivePosition = new kakao.maps.LatLng(latitude, longitude);
        
            // 도착 마커를 생성합니다
            var arriveMarker = new kakao.maps.Marker({
                map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
                position: arrivePosition,
                draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
                image: arriveImage // 도착 마커이미지를 설정합니다
        
            });
        
            var iwContent = '<div class="customoverlay">'
                + '  <a href="" target="_blank">'
                + '<span class="title">'+longitude+'</span>'
                + '</div>';
            iwPosition = new kakao.maps.LatLng(latitude, longitude); // 인포윈도우
																		// 표시
																		// 위치입니다
        
            // 인포윈도우를 생성합니다
            var customOverlay = new kakao.maps.CustomOverlay({
                map: map,
                position: iwPosition,
                content: iwContent,
                yAnchor: 1
            });
        }
        
    // console.log(place);
    // console.log(place.innerText);
    });




mapsExit.addEventListener("click", function (e) {
        mapTest.classList.add("hide");
});

});
