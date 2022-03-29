<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/admin_board.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
        
    <title>나의 활동(작성글)</title>
    
    <style>

        h2 {
            text-align: left;
            margin-left: 270px;
            margin-top: 50px;
        }

        /* 4개 종류 분류 */
        .record_list {
            margin-top: 20px;
            margin-left: 270px;
        }

        .record_list_1 {
            margin-right: 15px;
        }

        .record_list_2 {
            margin-right: 15px;
        }

        .record_list_3 {
            margin-right: 15px;
        }

        .record_list_1:hover{
            color: gray;
        }

        .record_list_2:hover{
            color: gray;
        }

        .record_list_3:hover{
            color: gray;
        }

        .record_list_4:hover{
            color: gray;
        }

        /* 테이블 */
        table {
            border-collapse: collapse;
        }

        .myRecord_wrap{
            margin: 0 auto;
            border-top: 1px solid #666;
            border-bottom: 1px solid #f2f2f2;
            width: 1000px;
            text-align: center;
        }
        
        .myRecord_head {
            margin-top: 40px;
            border-bottom: 1px solid #f2f2f2;
            
        }

        .myRecord_content {
            padding: 10px 0;
            border-bottom: 1px solid #f2f2f2;
        }

        .myRecord_head_nm {
            padding: 5px;
            font-size: 15px;
            padding-right: 85px;
        }

        .myRecord_content_nm {
            padding: 3px;
            font-size: 13px;
            padding-right: 85px;
        }    

    </style>

</head>

<body>
   
     <%@include file = "../include/header.jsp" %>

    <section>
        <h2>
            나의 활동(작성글)
        </h2>

    </section>
        <div class="record_list">
           <a href="<c:url value='/board/myRecord?board_writer=${login.userId}' />" class="record_list_1">작성글</a>
            <a href="<c:url value='/comment/myRecord?com_writer=${login.userId}' />" class="record_list_2">작성댓글</a>
            <a href="<c:url value='/scrap/myRecord?uses_Id=${login.userId}' />" class="record_list_3">스크랩</a>
            <a href="<c:url value='/note/myRecord?note_to=${login.userId}' />" class="record_list_4">받은 쪽지</a>
        </div>
        
    <section style="padding-top: 10px; padding-bottom: 100px;">
        <table class="myRecord_wrap">
            <thead class="myRecord_head">
                <tr> 
                    <th class="myRecord_head_nm">작성일</th>
                    <th class="myRecord_head_nm">분류</th>
                    <th class="myRecord_head_nm">제목</th>
                    <!--  <th class="myRecord_head_nm">작성자</th>-->
                    <th class="myRecord_head_nm">조회</th>
                </tr>
            </thead>
			
            <tbody>
					      <c:forEach var="list" items="${userBoard}">
			              <tr class="myRecord_content">
			                    <td class="myRecord_content_nm">
			                     <fmt:formatDate value="${list.board_regdate}" pattern="yy/MM/dd"/>
			                  	</td> 
			                    <td class="myRecord_content_nm">
			                     	<c:choose>
						<c:when test="${list.board_type == 1}">
							<p>사기업게시판</p>
						</c:when>
						<c:when test="${list.board_type == 2}">
							<p>공기업게시판</p>
						</c:when>
						<c:when test="${list.board_type == 3}">
							<p>아시아게시판</p>
						</c:when>
						<c:when test="${list.board_type == 4}">
							<p>유럽게시판</p>
						</c:when>
						<c:when test="${list.board_type == 5}">
							<p>남미게시판</p>
						</c:when>
						<c:when test="${list.board_type == 6}">
							<p>북미게시판</p>
						</c:when>
						<c:when test="${list.board_type == 7}">
							<p>아프리카게시판</p>
						</c:when>
						<c:when test="${list.board_type == 8}">
							<p>국가자격증게시판</p>
						</c:when>
						<c:when test="${list.board_type == 9}">
							<p>민간자격증게시판</p>
						</c:when>
						<c:when test="${list.board_type == 10}">
							<p>어학게시판</p>
						</c:when>
						<c:when test="${list.board_type == 11}">
							<p>자유게시판</p>
						</c:when>
						<c:when test="${list.board_type == 12}">
							<p>취뽀게시판</p>
						</c:when>
						<c:when test="${list.board_type == 13}">
							<p>취업게시판</p>
						</c:when>
						<c:when test="${list.board_type == 14}">
							<p>자격증게시판</p>
						</c:when>
						<c:when test="${list.board_type == 15}">
							<p>자소서게시판</p>
						</c:when>



					</c:choose>
			                  	</td>
			                    <td class="myRecord_content_nm"><a href="<c:url value='/board/JBoardDetail?board_no=${list.board_no}&board_type=${list.board_type}'/>" class="nm_content">${list.board_title}</a></td>
			                    
			                    <td class="myRecord_content_nm">${list.board_hit}</td>
			                
			              </tr>
				
               			</c:forEach>
            </tbody>
        </table>

    </section>

     <%@include file = "../include/footer.jsp" %>      
</body>
</html>