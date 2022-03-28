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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
	<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="../resources/css/admin_user.css">
    <title>어드민 회원관리</title>
    <script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"
	integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"
	integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

  </head>


  <body>
     <%@include file = "../admin_include/admin_header.jsp" %>

    <div class="member">
      <div class="member_title">
        <h2>회원관리</h2>
      </div>
      <br>
      <nav></nav>




      <div class="member_list" >
        <table class="admin_board_wrap" id="user-admin">
          <thead class="admin_boardList">
            <th class="admin_board_head">이름</th>
            <th class="admin_board_head">아이디</th>
            <th class="admin_board_head">현재상태</th>
            <th class="admin_board_head">가입일</th>
            <th class="admin_board_head">게시글수</th>
            <th class="admin_board_head">댓글수</th>
            <th class="admin_board_head">가입승인</th>
          </thead>
          <tbody>
          <c:forEach var="vo" items="${userInfo}">
            <tr class="admin_board_content">
              <td class="admin_board_content_nm"><a class="mypageModal user_id" value="${vo.userId}">${vo.userId}</a> </td>
              <td class="admin_board_content_nm">${vo.userName}</td>
              <td class="admin_board_content_nm">
              			<c:choose>
              				<c:when test="${vo.userStatus== 0}">취업준비생</c:when>
              				<c:when test="${vo.userStatus== 1}">직장인</c:when>
              			</c:choose>	
              </td>
              <td class="admin_board_content_nm">${vo.userDate}</td>
              <td class="admin_board_content_nm"><a href="#" class="modal_boardList_admin" data-user-id ="${vo.userId}">${vo.boardCnt}</a></td>
              <td class="admin_board_content_nm"><a href="#" class="modal_reply_admin" data-user-id ="${vo.userId}">${vo.commentCnt}</a></td>
			  <c:choose>
			  	<c:when test="${vo.userPass == 0}">
			  	<td class="admin_board_content_nm">
	                <button data-user-id ="${vo.userId}" type="button" value="승인" class="appro">승인 </button>
	                <button data-user-id ="${vo.userId}" type="button" value="거부" class="deni">거부</button>
                </td>
			  	</c:when>
			  	<c:when test="${vo.userPass == 1}">
			  	<td class="admin_board_content_nm">
	                <button data-user-id ="${vo.userId}" type="button" value="승인" class="userDrop">회원 추방</button>
                </td>
			  	</c:when>
			  	<c:when test="${vo.userPass == 3}">
			  	 	<td>추방회원</td>
			  	</c:when>
			  	<c:when test="${vo.userPass == 2 }">
			  		<td>승인거절회원</td>
			  	</c:when>
			  </c:choose>
            </tr>
            </c:forEach>
          </tbody>
        </table>


      </div>
    </div>


    <!-- 회원가입 승인 모달 -->
    <div class="modal_approve">
      <div class="po">
        <div class="check_listWrap">
          <div class="modal_appr">
            회원가입이 승인되었습니다.
            <div class="close_modal_btn approve-btn">
              <button class="modalAppro_end_btn">확인</button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 회원가입 거부 모달 -->
    <div class="modal_deni">
      <div class="po">
        <div class="check_listWrap">
          <div class="modal_de">
             회원가입이 거부되었습니다.
            <div class="close_modal_btn">
              <button class="modal_deni_btn">확인</button>
            </div>
          </div>
        </div>
      </div>

    </div>


    <!-- 게시글 모달로 가져오기-->
    <div class="modal_list">
      <div class="modal_boradlist">
        <div class="reply_listWrap">

          <div class="modal_wrap">
            <h3 id="ListName"></h3>
            <p class="modallist">작성한 게시글 수 : 총 01개</p>
            <table class="admin_boardM_wrap" id="comment-admin">
              <thead class="admin_boardMList">
                <th class="admin_boardM_title">글 번호</th>
                <th class="admin_boardM_title">글 제목</th>
                <th class="admin_boardM_title boardleng">작성일</th>
                <th class="admin_boardM_title">조회수</th>
                <th class="admin_boardM_title">좋아요</th>
              </thead>
              </tbody>
              <tbody id="getBoardList">
				<!-- 게시글이 들어갈 공간 -->
              </tbody>
            </table>

           
            <div class="close_modal_btn">
              <button class="modal_list_end_btn">닫기</button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="modal_reply">
      <div class="modal_replylist">
        <div class="reply_listWrap">
          <div class="modal_wrap">
            <div>
              <h3 id="comment_name"></h3>
            </div>

            <table class="admin_reply_wrap">
              <tbody class="admin_replyList">
                <th class="admin_reply_title">글번호</th>
                <th class="admin_reply_title replyleng">작성한 댓글</th>
                <th class="admin_reply_title">작성한 일자</th>
              </tbody>
              <tbody id="commentList_box">

                
              </tbody>
            </table>
            <!-- 모달 페이징 -->
            <div>

              <s_paging>
                <div id="pagingM">
                  <br>
                  <a href="#" class="prev" title="이전페이지">◀ PREV </a>
                  <s_paging_rep><a href="#" class="num">1</a></s_paging_rep>
                  <s_paging_rep><a href="#" class="num">2</a></s_paging_rep>
                  <s_paging_rep><a href="#" class="num">3</a></s_paging_rep>
                  <a href="#" class="prev" title="다음페이지">NEXT ▶</a>
                  <br />&nbsp;
                </div>
              </s_paging>
              <div class="close_modal_btn">
                <button class="modal_reply_end_btn">닫기</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- 회원관리 모달 -->
    <div class="mypage_modal">
      <div class="service_box">
        <div class="mem_box_inner">
          <div class="mypage">

            <!-- <div class="service_title_outline"><span class="service_title">회원관리</span></div> -->
            <div class="mypage_form">
              <h3 class="memInfo"></h3>
              <div class="line"></div>
              <div class="insert">
                <!--이름-->
                <div class="name_box">
                  &nbsp;&nbsp;<p>이름</p> <input type="text" name="name" readonly value="홍길동"><br>
                </div>
                <!--아이디-->
                <div class="id_box">
                  &nbsp;&nbsp;<p>아이디</p> <input type="text" name="id" readonly value="abc1234"><br>
                </div>
                <!--전화번호-->
                <div class="tel_box">
                  &nbsp; <p>전화번호</p> <input type="tel" name="phone" readonly><br>
                </div>
                <!--주소-->
                <div class="addr_box">
                  &nbsp; <p>주소</p> <input type="text" name="addr_num" readonly> 

                  <input type="text" class="addr addr1" name="addr1" readonly><br>
                  <input type="text" class="addr addr2" name="addr2" readonly><br>
                  <input type="text" class="addr addr3" name="addr3" readonly>
                </div>
                <!--현재 상태 구분-->
                <div class="job_box">
                  &nbsp;<p>현재 상태</p>
                  &nbsp;&nbsp;<span id="job-stat">취업준비생</span>
                </div>

              </div>
              <div class="close_btn">
                <button class="close">닫기</button>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>

    <script>

    
    
      let str = '';
      // 모달 스크립트 
      $(function () {
    	  $("#user-admin").DataTable();
        // 게시판 모달
        $('.modal_boardList_admin').click(function () {
        	var board_id = $(this).data("userId");
        	console.log(board_id);

        	getList(true, board_id);
          $('.modal_list').fadeIn(500);
        }); // open modal end
        
        function getList(reset, board_id) {
        	
        	if(reset) {
        		str = '';
        	}
        	
        	$.ajax({
        		type : 'post',
        		url : '<c:url value ="/admin/getUserBoardList"/>',
                data : {
                	board_writer : board_id,
                	},
        		dataType : "json",
        		success : function(data) {
					for(var i = 1 in data){
						console.log(data[i].board_title);
						str += "<tr class='admin_boardM_content'>"
						str += "<td class='admin_boardM_nm'><a href='#'>"+data[i].board_no+"</a></td>"
						str += "<td class='admin_boardM_nm'><a href='#'>"+data[i].board_title+"</a></td>"
						str += "<td class='admin_boardM_nm'><a href='#'>"+timeStamp(data[i].board_regdate)+"</a></td>"
						str += "<td class='admin_boardM_nm'>"+data[i].board_hit+"</td>"
						str += "<td class='admin_boardM_nm'>"+data[i].board_like+"</td>"
						str += "</tr>"
					}
					$('#ListName').html(board_id + '님의 작성 게시물')
					$('#getBoardList').html(str); 
					$("#comment-admin").DataTable();
				},error : function(status, error) {
					console.log('에러발생!!');
					console.log(status, error);
				}

	          });//ajax 종료
		}
        
        
        $('.modal_list_end_btn').click(function () {
        	console.log('모달 닫기 이벤트 발생!');
          $('.modal_list').fadeOut();
        });
        
        
        // 댓글 모달
        $('.modal_reply_admin').click(function () {
          $('.modal_reply').fadeIn(500);
      		var comment_id = $(this).data("userId");
    		console.log(comment_id);
			getList2(true,comment_id);
        });
        
        function getList2(reset, comment_id) {
			if(reset){
				str ='';
			}
			
    		$.ajax({
				type :'post',
				url : '<c:url value ="/admin/getCommentList"/>',
				data : {
					com_writer : comment_id,
				},
				dataType :"json",
				success : function(data) {
					console.log('잘됨!')
					for(var i = 1 in data){
						console.log(data[i].com_no);
		                str += "<tr class='admin_reply_content'>"
		                str += "  <td class='admin_reply_con'><a href='#'>"+data[i].com_no+"</a></td>"
		                str += " <td class='admin_reply_con'><a href='#'>"+data[i].com_content+"</a></td>"
		                str += " <td class='admin_reply_con'>"+timeStamp(data[i].com_regdate)+"</td>"
		                str += " </tr>"
					}
					$('#commentList_box').html(str);
					$('#comment_name').html(comment_id +'님의 작성 댓글 ')
				
					
					
				},error : function(status, error) {
					console.log('에러발생!!');
					
					console.log(status, error);
				}
				
			});//ajax 종료
		}
        
   
        $('.modal_reply_end_btn').click(function () {
          $('.modal_reply').fadeOut();
        });
        // 마이페이지 모달
        $('.mypageModal').click(function () {
          $('.mypage_modal').fadeIn(500);
          var Id = $(this).attr('value');
          console.log(Id);
          // 아이디 값 불러옴 
          
          $.ajax({
        	type : 'post',
        	url: '<c:url value="/admin/getuserInfo" />',
        	data : {
        		id : Id,
        	},
        	dataType:"json",
        	success : function(data){
        		console.log(data.userName);
        		console.log(data.userId);
        		$("input[name='name']").val(data.userName);
        		$("input[name='id']").val(data.userId);
        		$("input[name='phone']").val(data.userPh);
        		$("input[name='addr1']").val(data.userAdr3);
        		$("input[name='addr2']").val(data.userAdr2);
        		$("input[name='addr3']").val(data.userAdr4);
        		$("input[name='addr_num']").val(data.userAdr1);
        		$(".memInfo").html(data.userName+"님의 회원 정보");
        	},error : function(status, error) {
				console.log('에러발생!!');

				console.log(status, error);
			}
        	
        	
          })//ajax 종료
        });
        $('.close').click(function () {
          $('.mypage_modal').fadeOut();
        });
        // 회원가입 승인
        $('.appro').click(function () {
        	const successId = $(this).data("userId");
        	console.log(successId);
        	// 0 가입대기 , 1.가입승인, 2. 가입거절
        	
        	$.ajax({
        		type : 'post',
        		url : '<c:url value="/admin/successId" />',
        		data : {
            		id : successId,
            	},
            	success : function(data){
            	},error : function(status, error) {
    				console.log('에러발생!!');

    				console.log(status, error);
    			}
            	
        	}); // 아작스 종료
          $('.modal_approve').fadeIn(500);
        });
        $('.modalAppro_end_btn').click(function () {
          $('.modal_approve').fadeOut();
        });
        
        
        // 회원가입 거부
        $('.deni').click(function () {
        	const failId = $(this).data("userId");
        	console.log(failId);
 
          
      	$.ajax({
    		type : 'post',
    		url : '<c:url value="/admin/failId" />',
    		data : {
        		id : failId,
        	},
        	success : function(data){
        	},error : function(status, error) {
				console.log('에러발생!!');

				console.log(status, error);
			}

    	});//아작스 끝
        $('.modal_deni').fadeIn(500);
        });
        $('.modal_deni_btn').click(function () {
          $('.modal_deni').fadeOut();
        });
      });

      //검색
      $('.search_onclick_submit').click(function () {
          /* alert('검색되니?')
          location.href = "" + "검색어 이름" + "" + "검색어 아이디";*/
          if($('.search-input').val()===''){
            alert('서비스 준비 중입니다..');
            return;
          }
        }
      );
      // 엔터키누를시 검색버튼 눌리기
      $('.search-input').keypress(function (e) {
        if (e.keyCode == 13) {
          //실행할 function작성
          alert("엔터 잘 실행되니?");
        }
      });

      // 가입승인 버튼 클릭시 회원가입승인
      $('.appro').click(function(){
        $('.insert').submit();
        console.log('회원가입승인!')
        // 가입승인 메일전송 서비스 만들면 좋을듯
      });

      // 가입거부 버튼 클릭시 요청 삭제
      $('.deni').click(function(){
        console.log('회원가입거부!');
        // 가입승인 거부됨 메일전송 서비스 만들면 좋을듯
      });
      
      $('.userDrop').click(function() {
		
    	  const dropId = $(this).data("userId");
        	console.log(dropId);
           	$.ajax({
        		type : 'post',
        		url : '<c:url value="/admin/dropId" />',
        		data : {
            		id : dropId,
            	},
            	success : function(data){
            	},error : function(status, error) {
      				console.log('에러발생!!');
      				
      				console.log(status, error);
      			}
  		}); //end ajax


	  });// end user Drop
	  
	  function timeStamp(millis) {
	      
	      const date = new Date(); //현재 날짜
	      //현재 날짜를 밀리초로 변환 - 등록일 밀리초 -> 시간차
	      const gap = date.getTime() - millis;
	      
	      let time; //리턴할 시간
	      if(gap < 60 * 60 * 24 * 1000) { //1일 미만인 경우
	         if(gap < 60 * 60 * 1000) { //1시간 미만일 경우
	            time = '방금 전';
	         } else { //1시간 이상일 경우
	            time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
	         }
	      } else { //1일 이상일 경우
	         const today = new Date(millis);
	         const year = today.getFullYear(); //년
	         const month = today.getMonth() + 1; //월
	         const day = today.getDate(); //일
	         const hour = today.getHours(); //시
	         const minute = today.getMinutes(); //분
	         
	         time = year + '년 ' + month + '월 ' + day + '일 ' + hour + '시 ' + minute + '분'; 
	         
	      }
	      return time;
	   }
    </script>