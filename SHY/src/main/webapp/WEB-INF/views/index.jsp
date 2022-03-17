<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="jquery.bxslider/jquery.bxslider.css" rel="stylesheet" /> <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script> <script src="jquery.bxslider/jquery.bxslider.js"></script>

    <title>잡잡잡</title>
     <style media="screen">

       /* 슬라이드  */
      *{
        margin: 0; padding: 0;
      }
      .slide{
        width: 1200px;
        height: 400px;
        overflow: hidden;
        position: relative;
        margin: 0 auto;
        border-radius: 10px;
      }
      .slide ul{
        width: 5000px;
        position: absolute;
        top:0;
        left:0;
        font-size: 0;
      }
      .slide ul li{
        display: inline-block;
      }


      /* aside & mainList */
      .aside_list{
        width: 1200px;
        height: 600px;
        margin:  0 auto;
        position: relative;
        padding-top: 10px;
      
      }

      .aside_view{
        position: absolute;
        background: #b193df;
        margin-top: 10px;
        width: 200px;
        color: white;
        border-radius: 10px;
        box-shadow: 5px 5px 5px gray;
      }

      .my_info{
        text-align: center;
        padding: 20px;
      }

      .search{
        margin-top: 15px;
      }

      .aside_menu{
        text-align: center;
        line-height: 100px;
      }

      .aside_menu  :hover{
          color: aliceblue;
          text-shadow: 3px 3px gray;
      }
      .list{
        position: absolute;
        width: 950px;
        height: 600px;
        background-color: #b193df;
        left: 250px;
        top: 50px;
        border-radius: 10px;

      }

      .list_box1{
        position: absolute;
        width:  450px;
        height: 270px;
        background: white;
        border-radius: 10px;
        top: 28px;
        left: 14px;
      }
      .list_box2{
        position: absolute;
        width:  450px;
        height: 270px;
        background: white;
        border-radius: 10px;
        top: 28px;
        left: 484px;
      }
      .list_box3{
        position: absolute;
        width:  450px;
        height: 270px;
        background: white;
        border-radius: 10px;
        top: 316px;
        left: 14px;
      }
      .list_box4{
        position: absolute;
        width:  450px;
        height: 270px;
        background: white;
        border-radius: 10px;
        top: 316px;
        left: 484px;
      }

      .list_title_box{
        width: 700px;
        height: 60px;
        background: beige;
        position: absolute;
        left: 381px;
        top: 10px;
        color: white;
        border-radius: 10px;
        font-size: 30px;
        font-weight: bold;
        text-align: center;
        background-color: #b193df;

      }

      .box_main_title{
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        padding-bottom: 5px;
        border-bottom: 1px solid black;
        color: black;
      }

      /* 게시판 리스트 */

      .boardlist{
        margin-top: 10px;
        width: 100%;
        text-align: center;
        line-height: 40px;
        font-size: 15px;
      }

      /* section 3 */

      .study_box{
        width: 1200px;
        height: 540px;
        background: #b193df;
        margin: 0 auto;
        margin-top: 70px;
        padding-left: 25px;
        border-radius: 10px;
        position: relative;
        box-shadow: 3px 3px 3px 3px gray;
      }

      .job_info_box{
        width: 363px;
        height: 455px;
        background-color: white;
        display: inline-block;
        margin-top: 44px;
        margin-left: 15px;
        border-radius: 10px;
        box-shadow: 3px 3px 3px 3px gray;
      }

      .job_info_box_inner{
        text-align: center;
        padding : 13px;
      }

      .job_info_box_title{
        font-size: 20px;
        font-weight: bold;
        border-bottom: 2px solid black;
      }

      .job_info_table{
        margin-top: 10px;
        width: 100%;
        text-align: center;
        line-height: 40px;
        font-size: 15px;

      }

      /* footer */
      .footer_inner{
        width: 1200px;
        height: 80px;
        margin: 0 auto;
        align-items: center;
        top: 0;
        left: 0;
        right: 0;
      }

      .footer_inner ul{
        display: flex;
        margin-left: 20px;
      }

      .footer_inner ul li{
        margin: 0 auto;
        margin-top: 10px;
        padding: 10px 60px;
        font-size: 20px;
        font-weight: bold;
      }

      .footer_inner ul li:hover{
        color: #b193df;
      }

      /* footer modal */
    .modal1 { 
    position: absolute; 
    top: 0; 
    left: 0; 
    width: 100%; 
    height: 100%; 
    display: none; 
    background-color: rgba(0, 0, 0, 0.4);
    z-index: 1;
    }

    .service_box{
      width: 800px;
      height: 600px;
      background-color: #b193df;
      border-radius: 25px;
      margin: 0 auto;
      position: absolute;
      top: 30px;
      left: 50%;
      transform: translate(-50%, 0%);
    }

    .service_box_inner{
      width: 750px;
      height: 540px;
      background-color: white;
      border-radius: 25px;
      margin: 0 auto;
      position: absolute;
      top: 30px;
      left: 50%;
      transform: translate(-50%, 0%);
    }

    .service_title_outline{
      width: 750px;
      height: 50px;
      text-align: center;
      padding-top: 10px;
    }
      .service_title{
        font-size: 30px;
        font-weight: bold;
      }
    
    .inner_text{
      text-align: center;
      margin-top: 20px;
      width: 750px;
      height: 400px;
      overflow: auto;
    }

    .close_inner{
      width: 750px;
      height: 50px;
      padding-top: 20px;
      text-align: center;
    }

    /* 공지사항 css */

    .announcement_list{
      margin: 0 auto;
      margin-top: 10px;
        width: 100%;
        text-align: center;
        line-height: 40px;
        font-size: 15px;
        border: 1px solid #b193df;
    }

    .table{
      margin: 0 auto;
    }

    .form-control{
      width: 650px;
    }

    #paging {
      width:580px; 
      text-align:center; 
      line-height:15px;
      margin: 0 auto;
    }
    #paging a.prev{
      font:3px; 
      color:#b193df
    }
    #paging .selected {
      font-weight:bold; 
      color:#b193df
    }
    #paging a.num{
      border:#AAAAAA 1px solid; 
      background-color:#FFFFFF; 
      color:#b193df; 
      padding:3px 6px; 
      margin:3px; 
      font:3px}

    #paging a:hover.num{
      border:#b193df 3px solid
}


/* 인풋 css */

.input_search{
  width: 170px;
  border-radius: 10px;
  border: 5px solid #b193df;
}

/* 버튼 */
.myButton {
	box-shadow:inset 0px 1px 0px 0px #e184f3;
	background:linear-gradient(to bottom, #c123de 5%, #a20dbd 100%);
	background-color:#c123de;
	border-radius:6px;
	border:1px solid #a511c0;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:9px;
	font-weight:bold;
	padding:5px 10px;
	text-decoration:none;
	text-shadow:0px 1px 0px #9b14b3;
}
.myButton:hover {
	background:linear-gradient(to bottom, #a20dbd 5%, #c123de 100%);
	background-color:#b193df;
}
.myButton:active {
	position:relative;
	top:1px;
}

.myButton2 {
	box-shadow:inset 0px 1px 0px 0px #efdcfb;
	background:linear-gradient(to bottom, #dfbdfa 5%, #bc80ea 100%);
	background-color:#dfbdfa;
	border-radius:6px;
	border:1px solid #c584f3;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:27px;
	font-weight:bold;
	padding:21px 58px;
	text-decoration:none;
	text-shadow:0px 1px 0px #9752cc;
    margin-top: 70px;
}
.myButton2:hover {
	background:linear-gradient(to bottom, #bc80ea 5%, #dfbdfa 100%);
	background-color:#bc80ea;
}
.myButton2:active {
	position:relative;
	top:1px;
}




     </style>
  </head>
  <body>

    <header id="header">
  <%@ include file="./include/header.jsp" %>
    </header>

    <div class="slide" val="1" mx="3" class="bxslider" id="slide">
      <ul>
        <li id="img1"><img src="프로젝트이미지/20190330-IMG_5851.jpg" width="1200px" height="600px" alt=""/></li>
    
        <li id="img2"><img src="프로젝트이미지/22021046_조다은_중간과제.jpg" width="1200px" height="600px" alt=""/></li>
    
        <li id="img3"><img src="프로젝트이미지/눈오는_담벼락(스누피).png" width="1200px" height="600px" alt=""/></li>
      </ul>
    </div>

    <section class="aside_list">
      <div class="aside">
        <div class="search">
  <!-- Search Google --> 
  <form method=get action="http://www.google.co.kr/search" target="_blank" >  
    <table bgcolor="#FFFFFF">    
      <tr>    
      <td>    
        <input class="input_search" type=text name=q size=25 maxlength=255 value="" placeholder="구글검색" />  
        <!-- 구글 검색 입력 창 -->       
        <input type=submit name=btnG value="검색" />
        <!-- 검색 버튼 -->    
      </td>    
      </tr>  
      </table> 
      </form> 
    <!-- Search Google -->
        </div> 





        </div>
          <div class="aside_view">

            <div>
                <input type="text" name="" id="">
                <input type="text" name="" id="">
                <div><a href="#">로그인</a></div>
                <div><a href="#">회원가입</a></div>
                <div><a href="#">비밀번호 찾기</a></div>
              </div>



            <!-- 나중에 if로 세션 비교해서 해줄것! -->

            <!-- <div class="my_info">
                <h2>내 정보</h2>

                <span>로그인 날짜   : 2021.xx.xx</span>
                <p>000님 환영 합니다</p>
            </div>
            <div class="aside_menu">
              <h2><a href="#">쪽지</a></h2>
              <h2><a href="#">내가 쓴글</a></h2>
              <h2><a href="#">내가 쓴 댓글</a></h2>
              <h2><a href="#">스크랩</a></h2>
            </div> -->
          </div>



          <div class="list_title_box">게시판 리스트</div>

          <div class="list">
            <div class="list_box1">
              <div class="box_main_title">국내 취업</div>
              <table class="boardlist">
                <tr>
                	<th>제목</th>
               	 	<th>시간</th>
                </tr>
                <c:forEach var="vo" items="${boardList_in}">
					<tr>
						<td><a href="<c:url value ='/board/JBoardDetail?board_no=${vo.board_no}&board_type=${vo.board_type}'/>">${vo.board_title}</a></td>
						<td>${vo.board_regdate}</td>
					</tr>
				</c:forEach>
              </table>
            </div>
            <div class="list_box2">
              <div class="box_main_title">해외 취업</div>
              <table class="boardlist">
                <tr>
                	<th>제목</th>
               	 	<th>시간</th>
                </tr>
                <c:forEach var="vo" items="${boardList_out}">
					<tr>
						<td><a href="<c:url value ='/board/JBoardDetail?board_no=${vo.board_no}&board_type=${vo.board_type}'/>">${vo.board_title}</a></td>
						<td>${vo.board_regdate}</td>
					</tr>
				</c:forEach>
              </table>
            </div>
				<div class="list_box3">
              <div class="box_main_title">자격증</div>
              <table class="boardlist">
                <tr>
                	<th>제목</th>
               	 	<th>시간</th>
                </tr>
                <c:forEach var="vo" items="${boardList_certificate}">
					<tr>
						<td><a href="<c:url value ='/board/JBoardDetail?board_no=${vo.board_no}&board_type=${vo.board_type}'/>">${vo.board_title}</a></td>
						<td>${vo.board_regdate}</td>
					</tr>
				</c:forEach>
              </table>
            </div>
            <div class="list_box4">
              <div class="box_main_title">베스트</div>
              <table class="boardlist">
                <th>제목</th>
                <th>내용</th>
                <tr>
                  <td>첫번쨰 게시글</td>
                  <td>5분전 게시 </td>
                </tr>
                <tr>
                  <td>첫번쨰 게시글</td>
                  <td>5분전 게시 </td>
                </tr>
                <tr>
                  <td>첫번쨰 게시글</td>
                  <td>5분전 게시 </td>
                </tr>
                <tr>
                  <td>첫번쨰 게시글</td>
                  <td>5분전 게시 </td>
                </tr>
              </table>
            </div>
          </div>

      </div>
    </section>


            
    <section class="study_box">
        <div class="job_info_box">
          <div class="job_info_box_inner">
            <div class="job_info_box_title">취업 정보</div>
            <table class="job_info_table">
            <tr>
              <th>제목</th>
              <th>시간 </th>
             </tr>
              <c:forEach var="vo" items="${job_info }">
					<tr>
						<td><a href="<c:url value ='/board/JBoardDetail?board_no=${vo.board_no}&board_type=${vo.board_type}'/>">${vo.board_title}</a></td>
						<td>${vo.board_regdate}</td>
					</tr>
			</c:forEach>
            </table>
            <a href="#" class="myButton2">Click Me</a>
          </div>
        </div>
        <div class="job_info_box">
          <div class="job_info_box_inner">
            <div class="job_info_box_title">스터디</div>
            <table class="job_info_table">
            <tr>
              <th>제목</th>
              <th>시간 </th>
             </tr>
              <c:forEach var="vo" items="${study_info}">
					<tr>
						<td><a href="<c:url value ='/board/JBoardDetail?board_no=${vo.board_no}&board_type=${vo.board_type}'/>">${vo.board_title}</a></td>
						<td>${vo.board_regdate}</td>
					</tr>
			</c:forEach>
            </table>
            <a href="#" class="myButton2">Click Me</a>
          </div>
        </div>
        <div class="job_info_box">
          <div class="job_info_box_inner">
            <div class="job_info_box_title">알쓸신잡</div>
            <table class="job_info_table">
            <tr>
              <th>제목</th>
              <th>시간 </th>
             </tr>
              <c:forEach var="vo" items="${resume_info}">
					<tr>
						<td><a href="<c:url value ='/board/JBoardDetail?board_no=${vo.board_no}&board_type=${vo.board_type}'/>">${vo.board_title}</a></td>
						<td>${vo.board_regdate}</td>
					</tr>
			</c:forEach>
            </table>
            <a href="#" class="myButton2">Click Me</a>
          </div>
        </div>
    </section>

    <footer id="footer">
	    <%@ include file="./include/footer.jsp" %>
    </footer>


  </body>
  



  <script >

    // 버튼 js

  


    $(document).ready(function(){
      var imgs;
      var img_count;
      var img_position = 1;

      imgs = $(".slide ul");
      img_count = imgs.children().length;

      //버튼을 클릭했을 때 함수 실행
      $('#back').click(function () {
        back();
      });
      $('#next').click(function () {
        next();
      });

      function back() {
        if(1<img_position){
          imgs.animate({
            left:'+=1000px'
          });
          img_position--;
        }
      }
      function next() {
        if(img_count>img_position){
          imgs.animate({
            left:'-=1000px'
          });
          img_position++;
        }
      }
    });

    imgslide(); //페이지가 로딩될때 함수를 실행합니다
    
    function imgslide(){
    
      $val = $("#slide").attr("val"); //현재 이미지 번호를 가져옵니다
    
      $mx = $("#slide").attr("mx"); //총 이미지 개수를 가져옵니다
    
        $("#img"+$val).hide(); //현재 이미지를 사라지게 합니다.
    
        if( $val == $mx ){ $val = 1; } //현재이미지가 마지막 번호라면 1번으로 되돌립니다.
    
        else{ $val++; } //마지막 번호가 아니라면 카운트를 증가시켜줍니다
    
        $("#img"+$val).fadeIn(1000); //변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.
    
        $("#slide").attr('val',$val); //변경된 이미지영역의 번호를 부여합니다.
    
        setTimeout('imgslide()',3000); //1초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)

        
    }

    
  </script>


</html>
