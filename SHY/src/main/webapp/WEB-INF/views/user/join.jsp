<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="../resources/css/join.css">
    <title>회원가입</title>
    
</head>

<body>
    <!--header-->
    <header id="header">
  <%@ include file="../include/header.jsp" %>
    </header>
    <!--section-->
    <div class="join">
        <form action="<c:url value='/user/join' />" method="post" id="joinForm">
            <div class="join_form clearfix">
                <h2>회원가입</h2>
                <p class="star" style="width: 150px;">*은 필수입력입니다</p><br>
                <div class="insert">
                    <!--이름-->
                    <div class="name_box">
                        * <p>이름</p> <input type="text" name="userName" id="name" maxlength="10" autocomplete="off"><br>
                        <span class="check" id="name_check"></span>
                    </div>
                    <!--아이디-->
                    <div class="id_box">
                        * <p>아이디</p> <input type="text" name="userId" id="id" placeholder="영문자 포함 4~14자" autocomplete="off">
                        <button type="button" class="id_chk my_button">중복확인</button>
                        <span class="check id_check" id="id_check" style="font-size=12"></span><br>
                    </div>
                    <!--비밀번호-->
                    <div class="pw_box">
                        * <p>비밀번호</p> <input type="password" name="userPw" id="pw" placeholder="영문자 숫자 기호 포함 8자 이상">
                        <span class="check pw_check" id="pw_check_alarm"></span><br>
                        * <p>비밀번호 확인</p> <input type="password" name="pw_check" id="pw_check"><br>
                    </div>
                    <!--전화번호-->
                    <div class="tel_box">
                        * <p>휴대폰번호</p> <input type="tel" name="userPh" id="phone" maxlength="13" placeholder="숫자만 입력해 주세요"><br>
                    </div>
                    <!--주소-->
                    
                    <div class="addr_box">
                        &nbsp; <p>*주소</p> <input type="text" name="userAdr1" class="addr_num" readonly id="sample6_postcode" placeholder="우편번호"> 
                        <input type="button" onclick="sample6_execDaumPostcode()"  value="주소 찾기" class="findaddr my_button"><br>
                        <input type="text" class="addr addr1" name="userAdr2" id="sample6_address" readonly ><br>
                        <input type="text" class="addr addr2" name="userAdr3" id="sample6_extraAddress" readonly>
                        <input type="text" class="addr addr2" name="userAdr4" id="sample6_detailAddress" placeholder="상세주소">
                    </div>
                    <!--현재 상태 구분-->
                    <div class="job_box">
                        &nbsp;*<p>현재 상태</p>
                        <div class="job_check">
                            <div class="job_radio">
                                <input type="radio" name="userStatus" value="0"><p class="job">취업준비생</p>
                                <input type="radio" name="userStatus" value="1"><p class="job">재직자</p><br>
                            </div>
                            <div class="company">
                                직장명 <input type="text" name="userCompany" placeholder="재직자일 경우" readonly>
                            </div>
                        </div>
                    </div>
                    <!--이메일 인증-->
                    <div class="email_box">
                        <p class="me">* 본인확인</p><br>
                        &nbsp;&nbsp;<p>이메일</p><input type="email" id="email1" name="userEmail">@<input type="text" id="self_email" name="userEmail" placeholder="직접입력" >
                        <select name="" id="detail_email">
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="nate.com">nate.com</option>
                        </select>
                        <button type="button" class="my_button" id="email_check">인증번호 전송</button><br>
                        &nbsp;&nbsp;<p>인증번호</p> <input type="text" id="email_chk">
                        <button type="button" class="my_button" id="email_submit">확인</button><br>
                    </div>
                    <div class="btn">
                        <button type="button" class="cancel">취소</button>
                        <button type="button" class="join_sub">회원가입</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!--section end-->    
    <!--footer-->
     <footer id="footer">
       <%@ include file="../include/footer.jsp" %>
    </footer>
    
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   

    //주소찾기
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var addr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }//주소 찾기 끝

    //이름 공백 없애기
    $('#name').focusout(function(){
        const name = $('#name').val().replace(/ /gi, '');
        $('#name').val(name);
    })

    //id, pw 정규표현식
    const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
	const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	
	
	//아이디 중복 확인
    	let clicked = 0;
    $('.id_chk').click(function(){
    	clicked++;
    	if($('#id').val() === '') {
    		alert('아이디를 입력해주세요');
    		return;
    	}
    	const id = $('#id').val();
    	
		$.ajax({
			type : "POST",
			url : "<c:url value='/user/idCheck' />", 
			contentType : "application/json",
			data : id,
			success : function(result) {
				console.log('통신 성공' + result);
				if(result === 'duplicated') {
					alert('중복된 아이디입니다');
					return;
				}else {
					alert('사용 가능한 아이디입니다');
					$('#id').attr('readonly', 'true');
				}
			},
			error : function() {
				alert('통신 실패');
			}
		});//아이디 중복 체크 비동기 통신 끝
    });//아이디 중복 확인 끝
    
  //이메일 인증번호 전송
  	let code = '';
	$('#email_check').click(function() {
		const email = $('#email1').val()+ '@' + $('#self_email').val();
		console.log('이메일: ' + email);
		const checkInput = $('#email_chk'); //인증번호 입력
		
		$.ajax({
			type : 'GET',
			url : '<c:url value="/user/mailCheck?email=" />' + email,
			success: function(data) {
				console.log('인증번호: ' + data);
				checkInput.attr('disabled', false);
				code = data;
				alert('인증번호가 전송되었습니다');
			}
		});//end ajax 이메일
		
	}); //이메일 인증번호 끝
	
	
	//인증번호 비교
	$('#email_submit').click(function() {
		const inputCode = $('#email_chk').val();
		
		if(inputCode === code) {
			$('#email_check').attr('disabled',true);
			$('#email1').attr('readonly',true);
			$('#self_email').attr('readonly',true);
			$('#detail_email').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	        $('#detail_email').attr('onChange', 'this.selectedIndex = this.initialSelect');
			alert('인증번호가 일치합니다');
			return;
		} else {
			alert('인증번호가 일치하지 않습니다');
			return;
		}
	});
    
    

    //회원가입 버튼 클릭 이벤트
    $('.join_sub').click(function(){
    	console.log($('.addr1').val(), $('.addr2').val());
        if($('#name').val() === ''){
            alert('이름은 필수입니다');
            $('#name').focus();
            return;
        }
        //아이디
        else if($('#id').val() === ''){
            alert('아이디는 필수입니다');
            $('#id').focus();
            return;
        }
        
        //아이디 중복확인 클릭 여부
        else if(clicked <= 0) {
        	alert('아이디 중복확인은 필수입니다');
        	return;
        }
        //비밀번호
        else if($('#pw').val() === ''){
            alert('비밀번호는 필수입니다');
            $('#pw').focus();
            return;
        }
        
        //비밀번호 확인
        else if($('#pw_check').val() === ''){
            alert('비밀번호 확인은 필수입니다');
            $('#pw_check').focus();
            return;
        }
        
        else if($('#pw_check').val() !== $('#pw').val()){
            alert('비밀번호가 일치하지 않습니다');
            $('#pw_check').focus();
            return;
        }
        //전화번호
        else if($('#phone').val() === ''){
            alert('전화번호는 필수입니다');
            $('#phone').focus();
            return;
        }
        //주소
        else if($('.addr_num').val() === ''){
            alert('주소입력은 필수입니다');
            // $('.addr_box').focus();
            return
        }
        //현재 상태 체크 여부
        else if(!$('input:radio[name=userStatus]').is(':checked')){
            alert('현재 상태를 체크해주세요');
            return;
        }
        //인증 확인
        else if($('#email_chk').val() === ''){
            alert('이메일 인증번호를 입력해주세요');
            $('#email_chk').focus();
            return;
        }
        else {
            $('#joinForm').submit();
            alert('회원가입이 완료되었습니다');
        }
    });//회원가입 버튼 클릭 이벤트 끝
    
    
  	//아이디 검증
  	$('#id').keyup(function(){
  		if(!getIdCheck.test($('#id').val())){
  	        // $('#pw_check').css('display', 'block');
  	        $('#id_check').html('<b style="font-size:14px; color:red;">[영문자 포함 4~14자]</b>');
  	        $('#id').focus();
  	    }
  		else {
  			$('#id_check').html('');
  		}
  	});
  	
  	//비밀번호 검증
  	$('#pw').keyup(function(){
  		if(!getPwCheck.test($('#pw').val())){
  	        // $('#pw_check').css('display', 'block');
  	        $('#pw_check_alarm').html('<b style="font-size:14px; color:red;">[특수기호 포함 8자 이상]</b>');
  	        $('#pw').focus();
  	    }
  		else {
  			$('#pw_check_alarm').html('');
  		}
  	});
  	
  	
    
    //전화번호 '-' 붙이기 
    var autoHypenPhone = function(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }


var phoneNum = document.getElementById('phone');

phoneNum.onkeyup = function(){
    console.log(this.value);
    this.value = autoHypenPhone( this.value ) ;  
}//전화번호 입력 끝

//이메일 입력
$('#detail_email').change(function(){
    $('#self_email').val($('#detail_email').val());
});//이메일 입력 끝

//라디오 체크시 직장명 활성화 여부
$(document).ready(function(){
    $("input:radio[name=userStatus]").click(function(){

    if($("input[name=userStatus]:checked").val() === "1"){
        $("input:text[name=userCompany]").attr("readonly",false);
        // radio 버튼의 value 값이 1이라면 활성화

    }else if($("input[name=userStatus]:checked").val() === "0"){
        $("input:text[name=userCompany]").attr("readonly",true);
        // radio 버튼의 value 값이 0이라면 비활성화
    }
    });
});

$('.cancel').click(function(){
	history.back();
})



</script>
</html>