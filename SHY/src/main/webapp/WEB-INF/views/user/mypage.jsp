<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="stylesheet" href="../resources/css/mypage.css">
<title>마이페이지</title>
</head>
<body>
	<header id="header">
		<%@ include file="../include/header.jsp"%>
	</header>
	<div class="mypage">
		<form action="<c:url value='/user/updateUser' />" method="post"
			id="updateForm">
			<div class="mypage_form">
				<h2>마이페이지</h2>
				<div class="insert">
					<!--이름-->
					<div class="name_box">
						&nbsp;&nbsp;
						<p>이름</p>
						<input class="name" name="userName" value="${userInfo.userName}"
							readonly><br>
					</div>
					<!--아이디-->
					<div class="id_box">
						&nbsp;&nbsp;
						<p>아이디</p>
						<input class="id" name="userId" id="userId"
							value="${userInfo.userId}" readonly><br>
						<!-- <span class="check" id="id_check"></span><br> -->
					</div>
					<!--비밀번호-->
					<div class="pw_box">
						*
						<p>비밀번호</p>
						<input type="password" name="userPw" id="userPw" class="pw"
							placeholder="영문자 숫자 기호 포함 8자 이상"> <span
							class="check pw_check" id="pw_check_span"></span><br> *
						<p>비밀번호 확인</p>
						<input type="password" name="pw_check" id="pw_check"><br>
					</div>
					<!--전화번호-->
					<div class="tel_box">
						*
						<p>휴대폰번호</p>
						<input type="tel" name="userPh" id="userPh" maxlength="13"
							value="${userInfo.userPh}" placeholder="숫자만 입력해주세요"><br>
					</div>
					<!--주소-->
					<div class="addr_box">
						&nbsp;
						<p>*주소</p>
						<input type="text" name="userAdr1" class="addr_num" id="userAdr1" placeholder="우편번호" value="${userInfo.userAdr1}" readonly>
						<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기" class="findaddr my_button"><br>
						<input type="text" class="addr addr1" name="userAdr2" id="userAdr2" value="${userInfo.userAdr2}" readonly><br> 
						<input type="text" class="addr addr2" name="userAdr3" id="userAdr3" value="${userInfo.userAdr3}" readonly> 
						<input type="text" class="addr addr2" name="userAdr4" id="userAdr4" placeholder="상세주소" value="${userInfo.userAdr4}">
					</div>
					<!--현재 상태 구분-->
					<div class="job_box">
						&nbsp;
						<p>*현재 상태</p>
						<div class="job_check">
							<div class="job_radio" id="job_radio">
								<input type="radio" name="userStatus" id="userStatus" value="0" <c:if test="${userInfo.userStatus eq '0'}">checked</c:if>>
								<p class="job">취업준비생</p>
								<input type="radio" name="userStatus" id="userStatus" value="1" <c:if test="${userInfo.userStatus eq '1'}">checked</c:if>>
								<p class="job">재직자</p>
								<br>
							</div>
						</div>
					</div>

					<div class="btn">
						<button type="button" class="cancel" onclick="location.href='<c:url value='/'/>'" >취소</button>
						<button type="button" class="mod_sub custom-btn">수정</button>
						<button type="button" class="delete">삭제</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<footer id="footer">
		<%@ include file="../include/footer.jsp"%>
	</footer>
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//주소찾기
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {

				var addr = '';
				var extraAddr = '';

				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}

				if (data.userSelectedType === 'R') {
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					document.getElementById("userAdr3").value = extraAddr;

				} else {
					document.getElementById("userAdr3").value = '';
				}

				document.getElementById('userAdr1').value = data.zonecode;
				document.getElementById("userAdr2").value = addr;
				document.getElementById("userAdr4").focus();
			}
		}).open();
	}//주소찾기 끝

	//비밀번호 정규식
	const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);

	//수정버튼을 클릭했을 때
	$('.mod_sub')
			.click(
					function() {
						if ($('#userPw').val() === '') {
							alert('비밀번호란을 입력하세요.');
							$('#userPw').focus();
							return;
						} else if (!getPwCheck.test($('#userPw').val())) {
							alert('비밀번호 양식에 맞춰주세요');
							$('#pw_check_span').html('<b style="font-size:14px; color:red;">[특수문자 포함 8자 이상]</b>');
							$('#userPw').focus();
							return;
						} else if ($('#userPw').val() !== $('#pw_check').val()) {
							alert('비밀번호가 일치하지 않습니다');
							$('#pw_check').focus();
							return;
						} else if ($('#userPh').val() === '') {
							alert('전화번호는 필수입니다');
							$('#userPh').focus();
							return;
						} else if ($('.addr_num').val() === '') {
							alert('주소입력은 필수입니다');
							return;
						} else {
							if (confirm('수정하시겠습니까?')) {
								$('#updateForm').submit();
								alert('수정이 완료됐습니다.')
							} else
								return;
						}
					}); // 수정 버튼 이벤트 끝

	//삭제버튼 눌렀을 때   
	$('.delete')
			.click(
					function() {
						var inputPass1 = prompt("비밀번호를 입력해주세요.");

						if (inputPass1 != null) {
							var trimPass1 = inputPass1.trim();

							if (trimPass1 != "" && trimPass1 != undefined) {
								var inputPass2 = prompt("비밀번호를 다시 입력해주세요.");
								var trimPass2 = inputPass2.trim();

								if (trimPass1 == trimPass2) {

									var userId = $("#userId").val();
									var param = {
										"userId" : userId,
										"userPw" : trimPass1
									}

									$
											.ajax({
												type : "POST",
												url : "<c:url value='/user/deleteUser' />",
												contentType : "application/json",
												data : JSON.stringify(param),
												success : function(data) {
													if ("true" == data) {
														alert("탈퇴가 처리되었습니다.");
														location.href = "<c:url value='/user/logout' />"
													} else if ("false" == data) {
														alert("비밀번호가 일치하지 않습니다.")
													} else {
														alert(data);
													}
												},
												error : function(jqXHR,
														textStatus, errorThrown) {
													alert("ERROR : "
															+ textStatus
															+ " : "
															+ errorThrown);
												}
											})
								} else
									alert("비밀번호가 일치하지 않습니다.");
							} else {
								alert("비밀번호를 제대로 입력해주세요.");
							}
						}
					});

	//전화번호 '-' 붙이기 
	var autoHypenPhone = function(str) {
		str = str.replace(/[^0-9]/g, '');
		var tmp = '';
		if (str.length < 4) {
			return str;
		} else if (str.length < 7) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
		} else if (str.length < 11) {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
		} else {
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
		}
		return str;
	}

	var phoneNum = document.getElementById('userPh');

	phoneNum.onkeyup = function() {
		console.log(this.value);
		this.value = autoHypenPhone(this.value);
	}//전화번호 입력 끝
	
	//현재 상태 체크
	window.onload = function(){
	 	 document.querySelector("#job_radio input[value='${userInfo.userStatus}']").setAttribute('checked' , true);
	}

	
	
	
	
	
	
	
	
</script>
</html>