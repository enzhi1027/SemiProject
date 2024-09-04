<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행가조</title>
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
    <link rel="stylesheet" href="resouces/css/common.css">

    <style>
        .under > .side_menu > #side_menu_open_1 {font-weight: 600;}
        
        .content {
            padding: 15px;
            color: white;
        }

        .content_1 {
            width: 100%;
            height: 10%;
        }

        .content_2 {
            margin-top: 10px;
            width: 100%;
            height: 40%;
        }

        .content_3 {
            margin-top: 100px;
            width: 100%;
            height: 10%;
        }

        .content_4 {
            margin-top: 10px;
            width: 100%;
            height: 40%;
        }

        .content_5 {
            margin-top: 100px;
            width: 100%;
            height: 10%;
        }

        .content_6 {
            margin-top: 10px;
            width: 100%;
            height: 60%;
        }

        .content_7 {
            width: 100%;
            height: 10%;
        }

        h3 {
            margin-top: 2%;
            margin-left: 5%;
        }

        .swiper {
            width: 100%;
            height: 100%;
            justify-content: center;
            align-items: center;
        }

        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background-color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            overflow: hidden;
        }

        .swiper-slide img,
        .swiper-slide .cover {
            display: block;
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
            position: absolute;
        }

        .swiper-slide .cover {
            display: none;
            padding: 50% 0;
        }

        .swiper-slide img:hover+.cover,
        .swiper-slide .cover:hover {
            display: block;
            background-color: #00000075;
            transition: .7s;
        }

        .content_2 .swiper-slide:hover img {
            width: 600px;
            height: 450px;
            overflow: hidden;
            transition-duration: .7s; 
        }

        .content_4 .swiper-slide:hover img {
            width: 110%;
            height: 110%;
            overflow: hidden;
            transition-duration: .7s; 
        }

        .content_6 .swiper-slide:hover img {
            width: 110%;
            height: 110%;
            overflow: hidden;
            transition-duration: .7s; 
        }

    </style>
</head>

<body>
    <%@ include file="../common/basic.jsp" %>
    <div class="wrap">
        <div class="top">
            <div class="logo" onclick="location.href='<%= contextPath %>'">우리 여행가조</div>
            <div class="top_menu">
                <ul>
                    <% if (loginUser != null || loginAdmin != null) { %>
                   		<li id="top_menu_1" onclick="location.href='<%= contextPath %>/GoMyPage.me'">My page</li>
	                    <li id="top_menu_2" onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터</li>
	                    <li id="top_menu_3">로그아웃</li>
                    <% } else { %>
	                    <li id="top_menu_4" onclick="location.href='<%= contextPath %>/GoTermsOfUse.me'">회원가입</li>
	                    <li id="top_menu_5" onclick="location.href='<%= contextPath %>/GoLogin.me'">로그인</li>
	                    <li id="top_menu_6" onclick="location.href='<%= contextPath %>/GoServiceCenter.sc'">고객센터</li>
                    <% } %>
                </ul>
            </div>
        </div>

        <div class="under">
            <div class="side_menu">
                <div id="side_menu_open_1" onclick="location.href='<%= contextPath %>'">여행 갈래?</div>
                <% if (loginAdmin == null && loginUser != null) { %>
                	<div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd?mno=<%= loginUser.getmNo() %>'" class="login">계획 짤래?</div>
                <% } else if (loginAdmin != null && loginUser == null) { %>
                	<div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoShowPlanMain'" class="login">계획 짤래?</div>
                <% } else { %>
                	<div id="side_menu_open_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'" class="login">계획 짤래?</div>
                <% } %>
                <div id="side_menu_open_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'" class="login">리뷰 볼래?</div>
                <% if (loginAdmin != null) { %>
                	<div id="side_menu_open_4" onclick="location.href='<%= contextPath %>/GoAdminMain.ad'">관리자 메뉴</div>
                <% } %>
                <div id="close_btn" onclick="side_close()"><img src="resouces/img/chevron_left_24dp_5F6368.png" alt=""></div>

                <div id="side_menu_close_1" onclick="location.href='<%= contextPath %>'" class="login">
                    <img src="resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
                    <div class="explanation">여행 갈래?</div>
                </div>
                <% if (loginAdmin == null && loginUser != null) { %>
	                <div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd?mno=<%= loginUser.getmNo() %>'" class="login">
	                    <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
	                    <div class="explanation">계획 짤래?</div>
	                </div>
                <% } else if (loginAdmin != null && loginUser == null) { %>
               		<div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoShowPlanMain'" class="login">
	                    <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
	                    <div class="explanation">계획 짤래?</div>
	                </div>
                <% } else { %>
                	<div id="side_menu_close_2" onclick="location.href='<%= contextPath %>/GoScheduleMain.sd'" class="login">
	                    <img src="resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png" alt="">
	                    <div class="explanation">계획 짤래?</div>
	                </div>
                <% } %>
                <div id="side_menu_close_3" onclick="location.href='<%= contextPath %>/GoPostMain.ps'" class="login">
                    <img src="resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
                    <div class="explanation"><button onclick="location.href='views/post/postMain.jsp'">리뷰 볼래?</button></div>
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
                    <h3>집 나가면 고생? 국내여행은 달라!</h3>
                </div>
                <!-- 집 나가면 고생? 국내여행은 달라! -->
                <div class="content_2">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper"> 
                            <div class="swiper-slide" type="button" onclick="location.href='<%= contextPath %>/GoDetailGyeongJu.gt'">
                                    <img src="resouces/img/1.경주.jpg" alt="">     
                                    <div class="cover">경주</div>
                            </div>
                            <div class="swiper-slide" type="button" onclick="location.href='<%= contextPath %>/GoDetailBusan.gt'">
                                <img src="resouces/img/2.부산.jpg" alt="">
                                <div class="cover">부산</div>
                            </div>
                            <div class="swiper-slide" type="button" onclick="location.href='<%= contextPath %>/GoDetailSeoul.gt'">
                                <img src="resouces/img/3.남산.jpg" alt="">
                                <div class="cover">서울</div>
                            </div>
                            <div class="swiper-slide" type="button" onclick="location.href='<%= contextPath %>/GoDetailJeju.gt'">
                                <img src="resouces/img/4.제주.jpg" alt="">
                                <div class="cover">제주</div>
                            </div>
                            <div class="swiper-slide" type="button" onclick="location.href='<%= contextPath %>/GoDetailGwangJu.gt'">
                                <img src="resouces/img/5.광주.jpg" alt="">
                                <div class="cover">광주</div>
                            </div>
                            <div class="swiper-slide" type="button" onclick="location.href='<%= contextPath %>/GoDetailPohang.gt'">
                                <img src="resouces/img/6.포항.jpg" alt="">
                                <div class="cover">포항</div>
                            </div>
                            <div class="swiper-slide" type="button" onclick="location.href='<%= contextPath %>/GoDetailYeosu.gt'">
                                <img src="resouces/img/7.여수.jpg" alt="">
                                <div class="cover">여수</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_3">
                    <h3>핫플레이스 정복기 🔥</h3>
                </div>
                <!-- 핫플레이스 정복기 -->
                <div class="content_4">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide" type="button" id="pop-up" onclick="location.href='<%= contextPath %>/GoPopupHush.gt'">
                                <img src="resouces/img/1. 강남허쉬.JPG" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="pop-up" onclick="location.href='<%= contextPath %>/GoPopupDaegu.gt'">
                                <img src="resouces/img/2. 대구.JPG" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="pop-up" onclick="location.href='<%= contextPath %>/GoPopupJjanggu.gt'">
                                <img src="resouces/img/3. 짱구.JPG" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="pop-up" onclick="location.href='<%= contextPath %>/GoPopupSeocheon.gt'">
                                <img src="resouces/img/4. 서천.JPG" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="pop-up" onclick="location.href='<%= contextPath %>/GoPopupHorok.gt'">
                                <img src="resouces/img/5. 호록.JPG" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="pop-up" onclick="location.href='<%= contextPath %>/GoPopupSpongebob.gt'">
                                <img src="resouces/img/6. 스폰지밥.JPG" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="pop-up" onclick="location.href='<%= contextPath %>/GoPopupPupg.gt'">
                                <img src="resouces/img/7. 펍지.JPG" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_5">
                    <h3>💸 지갑은 가볍게, 추억은 무겁게! 💸</h3>
                </div>
                <!-- 지갑은 가볍게, 추억은 무겁게! -->
                <div class="content_6">
                    <!-- Swiper -->
                    <div class="swiper mySwiper">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide" type="button" id="low-cost" onclick="location.href='<%= contextPath %>/GoCourseGangneung.gt'">
                                <img src="resouces/img/1. 강릉.jpg" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="low-cost" onclick="location.href='<%= contextPath %>/GoCourseJeju.gt'">
                                <img src="resouces/img/1. 제주.jpg" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="low-cost" onclick="location.href='<%= contextPath %>/GoCourseGyeongJu.gt'">
                                <img src="resouces/img/1. 경주.JPG" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="low-cost" onclick="location.href='<%= contextPath %>/GoCourseGanghwa.gt'">
                                <img src="resouces/img/1. 강화.jpg" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="low-cost" onclick="location.href='<%= contextPath %>/GoCourseDanyang.gt'">
                                <img src="resouces/img/1. 단양.jpg" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="low-cost" onclick="location.href='<%= contextPath %>/GoCourseBusan.gt'">
                                <img src="resouces/img/1. 부산.jpg" alt="">
                            </div>
                            <div class="swiper-slide" type="button" id="low-cost" onclick="location.href='<%= contextPath %>/GoCourseSokcho.gt'">
                                <img src="resouces/img/1. 속초.JPG" alt="">
                            </div>
                        </div>
                    </div>
                </div>

                <br><br>
            </div>
        </div>
    </div>
</body>

</html>