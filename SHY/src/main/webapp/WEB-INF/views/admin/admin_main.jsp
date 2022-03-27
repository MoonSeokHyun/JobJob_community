<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<!DOCTYPE html>
<html lang="ko">
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
        <link rel="stylesheet" href="../resources/css/admin-main.css">
    <title>관리자 페이지</title>
</head>
<style>

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
      width: 780px;
      height: 600px;
      background-color: rgb(159, 204, 147);
      border-radius: 10px;
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
      /* border-radius: 25px; */
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
    .mypage {
        box-shadow: none;
        margin-top: 50px;
        height: 300px;
        margin-bottom: 0px;
    }
    .mypage div {
        margin-bottom: 40px;
    }
    .btn {
        margin: 0;
    }
    .mypage_modal .job_box {
        margin-top: 10px;
    }
    .mypage_modal .service_box {
        height: 530px;
    }
    .mypage_modal .service_box_inner {
        height: 470px;
    }
    
    
</style>
<body class="end-modal">
     <%@include file = "../admin_include/admin_header.jsp" %>
    <div class="table-box">
        <div class="ad-table alarm">
          
            </table>
        </div>

        <div class="ad-table manage">
            <p><a href="">회원관리</a></p>
            <table class="atable manage-table">
                <thead>
                    <th>아이디</th>
                    <th>닉네임</th>
                    <th>가입날짜</th>
                </thead>
                <tbody>
                  <c:forEach var="vo" items="${userInfo}">
                    <tr>
                        <td><a class="manage-btn" href="#">${vo.userId}</a></td>
                        <td>${vo.userName}</td>
                        <td>${vo.userDate}</td>
                    </tr>
                      </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="new-article">
            <p><a href="">새 게시글</a></p>
            <table class="atable article-table">
                <thead>
                    <th>글 제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                </thead>
                <tbody>
                <c:forEach var="vo" items="${boardList}">
                    <tr>
                        <td><a class="new_art"  href="<c:url value ='/board/JBoardDetail?board_no=${vo.board_no}&board_type=${vo.board_type}'/>">${vo.board_title}</a></td>
                        <td>${vo.board_writer}</td>
                        <td>${vo.board_regdate}</td>
                    </tr>
                   </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

    <!-- 모달 -->
    <!--공지사항 모달-->
    <div class="alram_modal modal1">
        <div class="service_box">
            <div class="service_box_inner">
                <div class="service_title_outline"><span class="service_title">공지사항</span></div>
                <div class="inner_text">
                    
                        <table class="amodal">
                            <thead>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><a class="inalarm-btn" href="#"></a></td>
                                    <td>sss</td>
                                    <td>sss</td>
                                </tr>
                      
                            </tbody>
                        </table>
                        <s_paging>
                            <div id="pagingM">
                                <br>
                                <a href="#" class="prev" title="이전페이지">◀ PREV </a>
                                <s_paging_rep><a href="#" class="num">1</a></s_paging_rep>
                                <s_paging_rep><a href="#" class="num">2</a></s_paging_rep>
                                <s_paging_rep><a href="#" class="num">3</a></s_paging_rep>
                                <a href="#" class="prev" title="다음페이지">NEXT ▶</a>
                                <br/>&nbsp;
                            </div>
                        </s_paging>
                </div>
                <div class="close_inner">
                    <button class="write">글쓰기</button>
                    <button class="close">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <!--공지사항 작성 모달-->
    
    <div class="write_modal modal1">
        <div class="service_box">
            <div class="service_box_inner">
                <div class="service_title_outline"><span class="service_title">공지사항</span></div>
                <div class="inner_text">
                    <form action="#">
                        <div class="box">
                            <div class="write_box">
                                <div class="title">
                                    <div class="title_box">
                                        <p>제목&nbsp;&nbsp;&nbsp;</p><input type="text">
                                    </div>
                                </div>
                                <div class="writer"><p>작성자</p>&nbsp;&nbsp;&nbsp;<span>홍길동</span></div>
                                <div class="date">
                                    <div class="date_box">
                                        <p>작성일</p>&nbsp;&nbsp;&nbsp;<span>2022-03-08</span>
                                    </div>
                                </div>
                                <div class="content">
                                    <textarea name="" id="classic" cols="30" rows="10"></textarea>
                                </div>
                                
                                <div class="btn">
                                    
                                    <button class="sub">등록</button><button class="can">취소</button>
                                    
                                </div>
                            </div>
                            
                        </div>
                    </form>
                        
                </div>
                <div class="close_inner">
                    
                    <button class="close">닫기</button>
                </div>
            </div>
        </div>
    </div>


    <!--회원관리 모달-->
    <div class="mypage_modal modal1">
        <div class="service_box">
            <div class="service_box_inner">
                <div class="service_title_outline"><span class="service_title">회원관리</span></div>
                <div class="mypage">
                    
                        <div class="mypage_form">
                            <div class="insert">
                                <!--이름-->
                                <div class="name_box">
                                    &nbsp;&nbsp;<p>이름</p> <span class="name">홍길동</span>
                                </div>
                                <!--아이디-->
                                <div class="id_box">
                                    &nbsp;&nbsp;<p>아이디</p> <span class="id">abc1234</span>
                                    
                                </div>
                                
                                <!--전화번호-->
                                <div class="tel_box">
                                    &nbsp; <p>전화번호</p>&nbsp;&nbsp;&nbsp;<span class="tel">010-1111-2222</span>
                                </div>
                                <!--주소-->
                                <div class="addr_box">
                                    &nbsp; <p>주소</p>&nbsp;<span class="ad_num">10111</span>&nbsp;&nbsp;<span class="ad_detail1">경기도 고양시</span>&nbsp;&nbsp;<span class="ad_datail2">덕양구</span>
                                    &nbsp;&nbsp;<span class="ad_datail3">101-101</span>
                                </div>
                                <!--현재 상태 구분-->
                                <div class="job_box">
                                    &nbsp;<p>현재 상태</p>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="job-stat">취업준비생</span>
                                </div>
                                
                            </div>
                        </div>
                    
                </div>
                <div class="close_inner">
                    <button class="close">닫기</button>
                </div>
            </div>
        </div>
    </div>

    <!--게시글 관리 모달-->
    <div class="article_modal modal1">
        <div class="service_box">
            <div class="service_box_inner">
                <div class="service_title_outline"><span class="service_title">새 게시글</span></div>
                <div class="inner_text">
                    <form action="#">
                        <div class="box">
                            <div class="write_box">
                                <div class="title">
                                    <div class="title_box">
                                    	
                                        <p>제목&nbsp;&nbsp;&nbsp;</p><span></span>
                                    </div>
                                </div>
                                <div class="writer"><p>작성자</p>&nbsp;&nbsp;&nbsp;<span>홍길동</span></div>
                                <div class="date">
                                    <div class="date_box">
                                        <p>작성일</p>&nbsp;&nbsp;&nbsp;<span>2022-03-08</span>
                                    </div>
                                </div>
                                <div class="content">
                                    <div class="text">
                                        <textarea name="" id="" cols="30" rows="10" readonly>안녕하세요. 새 게시글입니다. 이 부분은 작성란이 아닙니다</textarea>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </form>
                        
                </div>
                <div class="close_inner">
                    
                    <button class="close">닫기</button>
                </div>
            </div>
        </div>
    </div>


</body>
<!--  일단 기능 죽임
    <script>
        $(function(){
            
            $('.alarm-btn').click(function(){
                $('.alram_modal').fadeIn();
                // console.log('모달띄움')
            }); // open modal end
            $('.write').click(function(){
                $('.write_modal').fadeIn();//공지사항 작성 모달
                $(this).hide();
            })
            $('.inalarm-btn').click(function(){
                $('.article_modal').fadeIn();
                $('.service_title').html('공지사항');
                $('.close').html('닫기');
            })
            // $('.sub').click(function(){
            //     $(this).submit();
            // })
            $('.manage-btn').click(function(){
                $('.mypage_modal').fadeIn();
                $('.service_title').html('회원관리');
                $('.close').html('닫기');
                // console.log('모달띄움')
            });
            $('.can').click(function(){
                $('.alram_modal').fadeIn();
            });
            $('.new_art').click(function(){
                $('.article_modal').fadeIn();
                $('.service_title').html('새 게시글');
                $('.close').html('닫기');
            })
            $('.close').click(function(){
                $('.alram_modal').fadeOut();
                $('.mypage_modal').fadeOut();
                $('.write_modal').fadeOut();
                $('.article_modal').fadeOut();
                $('.write').show();
                // console.log('모달끔')
            });
        });
    </script>
 -->


</html>