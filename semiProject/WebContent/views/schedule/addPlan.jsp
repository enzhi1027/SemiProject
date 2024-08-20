<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>add_plan</title>
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
         
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

        <script defer src="resouces/js/common.js"></script>
        <script defer src="resouces/js/calendar.js"></script>
        <script defer src="resouces/js/add_plan.js"></script>
        <link rel="stylesheet" href="resouces/css/add_plan.css">
        <link rel="stylesheet" href="resouces/css/calendar.css">
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
                    <form action="<%= contextPath %>/addPlan.sd" method="post" class="inner">
                        <table>
                            <tr>
                                <td id="plan_name_t" class="white big"><div>여행명</div></td>
                                <td colspan="2"><input type="text" name="plan_title" id="plan_title"></td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <div id="search_place_t" class="white big">장소 검색</div>
                                    <div id="search_place_b">
                                        <input type="text" name="place_name" id="place_name">
                                        <button type="button" class="material-symbols-outlined" id="search_btn">search</button>
                                    </div>
                                    <div class="search_result">
                                        결과들 유동적으로 추가할 예정
                                    </div>
                                    <div id="search_place_add" class="white">장소 추가하기</div>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <div id="trip_date_t" class="white big">여행 일정</div>
                                    <div id="making_plan">
                                        <div id="calendar-container">
                                            <div id="calendar">
                                                <div id="calendar-left"></div>
                                                <div id="calendar-right"></div>
                                            </div>
                                            <div id="selected-range">총 <span id="range-info">0일</span></div>
                                            <div id="btn">
                                                <button id="prev" aria-label="Previous month" type="button" class="material-symbols-outlined">arrow_back_ios</button>
                                                <button id="today" aria-label="Go to current month" type="button">Today</button>
                                                <button id="next" aria-label="Next month" type="button" class="material-symbols-outlined">arrow_forward_ios</button>
                                            </div>
                                        </div>

                                        <input type="hidden" id="sDate" name="sDate">
                                        <input type="hidden" id="eDate" name="eDate">
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="3">
                                    <div id="explanation_t" class="white big">설명</div>
                                    <textarea name="explanation_e" id="explanation_e" style="overflow-y: auto;"></textarea>
                                </td>
                            </tr>

                            <tr class="white">
                                <td class="big" colspan="2">공개 범위 설정</td>
                                <td>
                                    <input type="radio" name="range" id="all" value="1"checked>
                                    <label for="all">전체 공개</label>

                                    <input type="radio" name="range" id="friend" value="2">
                                    <label for="friend">친구 공개</label>

                                    <input type="radio" name="range" id="me" value="3">
                                    <label for="me">나만 보기</label>
                                </td>
                            </tr>

                            <tr class="white">
                                <td class="big" colspan="2">배경 이미지</td>
                                <td>
                                    <input type="radio" name="img" id="random" value="1"checked>
                                    <label for="random">랜덤</label>

                                    <input type="radio" name="img" id="choice" value="2">
                                    <label for="choice">선택</label>
                                </td>
                            </tr>

                            <tr id="img_choice_tr">
                                <td colspan="3">
                                    <div id="img_choice_cover">
                                        <div id="img_header">
                                            <div id="basic">기본 이미지</div>
                                            <div id="computer">컴퓨터에서 가져오기</div>
                                        </div>
                                        <div id="img_content1">
                                            <div class="img">
                                                <img src="resouces/img/random/1.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/2.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/3.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/4.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/5.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/6.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/7.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/8.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/1.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/2.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/3.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/4.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/5.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/6.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/7.jpg" alt="">
                                            </div>
                                            <div class="img">
                                                <img src="resouces/img/random/8.jpg" alt="">
                                            </div>
                                        </div>

                                        <div id="img_content2">
                                            여기로 사진 드래그<br><br>
                                            - 또는 -<br><br>
                                            <input type="file" name="userImg" id="userImg">
                                            <label for="userImg" id="userImgBtn">컴퓨터에서 가져오기</label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>

                        <br><br>

                        <input type="submit" value="일정 추가 완료하기" id="add_done_plan" class="white">
                    </form>

                    <br><br>

                    <div id="cover"></div>
                </div>
            </div>
            
            <form action="" id="place_add">
                <span id="cancle" class="material-symbols-outlined">close</span>
                <table id="place_add_table">
                    <tr>
                        <th>장소명</th>
                        <td><input type="text"></td>
                    </tr>

                    <tr>
                        <th>주소</th>
                        <td><input type="text"></td>
                    </tr>

                    <tr id="clock">
                        <th>운영시간</th>
                        <td>
                        </td>
                    </tr>

                    <tr>
                        <th>장소 설명</th>
                        <td></td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <textarea name="explanation_p" id="explanation_p" style="overflow: auto;"></textarea>
                            <div id="count">0/1000</div>
                        </td>
                    </tr>
                    
                    <input type="submit" value="장소 추가 완료하기" id="add_done_place">
                </table>
            </form>
        </div>
    </body>
</html>