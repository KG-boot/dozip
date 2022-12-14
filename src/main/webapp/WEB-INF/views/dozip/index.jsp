<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>두꺼비집</title>
    <link rel="stylesheet" type="text/css" href="/css/dozip/main.css"/>
    <link rel="stylesheet" type="text/css" href="/css/dozip/portfolio.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>

    <script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>
    <script src="/js/dozip/header.js" defer></script>
    <script src="/js/dozip/map.js" defer></script>
    <script src="/js/dozip/portfolio.js" defer></script>
    <script src="/js/dozip/jquery.js"></script>
    <script src="/js/dozip/member.js"></script>

    <%--new 헤더--%>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script src="/js/dozip/header.js"></script>
    <script src="https://kit.fontawesome.com/6f3edb2719.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/dozip/header.css"/>
    <style>
        .info button {
            background: none;
            border-radius: 4px;
            border: none;
            padding: 5px;
        }
        .info button:hover{
            background: #F3FAF5;
        }
        #keyword {
            width: 260px;
            border: none;
            text-align: left;
            padding: 17px 10px 17px 0px;
            height: 20px;
            outline: none;
            background: none;
            color: black;
            font-size: 20px;
        }
        #keyword:focus {
            color: black;
        }
        div#keyword_form{
            width: 330px;
            border: 1.5px solid #6d7696;
            border-radius: 4px;
            background: white;
        }
        div#keyword_form:hover{
            background: #F1F1FC;
        }
        .xi-search {
            font-size: 20px;
            padding: 10px 5px;
        }
    </style>
    <script>
        function openLogin() {
            window.open("/dozip/login", "_blank", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=550, height=750, left=0, top=0");
        }/* width=400, height=550 */
    </script>
    <%--스크롤 할 때 이미지 fade in되게 설정--%>
    <script>
        $(document).ready(function(){
            $(window).scroll(function (){
                $('.part4_img,.part5_img').each(function (){
                    var bottom_of_element = $(this).offset().top + $(this).outerHeight()/3;
                    var bottom_of_window = $(window).scrollTop() + $(window).height();

                    if(bottom_of_window > bottom_of_element){
                        $(this).animate({'opacity':'1'},700);
                    }
                });
            });
        });
    </script>
</head>
<body>
		<!-- header 영역 -->
		<header>
			<div class="container clearfix">
				<h1 class="logo">
					<a href="/dozip/home"></a>
				</h1>
				<nav class="clearfix">
					<ul class="main-menu">
						<li><a href="/dozip/home" class="active">Home</a></li>
						<li><a href="/dozip/apply">견적신청</a></li>
						<li><a href="/dozip/port">포트폴리오</a></li>
						<li><a href="/dozip/review_main">고객후기</a></li>
						<li><a href="">스토리</a></li>
						<li><a href="/partners/main" target='_blank'>파트너스</a></li>
					</ul>
					<ul class="top-icons">
						<c:if test="${empty id}"> <!-- 로그인 전 -->
							<li><a href="#none" onclick="openLogin();" ><i class="fas fa-user"></i></a>
                                    <div class = "sub_menu1">
                                        <ul>
                                            <li><a href="#" onclick="openLogin()">로그인</a></li>
                                            <li><a onclick="openJoin()" style="cursor:pointer;">회원가입</a></li>
                                        </ul>
                                    </div>
                            </li>
						</c:if>
						<c:if test="${!empty id}"> <!-- 로그인 후 -->
							<li><a href="/dozip/mypage_main"><i class="fas fa-user" style="color:#7e9e7f;"></i></a>
                                    <div class = "sub_menu2">
                                        <ul>
                                            <li><a onclick="location.href='logout_ok'" style="cursor: pointer">로그아웃</a></li>
                                            <li><a onclick="location.href='mypage_main'" style = "cursor:pointer">마이페이지</a></li>
                                        </ul>
                                    </div>
                            </li>
						</c:if>
						<li><a href="/dozip/counsel_main"><i class="fa-solid fa-comments"></i></a></li>
					</ul>
				</nav>
			</div>
		</header>
		<!-- header 영역 끝 -->

<div class="clear"></div>

<!-- 본문 -->

<div id="part">
    <div id="part1">
        <%--배너 시작 --%>
        <div class="slideshow-container">

            <div class="mySlideDiv fade active">
                <img src="/images/dozip/mainslide01.jpg">
            </div>

            <div class="mySlideDiv fade">
                <img src="/images/dozip/mainslide02.jpg">
            </div>

            <div class="mySlideDiv fade">
                <img src="/images/dozip/mainslide03.jpg">
            </div>


            <a class="prev" onclick="prevSlide()">&#10094;</a>
            <a class="next" onclick="nextSlide()">&#10095;</a>

        </div>
        <%-- 배너 종료 --%>
    </div>

    <div class="clear"></div>

    <div id="part2" style="background-color: white;">
        <div id="part21">
            <div id="part2_title">
           주변의 인테리어 업체를 찾아보세요</div>
            <div id="keyword_form">
                <form onsubmit="searchPlaces(); return false;">
                    <i class="xi-search"></i>
                    <input type="search" placeholder="업체검색"  value="강남 인테리어" id="keyword">
                </form>
            </div>
           <div id="part2_info"> 검색하고자 하는 키워드를 입력하세요. (예: 역삼동 인테리어)</div>
        </div>
        <div id="part22">

            <div class="part2_left">
                <div id="menu_wrap" class="bg_white">
                    <ul id="placesList"></ul>
                    <div id="pagination"></div>
                </div>
            </div>
            <div id="map"></div>
            <script type="text/javascript"
                    src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d8bfa3cbe8aabf2dd47e365262af246&libraries=services,clusterer,drawing"></script>
        </div>
    </div>

    <div class="clear"></div>

<%--    <div id="part3">--%>
<%--        <span class="part_title"><p>인테리어, 왜 두집에 맡겨야 할까요?</p></span>--%>
<%--        <span id="part3_img">--%>
<%--					<a id="part3_image" href="#"><img src="/images/dozip/part3.png" style="width: 400px;"/></a>--%>
<%--				</span>--%>
<%--    </div>--%>

    <section class="excellent_mobile">
        <div class="container clearfix">
            <img src="/images/dozip/dozip_hand.png" alt="Dozip"/>
            <div class="contents">
                <h3 class="content_tt">인테리어, 왜 두집에 맡겨야 할까요?</h3>
                <p class="content_desc">꼼꼼한 비교견적 믿을 수 있는 업체를 연결해 드려요. 상세한 집닥플래너 견적서의 분석과 상담을 전담플래너가 관리해드려요. 현장케어 시공현장을 꼼꼼하게 체크해요. 든든한 두집과 함께하면 스트레스 받지 않아요.</p>
                <ul>
                    <li><span>bullet</span> 간단한 회원가입후 견적신청을 해보아요</li>
                    <li><span>bullet</span> 두집과 파트너스를 맺어 더 많은 고객과 연결될 수 있어요</li>
                    <li><span>bullet</span> 다양한 스타일을 포트폴리오로 확인하고 해당 회사에 견적을 맡길 수 있어요</li>
                    <li><span>bullet</span> 후기를 작성해서 다른 고객들께 좋은 인테리어 회사를 추천해 보아요</li>
                </ul>
            </div>
        </div>
    </section><!--//excellent_mobile -->

    <div class="clear"></div>

    <div id="part4" style="background-color: white;">
			<span class="part_title">
				<a id="part4_link" href="port"><p><font >포트폴리오 보러가기</p></a>
			</span>

        <div id="part4_area">
            <c:if test="${!empty plist}">
                <c:forEach var="i" begin="0" end="2" step="1">
                    <div class="part4_inner">
                        <div><a class="part4_img">
                            <img onclick="location.href='port_detail?pf_no=${plist[i].pf_no}';"
                                 src='${plist[i].pf_photo1}'/>
                                <%-- 클릭시 글번호를 넣어 상세로 연결 --%>
                        </a></div>
                        <div class="part4_title"><p>${plist[i].pf_title}</p></div>
                        <div class = "part4_cont">
                            <li class="card_tag">${plist[i].pf_type} ${plist[i].pf_area} ${plist[i].pf_cost}</li>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <c:if test="${empty plist}">
                <div id="none_pf">포트폴리오 목록이 없습니다</div>
            </c:if>
        </div>
    </div>
    <div class="clear"></div>

    <div id="part5">
				<span class="part_title">
					<a id="part5_link" href="review_main"><p>더 많은 후기 보러가기</p></a>
				</span>
        <div id="part5_area">
            <c:if test = "${!empty reviewList}">
                <c:forEach var = "i" begin="0" end = "2" step="1">
                    <div class="part5_inner">
                        <div><a class="part5_img">
                            <img src='${reviewList[i].re_photo1}' onclick="location.href='review_detail?re_no=${reviewList[i].re_no}'"/>
                        </a></div>
                        <div class="part5_title"><p>${reviewList[i].re_title}</p></div>
                        <div class="part5_cont">
                            <p>${reviewList[i].re_cont}</p>
                        </div>
                        <p></p>
                    </div>
                </c:forEach>
            </c:if>

            <c:if test="${empty reviewList}">
                <div id="none_pf">고객후기 목록이 없습니다</div>
            </c:if>


        </div>
    </div>
</div>

<!-- footer영역 -->
<div class="clear"></div>

        <footer id="footer">
            <hr/>
            <nav class="footer_nav">
                <ul class="footer_menu">
                    <li><a href="#">회사소개</a></li>
                    <li><a href="#">개인정보처리방침</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="/partners/main">파트너스 페이지</a></li>
                </ul>
            </nav>

            <div id="footer_company">
                <div class="footer_company_call">
                    <p class="footer_company_call_number">1600 - 0000</p>
                    <p class="footer_company_call_info">
                        <span>월 - 금: 09:00 - 18:00 (주말/공휴일 제외) | </span>
                        <span class="_modis">팩스 : 02-1111-1111 | </span>
                        <span class="_modis">고객문의: <a class="footer_mail" href="mailto:5140lovely@naver.com">5140lovely@naver.com</a> | </span>
                        <span class="_modis">제휴문의: <a class="footer_mail" href="mailto:5140lovely@naver.com">5140lovely@naver.com</a> | </span>
                    </p>
                </div>

                <div class="footer_company_text" >
                    <span>두집주식회사 대표이사 : 1조 | </span>
                    <span>주소 : 서울 강남구 | </span>
                    <span>사업자등록번호 : 000-81-12345 | </span>
                    <span>통신판매번호 : 2022-서울강남-11111호</span>
                </div>
                <div class="footer_company_copyright">
                    <p>두집주식회사는 통신판매중개자로서 건축 공사의 주 거래 당사자가 아니며, 시공전문가가 제공한 견적 및 공사
                        시공 서비스에 대해 일체 책임을 지지 않습니다.</p>
                    <p>copyright © DOZIP</p>
                </div>
            </div>
        </footer>
</body>

</html>