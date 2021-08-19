<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<style>
.footer {
   margin-top: 50px;
}

caption {
   overflow: hidden;
   width: 0;
   height: 0;
   text-indent: -5000px;
   font-size: 0;
   line-height: 0;
}

table img {
   height: 130px;
}

table.data {
   border-top: 2px solid #707070;
}

table {
   display: table;
   box-sizing: border-box;
   text-indent: initial;
   border-spacing: 2px;
   border-color: grey;
   border-collapse: collapse;
   text-align: center;
}

td, th {
   border: 1px solid #999;
   padding: 0.1em 1em;
   line-height: 40px;
   text-align: center;
}

table.data thead th {
   padding: 10px;
   border: 1px solid #707070;
   border-bottom: 1px solid #c3c3c3;
   background: #f5f5f5;
}

table.data thead tr:first-child th:first-child {
   border-left: none;
}

table.data thead tr:last-child, table.data thead th:last-child {
   border-right: none;
}

table.data tbody tr th:first-child {
   border-left: none;
}

table.data tbody tr td {
   border-right: none;
}

p {
   margin-top: 10px;
}

.app {
   margin-top: 40px;
}

.app img {
   margin-right: 20px;
   background-color: green;
}

.use {
   overflow-y: hidden;
}

.map_menu #map1 {
   width: 77%;
   float: left;
}

.map_menu #m_menu {
   width: 20%;
   height: 100%;
   float: left;
   margin-left: 1px;
   margin-bottom: 8px;
}

#m_menu .menu_header {
   height: 48px;
   text-align: center;
}

#m_menu {
   background-color: #258fff;
}

.menu_header {
   padding-top: 7px;
}

.menu_header h4 {
   padding-top: 10px;
   color: #ffffff;
}

.menu_content {
   background-color: #eeeeee;
   min-height: 470px;
   position: relative;
   overflow-x: hidden;
   overflow-y: auto;
}

.col-xs-5 {
   margin: 5px 0;
}

.menu_detail {
   text-align: left;
   border-bottom: solid 1px grey;
}

#m_btn {
   display: inline-block;
   width: 65px;
   margin-top: 11px;
}

.detail_header {
   padding-top: 20px;
}

.detail_content1 {
   font-size: 1.25rem;
   padding-left: 5px;
}

.detail_content2 {
   padding-left: 5px;
}

.detail_content3 {
   padding-left: 5px;
}

/** 최상단 메인 제목 **/
.main_header h1 {
   position: relative;
   text-align: center;
}

.main_header>h1>span>img {
   width: 3rem;
   height: 3rem;
   position: relative;
   left: 5px;
   bottom: 5px;
}
</style>

</head>
<body>
   <div class="wrapper">
      <%@ include file="../inc/Header.jsp"%>
      <div class="container">

         <div class=body>
            <div class="main_header">
               <h1 class="page-header page-title">
                  <span>공공자전거<img alt="따릉이 실시간 이용현황"
                     src="../assets/icon_img/자전거 아이콘 2.png" />
                  </span>
               </h1>
            </div>
            <!-- 본문 상단 메뉴 부분 -->
            <div class="body_header clearfix">
               <div class="map_menu ">
                  <!-- 자전거 실시간 현황 지도 -->
                  <div id="map1" style="height: 530px; margin: auto"></div>
                  <div id="m_menu">
                     <div class="menu_header clear-fix" style="height:40px; ">
                        <form id="mapSearch"
                           action="${pageContext.request.contextPath }/bicyclePage/bicycle_index_search.do">
                           <label for="keyword" class="pull-left" style="margin-left:10px;" >대여소 : </label> <input type="search" class="serch col-md-9 col-sm-8 col-xs-6 pull-right" 
                              name="keyword" id="keyword" />
                           <button type="submit" class="col-xs-12"
                              id="mapSearch-btn">검색</button>
                        </form>
                     </div>
                     <br>
                     <!-- 지역별 자전거 이용 현황 -->
                     <div class="menu_content"
                        style="height:150px; overflow-y: scroll;">
                        <div id="select_result" ></div>
                     </div>
                  </div>
               </div>
            </div>
            <!-- //본문 상단 메뉴 부분 끝 -->
            <br>
            <div class="body_container">
               <div class="oper_Sts">
                  <h2>운영 현황</h2>
                  <table class="data" width="100%" summary="서울시 공공자전거 운영현황을 정리한 표">
                     <caption>운영 현황</caption>
                     <thead>
                        <tr>
                           <th scope="col">구분</th>
                           <th scope="col">2017년</th>
                           <th scope="col">2018년</th>
                           <th scope="col">2019년</th>
                           <th scope="col">2020년</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <th scope="row">자전거</th>
                           <td>17,690대 <br> (+10,400)
                           </td>
                           <td>20,000대 <br> (+2,310)
                           </td>
                           <td>25,000대 <br> (+5,000)
                           </td>
                           <td>37,500대 <br> (+12,500)
                           </td>
                        </tr>
                        <tr>
                           <th scope="row">대여소</th>
                           <td>1,290개소 <br> (+840)
                           </td>
                           <td>1,540개소 <br> (+250)
                           </td>
                           <td>1,540개소 <br> (-)
                           </td>
                           <td>2,228개소 <br> (+688)
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <p>※ 서비스 지역 : 서울시 전역(25개 자치구) / 서비스시작 : 2015.9.19. (967대)</p>
                  <br>

               </div>
               <div class="use">
                  <h2>이용방법</h2>
                  <table class="data" width="100%"
                     summary="이용방법을 구분, 시작하기, 대여하기, 반납하기로 나누어 정리한 표">
                     <caption>이용방법</caption>
                     <thead>
                        <tr>
                           <th scope="col">구분</th>
                           <th scope="col">시작하기</th>
                           <th scope="col">대여하기</th>
                           <th scope="col">반납하기</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <th scope="row" rowspan="2" style="width: 100px;">LCD형 <br>단말기
                           </th>
                           <td class="manual_img"><img
                              src="../assets/img/bikeseoul_lcd1.png" alt="LCD형 단말기 시작" /></td>
                           <td class="manual_img"><img
                              src="../assets/img/bikeseoul_lcd2.png" alt="LCD형 단말기 대여" /></td>
                           <td class="manual_img"><img
                              src="../assets/img/bikeseoul_lcd3.png" alt="LCD형 단말기 반납" /></td>
                        </tr>
                        <tr>
                           <td class="left"><li class="sssblet">구글플레이스토어 또는
                                 앱스토어에서 ‘따릉이’를 검색하여 설치한 뒤, 이용권을 구매합니다.</li></td>
                           <td class="left">
                              <ul>
                                 <li class="sssblet">단말기 버튼을 누른 뒤 대여 비밀번호를 입력합니다.</li>
                                 <li class="sssblet">단말기 오른쪽에 꽂혀있는 잠금장치를 분리하여 대여합니다.</li>
                              </ul>
                           </td>
                           <td class="left"><li class="sssblet">반납할 거치대로 이동하여,
                                 단말기에 잠금장치를 결합합니다.</li>
                              <li class="sssblet">LCD형 단말기는 신규대여소(QR형 단말기용 거치대)에 반납이
                                 불가능합니다.</li></td>
                        </tr>
                        <tr>
                           <th scope="row" rowspan="2">QR형<br>단말기
                           </th>
                           <td class="manual_img"><img
                              src="../assets/img/bikeseoul_qr1.png" alt="QR형 단말기 시작" /></td>
                           <td class="manual_img"><img
                              src="../assets/img/bikeseoul_qr2.png" alt="QR형 단말기 대여" /></td>
                           <td class="manual_img"><img
                              src="../assets/img/bikeseoul_qr3.png" alt="QR형 단말기 반납" /></td>
                        </tr>
                        <tr>
                           <td class="left"><li class="sssblet">구글플레이스토어 또는
                                 앱스토어에서 ‘따릉이’를 검색하여 설치한 뒤, 이용권을 구매합니다.</li></td>
                           <td class="left"><li class="sssblet">따릉이 앱 실행 후 자전거
                                 QR코드를 스캔하거나, 자전거번호를 입력합니다.</li></td>
                           <td class="left"><li class="sssblet">대여소 거치대에 거치한 후
                                 잠금 장치를 당겨서 잠급니다.</li></td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <br>
               <div class="ticket_info">
                  <h2>이용권 안내</h2>
                  <table class="data" width="100%"
                     summary="이용권안내를 구분, 일반권, 프리미엄권으로 나누어 정리한 표">
                     <caption>이용권안내</caption>
                     <thead>
                        <tr>
                           <th scope="col" colspan="2">구분</th>
                           <th scope="col">1시간권(60분)</th>
                           <th scope="col">2시간권(120분)</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <th scope="row" colspan="2">일일권</th>
                           <td>1,000원</td>
                           <td>2,000원</td>
                        </tr>
                        <tr>
                           <th scope="rowgroup" rowspan="4">정기권</th>
                           <th scope="row">7일권</th>
                           <td>3,000원</td>
                           <td>4,000원</td>
                        </tr>
                        <tr>
                           <th scope="row">30일권</th>
                           <td>5,000원</td>
                           <td>7,000원</td>
                        </tr>
                        <tr>
                           <th scope="row">180일권</th>
                           <td>15,000원</td>
                           <td>20,000원</td>
                        </tr>
                        <tr>
                           <th scope="row">365일권</th>
                           <td>30,000원</td>
                           <td>40,000원</td>
                        </tr>
                     </tbody>
                  </table>
                  <p>※ 기본 시간 초과 시 5분당 200원씩 추가됩니다.</p>
                  <p>※ 비회원의 경우 일일권 구매만 가능합니다.</p>
               </div>
            </div>
         </div>
         <div class="app">
            <a
               href="https://apps.apple.com/kr/app/%EC%84%9C%EC%9A%B8%EC%9E%90%EC%A0%84%EA%B1%B0-%EB%94%B0%EB%A6%89%EC%9D%B4/id1037272004">
               <img src="../assets/img/app_ios.png" alt="앱 스토어 다운로드">
            </a> <a
               href="https://play.google.com/store/apps/details?id=com.dki.spb_android&hl=ko&gl=US">
               <img src="../assets/img/app_and.png" alt="구글 스토어 다운로드">
            </a>
         </div>
      </div>
   </div>

   <%@ include file="../inc/Footer.jsp"%>


   <%@ include file="../inc/plugin.jsp"%>

</body>
<script type="text/javascript"
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9870eef7f02b830927d5cdc63a809fa0&libraries=clusterer"></script>
<script
   src="${pageContext.request.contextPath}/assets/plugins/ajax-form/jquery.form.min.js"></script>

<script>
   function getContextPath() {
      var hostIndex = location.href.indexOf(location.host)
            + location.host.length;
      var contextPath = location.href.substring(hostIndex, location.href
            .indexOf('/', hostIndex + 1));
      return contextPath;
   }

   $(function() {
      $("#mapSearch")
            .submit(
                  function(e) {
                     e.preventDefault();
                     var words = $("#keyword").val();
                     $
                           .ajax({
                              method : 'GET',
                              url : getContextPath()
                                    + '/bicyclePage/bicycle_index_search.do',
                              data : {
                                 keyword : words
                              },
                              dataType : 'json',
                              success : function(result) {
                                 if (result.item.length > 0) {
                                    size=result.item.length;
                                    var str = ''
                                    for (var i = 0; i < result.item.length; i++) {
                                       var x=result.item[i].stationLatitude;
                                       var y=result.item[i].stationLongitude;
                                       
                                       str += '<div class="menu_detail" onclick="panTo('+x+','+y+')" style="cursor:pointer;">';
                                       str += "<button id='map_btn' class='btn btn-info pull-right' type='button' style='display:none'>위치 찾기 </button>";
                                       str += "<p class='detail_content1'>대여소 : "
                                             + result.item[i].stationName
                                             + " </p>";
                                       str += "<p class='detail_content2'>현재 이용 가능 대수: "
                                             + result.item[i].parkingBikeTotCnt
                                             + " </p>";
                                       str += "<p class='detail_content3'>거치율: "
                                             + result.item[i].shared + "%"
                                             + "</p></div>";
                                    }
                                    $("#select_result").html(str);
                                 } else {
                                    $("#select_result")
                                          .html(
                                                "<h3>검색결과가 없어요.</h3> <br><h3>검색어를 확인해주세요.</h3>");
                                 }
                              },
                              error : function(e) {
                                 console.log('error:' + e.status);
                              }
                           });
                  })

   });
</script>

<!-- 지도 script -->
<script>
   var map = new kakao.maps.Map(document.getElementById('map1'), { // 지도를 표시할 div
      center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표 
      level : 9
   // 지도의 확대 레벨 
   });
   // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
   var mapTypeControl = new kakao.maps.MapTypeControl();

   // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
   // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
   map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

   // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
   var zoomControl = new kakao.maps.ZoomControl();
   map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
   
   function panTo(x, y) {
   // 이동할 위도 경도 위치를 생성합니다
   var moveLatLon = new kakao.maps.LatLng(x,y);
   map.setLevel(3);
   // 지도 중심을 부드럽게 이동시킵니다
   // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
   map.panTo(moveLatLon);
   }


   //Ajax를 통해 좌표 데이터 map를 전송받는다.

   var imageSrc = '../assets/img/bicycle_marker.png', // 마커이미지의 주소입니다
   imageSize = new kakao.maps.Size(50, 40); // 마커이미지의 크기입니다
   // 마커 이미지 생성
   var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

   // 마커 클러스터러를 생성합니다 
   var clusterer = new kakao.maps.MarkerClusterer({
      map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
      averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
      minLevel : 3
   // 클러스터 할 최소 지도 레벨 
   });

   $(window).load(function() {
                  $.ajax({
                           url : getContextPath()
                                 + "/bicyclePage/bicycle_index_map",
                           type : "GET",
                           data : "",
                           dataType : "json",
                           success : function(data) {
                              //요청에 성공하면 DB에서 꺼낸 데이터를 json 형식으로 응답 받는다.

                              //마커들을 저장할 변수
                              var markers = $(data.item).map(function(i, position) {
                                             //마커를 하나 새로 만드는데, 위치값을 지정하고 클릭이 가능하게 설정함.
                                             var marker = new kakao.maps.Marker({
                                                      position : new kakao.maps.LatLng(
                                                            position.stationLatitude,
                                                            position.stationLongitude),
                                                      image : markerImage,
                                                      clickable : true
                                                   });

                                             //띄울 인포윈도우 정의
                                             var iwContent = '<div style="padding-left:5px; height:60px;">'
                                                   + '<h5>'+ '<b>' +position.stationName + '</b>' + '</h5>'
                                                   // + '<br/>'
                                                   + "이용 가능한 자전거 수 : "
                                                   + position.parkingBikeTotCnt + "대"
                                                   + '</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                                             iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
                                             // 인포윈도우를 생성합니다
                                             var infowindow = new kakao.maps.InfoWindow({
                                                      content : iwContent
                                                   });

                                             // 마커에 마우스오버 이벤트를 등록합니다
                                             kakao.maps.event.addListener(marker,'mouseover',function() {
                                                            // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                                                            infowindow.open(map,marker);
                                                         });

                                             // 마커에 마우스아웃 이벤트를 등록합니다
                                             kakao.maps.event.addListener(marker,'mouseout',function() {
                                                            // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                                                            infowindow.close();
                                                         });

                                             //생성된 마커를 반환합니다.
                                             return marker;
                                          });
                              // 클러스터러에 마커들을 추가합니다
                              clusterer.addMarkers(markers);
                           }

                        });

               });
</script>
</html>