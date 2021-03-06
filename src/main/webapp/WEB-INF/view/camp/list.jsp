<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script defer src="/js/list/scroll.js"></script>
<script defer src="/js/list/message.js"></script>
<link rel="stylesheet"
   href="https://use.fontawesome.com/releases/v5.13.1/css/all.css"
   integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q"
   crossorigin="anonymous">
   <div class="top-btn" ><i class="fas fa-arrow-up"></i> </div>

<c:if test="${param.query!=null }">
<div style="padding-top:50px;text-align:center;padding-bottom:50px;font-size:24px;">${param.query }에 대한 ${index }개의 검색결과 입니다.</div>
   <div class="camp-list">
      <c:forEach var="rs" items="${result }">
         <section class="list">
            <div class="list-container">
               <div class="img">
                  <a href="detail?id=${rs.id }"><img class="image"
                     src="/images/${rs.img1 }" width="200" height="150"></a>
               </div>
               <div class="content-container">
                  <div class="title map-title">
                     <a href="detail?id=${rs.id }">${rs.name }</a>
                  </div>
                  <div style="color: rgb(0, 140, 236);" class="local">${rs.address }</div>
                  <div class="comfor">${rs.faclity }</div>
               </div>
               <div class="icon-list">
                  <div class="icons list-map">
                     <div class="icon">
                        <i class="fas fa-map-marker-alt"></i> <span>지도</span>
                        <div class="d-none latitude">${rs.latitude}</div>
                             <div class="d-none longitude">${rs.longitude}</div>
                     </div>
							</div>
                     <div class="icons message-icons">
							<div class="icon message-icon">
								<i class="fas fa-book message-text"></i> <span>쪽지</span>
						</div>
                  </div>
                 
               </div>
            </div>
            <div id="map" class="map hide">
                        <div class="maps-exit">Exit

                        </div>

                    </div>
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d381a3bf90a679a591c3eb39a8edfe8"></script>
   
         </section>
         
      </c:forEach>
      </div>
</c:if>


<c:if test="${param.query==null }">
   <nav class="region-list">
      <li><a href="list?reg=se">서울</a></li>
      <li><a href="list?reg=gg">경기도</a></li>
      <li><a href="list?reg=kw">강원도</a></li>
      <li><a href="list?reg=gs">경상도</a></li>
      <li><a href="list?reg=jl">전라도</a></li>
      <li><a href="list?reg=cc">충청도</a></li>
      <li><a href="list?reg=jj">제주도</a></li>
   </nav>
   <!-- 캠핑장 찾기누르자마자 나오는 화면  -->
   <c:if test="${param.reg == null }">
   <div class="Message1"><span>이</span><span>런</span>&nbsp;&nbsp;<span>캠</span><span>핑</span><span>장</span></div>
   <div class="Message2"><span>어</span><span>떠</span><span>세</span><span>요</span><span>!</span></div>
   
   
   
      <div class="random-message"><span class="rec-Button">캠핑장 랜덤추천 <i class="fas fa-redo"></i> </span></div>
   <div class="camp-container">
      <div class="box-wrap">
         <c:forEach var="r" items="${recommend }">
            <div class="box">
                  <a href="detail?id=${r.id }"><img src="/images/${r.img1 }" class="rec-img"></a>
               <div class="name-sec">
                  <a href="detail?id=${r.id }"><span class="rec-name"><i class="fas fa-map-signs">&nbsp;&nbsp;${r.name }</i></span></a>
               </div>
               <div class="address-sec">
                  <a href="detail?id=${r.id }"><span class="rec-address"> ${r.address } </span></a>
               </div>
            </div>
         </c:forEach>

      </div>
   </div>


</c:if>
<div class="camp-list">
   <!-- 지역별 캠핑장을 찾을 때  -->
   <c:if test="${list!=null }">
      <c:forEach var="camp" items="${list }">
         <section class="list">
            <div class="list-container">
               <div class="img">
                  <a href="detail?id=${camp.id }"><img class="image"
                     src="/images/${camp.img1 }" width="200" height="150"></a>
               </div>
               <div class="content-container">
                  <div class="title map-title">
                     <a style="color: rgb(255, 72, 82);" href="detail?id=${camp.id }">${camp.name }</a>
                  </div>
                  <div style="color: rgb(0, 140, 236);" class="local">${camp.address }</div>
                  <div class="comfor">${camp.faclity }</div>
                  <div class="camp-id" style="display:none;">${camp.id}</div>
               </div>
               <div class="icon-list">
               <div class="icons list-map">
                  <div class="icon">
                     <i class="fas fa-map-marker-alt"></i> <span class="map-span">지도</span>
                     <div class="d-none latitude">${camp.latitude}</div>
                             <div class="d-none longitude">${camp.longitude}</div>
                  </div>
                  
               </div>
               <div class="icons message-icons">
							<div class="icon message-icon">
								<i class="fas fa-book message-text"></i> <span>쪽지</span>
						</div>
               
            </div>
            
							<div id="message" class="message hide">
								<div class="message-exit">Exit</div>
									<div class="message-campName"></div>
									
								<div class="writing_area">
								<textarea id="writeNote" style="resize:none;" rows="5" cols="55" title="쪽지 내용을 입력해 주세요."></textarea>
								<div class="button-area">
								<button class="message-send">전송</button>
								<button class="message-cancel">취소</button>
								</div>
								<div class="message-camp-id" style="display:none;"></div>
							</div>
							</div>
								<div id="map" class="map hide">
									<div class="maps-exit">Exit</div>

								</div>
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6d381a3bf90a679a591c3eb39a8edfe8"></script>
							</div>


						</div>
      </section>
         
      </c:forEach>
   </c:if>
</div>
</c:if>