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
    <script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
    <script src="https://kit.fontawesome.com/860e355b09.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<style>
    .con{
        width: 1200px;
        
         position: relative; 
      margin-bottom:50px;
        
    }
    .clearfix::after {
       display:block;
       content:'';
       clear:both;
    }
    .first-box{
        width: 900px;
        box-shadow: 5px 5px 5px gray;
        margin: 50px auto 50px;
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
    }
    
    .Hate {
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
       height: 100%
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
    /* .left-btn {
        margin-left: 550px;
        display: inline-block;

    } */
    
    /* .c-icon {
       float: left;
       /* display: inline-block; 
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
           right: 235px; 
           top:100px;
        /*  float: right; */ 
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
.
.myButton3:active {
   /* position:relative; */
   top:1px;
}
.comment-box{
    width: 760px;
    height: 120px;
    margin-top: 20px;
    border: 1px solid rgb(109, 106, 106);
    border-radius: 10px;
     padding: 15px;
    box-sizine:border-box;
   position:relative;
}
.regBtn {
   position:absolute;
   top: 70px;
   left: 660px;
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
/* .c-icon{
    font-size: 50px;
    margin-left: 20px;
    margin-top: 5px;
  
} */
.comment-sbox{
    margin-left:20px;
    width:600px;
}
   

.comment-count{
    font-size: 13px;
    /* margin-bottom: 7px;
    margin-left: 10PX; */
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

.comment-name {
   display: inline-block;
   margin-bottom:-40px;
}
.comment-sbox {
   display: block;
   margin-left:0;
}
.comment_Box {
   display: block;
   width: 760px;
   margin-top:20px;
   margin-bottom:20px;
   padding:15px;
   border-radius: 3px;
   background-color:#FAFAFA
}
.comment_Box hr {
   margin-top: 5px;
   /* background-color:#FF9DFF; */
   height:3px;
}
/* .comment_Box span {
   display: block;
} */

.comment-input {
   width: 630px;
   resize:none;
}

.likeHateCol {
   background: #b193df;
}     

.left-btn {
   margin-left: 430px;
   display: inline-block;
}

</style>
<body>
  

    <header id="header">
  <%@ include file="../include/header.jsp" %>
    </header>
    <div class="con">
        <div class="first-box clearfix">
            <div class="name_like_box ">
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
                <div class="Like">
                  <i class="fa-solid fa-thumbs-up">&nbsp;&nbsp;&nbsp;<span id ="like_cnt">${boardDetail.board_like}</span></i>
               </div>
               <br>
               <div class="Hate">
                  <i class="fa-solid fa-thumbs-down">&nbsp;&nbsp;&nbsp;<span id ="hate_cnt">${boardDetail.board_hate}</span></i>
               </div>
            </div>
            <div class ="second-box">

                <div class="input_box"> 
                    <form action="#">
                    <input type="hidden" id="like_hate" name="like_hate" value="${boardDetail.like_hate}" />
                        <div class="inner_box1" style="font-size:13px; margin-bottom:20px;">
                            <span>글번호 :  </span>
                            <span>&nbsp;${boardDetail.board_no}</span>
                            <div class="hit_box">
                                <span>Hit : </span>
                                <span>&nbsp; ${boardDetail.board_hit}</span>
                            </div>
                        </div>
                        <div class="title_box">
                            <span style="font-size:25px;"> 제&nbsp;&nbsp;&nbsp;&nbsp;목 : &nbsp;&nbsp;&nbsp; </span>
                            <input type="text" name="" id="" class="title" value="${boardDetail.board_title}" readonly style="border:none; font-size:25px; font-weight:bold;">
                        </div>
                        <div class="writer_box">
                            <span> 작성자 : &nbsp;&nbsp;&nbsp;  </span>
                            <input class="writer" type="text" name="" id="" value="${boardDetail.board_writer }" readonly style="border:none;"> 
                        </div>
                    

                        <div id="contnet" style="border:1px solid gray; width:750px; height:450px; border-radius:3px; padding-left:15px;">
                           <c:out value="${boardDetail.board_content}" escapeXml="false" />

                          </div>

        

                    </form>
                </div>
            
                <div class="t-icons">

                    <a href="javascript:;" onclick="like_hate('LIKE')" class="myButton3 like_col"><i class="fa-solid fa-thumbs-up"></i></a>
               <a href="javascript:;" onclick="like_hate('HATE')" class="myButton3 hate_col"><i class="fa-solid fa-thumbs-down"></i></a>
                </div>
            
                <div class="right-btn">
                    
                    <a href="<c:url value='/board/JBoardList?board_type=${board_type}' />" class="myButton3 btn-list">목록</a>
                    <a href="#" class="myButton3 btn-scrap" id="btn">스크랩</a>
                    <div class ="left-btn">
                       <a href="<c:url value='/board/JBoardUpdate?board_no=${board_no}&board_type=${board_type}&board_writer=${boardDetail.board_writer}'/>"
                     class="myButton3 btn-mod">수정</a> 
                  <a href="<c:url value = '/board/JBoardDelete?board_no=${board_no}&board_type=${board_type}&board_writer=${boardDetail.board_writer}'/>"
                     class="myButton3 btn-del">삭제</a>
                    </div>
                </div>
              
                <div class="comment-box">
                    
                          <div class="comment-count">댓글 <span id="count">0</span></div>

                                <!-- <span class="c-icon"><i class="fa-solid fa-user"></i>  -->
                          <div class="comment-name">
                           <span class="anonym">작성자 : 
                              <input type="text" class="form-control" id="com_writer" placeholder="이름" name ="com_writer" value='${login.userId}' readonly  style="width: 100px; border:none;">
                           </span>
                         </div>   
                              
                           <!-- </span> -->
                     <!--<img src="/익명.jpg" width ="50px" alt="My Image"><!-->
                    <div class="comment-sbox">
                        <textarea class="comment-input" id="com_content" cols="80" rows="2" name="com_content" ></textarea>
                        <!-- <span class="com-function-btn" type="hidden">
                            
                            <a href="#"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a href="#"><i class="fa-solid fa-trash-can"></i></a>
                         </span> -->
                    </div>
                       <div class="regBtn">
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
                   <div class="comment_Box" style="border:1px solid gray;"> <!-- 댓글이 들어갈 박스 -->

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
               
         //<c:url value='/script/myRecord?board_no=${board_no}&board_type=${board_type}&board_writer=${boardDetail.board_writer}' />
            $('.btn-scrap').click(function(){
               const scrap_Id = $('.writer').val();
               const uses_Id = '${login.userId}';
               const scrap_type = ${board_type};
               const bno_sc = ${board_no};
               
               console.log(bno_sc);
               console.log(scrap_Id);
               console.log(uses_Id);
               console.log(scrap_type);
               
               const info = {
                     "bno_sc":bno_sc,
                        "scrap_Id":scrap_Id,
                        "uses_Id":uses_Id,
                        "scrap_type":scrap_type
                        };
               
               $.ajax({
                  type:'post',
                     url:'<c:url value="/scrap/insertScript"/>',
                     data: JSON.stringify(info),
                     contentType: 'application/json',
                     success:function(data){
                        console.log('통신성공');
                        if(data === 'suc') {
                           alert('스크랩하였습니다.');
                           console.log('스크랩 완료');
                        } else {
                           alert('로그인 이후 이용해주시기 바랍니다.');
                        }
                        
                     },
                     error:function(status, error){
                        /* alert('통신실패'); */
                        console.log('스크랩 실패');
                        console.log('info : '+info);
                        console.log(status, error);
                     }
               });//scrap ajax end
               
               
            });//btn-scrap end 스크랩버튼 클릭시
               
         //처음 좋아요 싫어요 눌렀는지 안눌렀는지 버튼 색
               var nowStatus = $("#like_hate").val();
               
               if("LIKE" == nowStatus){ 
                  $(".like_col").addClass("likeHateCol");
               } else if("HATE" == nowStatus) {
                  $(".hate_col").addClass("likeHateCol");   
               }
      
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
                  if(data === 'InsertSuccess') {
                     alert('댓글 등록이 완료되었습니다.');
                     console.log('댓글 등록 완료');
                     $('#com_writer').val(com_writer);
                        $('#com_content').val('');
                        getList();
                  } else {
                     alert('로그인 이후 이용해주시기 바랍니다.');
                     console.log('댓글 등록 실패');
                  }
               },
               error:function(){
                  alert('통신실패');
               }
            });// 댓글 비동기 끝
            
      });// 댓글등록 이벤트 끝
      
      getList();

      
      function getList() {
         
         const com_bno = ${board_no};
         const com_writer = $('#com_writer').val();
            const com_content = $('#com_content').val();
            /* const com_no = ${com}; */
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
                     comment_html += "<div><span id='com_writer'><strong>" + writer + "</strong></span><br/>";
                     comment_html += "<span id='com-content'>" + content + "</span><br>";
                     if(writer === $("#com_writer").val()){
                         comment_html += "<span id='delete' style='cursor:pointer;' data-id ="+content+">[삭제]</span><br></div><hr>";
                         
                     }
                     else{
                        comment_html += "</div><hr>";
                     }
                  }
                  
                  $(".comment_Box").html(comment_html);
                  
                  
               }
               else{
                  var comment_html = "<div>등록된 댓글이 없습니다.</div>";
                  $(".comment_Box").html(comment_html);
               }
         
            
            }
            );//getJson
         
      
      };//fucntion getList
      
      
      
      
      //댓글 삭제
      $(document).on("click", "#delete", function(){
         /* const com_bno = ${board_no}; */
         const com_writer = $('#com_writer').val();
            /* const com_content =$('#com-content').text(); */
            const com_content =$(this).data("id");
            console.log(com_content);
         alert('댓글을 삭제하시겠습니까?');
         console.log('댓글삭제');
         console.log(com_content);
                 $.ajax({
                     type:'post',
                     url:'<c:url value="/comment/commentDelete"/>',
                     data:JSON.stringify(
                        {
                           /* "com_bno":com_bno, */
                           "com_writer":com_writer,
                           "com_content":com_content
                        }      
                     ),
                     contentType: 'application/json',
                     success:function(data){
                        console.log('통신성공'+data);
                        alert('댓글이 삭제되었습니다');
                        getList();
                     },
                     error:function(){
                        alert('통신실패');
                     }
                  }); //댓글 삭제 비동기
           
      });

      
      
      
      
      
   }) ;//jquery


   //좋아요,싫어요 
   var totLikeCnt = ${boardDetail.board_like};
   var totHateCnt = ${boardDetail.board_hate};
   
   
   function like_hate(param) {
      var org_like_hate = $("#like_hate").val();
      var ck_like_hate = param;
      
      var data = {"org_like_hate":org_like_hate,
               "ck_like_hate":ck_like_hate,
               "board_no":${boardDetail.board_no},
               "board_type":${boardDetail.board_type}}
      $.ajax({
         type: 'POST',
         url:'<c:url value="/board/likeHateCnt"/>',
          data : data,
         success : function(data) {
            
            if(data != "error") {
               fnSuccess(ck_like_hate,data);
            } else {
               alert("에러발생");
            }
         }
      });
   }//like_hate(param)
      //좋아요, 싫어요 색 표시 , 카운트
      function fnSuccess(ck_like_hate, param){
         const org_like_hate = $("#like_hate").val();
         
         if("LIKE" == ck_like_hate){
            if(org_like_hate === "LIKE") {
               $(".like_").css("background","#ededed");
               $(".like_col").removeClass("likeHateCol");
               //상단 좋아요 카운트 감소
               totLikeCnt = totLikeCnt-1;
               $("#like_cnt").html(totLikeCnt);
            } else if(org_like_hate === "HATE") {
               $(".like_col").addClass("likeHateCol");
               $(".hate_col").removeClass("likeHateCol");
               //상단 좋아요 카운트 추가 , 싫어요 카운트 감소
               totLikeCnt = totLikeCnt+1;
               totHateCnt = totHateCnt-1;
               $("#like_cnt").html(totLikeCnt);
               $("#hate_cnt").html(totHateCnt);
            } else {
               $(".like_col").addClass("likeHateCol");
               //상단 좋아요 카운트 추가
               totLikeCnt = totLikeCnt+1;
               $("#like_cnt").html(totLikeCnt);
            }
         }else{
            if(org_like_hate === "HATE") {
               $(".hate_col").removeClass("likeHateCol");
               //상단 싫어요 카운트 감소
               totHateCnt = totHateCnt-1;
               $("#hate_cnt").html(totHateCnt);
            } else if(org_like_hate === "LIKE") {
               $(".hate_col").addClass("likeHateCol");
               $(".like_col").removeClass("likeHateCol");
               //상단 싫어요 카운트 추가 , 좋아요 카운트 감소
               totHateCnt = totHateCnt+1;
               totLikeCnt = totLikeCnt-1;
               $("#hate_cnt").html(totHateCnt);
               $("#like_cnt").html(totLikeCnt);
            } else {
               $(".hate_col").addClass("likeHateCol");
               //상단 싫어요 카운트 추가
               totHateCnt = totHateCnt+1;
               $("#hate_cnt").html(totHateCnt);
            }
         }
         $("#like_hate").val(param);
      }////좋아요, 싫어요 색 표시 , 카운트

    </script>

    
 
    
</html>
 