<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세보기</title>
   
    <script src="https://kit.fontawesome.com/860e355b09.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<style>
    .con{
        width: 1200px;
        height: 1000px;
        position: relative;

        
    }
    .first-box{
        width: 900px;
        height: 1000px;
        box-shadow: 5px 5px 5px gray;
        margin: 50px auto;
        border: 1px solid gray;
        border-radius: 10px;
        /* position: absolute;
      top: 30px;
      left: 50%; */
      /* transform: translate(-50%, 0%); */
    
       

    }
    .name_like_box {
        margin-top: 50px;
    }
    .Board-title{
        width: 120px;
        margin-left: 70px;
        display: inline-block;
    }
    .Like{
        width: 90px;
        display: inline-block;
        position: absolute;
        left: 900px;
        /* padding: 0px;
        position: absolute;
        top: 2px;
        left: 850px;
        text-align: right; */
    }
    .second-box{
        width: 900px;
    
        margin-top: 30px;
        margin-left:75px;

        
    }
    .third-box{
        width: 900px;
       
        margin-top: 50px;
        margin-left:100px;
    }
    .third-box textarea {
        resize: none;
        height: 80px;
    }
    .b-content{
        /* border: 1px solid darkgray ; */
        margin-top: 10px;
        margin-left: 30px;

        width: 700px;
        height: 350px;
        background-color: white;

    }
    .b-content textarea {
        width: 100%;
        height: 350px;
        border: 1px solid black;
        resize: none;
    }
    .b-title {
        width: 400px;
        font-size: 18px;
        /* font-style: italic; */
    }
    .b-title input {
        margin-left: 10px;
    }
    .b-writer {
        font-size: 18px;
    }
    
    .t-icons{
        margin-left: 350px;
        margin-top: 20px;
    }
    .right-btn {
        margin-top: 35px;
        margin-bottom: 35px;
    }
    .btn-list{
        margin-left: 35px;
        margin-bottom: none;
    }
    .left-btn {
        margin-left: 550px;
        display: inline-block;

    }
    
    .c-icon {
       float: left;
       /* display: inline-block; */
       font-size: 35px;
       margin-right: 15px;
      
    }
    /* .c-content {
        display: inline-block;
        margin-top: 5px;
    } */
    .c-box{
        margin-top: 10px;
        margin-left: 650px;


    }
    hr {
        margin-top: 70px;
    }
    /* textarea {
    width: 65%;
    height: 3em;
    border: none;
    resize: none;
  } */
  

      /* /* content_box * */

      .content{
          border-radius: 10px;
      }

      .title{
          width: 700;
      }

      .inner_box1{
        display: flex;
        margin-bottom: 10px;
      }
      .hit_box{
          position: absolute;
          right: 220px;
      }
      .title{
          width: 650px;
      }
      .title_box{
          margin-bottom: 10px;
      }
      .writer_box{
          margin-bottom: 50px;
      }
     
    .myButton3 {
   box-shadow:inset 0px 1px 0px 0px #ffffff;
   background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
   background-color:#ededed;
   border-radius:6px;
   border:1px solid #dcdcdc;
   display:inline-block;
   cursor:pointer;
   color:#777777;
   font-family:Arial;
   font-size:12px;
   font-weight:bold;
   padding:5px 15px;
   text-decoration:none;
   text-shadow:0px 1px 0px #ffffff;
}
.myButton3:hover {
   background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
   background-color:#dfdfdf;
}
.myButton3:active {
   position:relative;
   top:1px;
}
.comment-box{
    width: 760px;
    height: 120px;
    margin-top: 20px;
    border: 1px solid rgb(109, 106, 106);
    border-radius: 10px;
  
    

}
.comment-btn {

    margin-right: auto;
   

    box-shadow:inset 0px 1px 0px 0px #ffffff;
   background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
   background-color:#ededed;
   border-radius:6px;
   border:1px solid #dcdcdc;
   display:inline-block;
   cursor:pointer;
   color:#777777;
   font-family:Arial;
   font-size:12px;
   font-weight:bold;
   padding:5px 15px;
   text-decoration:none;
   text-shadow:0px 1px 0px #ffffff;
  
   
}
.c-icon{
    font-size: 50px;
    margin-left: 20px;
    margin-top: 5px;
  
}
.comment-sbox{
    margin-left:20px;
}
   

.comment-count{
    font-size: 13px;
    margin-bottom: 7px;
    margin-left: 10PX;
}
.txtcontent {
    font-size: 15px;
}
.reComment {
    margin-left:20px;
}
.anonym {
    margin-left:none;
    font-size: 12px;
}
.com-function-btn{
    font-size: 15px;
}
.reCom-sbox {
    margin-left: 83px;
}







     

</style>
<body>
  

    <header id="header">
  <%@ include file="../include/header.jsp" %>
    </header>
    <div class="con">
        <div class="first-box">
            <div class="name_like_box">
                <div class="Board-title"><a href="#">
                					<c:choose>
						<c:when test="${type == 1}">
							<h3>사기업게시판</h3>
						</c:when>
						<c:when test="${type == 2}">
							<h3>공기업게시판</h3>
						</c:when>
						<c:when test="${type == 3}">
							<h3>아시아게시판</h3>
						</c:when>
						<c:when test="${type == 4}">
							<h3>유럽게시판</h3>
						</c:when>
						<c:when test="${type == 5}">
							<h3>남미게시판</h3>
						</c:when>
						<c:when test="${type == 6}">
							<h3>북미게시판</h3>
						</c:when>
						<c:when test="${type == 7}">
							<h3>아프리카</h3>
						</c:when>
						<c:when test="${type == 8}">
							<h3>국가자격증</h3>
						</c:when>
						<c:when test="${type == 9}">
							<h3>민간자격증</h3>
						</c:when>
						<c:when test="${type == 10}">
							<h3>어학게시판</h3>
						</c:when>
						<c:when test="${type == 11}">
							<h3>자유게시판</h3>
						</c:when>
						<c:when test="${type == 12}">
							<h3>취뽀게시판</h3>
						</c:when>
						<c:when test="${type == 13}">
							<h3>취업게시판</h3>
						</c:when>
						<c:when test="${type == 14}">
							<h3>자격증게시판</h3>
						</c:when>
						<c:when test="${type == 15}">
							<h3>자소서게시판</h3>
						</c:when>
					</c:choose>
                </a></div>
                <div class="Like"><i class="fa-solid fa-thumbs-up">좋아요<a href="#">12</a></i></div>
            </div>
            <div class ="second-box">

                <div class="input_box"> 
                    <form action="#">
                        <div class="inner_box1">
                            <span>글번호 : ${board_no} </span>
                            <span>&nbsp; 5</span>
                            <div class="hit_box">
                                <span>Hit : </span>
                                <span>&nbsp; 5</span>
                            </div>
                        </div>
                        <div class="title_box">
                            <span> 제&nbsp;&nbsp;&nbsp;&nbsp;목 : &nbsp;&nbsp;&nbsp; </span>
                            <input type="text" name="" id="" class="title" readonly>
                        </div>
                        <div class="writer_box">
                            <span> 작성자 : &nbsp;&nbsp;&nbsp;  </span>
                            <input class="writer" type="text" name="" id="" readonly> 
                        </div>
                    

                        <div id="contnet">
                            <textarea name="editorTxt" class ="txtcontent" id="classic" 
                                      rows="20" cols="10" 
                                      style="width: 800px" readonly>
                                     최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.</textarea>
                          </div>

        

                    </form>
                </div>
            
                <div class="t-icons">

                    <a href="#" class="myButton3 btn-mod"><i id="like"class="fa-solid fa-thumbs-up"></i></a>
                    <a href="#" class="myButton3 btn-mod"><i id="dislike"class="fa-solid fa-thumbs-down"></i></a>
                </div>
            
                <div class="right-btn">
                    
                    <a href="#" class="myButton3 btn-list">목록</a>
                    <div class ="left-btn">
                        <a href="<c:url value='/board/JBoardUpdate?board_no=${board_no}&board_type=${board_type}'/>" class="myButton3 btn-mod">수정</a>
                          <a href="<c:url value = '/board/JBoardDelete?board_no=${board_no}&board_type=${board_type}'/>" class="myButton3 btn-del">삭제</a>
                    </div>
                </div>
              
                <div class="comment-box">
                    
   		                 <div class="comment-count">댓글 <span id="count">0</span></div>

   		                 	   <span class="c-icon"><i class="fa-solid fa-user"></i> 
	                        <span class="anonym">작성자 : 
	                    	    <input type="text" class="form-control" id="com_writer" placeholder="이름" name ="com_writer"  style="width: 50px">
	                        </span>
	                         
	                        	
	                        </span>
                     <!--<img src="/익명.jpg" width ="50px" alt="My Image"><!-->
                    <span class="comment-sbox">
                        <textarea class="comment-input" id="com_content" cols="80" rows="2" name="com_content"></textarea>
                        <span class="com-function-btn" type="hidden">
                            <a href="#"><i class="fa-solid fa-heart"></i></a>
                            <a href="#"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a href="#"><i class="fa-solid fa-trash-can"></i></a>
                    </span>
                    	<div>
                    		<button id="Comment_regist"> 댓글등록</button>
                    	 </div>

                 
                        <!-- 
                        
                                           <span class="reCom-sbox">
                        <span class="icon-reply">
                            <img src="/replyArrow.jpg" width ="15px" alt="답변">
                        </span>
                        <textarea class ="reComment"name="" value="" cols="65"rows="1" id=""></textarea>
                        <button type="submit" class="registBtn" accesskey="s">글등록</button>

                    </span>   
                        
                  
 
                       
                        <!--<textarea class="reply" cols ="75" rows="1">답글</textarea>-->
                 
                    <!--<div></div><button class="comment-btn">등록</button></div> -->
                </div>   
                
                -->
                
                <div class="comment_Box"> <!-- 댓글이 들어갈 박스 -->
                	
                </div>

            </div><!--secondbox-->
               
 
        </div><!--firstbox-->
       
        
    </div><!--con-->

    <footer id="footer">
	    <%@ include file="../include/footer.jsp" %>
    </footer>
      </body>
      
      
    <script>

   	// 댓글
   	   	$(document).ready(function() {
		
   		$('#Comment_regist').click(function() {
			
   			//Json으로 전달할 파라미터 변수선언
   			const com_bno = ${board_no};
   			const com_writer = $('#com_writer').val();
   			const com_content = $('#com_content').val();
   			
   			console.log(com_bno);
   			console.log(com_writer);
   			console.log(com_content);
   		
   			if(com_writer == '' || com_content == ''){
   				alert('내용을 입력하세요');
   				return;
   			}
   			
   			$.ajax({
   				type:'post',
   				url:'<c:url value="/Comment/InsertComment"/>',
   				data: JSON.stringify(
   					{
   						"com_bno":com_bno,
   						"com_writer":com_writer,
   						"com_content":com_content
   					}		
   				),
   				contentType: 'application/json',
   				success:function(data){
   					console.log('통신성공' + data);
   					$('#com_writer').val('');
   					$('#com_content').val('');
   					getList();
   				},
   				error:function(){
   					alert('통신실패');
   				}
   			});// 댓글 비동기 끝
   			
		});// 댓글등록 이벤트 끝
		

		
		function getList() {
			
			const com_bno = ${board_no};
			
			$.getJSON(
				"<c:url value='/Comment/CommentList/'/>"+com_bno,
				function(data) {
					if(data.total > 0){
						var list = data.list;
						
						var comment_html = "<div>";
						
						$('#count').html(data.total);
						for(i = 0;i < list.length;i++){
							var content = list[i].com_content;
							var writer = list[i].com_writer;
							comment_html += "<span>" + writer + "</span><br/>";
							comment_html += "<span>" + content + "</span>";
							
						}
						
						comment_html += "</div>";
						
						$(".comment_Box").html(comment_html);
					}else{
						var comment_html = "<div>등록된 댓글이 없습니다.</div>";
						$(".comment_Box").html(comment_html);
					}
			
				
				}
			)
		
		}
		
		
	}) ;


	

    </script>

    
 
    
</html>
 
