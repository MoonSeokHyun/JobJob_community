<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ê²ìê¸ì°ê¸°</title>
    <!-- í´ëì ìëí° -->
    <script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
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
      
      /* ìëí° */
      .ck.ck-editor {
    	max-width: 750px;
	}
	.ck-editor__editable {
	    min-height: 400px;
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
    
    <header id="header">

    </header>

    <div class="con">
        <div class="first-box">
            <div class="name_like_box">
                <div class="Board-title"><a href="#">>>ê²ìíì´ë¦</a></div>
                <div class="Like"><i class="fa-solid fa-thumbs-up">ì¢ìì<a href="#">12</a></i></div>
            </div>
            <div class ="second-box">

                <div class="input_box"> 
                    <form action="#">
                        <div class="inner_box1">
                            <span>ê¸ë²í¸ : </span>
                            <span>&nbsp; 5</span>
                            <div class="hit_box">
                                <span>Hit : </span>
                                <span>&nbsp; 5</span>
                            </div>
                        </div>
                        <div class="title_box">
                            <span> ì &nbsp;&nbsp;&nbsp;&nbsp;ëª© : &nbsp;&nbsp;&nbsp; </span>
                            <input type="text" name="" id="" class="title" readonly> 
                        </div>
                        <div class="writer_box">
                            <span> ìì±ì : &nbsp;&nbsp;&nbsp;  </span>
                            <input class="writer" type="text" name="" id="" readonly></input>
                        </div>
                    

                        <div id="contnet">
                            <textarea name="editorTxt" id="classic" 
                                      rows="20" cols="10" 
                                      placeholder="ë´ì©ì ìë ¥í´ì£¼ì¸ì"
                                      style="width: 800px"></textarea>

                             <!-- ì²¨ë¶íì¼(ì´ë¯¸ì§íì¼ë§ ìë¡ëê°ë¥) -->
                            <input type="file" id="u_file" name="u_file" accept="image/*">

                              <!-- ì´ë¯¸ì§ ë¯¸ë¦¬ë³´ê¸° ìì­ -->
                            <div id="imgViewArea" style="margin-top:10px; display:none;">
                                <img id="imgArea" style="width:100px; height:50px;" onerror="imgAreaError()"/>
                            </div>
        
                                

                        </div>
                          
                    </form>
                </div>
            
                <div class="t-icons">

                    <a href="#" class="myButton3 btn-mod"><i id="like"class="fa-solid fa-thumbs-up"></i></a>
                    <a href="#" class="myButton3 btn-mod"><i id="dislike"class="fa-solid fa-thumbs-down"></i></a>
                </div>
            
                <div class="right-btn">
                    
                    <a href="#" class="myButton3 btn-list">ëª©ë¡</a>
                    <div class ="left-btn">
                        <a href="#" class="myButton3 btn-mod">ìì </a>
                        <a href="#" class="myButton3 btn-del">ì­ì </a>
                    </div>
                </div>
                <!--ëê¸-->
                <div class="comment-box">
                    <div class="c-icon"><i class="fa-solid fa-user"></i></div>
                    <div class="comment-count">ëê¸ <span id="count">0</span></div> 
                    <textarea class="comment-input" id="" cols="90" rows="1"></textarea> 
                    <button class="comment-btn">ë±ë¡</button> 
                 </div>   
            
            </div><!--secondbox-->
               
 
        </div><!--firstbox-->
       
        
    </div><!--con-->

    

     <footer id="footer">

    </footer>  
<script>

    $(document).ready(function(){
      $('#header').load("header.html");
      $('#footer').load("footer.html");
        });



    </script>
    <script>
            ClassicEditor
                .create( document.querySelector( '#classic' ))
                .catch( error => {
                    console.error( error );
                } );

            function onLoadedFunction(){
                this.eleTxt.setHtml('<textarea name ="ir1" id=ir1" rows')
            } 
            
             
            
          /* ClassicEditor
            .create (document.querySelector ('#classic'),{
                toolbar:{
                    items: [
                        'heading','|','italic','link','bulletedList',
                        'numberedList','|','indent','outdent','|',
                        'imageUpload','blockQuote','insertTable','mediaEmbed',
                        'undo','redo','expertPdf','fontBackgroundColor',
                        'fontColor','fontSize','fontFamily','highlight','horizontalLine',
                        'underline',

                    ]
                },
                language :'ko',
                imgae:{
                    toolbar: [
                        'imageTextAlternative',
                        'imageStyle:full',
                        'imageStyle:side'
                    ]
                },
                table: {

                    contentToolbar :[
                        'tableColum',
                        'tableRow',
                        'mergeTableCells',
                        'tableCellProperties'

                ]
                },
                ckfinder :{
                    uploadUrl:
                    '/ckeditor/ckeditor5ImageUpload.do'
                }

            })
            .then( editor => {
                window.editor = editor;
            })
            .catch(error => {
                console.error(error);
            });
            */
           
           // ì½íì¸  ìì  :: ì¬ì§ ìì  ì ì´ë¯¸ì§ ë¯¸ë¦¬ë³´ê¸°
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

	// ì´ë¯¸ì§ ìë¬ ì ë¯¸ë¦¬ë³´ê¸°ìì­ ë¯¸ë¸ì¶
	function imgAreaError(){
		$('#imgViewArea').css({ 'display' : 'none' });
	}

            
        </script>

 
    
</html>
 
