<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <title>여행 갈래?</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Swiper -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">

    <script defer src="resouces/js/common.js"></script>
    <script defer src="resouces/js/swiper.js"></script>
    <link rel="stylesheet" href="resouces/css/goTripMain.css">
    <link rel="stylesheet" href="resouces/css/common.css">
</head>

<body>
    <%@ include file="../common/basic.jsp" %>
    <div class="wrap">
        <div class="top">
            <div class="logo" onclick="location.href='<%= contextPath %>'">우리 여행가조</div>
            <div class="top_menu">
                <ul>
                    <li id="top_menu_1" onclick="location.href='<%= contextPath %>/GoMyPage.me'">My page</li>
                    <li id="top_menu_2" onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터</li>
                    <li id="top_menu_3">로그아웃</li>
                </ul>
            </div>
        </div>

        <div class="under">
            <div class="side_menu">
                <div id="side_menu_open_1" onclick="location.href='<%= contextPath %>'">여행 갈래?</div>
                <div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'" class="login">계획 짤래?</div>
                <div id="side_menu_open_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'" class="login">리뷰 볼래?</div>
                <% if (loginAdmin != null) { %>
                	<div id="side_menu_open_4" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">관리자 메뉴</div>
                <% } %>
                <div id="close_btn" onclick="side_close()"><img src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>

                <div id="side_menu_close_1" onclick="location.href='<%= contextPath %>'" class="login">
                    <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                    <div class="explanation">여행 갈래?</div>
                </div>
                <div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'" class="login">
                    <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
                    <div class="explanation">계획 짤래?</div>
                </div>
                <div id="side_menu_close_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'" class="login">
                    <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                    <div class="explanation">리뷰 볼래?</div>
                </div>
                <% if (loginAdmin != null) { %>
	                <div id="side_menu_close_4" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">
	                    <img src="resouces/img/manage_accounts_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
	                    <div class="explanation">관리자 메뉴</div>
	                </div>
	            <% } %>
                <div id="open_btn" onclick="side_open()">
                    <img src="resouces/img/chevron_right_24dp_5F6368.png" alt="">
                </div>
            </div>

            <div class="content">
                <div class="content_1">
                    집 나가면 고생? 국내 여행은 달라!
                </div>
                <div class="content_2">
                        경주 편
                </div>
                <div class="content_3">
                    ✨ MD 픽 추천 숙소 7선 ✨
                </div>
                <div class="content_4">
                     <!-- Swiper -->
                     <div class="swiper mySwiper">
                        <div class="swiper-wrapper"> 
                            <div class="swiper-slide" type="button" >
                                <img src="https://yaimg.yanolja.com/v5/2024/03/22/10/1280/65fd638cca4c54.62821558.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">경주 H Avenue 경주불국사점 <br><br>
                                                   130,000원 ~
                                </div>   
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="" src="https://yaimg.yanolja.com/v5/2024/03/19/13/1280/65f98e45d7d554.14810113.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">경주 포베르타 스테이 <br><br>
                                                   87,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="" src="https://yaimg.yanolja.com/v5/2023/06/21/14/1280/64930527a553c8.73852353.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">더 테라스 호텔 경주 <br><br>
                                                   135,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="" src="https://yaimg.yanolja.com/v5/2023/06/12/11/1280/648707f905b962.10479190.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">이제 경주 <br><br>
                                                   250,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="" src="https://yaimg.yanolja.com/v5/2023/04/14/14/1280/643964e90e49e7.08374184.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">경주 트라제 풀 빌라 호텔 <br><br>
                                                   299,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="" src="https://yaimg.yanolja.com/v5/2023/12/16/17/1280/657de29c553373.19840735.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">경주 경주엔 한옥 펜션 <br><br>
                                                   180,000원 ~
                                </div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img alt="" src="https://yaimg.yanolja.com/v5/2024/07/04/11/1280/6686849dd7ba98.36523125.jpg" decoding="async" data-nimg="fill" class="css-sr2c7j">
                                <div class="cover">경주 한옥호텔 춘추관 펜션 <br><br>
                                                   98,000원 ~
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_5">
                    놀면 뭐 타지? ✈️
                </div>
                <div class="content_6">
                     <!-- Swiper -->
                     <div class="swiper mySwiper">
                        <div class="swiper-wrapper"> 
                                <div class="swiper-slide" type="button" onclick="location.href='https://carmore.kr/home/rent?v=20240801154352'">
                                    <img class="w-100 click-no-effect normal-img" data-idx="0" src="https://d1y0pslxvt2ep5.cloudfront.net/event/content/content_325_1_20240610054548.png" style="width: 50%;">
                                    <div class="cover">렌트카 조회 하기</div>
                                </div>
                                <div class="swiper-slide" type="button" onclick="location.href='https://flight.naver.com/'">
                                    <img class="bOaTkZcdqgXxzJCZECTz" src="https://media.istockphoto.com/id/1366159026/ko/%EB%B2%A1%ED%84%B0/%EC%83%81%EC%97%85%EC%9A%A9-%ED%95%AD%EA%B3%B5%EC%82%AC-%ED%95%AD%EA%B3%B5%ED%8E%B8-%ED%83%91%EC%8A%B9%EA%B6%8C.jpg?s=612x612&amp;w=0&amp;k=20&amp;c=ZwLd6tZh2K4lR8vRjr7H_XNHkrRssRIR0dhv-AjLY6A=" alt="상업용 항공사 항공편 탑승권 - 비행기 티켓 stock illustrations">
                                    <div class="cover">항공편 조회 하기</div>
                                </div>
                                <div class="swiper-slide" type="button" onclick="location.href='https://www.google.com/maps/?hl=ko'">
                                <img src="resouces/img/지도.jpg" alt="">
                                <div class="cover">내 맘 대로 <br> 소요시간 조회 하기</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_7">
                    포브스 선정 경주에서 가볼만한 곳 TOP 7 👍
                </div>
                <div class="content_8">
                     <!-- Swiper -->
                     <div class="swiper mySwiper">
                        <div class="swiper-wrapper"> 
                            <div class="swiper-slide" type="button" >
                                <img src="resouces/img/경주월드.jpg" alt="">     
                                <div class="cover">경주 월드</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/국립박물관.jpg" alt="">
                                <div class="cover">경주 국립 박물관</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/불국사.jpg" alt="">
                                <div class="cover">불국사</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/양동민속마을.jpg" alt="">
                                <div class="cover">양동 민속마을</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/첨성대.jpg" alt="">
                                <div class="cover">첨성대</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/황리단길.jpg" alt="">
                                <div class="cover">황리단길</div>
                            </div>
                            <div class="swiper-slide" type="button">
                                <img src="resouces/img/교동법주.jpg" alt="">
                                <div class="cover">교동법주</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>