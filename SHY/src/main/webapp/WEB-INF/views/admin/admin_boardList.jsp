<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
        <link rel="stylesheet" href="../resources/css/admin_board.css">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
        
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
                <div id="filter"></div>
            </div>
        </section>
        <section style="padding-top: 20px;">
            <table class="ad_board_wrap" id="board-admin">
                <thead class="ad_boardList">  
                	<tr>
	                    <th class="ad_board_head_name">글번호</th>
	                    <th class="ad_board_head_name">게시판명</th>
	                    <th class="ad_board_head_name">제목</th>
	                    <th class="ad_board_head_name">작성자</th>
	                    <th class="ad_board_head_name">작성일</th>
	                    <th class="ad_board_head_name">조회수</th>
	                    <th class="ad_board_head_name">좋아요</th>
	                    <th class="ad_board_head_name">싫어요</th>
	                    <th class="ad_board_head_name">기능</th>
                    </tr>
                </thead>

                <tbody>
                <c:forEach var="vo" items="${allBoard}">
                  <tr class="ad_board_content"> 
                    <td class="ad_board_content_nm">${vo.board_no}</td>
                    <td class="ad_board_content_nm">
                    	<c:choose>
                    		<c:when test="${vo.board_type == 1 or vo.board_type == 2 }">국내취업</c:when>
                    		<c:when test="${vo.board_type == 3 or vo.board_type == 4 or vo.board_type == 5 or vo.board_type == 6 or
                    		vo.board_type == 7}">해외취업</c:when>
                    		<c:when test="${vo.board_type == 8 or vo.board_type == 9 or vo.board_type == 10 }">자격증</c:when>
                    		<c:when test="${vo.board_type == 11 or vo.board_type == 12 }">자유게시판</c:when>
                    		<c:when test="${vo.board_type == 13 or vo.board_type == 14 or vo.board_type == 15}">스터디</c:when>
                    		<c:when test="${vo.board_type == 16}">삭제게시판</c:when>
                    	</c:choose>
                    </td>                  
                    <td class="ad_board_content_nm"><a href="<c:url value ='/board/JBoardDetail?board_no=${vo.board_no}&board_type=${vo.board_type}'/>">${vo.board_title}</a></td>
                    <td class="ad_board_content_nm">${vo.board_writer}</td>
                    <td class="ad_board_content_nm">${vo.board_regdate}</td>
                    <td class="ad_board_content_nm">${vo.board_hit}</td>
                    <td class="ad_board_content_nm">${vo.board_like}</td>
                    <td class="ad_board_content_nm">${vo.board_hate}</td>
                    <td class="ad_board_content_nm"><button class="op_btn2" data-board-no ="${vo.board_no}" >삭제</button>
                    </td>
                  </tr>
            </c:forEach>
                </tbody>
            </table>
        </section>


    </body>
            <script>
            $(function(){

                
                $('.op_btn2').click(function() {
					var boardNo = $(this).data("boardNo");
					console.log(boardNo);
					
				if(confirm("정말 삭제 하시겠습니까?")){
					$.ajax({
		        		type : 'post',
		        		url : '<c:url value ="/admin/deleteBoard"/>',
		                data : {
		                	board_no : boardNo,
		                	},
		        		success : function(data) {
							console.log("성공")
							location.reload();
						},error : function(status, error) {
							console.log('에러발생!!');
							console.log(status, error);
						}   			
					}); // end ajax
					return true;
				}else{
					return false;
				}
					
				});
                
                
                
                
                
                var dt_columns =  [
                    { title: "전체", width:150}
                ]
                
                //
                
                $("#board-admin").DataTable({
    			    "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "전체"]],
    			    "initComplete": function () {
    			        this.api().columns().every( function (e) {
    			        	
    			        	console.log(e);
    			        	
    			            if(e == 1){
    			                var column = this;
    			                col_name = dt_columns[0].title;

    			                var select = $('<select><option value="">'+col_name+'</option></select>')
    			                .appendTo( $("#filter").empty() )
    			                .on( 'change', function () {
    			                    var val = $.fn.dataTable.util.escapeRegex(
    			                        $(this).val()
    			                    );
    			                    column.search( val ? '^'+val+'$' : '', true, false ).draw();
    			                } );
    			
    			                column.data().unique().sort().each( function ( d, j ) {
    			                    select.append( '<option value="'+d+'">'+d+'</option>' )
    			                } );
    			            }
    			        } );
    			    }
    			});
            });
        </script>
</html>
