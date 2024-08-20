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
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap" rel="stylesheet">

        <!-- lodash cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- GSAP cdn -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
        <!-- GSAP ScrollToPlugin -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollToPlugin.min.js" integrity="sha512-1PKqXBz2ju2JcAerHKL0ldg0PT/1vr3LghYAtc59+9xy8e19QEtaNUyt1gprouyWnpOPqNJjL4gXMRMEpHYyLQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- SWIPER -->
        <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
        <script defer src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>

        <!-- Scroll Magic -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <script defer src="resouces/js/common.js"></script>
        <script defer src="resouces/js/add_detail.js"></script>
        <link rel="stylesheet" href="resouces/css/add_detail.css">
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
                    <div class="detail">
                        <div class="date_div">
                            <div class="date">24.07.10</div>
                            <div class="open_btn material-symbols-outlined">keyboard_arrow_down</div>
                            <div class="close_btn material-symbols-outlined">keyboard_arrow_up</div>
                        </div>
                        <div class="plan">
                            <div class="timeline">
                                <div class="circle1 material-symbols-outlined">circle</div>
                                <div class="bar"></div>
                                <div class="circle2 material-symbols-outlined">add_circle</div>
                            </div>
                            <div class="detail_plan">
                                <div class="plan_content">첫번째 일정임</div>
                                <div class="plan_content">두번째 일정임</div>
                                <div class="plan_content">세번째 일정임</div>
                                <div class="plan_content">네번째 일정임</div>
                            </div>
                        </div>

                        <div class="map">
                            <img src="resouces/img/maptest.png" alt="">
                        </div>
                    </div>

                    <div class="detail">
                        <div class="date_div">
                            <div class="date">24.07.11</div>
                            <div class="open_btn material-symbols-outlined">keyboard_arrow_down</div>
                            <div class="close_btn material-symbols-outlined">keyboard_arrow_up</div>
                        </div>
                        <div class="plan">
                            <div class="timeline">
                                <div class="circle1 material-symbols-outlined">circle</div>
                                <div class="bar"></div>
                                <div class="circle2 material-symbols-outlined">add_circle</div>
                            </div>
                            <div class="detail_plan">
                                <div class="plan_content">첫번째 일정임</div>
                                <div class="plan_content">두번째 일정임</div>
                                <div class="plan_content">세번째 일정임</div>
                                <div class="plan_content">네번째 일정임</div>
                            </div>
                        </div>

                        <div class="map">
                            <img src="resouces/img/maptest.png" alt="">
                        </div>
                    </div>

                    <div class="detail">
                        <div class="date_div">
                            <div class="date">24.07.12</div>
                            <div class="open_btn material-symbols-outlined">keyboard_arrow_down</div>
                            <div class="close_btn material-symbols-outlined">keyboard_arrow_up</div>
                        </div>
                        <div class="plan">
                            <div class="timeline">
                                <div class="circle1 material-symbols-outlined">circle</div>
                                <div class="bar"></div>
                                <div class="circle2 material-symbols-outlined">add_circle</div>
                            </div>
                            <div class="detail_plan">
                                <div class="plan_content">첫번째 일정임</div>
                                <div class="plan_content">두번째 일정임</div>
                                <div class="plan_content">세번째 일정임</div>
                                <div class="plan_content">네번째 일정임</div>
                            </div>
                        </div>

                        <div class="map">
                            <img src="resouces/img/maptest.png" alt="">
                        </div>
                    </div>

                    <div class="detail">
                        <div class="date_div">
                            <div class="date">24.07.13</div>
                            <div class="open_btn material-symbols-outlined">keyboard_arrow_down</div>
                            <div class="close_btn material-symbols-outlined">keyboard_arrow_up</div>
                        </div>
                        <div class="plan">
                            <div class="timeline">
                                <div class="circle1 material-symbols-outlined">circle</div>
                                <div class="bar"></div>
                                <div class="circle2 material-symbols-outlined">add_circle</div>
                            </div>
                            <div class="detail_plan">
                                <div class="plan_content">첫번째 일정임</div>
                                <div class="plan_content">두번째 일정임</div>
                                <div class="plan_content">세번째 일정임</div>
                                <div class="plan_content">네번째 일정임</div>
                            </div>
                        </div>

                        <div class="map">
                            <img src="resouces/img/maptest.png" alt="">
                        </div>
                    </div>
                </div>

                <div id="add_detail">
                    <span id="cancle" class="material-symbols-outlined" style="position: absolute; right: 10px; cursor: pointer;">close</span>
                    <table>
                        <tr>
                            <td class="detail_title">장소 검색</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div id="search">
                                    <input type="text">
                                    <div class="material-symbols-outlined" id="search-icon">search</div>
                                </div>
                                <div></div>
                                <div></div>
                                <div>장소 추가하기</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="detail_title">날짜</td>
                            <td>+ 클릭한 날로 기본 설정 but 변경 가능</td>
                        </tr>
                        <tr>
                            <td class="detail_title">시간 설정</td>
                            <td>시계 넣을 거임</td>
                        </tr>
                        <tr>
                            <td class="detail_title">기타 사항</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <textarea name="" id="" style="resize: none;"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>