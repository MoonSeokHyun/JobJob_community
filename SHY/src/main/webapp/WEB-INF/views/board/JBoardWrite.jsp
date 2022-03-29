<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글쓰기</title>
    <!-- 클래식 에디터 -->


    <script src="https://kit.fontawesome.com/860e355b09.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
</head>

<style>
	input {
		border-radius: 5px;
	}

    .con{
        width: 1200px;
        height: 1000px;
        position: relative;

        
    }
    .first-box{
        width: 900px;
        height: 850px;
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
      
      /* 에디터 */
      .ck.ck-editor {
       max-width: 750px;
   }
   .ck-editor__editable {
       min-height: 280px;
   }
   .ck-editor__editable-inline {
       min-height: 500px;
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
    height: 67px;
    margin-top: 20px;
    border: 1px solid rgb(109, 106, 106);
    border-radius: 10px;
  
    

}
.comment-btn {

    margin-inline-end: auto;
    margin-bottom: 5px;
  
   
}
.c-icon{
    margin-left: 30px;
    margin-top: 5px;
}
.comment-count{
    font-size: 13px;
    margin-bottom: 7px;
}
#imgArea {
    float: left;
}





     

</style>
<body>
	<c:choose>
	    <c:when test="${login == null}">
	    	<script>
	    		alert('회원만 글작성이 가능합니다');
	    		history.back();
	    	</script>
	    </c:when>
    <c:otherwise>
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
            </div>
            <div class ="second-box">

                <div class="input_box"> 
                   <form action="<c:url value ='/board/InsertForm'/>" method="post" enctype="multipart/form-data" name="registForm">
                        <div class="inner_box1">


                        </div>
                        <div class="title_box">
                            <span> 제&nbsp;&nbsp;&nbsp;&nbsp;목 : &nbsp;&nbsp;&nbsp; </span>
                            <input type="text" name="board_title" id="title" class="title" style="width:600px;"> 
                        </div>
                        <div class="writer_box">
                            <span> 작성자 : &nbsp;&nbsp;&nbsp;  <%-- ${login.userId} --%></span>
                            <input class="writer" type="text" name="board_writer" id=""  value="${login.userId}" readonly style="border:none;"></input> 
                        </div>
                        <div class="writer_box">
                            <span>이미지 등록하기</span>
                            <input type="file" id="img_file" name="img_file">
                             <input type="button" id="btn-img-upload" value="등록"/>
                             <span id="img-url"></span>
                        </div>
                    

                        <div id="contnet" style="width:745px;">
                        	<input type="hidden" name="board_content" id="board_content"/>
                            <textarea name="content" id="content" 
                                      rows="20" cols="10"  
                                      placeholder="내용을 입력해주세요"
                            >
                                      
                                      </textarea>

                             <!-- 첨부파일(이미지파일만 업로드가능) -->
                             <!-- <input type="file" id="u_file" name="u_file"> -->

                              <!-- 이미지 미리보기 영역 -->
                            <!-- <div id="imgViewArea" style="margin-top:10px; display:none;">
                                <img id="imgArea" style="width:100px; height:50px;" onerror="imgAreaError()"/>
                            </div> -->
        
                                <input type="hidden" name="board_type" value="${type}">	

                        </div>
                          
                    </form>
                </div>
            
      			<!-- 
      			<div class="t-icons">

                    <a href="#" class="myButton3 btn-mod"><i id="like"class="fa-solid fa-thumbs-up"></i></a>
                    <a href="#" class="myButton3 btn-mod"><i id="dislike"class="fa-solid fa-thumbs-down"></i></a>
                </div>
      			 -->
            
                <div class="right-btn">
                    
                    <a href="#" class="myButton3 btn-list">목록</a>
                    <div class ="left-btn">
                        <a href="#" class="myButton3 btn-mod" id="Regist_btn">작성</a>
                    </div>
                </div>
                <!--뎃글
                <div class="comment-box">
                    <div class="c-icon"><i class="fa-solid fa-user"></i></div>
                    <div class="comment-count">댓글 <span id="count">0</span></div> 
                    <textarea class="comment-input" id="" cols="90" rows="1"></textarea> 
                    <button class="comment-btn">등록</button> 
                 </div>   
            -->
            </div><!--secondbox-->
               
 
        </div><!--firstbox-->
       
        
    </div><!--con-->

      <footer id="footer">
       <%@ include file="../include/footer.jsp" %>
    </footer>
    </c:otherwise>
</c:choose>
    </body>


    <script>
    
    CKEDITOR.replace( 'content' );
    
    $("#btn-img-upload").click(function(){
    	var form = new FormData();
        form.append( "img_file", $("#img_file")[0].files[0] );
        
         jQuery.ajax({
             url : "<c:url value ='/getImgUrl'/>"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
               $("#img-url").text(response);
           }
           ,error: function (jqXHR) 
           { 
               alert(jqXHR.responseText); 
           }
       });
    });
    
    // 글 작성 
    $('#Regist_btn').click(function() {
    	if($("#title").val() === '') {
    		alert('제목을 입력하세요');
    		return;
    	}
    	 /* else if($('#cke_1_contents').val() === '') {
    		alert('내용을 입력하세요');
    		return;
    	}  */
    		
    	$("#board_content").val(CKEDITOR.instances.content.getData());
  
    	
		document.registForm.submit();
	});



   function readURL(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(e) {
            $('#imgArea').attr('src', e.target.result); 
         }
         reader.readAsDataURL(input.files[0]);
      }
   }

   $(":input[name='u_file']").change(function() {
      if( $(":input[name='u_file']").val() == '' ) {
         $('#imgArea').attr('src' , '');  
      }
      $('#imgViewArea').css({ 'display' : '' });
      readURL(this);
   });

   // 이미지 에러 시 미리보기영역 미노출
   function imgAreaError(){
      $('#imgViewArea').css({ 'display' : 'none' });
   }

            
        </script>

 
    
</html>
 