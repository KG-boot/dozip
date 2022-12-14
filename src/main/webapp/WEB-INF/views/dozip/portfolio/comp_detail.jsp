<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:include page = "../common/header.jsp"/>
<%-- 상단 공통부분 끝 --%>
<link rel="stylesheet" type="text/css" href="/css/dozip/comp_det.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class = "clear"></div>
	
	<!-- 본문영역 -->
	<br><br>
	<div class = "comp_wrap">
			<%-- 업체 명함 부분 --%>
			<div class = "flip">
				<div class = "comp_card">
					<div class = "front">
						<div class = "comp_name">
							<h2>${pc.businessName}</h2>
						</div>

						<%-- 제공 서비스 --%>
						<div class = "comp_service">
							<p id = service_title>제공 서비스</p>
							<div class = "service_images">
								<img id = "insu" src = "/images/dozip/portfolio/detail/insurance.png"/>

								<img id = "scetch" src = "/images/dozip/portfolio/detail/scetch.png"/>

								<img id = "3d" src = "/images/dozip/portfolio/detail/3D.png"/>

								<img id = "credit" src = "/images/dozip/portfolio/detail/credit.png"/>

							</div>
							<ul class = "service_cont">
								<li class = "insu_cont">보증보험</li>
								<li class = "scetch_cont">일반도면</li>
								<li class = "3d_cont">3D 도면</li>
								<li class = "credit_cont">카드결제</li>
							</ul>
						</div>
					</div>
					<div class = "back">
						<c:if test="${pst.p_Comp_logo eq null}">
							<div class=   "comp_img">
								<img id = "comp_logo" src = "/images/dozip/portfolio/detail/frog.png"/>
								<button type = "button" id = "comp">보증업체 (i)
									<span class = "tooltip-text">5000만원 예치금 보증회사</span>
								</button>
							</div>
						</c:if>
						<c:if test="${pst.p_Comp_logo ne null}">
							<div class=   "comp_img">
								<img id = "comp_logo2" src = "${pst.p_Comp_logo}"/>
								<button type = "button" id = "comp2">보증업체 (i)
									<span class = "tooltip-text2">5000만원 예치금 보증회사</span>
								</button>
							</div>
						</c:if>

						<%-- 업체 정보 --%>
						<div class = "comp_cont">
							<p id = "comp_title">업체정보</p>
							<p id = "comp_bnum">${pc.businessNum}</p>
							<p id = "comp_ceo">대표자 : ${pc.p_Name}</p>

							<p id = "comp_cont">전문분야 : 주거공간 / 상업공간</p>
							<p id = "comp_place">시공지역 : 서울/경기</p>
							<p id = "comp_year">경력 : 7년</p>
							<c:if test = "${pc.p_Addr1 != ''||pc.p_Addr1 ne null}">
								<p id = "comp_where">주소 : ${pc.p_Addr1}</p>
							</c:if>
							<c:if test = "${pc.p_Addr1 eq null}">
								<p id = "comp_where_none"></p>
							</c:if>

						</div>
					</div>
				</div>
			</div>
				<div id="map" style="width:40%;height:500px;"></div>

				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f908dbe7bf50aa48ef0755edf8cbb327&libraries=services"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div
							mapOption = {
								center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								level: 3 // 지도의 확대 레벨
							};

					// 지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);

					var imageSrc = '/images/dozip/portfolio/icons8-home-address-100.png', // 마커이미지의 주소입니다
						imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
						imageOption = {offset: new kakao.maps.Point(27, 69)}; //이미지 안에서의 좌표를 설정합니다.

					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder.addressSearch("${pc.p_Addr1}", function(result, status) {

						// 정상적으로 검색이 완료됐으면
						if (status === kakao.maps.services.Status.OK) {

							var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

							// 결과값으로 받은 위치를 마커로 표시합니다
							var marker = new kakao.maps.Marker({
								map: map,
								image:markerImage,
								position: coords
							});

							// 인포윈도우로 장소에 대한 설명을 표시합니다
							var infowindow = new kakao.maps.InfoWindow({
								content: '<div style="width:150px;text-align:center;padding:6px 0;">${pc.businessName}</div>'
							});
							infowindow.open(map, marker);

							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
						}
					});
				</script>
	</div>
	<br><br>


	<%-- 하단 공통부분--%>
<jsp:include page = "../common/footer.jsp"/>