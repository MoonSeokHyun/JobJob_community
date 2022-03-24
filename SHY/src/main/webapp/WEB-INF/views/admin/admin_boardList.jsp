<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../resources/css/admin_board.css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        
        <title>게시판 관리</title>
    </head>

    <body>


        <header>
    <%@include file = "../admin_include/admin_header.jsp" %>
        </header>

        <section>
            <h2>
                게시판 관리
            </h2>

            <div class="search_keyword search-container" style="text-align: right; margin-right: 270px;">
                <select class="search-option" name="condition">

                </select>
                <input type="text" class="search-input" placeholder="검색" name="search" size="10">
                <button type="submit" class="search_onclick_submit">검색</button>
            </div>
        </section>

        <section>
            <div class="sec" style="padding-left: 270px;">
                <a href="#">국내취업</a>
                <a href="#">자격증</a>
                <a href="#">자소서 형식</a>
                <a href="#">스터디</a>
                <a href="#">해외취업</a>
            </div>
        </section>

        <section style="padding-top: 20px;">
            <table class="ad_board_wrap">
                <thead class="ad_boardList">  
                    <th class="ad_board_head_name">글번호</th>
                    <th class="ad_board_head_name">게시판명</th>
                    <th class="ad_board_head_name">제목</th>
                    <th class="ad_board_head_name">작성자</th>
                    <th class="ad_board_head_name">내용보기</th>
                    <th class="ad_board_head_name">댓글보기</th>
                    <th class="ad_board_head_name">기능</th>
                </thead>

                <tbody>
                  <tr class="ad_board_content">
                    <td class="ad_board_content_nm">1</td>
                    <td class="ad_board_content_nm">사기업</td>
                    <td class="ad_board_content_nm">취업준비생</td>
                    <td class="ad_board_content_nm">작성자</td>
                    <td class="ad_board_content_nm"><a href="#">내용</a></td>
                    <td class="ad_board_content_nm"><a href="#">댓글</a></td>
                    <td class="ad_board_content_nm"><button class="op_btn2">삭제</button>
                    </td>
                  </tr>
                </tbody>
            </table>
        </section>

        <s_paging> 
            <div id="paging">
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

        <div class="board_modal_delete">
            <div class="board_wrap_delete">
                <div class="board_delete">
                    이 게시물을 삭제합니다.
                    <div class="board_delete_btn">
                        <button type="button" class="delete_btn" onclick = "location.href = '#' ">확인</button>
                        <button type="button" class="delete_btn" onclick = "location.href = '#' ">취소</button>
                    </div>
                </div>
             
            </div>
        </div>
    </body>
            <script>
            $(function(){
                $('.op_btn2').click(function(){
                    $('.board_modal_delete').fadeIn();
                }); // open modal end
                $('.modal_end_btn').click(function(){
                    $('.board_modal_delete').fadeOut();
                });
            });
        </script>
</html>
