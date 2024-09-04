<%@page import="semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 우편번호 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resouces/css/myPageModify.css">
</head>
<body>

	<%@ include file="../common/basic.jsp"%>

	<%
	// 로그인된 사용자의 정보를 가져옴
    String userNickname = loginUser.getmNickname();
    String phone = loginUser.getmPhone();
    String email = loginUser.getmEmail();
    String postalCode = loginUser.getPostalCode(); // 새로 추가한 우편번호
    String basicAddress = loginUser.getBasicAddress(); // 새로 추가한 기본 주소
    String detailedAddress = loginUser.getDetailedAddress(); // 새로 추가한 상세 주소
	%>

	<div class="wrap">
		<div class="top">
			<div class="logo" onclick="location.href='<%=contextPath%>'">우리
				여행가조</div>
			<div class="top_menu">
				<ul>
					<li id="top_menu_1"
						onclick="location.href='<%=contextPath%>/myPage.me'">My page</li>
					<li id="top_menu_2" onclick="location.href=''">고객센터</li>
				</ul>
			</div>
		</div>

		<div class="under">
			<div class="side_menu">
				<div id="side_menu_open_1"
					onclick="location.href='../여행_갈래/여행_갈래.html'">내 정보 수정</div>
				<div id="side_menu_open_2"
					onclick="location.href='../내_여행/내_여행_일정_O.html'">내가 쓴 글</div>
				<div id="side_menu_open_3"
					onclick="location.href='../리뷰/리뷰_로그인_O.html'">내 찜 목록</div>
				<div id="close_btn" onclick="side_close()">
					<img src="../resouces/img/chevron_left_24dp_5F6368.png" alt="">
				</div>

				<div id="side_menu_close_1"
					onclick="location.href='../여행_갈래/여행_갈래.html'">
					<img src="../resouces/img/airplane_ticket_24dp_5F6368.png" alt="">
					<div class="explanation">여행 갈래?</div>
				</div>
				<div id="side_menu_close_2"
					onclick="location.href='../내_여행/내_여행_일정_O.html'">
					<img
						src="../resouces/img/edit_calendar_24dp_5F6368_FILL0_wght400_GRAD0_opsz24.png"
						alt="">
					<div class="explanation">계획 짤래?</div>
				</div>
				<div id="side_menu_close_3"
					onclick="location.href='../리뷰/리뷰_로그인_O.html'">
					<img src="../resouces/img/dynamic_feed_24dp_5F6368.png" alt="">
					<div class="explanation">리뷰 볼래?</div>
				</div>
				<div id="open_btn" onclick="side_open()">
					<img src="../resouces/img/chevron_right_24dp_5F6368.png" alt="">
				</div>
			</div>

			<div class="content">
				<div class="min_content" align="center">
					<form id="myPage-form" action="<%=contextPath%>/update.me"
						method="post" onsubmit="return validateForm();">
						<input type="hidden" name="userId" value="<%=loginUser.getmId()%>">
						<table>
							<tr>
								<!-- <th colspan="2" class="text">내 정보 수정</th> -->
							</tr>

							<tr>
								<td rowspan="4" width="250">
									<div class="min_profile-pic-img">
										<label for="imageInput"> <img
											src="default_profile.png" class="min_profile-pic"></label> <input
											type="file" name="profileImage" id="imageInput"
											accept="image/*">
									</div>
								</td>
								<td class="text height">새 비밀번호</td>
							</tr>

							<tr>
								<td><input type="password" id="input_pwd" class="height"
									name="newPwd">
									<div id="password-error" class="text-danger"
										style="color: red; font-size: 12px;"></div> <!-- 비밀번호 오류 메시지 -->
								</td>
							</tr>

							<tr>
								<td class="text height" width="500">새 비밀번호 확인</td>
							</tr>

							<tr>
								<td><input type="password" id="confirmPassword"
									class="height" name="newPwd2">
									<div id="password-confirm-error" class="text-danger"
										style="color: red; font-size: 12px;"></div></td>
							</tr>

							<tr>
								<div class="profile-btn-area"></div>
								<th rowspan="2" class="text">
							
							<tr>
							<tr>
								<td class="text height" style="text-align: left;">닉네임</td>
								<!-- 닉네임 텍스트 -->
							</tr>
							<tr>
								<td colspan="2">
									<div class="nickname-wrapper"
										style="display: flex; align-items: center;">
										<input type="text" id="min_username" value="<%=userNickname%>"
											name="newNickName"
											style="width: 150px; margin-right: 5px; padding: 5px;">
										<!-- 입력 필드 길이를 줄임 -->
										<button type="button" class="min_check-btn"
											style="width: 80px; padding: 5px;">중복확인</button> <span style="color:white;">우편번호</span>
										<!-- 중복확인 버튼의 크기를 줄임 -->
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div id="nickname-check-message"></div>
								</td>
							</tr>

							<tr>
								<td class="text height"></td>
								<td>
									<div class="zip-code-wrapper">
										<input type="text" id="postcode" name="postcode"
											placeholder="우편번호" readonly value="<%= (postalCode != null ? postalCode : "") %>" style="margin-top: -10px;">
										<button type="button" id="zip_code"
											onclick="execDaumPostcode()">우편번호 찾기</button>
									</div>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" id="address" name="address"
									placeholder="기본 주소" readonly value="<%= (basicAddress != null ? basicAddress : "") %>" ></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" id="detailAddress"
									name="detailAddress" placeholder="상세 주소"  value="<%= (detailedAddress != null ? detailedAddress : "") %>" ></td>
							</tr>

							<!-- 전화번호 필드를 오른쪽으로 배치 -->
							<tr>
								<td colspan="2" class="text height" style="padding-left: 250px;">전화번호</td>
							</tr>
							<tr>
								<td colspan="2"><input type="text" class="phone"
									name="newPhone" style="width: 100%;"
									value="<%=phone != null ? phone : ""%>"></td>
							</tr>

							<tr>
								<td class="height"></td>
								<td class="text">이메일</td>
							</tr>

							<tr>
								<td class="height"></td>
								<td id="email"><input type="text" class="email"
									name="newEmail" value="<%=email%>">
									<div class="text" id="email_t"></div> <input type="hidden"
									id="textEamil"></td>
							</tr>
						</table>

						<br> <br> <br>

						<button type="submit" onclick="return validateForm();">변경하기</button>
						<button type="submit" data-toggle="modal"
							data-target="#deleteModal" style="background-color: red;">탈퇴하기</button>
						<button type="reset" style="background-color: darkturquoise;">취소</button>
					</form>

					<script>
    function validateForm() {
        // 비밀번호, 전화번호 등의 필드가 비어 있어도 통과하도록 변경
        return true;
    }
</script>


					<script>
					function validateForm() {
				        const pwdInput = document.getElementById('input_pwd').value;
				        const pwdConfirmInput = document.getElementById('confirmPassword').value;
				        const pwdError = document.getElementById('password-error');
				        const pwdConfirmError = document.getElementById('password-confirm-error');

				        pwdError.textContent = ''; // 기존 오류 메시지 초기화
				        pwdConfirmError.textContent = ''; // 기존 오류 메시지 초기화

				        // 비밀번호 입력이 있을 경우에만 검증을 진행
				        if (pwdInput !== '' || pwdConfirmInput !== '') {
				            const pwdPattern = /^(?=.*[a-z])(?=.*\d)(?=.*[\W_])[a-z\d\W_]{8,16}$/i; // 비밀번호 패턴

				            if (!pwdPattern.test(pwdInput)) {
				                pwdError.textContent = '비밀번호는 소문자, 숫자, 특수문자를 포함한 8~16자리여야 합니다.';
				                return false;
				            }

				            if (pwdInput !== pwdConfirmInput) {
				                pwdConfirmError.textContent = '비밀번호가 일치하지 않습니다.';
				                return false;
				            }
				        }

				        return true; // 모든 검증을 통과하면 폼 제출
				    }

                    $(document).ready(function() {
                        // Check if the phone number input is null or empty
                        const phoneInput = $("input[name='newPhone']");
                        const phoneValue = phoneInput.val();

                        if (phoneValue === "null" || phoneValue === null) {
                            phoneInput.val(""); // Set it to an empty string
                        }
                    });

                    $(function(){
                        $("#select").change(function(){
                            if($("#select").val() == 'directly') {
                                $("#textEmail").attr("disabled", false);
                                $("#textEmail").val("");
                                $("#textEmail").focus();
                            } else {
                                $("#textEmail").val($("#select").val());
                            }
                        });
                    });

                 // 닉네임 중복 확인 함수
                    let isNicknameValid = false;
                    $(".min_check-btn").click(function() {
                        const nickname = $("#min_username").val();
                        if (nickname === "") {
                            alert("닉네임을 입력하세요.");
                            return;
                        }
                        $.ajax({
                            url: "<%=contextPath%>
						/checkNickname.me",
						method : "GET",
						data : {
							nickname : nickname
						},
						success : function(
								response) {
							const isDuplicate = response.isDuplicate;
							if (isDuplicate) {
								$(
										"#nickname-check-message")
										.html(
												"중복된 닉네임입니다.")
										.css(
												"color",
												"red");
								isNicknameValid = false;
							} else {
								$(
										"#nickname-check-message")
										.html(
												"사용 가능한 닉네임입니다.")
										.css(
												"color",
												"green");
								isNicknameValid = true;
							}
						},
						error : function() {
							alert("서버와의 통신 중 오류가 발생했습니다.");
						}
					});
		});

						// 폼 제출 시 닉네임 중복 확인
						$("#myPage-form").submit(function(event) {
							if (!isNicknameValid) {
								alert("닉네임 중복 확인을 먼저 해주세요.");
								event.preventDefault();
							}
						});

						
					</script>
				</div>
			</div>
		</div>
	</div>

	<script>
		const side_menu = document.getElementsByClassName('side_menu');
		const content = document.getElementsByClassName('content');

		const side_menu_open_1 = document.getElementById('side_menu_open_1');
		const side_menu_open_2 = document.getElementById('side_menu_open_2');
		const side_menu_open_3 = document.getElementById('side_menu_open_3');
		const close_btn = document.getElementById('close_btn');

		const side_menu_close_1 = document.getElementById('side_menu_close_1');
		const side_menu_close_2 = document.getElementById('side_menu_close_2');
		const side_menu_close_3 = document.getElementById('side_menu_close_3');
		const open_btn = document.getElementById('open_btn');

		function side_close() {
			side_menu[0].style.width = '2.5%';

			side_menu_open_1.style.display = 'none';
			side_menu_open_2.style.display = 'none';
			side_menu_open_3.style.display = 'none';
			close_btn.style.display = 'none';

			side_menu_close_1.style.display = 'block';
			side_menu_close_2.style.display = 'block';
			side_menu_close_3.style.display = 'block';
			open_btn.style.display = 'block';
		}

		function side_open() {
			side_menu[0].style.width = '15%';

			side_menu_open_1.style.display = 'block';
			side_menu_open_2.style.display = 'block';
			side_menu_open_3.style.display = 'block';
			close_btn.style.display = 'block';

			side_menu_close_1.style.display = 'none';
			side_menu_close_2.style.display = 'none';
			side_menu_close_3.style.display = 'none';
			open_btn.style.display = 'none';
		}
		
		function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분입니다.
	                // 예: 우편번호와 주소 정보를 해당 필드에 넣습니다.
	                document.getElementById('postcode').value = data.zonecode; // 우편번호
	                document.getElementById('address').value = data.roadAddress; // 도로명 주소
	                document.getElementById('detailAddress').focus(); // 상세 주소로 포커스 이동
	            }
	        }).open();
	    }
	</script>

</body>
</html>