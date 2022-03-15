<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 리스트</title>
    
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style>

.body-box {
  margin-top: 50px;
  margin-bottom: 300px;
  
}
.titlebox{
  margin-left: 120px;
}
a {
  text-decoration: none;
  color: #333;
}
a:hover {color: #6199ff;}

#search_box {
	margin-top:30px;
	text-align: right;
  margin-right: 150px;
}


/* 테이블 색상  */
table {
  width: 80%;
  margin: 40px auto 10px;
  border-collapse: collapse;
}
th {
  background:#b193df;
  color: #fff;
}
td, th {
  border: 1px solid #dbdbdb;
  padding: 5px 10px;
  font-size:12px;
}
tr:nth-of-type(even) { 
	background: #eee; 
}

/* 체크박스의 크기 */
.check {
  width:15px;
  height:15px;
}

/* 컬럼의 너비 */

.no {width: 7%;}
.title { }
.writer {width: 9%;}
.date {width: 10%;}
.count {width: 7%;}
.like {width: 7%;}

/* 컬럼의 정렬 */
tr td:nth-child(1){text-align:center;}
tr td:nth-child(2){text-align:center;}
tr td:nth-child(3){text-align:center;}
tr td:nth-child(4){text-align:center;}
tr td:nth-child(5){text-align:center;}


.btn-write {
  margin-left: 1078px;

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



/*페이징*/
  .pagination {
        
	list-style:none;
	display:inline;
	padding:5px;
	margin-left:40%;
	width:10px;
	color:#000;
	font:bold 12px tahoma;
	border:1px solid #eee;
	text-align:center;
	text-decoration:none;
     
}
  


      
   .pagination li a:hover, .pagination li a:focus {
	color:#fff;
	border:2px solid #a511c0;
	background-color:#a511c0;
     }

     .pagination li{
    margin-left: 10px;
    display: inline;
  
  }
  /*모달css*/
  .modal_wrap{
        display: none;
        width: 200px;
        height: 150px;
        background:#c8b6e4;
        position: fixed;
        right:50px;
        top:50px;
      
    }
    .mini-title{
      margin-top: 10px;
      font-size: 14px;
      text-align: center;
      
    }
    .modal-txtcontent {
      margin-left: 5px;
      resize: none;
    }
    .send-modalBtn {
      margin-left: 50px;
    }
    
    
     
    

    </style>
    


</head>

<body>
    <header id="header">
  <%@ include file="../include/header.jsp" %>
    </header>
  


    <section>
        <div class="body-box">
            <div class="row">
              
                    <div class="titlebox">
                         	<c:choose>
								<c:when test="${type == 1}">
									<h2>사기업게시판</h2>
								</c:when>
								<c:when test="${type == 2}">
									<h2>공기업게시판</h2>
								</c:when>
								<c:when test="${type == 3}">
									<h2>아시아게시판</h2>
								</c:when>
								<c:when test="${type == 4}">
									<h2>유럽게시판</h2>
								</c:when>
								<c:when test="${type == 5}">
									<h2>남미게시판</h2>
								</c:when>
								<c:when test="${type == 6}">
									<h2>북미게시판</h2>
								</c:when>
								<c:when test="${type == 7}">
									<h2>아프리카게시판</h2>
								</c:when>
								<c:when test="${type == 8}">
									<h2>국가자격증게시판</h2>
								</c:when>
								<c:when test="${type == 9}">
									<h2>민간자격증게시판</h2>
								</c:when>
								<c:when test="${type == 10}">
									<h2>어학게시판</h2>
								</c:when>
								<c:when test="${type == 11}">
									<h2>자유게시판</h2>
								</c:when>
								<c:when test="${type == 12}">
									<h2>취뽀게시판</h2>
								</c:when>
								<c:when test="${type == 13}">
									<h2>취업게시판</h2>
								</c:when>
								<c:when test="${type == 14}">
									<h2>자격증게시판</h2>
								</c:when>
								<c:when test="${type == 15}">
									<h2>자소서게시판</h2>
								</c:when>
								
								
								
							</c:choose>
                    </div>
                    <hr>

                    

                        <div class="search-wrap">
                            
                          <div id="search_box">
                    <form action=<c:url value="/board/JBoardList?board_type=${type}"/>>
                        <div class="search-wrap clearfix">
                                                    <select class="form-control search-select" name="condition">
                                <option value="title" ${pc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
                                <option value="content" ${pc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
                                <option value="writer" ${pc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
                                <option value="titleContent" ${pc.paging.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
                            </select>
                            <input type="text" name="keyword" class="form-control search-input" value="${pc.paging.keyword}">
							<button type="submit" class="btn btn-info search-btn">검색</button>
                        </div>
                    </form> 
                            </div>
                        </div>
                        <table>
                            <colgroup>
                              
                              <col class="no">
                              <col class="title">
                              <col class="writer">
                              <col class="date">
                              <col class="count">
                              <col class="like">
                            </colgroup>
                            <thead>
                              <tr>
                               
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회</th>
                                <th>추천</th>
                              </tr>
                            </thead>
                            <tbody>
                            
                            <c:forEach var ="vo" items="${boardList}">
                              <tr>
                                <td>${vo.board_no}</td>
                                <td><a href="#">${vo.board_title}</a></td>
                                <td><a href="#" id="modal-writer1">${vo.board_writer}</a></td>
                                <td>${vo.board_regdate}</td>
                                <td>${vo.board_hit}</td>
                                <td>${vo.board_like}</td>
                              </tr>
                            </c:forEach>


                             
                            </tbody>
                         </table>
                          <button class="btn-write">글쓰기</button>
                          

                    <form action=<c:url value="/board/JBoardList?board_type=${type}"/> name="pageForm">
	                        <div class="text-center clearfix">
	                            <hr>
	                            <ul class="pagination" id="pagination">
	                            	<c:if test="${pc.prev}">
	                                	<li><a href="#" data-pageNum="${pc.beginPage-1}">이전</a></li>
	                                </c:if>
	                                
	                                <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
	                                	<li class="${pc.paging.pageNum == num ? 'active' : ''}"><a href="#" data-pageNum="${num}">${num}</a></li>
	                                </c:forEach>
	                                
	                                <c:if test="${pc.next}">
	                               		<li><a href="#" data-pageNum="${pc.endPage+1}">다음</a></li>
	                                </c:if>
	                            </ul>
	                            
	                            <!-- 페이지 관련 버튼을 클릭 시 같이 숨겨서 보낼 값 -->
	                            <input type="hidden" name="board_type" value="${type}">
	                            <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
	                            <input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
	                            <input type="hidden" name="keyword" value="${pc.paging.keyword}">
	                            <input type="hidden" name="condition" value="${pc.paging.condition}">
	                            
	                          
	                        </div>
                        </form>
                </div>
            </div>
        </div>
        
        <!--쪽지모달-->
       
   
        <div class="modal_wrap">
        
          
            <div class="modal-contnet">
              <div class="mini-title">작성자님에게 보내는 쪽지</div>
              <textarea class ="modal-txtcontent" rows="4" cols=25"></textarea> 
              <button class="send-modalBtn"><a href="#" >보내기</a></button>
              <button class="close-modalBtn"><a href="#" >닫기</a></button>
            </div>    
              
         
        </div> 
           
         
                
    </section>

  
    <footer id="footer">
	    <%@ include file="../include/footer.jsp" %>
    </footer>
</body>
<script>

// 페이징
$(function() {
	$('#pagination').on('click', 'a', function(e) {
		e.preventDefault();
		console.log($(this));
		const value = $(this).data('pagenum');
		console.log(value);
		document.pageForm.pageNum.value = value;
		document.pageForm.submit();
	});
});

    window.onload = function() {
 
   function onClick() {
     document.querySelector('.modal_wrap').style.display ='block';
     
    }   
   function offClick() {
     document.querySelector('.modal_wrap').style.display ='none';
    
    }

    document.getElementById('modal-writer1').addEventListener('click', onClick);
    document.getElementById('modal-writer2').addEventListener('click', onClick);
    document.getElementById('modal-writer3').addEventListener('click', onClick);
    document.getElementById('modal-writer4').addEventListener('click', onClick);
    
    document.querySelector('.close-modalBtn').addEventListener('click', offClick);

   };   
</script>

</html>