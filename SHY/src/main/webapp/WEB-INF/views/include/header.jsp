<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
    
    <title>Document</title>
</head>

<style>
/*  폰트 적용 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap');
html {
    font-family: "Noto Sans KR", sans-serif;
}

/* 노말라이즈 */
body, ul, li, h1 {
    margin:0;
    padding:0;
    list-style:none;
}

a {
    color:inherit;
    text-decoration:none;
}

/* 라이브러리 */
.con {
    margin:0 auto;
}

.img-box > img {
    width:100%;
    display:block;
}

.row::after {
    content:"";
    display:block;
    clear:both;
}

.cell {
    float:left;
    box-sizing:border-box;
}

.cell-right {
    float:right;
    box-sizing:border-box;
}

.margin-0-auto {
    margin:0 auto;
}

.block {
    display:block;
}

.inline-block {
    display:inline-block;
}

.text-align-center {
    text-align:center;
}

.line-height-0-ch-only {
    line-height:0;
}

.line-height-0-ch-only > * {
    line-height:normal;
}

.relative {
    position:relative;
}

.absolute-left {
    position:absolute;
    left:0;
}

.absolute-right {
    position:absolute;
    right:0;
}

.absolute-middle {
    position:absolute;
    top:50%;
    transform:translateY(-50%);
}

.width-100p {
    width:100%;
}

.table {
    display:table;
}

.table-cell {
    display:table-cell;
}

.vertical-align-top {
    vertical-align:top;
}

.vertical-align-middle {
    vertical-align:middle;
}

.vertical-align-bottom {
    vertical-align:bottom;
}

/* 커스텀 */

.con {
    width:1180px;
}

.con-min-width {
    min-width:1180px;
}

/* 반응형 레이아웃 */
/*
.con {
    max-width:1150px;
}

.con-min-width {
    min-width:320px;
}

html, body {
    overflow-x:hidden;
}
*/

.navbar{
    display: flex;
    justify-content: space-between;
    position: relative;
}




header {	
	background:-webkit-linear-gradient(rgba(255,255,255,1) 50px,rgba(255,255,255,0.2) 50px);
	transition: 0.4s ease-in;
	height:50px;

}

.header li {
    width: 80px;
}
.header ul {
    width: 100px;
}


nav {width:1200px; margin:0 auto; font-size: 17px; height: 60px;} 
nav > ul > li {float:left; line-height:50px; margin-right:40px; position: relative; font-weight: bold; }
nav > ul > li ul{ width:1400%; opacity:0; position: absolute; transition:0.3s 0.2s; }
nav > ul > li ul li{white-space:nowrap;}

nav > ul > li:hover ul{opacity:1; }

/* .logo {
    float:left; line-height:50px; margin-right:40px; position: relative;
    color: #8947e9;
    font-weight: bold;
} */


/* 로고  */
.container { 
  font-family: 'Dosis', sans-serif;
  font-weight: 300;
  height: 100vh;
  color: #111;
  margin-top: 7px;
  text-shadow: 2px 2px grey;

}

.logo { font-size: 20px; }

.mark { 
  border-bottom: 4px solid #111; 
  width: 2rem;
  position: absolute;
  top: 1rem;
  left: 0.25rem;
  transform: translate3d(0, 0, 0);
  animation: mark-anim 8s infinite cubic-bezier(0.55, 0, 0.1, 1);
}

.r,
.e1,
.s1,
.s2,
.e2 { will-change: margin-left, margin-right; }

.r { 
  margin-left: 0.25rem;
  margin-right: 0.25rem;
  animation: r-anim 10s infinite cubic-bezier(0.55, 0, 0.1, 1);
}

.e1 {
  margin-left: 0.5rem;
  margin-right: 0.5rem;
  animation: e1-anim 10s infinite cubic-bezier(0.55, 0, 0.1, 1);
}

.s1 { 
  margin-left: 1rem;
  margin-right: 1rem; 
  animation: s1-anim 10s infinite cubic-bezier(0.55, 0, 0.1, 1);
}

.s2 { 
  margin-left: 1rem;
  margin-right: 1rem;
  animation: s2-anim 10s infinite cubic-bezier(0.55, 0, 0.1, 1);
}

.e2 { 
  margin-left: 2rem;
  margin-right: 3rem;
  animation: e2-anim 10s infinite cubic-bezier(0.55, 0, 0.1, 1);
}


@keyframes mark-anim {
  0%, 25%, 100% { 
    left: 1.5%;
  }
  50%, 75%  {
    left: 92%;
  }
}


@keyframes r-anim {
  0%, 25%, 100% { 
    margin-left: 0.25rem;
    margin-right: 0.25rem;
  }
  50%, 75%  {
    margin-left: 3rem;
    margin-right: 2rem;
  }
}

@keyframes e1-anim {
  0%, 25%, 100% { 
    margin-left: 0.5rem;
    margin-right: 0.5rem;
  }
  50%, 75%  {
    margin-left: 1rem;
    margin-right: 1rem; 
  }
}

@keyframes s1-anim {
  0%, 25%, 100% { 
    margin-left: 1rem;
    margin-right: 1rem; 
  }
  50%, 75%  {
    margin-left: 1rem;
    margin-right: 1rem;  
  }
}

@keyframes s2-anim {
  0%, 25%, 100% { 
    margin-left: 1rem;
    margin-right: 2rem; 
  }
  50%, 75%  {
    margin-left: 0.5rem;
    margin-right: 0.5rem;
  }
}

@keyframes e2-anim {
  0%, 25%, 100%   { 
    margin-left: 2rem;
    margin-right: 3rem;
  }
  50%, 75% {
    margin-left: 0.25rem;
    margin-right: 0.25rem;
  }
}









.login{
    float:left; line-height:50px; margin-right:40px; position: relative;
    font-weight: bold;
}

/* 로그인 모달 */
.modal { 
    position: absolute; 
    top: 0; 
    left: 0; 
    width: 100%; 
    height: 100%; 
    display: none; 
    background-color: rgba(0, 0, 0, 0.4);
    z-index: 1;
}

.modal2{
    position: absolute; 
    top: 0; 
    left: 0; 
    width: 100%; 
    height: 100%; 
    display: none; 
    background-color: rgba(0, 0, 0, 0.4);
    z-index: 1;
}
.modal_body2{
    margin: 0 auto;
    position: absolute;
    top: 30px;
    left: 50%;
    transform: translate(-50%, 0%);
    z-index: 1;
    
}
.pw_find_form{
    width: 300px;
    background-color: #EEEFF1;
    margin-right: auto;
    margin-left: auto;
    margin-top: 30px;
    padding: 20px;
    text-align: center;
    border: none;
}

* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
}
 
 
.login-form {
    width: 300px;
    background-color: #EEEFF1;
    margin-right: auto;
    margin-left: auto;
    margin-top: 50px;
    padding: 20px;
    text-align: center;
    border: none;
    
}

.pw_find_form{
    width: 300px;
    background-color: #EEEFF1;
    margin-right: auto;
    margin-left: auto;
    margin-top: 30px;
    padding: 20px;
    text-align: center;
    border: none;
}

.text-field {
      font-size: 14px;
      padding: 10px;
      border: none;
      width: 260px;
      margin-bottom: 10px;
 
}


 
.submit-btn {
  font-size: 14px;
  border: none;
  padding: 10px;
  width: 260px;
  background-color: #1BBC9B;
  margin-bottom: 5px;
  color: white;
  border-radius: 5px;
}
 

/* 인증번호 확인 모달*/
.pw_check_form_modal{
    position: absolute; 
    top: 0; 
    left: 0; 
    width: 100%; 
    height: 100%; 
    display: none; 
    background-color: rgba(0, 0, 0, 0.4);
    z-index: 1;
}
.modal_body3{
    margin: 0 auto;
    position: absolute;
    top: 30px;
    left: 50%;
    transform: translate(-50%, 0%);
    z-index: 1;
    
}
.pw_check_form{
    width: 300px;
    background-color: #EEEFF1;
    margin-right: auto;
    margin-left: auto;
    margin-top: 30px;
    padding: 20px;
    text-align: center;
    border: none;
}

/* 새 비밀번호를 받을 모달 */

.new_pw_modal{
    position: absolute; 
    top: 0; 
    left: 0; 
    width: 100%; 
    height: 100%; 
    display: none; 
    background-color: rgba(0, 0, 0, 0.4);
    z-index: 1;
}

.modal_body4{
    margin: 0 auto;
    position: absolute;
    top: 30px;
    left: 50%;
    transform: translate(-50%, 0%);
    z-index: 1;
    
}
.new_pw_form{
    width: 300px;
    background-color: #EEEFF1;
    margin-right: auto;
    margin-left: auto;
    margin-top: 30px;
    padding: 20px;
    text-align: center;
    border: none;
}
.links {
    text-align: center;
}
 
.links a {
  font-size: 12px;
  color: #9B9B9B;
}

.header > li > ul :hover {
    color: #8947e9;
}

.login:hover{
    color : #8947e9;
}


</style>


  
  
<body>


    <header>
        <nav class="navbar">

            
            <div class="container flex flex-center">
                <div class="logo center mx-auto relative">
                <div class="mark"></div>
                <span class="p">J</span><!-- 
            --><span class="r">O</span><!-- 
            --><span class="e1">B</span><!-- 
            --><span class="s1">J</span><!-- 
            --><span class="s2">O</span><!-- 
            --><span class="e2">B</span><!-- 
            --><span class="d">!</span>
                </div>
            </div>

            <ul class="clearfix header">
                <li class="manu">국내취업
                    <ul>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=1'/>">사기업</a></li>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=2'/>">공기업</a></li>
                    </ul>
                </li>
                <li>해외취업
                    <ul class="manu">
                        <li> <a href="<c:url value='/board/JBoardList?board_type=3'/>">아시아</a></li>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=4'/>">유럽</a></li>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=5'/>">남미</a></li>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=6'/>">북미</a></li>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=7'/>">아프리카</a></li>
                    </ul>
                </li>
                <li class="manu">자격증
                    <ul>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=8'/>">국가자격증</a></li>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=9'/>">민간자격증</a></li>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=10'/>">어학</a></li>
                    </ul>
                </li class="manu">
                <li>왁자지껄
                    <ul>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=11'/>">자유게시판</a></li>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=12'/>">취뽀 게시판</a></li>
                    </ul>
                </li class="manu study">
                <li>스터디
                    <ul>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=13'/>">취업</a></li>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=14'/>">자격증</a></li>
                        <li> <a href="<c:url value='/board/JBoardList?board_type=1 5'/>">자소서</a></li>
                    </ul>
                </li>
    
            </ul>

        <div class="login">
            <span> <a class="login_modal_btn" href="#">로그인</a></span>
        </div>
        </nav>

    </header>





    <!-- 모달 -->

    <div class="modal">
        <div class="modal_body">

            <div class="login-form">
                <form method="post" class="loginForm"> 
                    <input type="text" name="id" class="text-field id" placeholder="아이디">
                    <input type="password" name="password" class="text-field password" placeholder="비밀번호">
                    <input type="button" value="Login" class="submit-btn login_btn submit">
                    <input type="button" value="Close" class="submit-btn modal_end_btn ">
                </form>
                <div class="links">
                <a href="#">회원가입</a>&nbsp;&nbsp;
                <a href="#" class="pw_find_modal_btn">비밀번호 찾기</a>
                </div>
            </div>
        </div>

    </div>
    

    <!-- 패스워드 찾기 모달 -->

    <div class="modal2">
        <div class="modal_body2">
            <div class="pw_find_form">
                <form method="post" class="passwordFind">
                    <input type="text" name="id" class="pwFind_id text-field" placeholder="아이디">
                    <input type="text" name="email"  class="email text-field" placeholder="이메일">
                    <input type="button" value="비밀번호 찾기" class="submit-btn pw_check submit">
                    <input type="button" value="Close" class="submit-btn modal_end_btn ">

                </form>

        </div>

    </div>

    <!-- 인증번호 모달 -->
    
    <div class="pw_check_form_modal">
        <div class="modal_body3">
            <div class="pw_check_form">
                <form>
                    <input type="text" name="check_pw_num"  class="check_num text-field" placeholder="인증번호">
                    <input type="button" value="Check" class="submit-btn Check submit">
                    <input type="button" value="Close" class="submit-btn modal_end_btn ">
                </form>

        </div>

    </div>


    <!-- 새로운 비밀번호를 받을 모달 -->

    <div class="new_pw_modal">
        <div class="modal_body4">
            <div class="new_pw_form">
                <form method="post" class="newPw_form">
                    <input type="text" name="new_pw" class="new_pw text-field" placeholder="새로운 비밀번호 입력">
                    <input type="text" name="new_pw" class="new_pw_ck text-field" placeholder="비밀번호 확인">
                    <input type="button" value="Check" class="submit-btn new_pw_btn submit">
                    <input type="button" value="Close" class="submit-btn modal_end_btn ">
                </form>

        </div>

    </div>
  
</body>
<script>
    $(function(){
var $firstmenu = $('nav > ul > li'),
   $header = $('header');
$firstmenu.mouseenter(function(){
   $header.stop().animate({height:'300px'},200);
})
.mouseleave(function(){
    $header.stop().animate({height:'50px'},200);
})


});

// 모달 스크립트 
// 나중에 submit이나 ajax로 데이터 베이스 접속해서 서로 비교할것!!
// 로그인 모달 
$(function(){
    $('.login_modal_btn').click(function(){
        $('.modal').show(500);
    }); // open modal end
    $('.modal_end_btn').click(function(){
        $('.modal').fadeOut();
    });

    // 메인 로그인 페이지 빈값확인
    $('.login_btn').click(function(){
        if($('.id').val() === ''){
            alert('아이디를 입력하세요.');
            $('.id').focus();
            return;
        } else if($('.password').val() === ''){
            alert('비밀번호를 입력하세요.');
            $('.password').focus();
            return;
        } else {
            //$('.loginForm').submit(); //ajax로 추후 처리 예정
            $('.id').val() =='';
        }
});

// 비밀번호 찾기 모달
$('.pw_find_modal_btn').click(function(){
    $('.modal').hide();
    $('.modal2').show(500);

});
$('.modal_end_btn').click(function(){
    $('.modal2').fadeOut();
});

// 비밀번호 찾기 모달 빈값 확인
$('.pw_check').click(function(){
    if($('.pwFind_id').val() === ''){
        alert('아이디를 입력하세요.');
        $('.pwFind_id').focus();
        return;
    } else if($('.email').val() === ''){
        alert('이메일를 입력하세요.');
        $('.email').focus();
        return;
    } else {
        //$('.passwordFind').submit(); //ajax로 추후 처리 예정
        $('.pw_check_form_modal').show(500); // 인증번호 입력할 수 있게 모달창 띄우기
    }
});




//인증번호 모달
/*$('.pw_check').click(function(){
    $('.pw_check_form_modal').show(500);
}); */
$('.modal_end_btn').click(function(){
    $('.pw_check_form_modal').fadeOut();
});



});


$('.Check').click(function(){
    console.log($('.check_num').val())
    if($('.check_num').val() === ''){
        alert('빈칸을 확인해주세요!');  
        $('.check_num').focus();
        return;
    }else{
        //ajax로 인증번호 일치 확인
        $('.new_pw_modal').show(500); // 새로운 비밀번호 설정 모달 뜨기
    }
});


$('.new_pw_btn').click(function(){
    if($('.new_pw').val() === '' || $('.new_pw_ck').val() === ''){
        alert('입력란을 확인해주세요!');  
        return;
    } else if($('.new_pw').val() !== $('.new_pw_ck').val()){
        alert('비밀번호가 일치하지 않습니다.');
        return;
    } else{
        //$('.newPw_form').submit() ajax 로 처리 
    }

});



</script>
</html>

    