<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>

<script src="js/jquery.js" type="text/javascript">
	$(document).ready(function() {
 	var progressbar = $('#progressbar'),
    max = progressbar.attr('max'),
    value = progressbar.val();
};
</script>
<style>
progress {
	width: 100%;
	margin: auto;
	margin-top: 3px;
}

progress::-webkit-progress-bar {
	background-color: rgb(192, 192, 192);
	width: 100%;
	border-radius: 15px;
}

progress::-webkit-progress-value {
	background-color:  #0abf53;
	color: white;
	padding: 1%;
	text-align: right;
	font-size: 20px;
	border-radius: 15px;
}
</style>

<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">Blog
				Single</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>Blog Single</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->
<!-- blog single -->
<section class="w3l-blog-single py-5">
	<div class="single-blog sec-padding py-md-4 py-3">
		<div class="container">
			<div class="req_seq" style="display: none"></div>
			<div class="single-bottom-blog">
				<h3 id="req_date" class="date"></h3>
				<div class="blog-img-single">
					<img id="req_file" class="img-fluid img-responsive" style="width:50%;"/>
				</div>

				<div class="bottom-grid mt-4 pt-2">
					<h3 id="req_title"></h3>

					<p id="req_content"></p>
				</div>
				<!-- bottom -->
				
				<!-- <progress id="progressbar" max="100" value="50"></progress> -->

				<div
					class="blog-single-tags d-flex align-items-center mt-4 pt-1 mb-5">
					<div class="blog-tags">
						<ul>
							<li class="text-tag">Tags:</li>
							<!-- 나중에 Hashtag기능 구현하면 눌렀을때 같은 해쉬테그를 가진 글 검색 -->
							<li><a id="req_hash"></a></li>
						</ul>
					</div>
				</div>
				<!--  <div class="single-pagination clearfix">
					<a class="prev-post pull-left" href="#prev"><span
						class="fa fa-arrow-left" aria-hidden="true"></span> Previous Post</a>
					<a class="next-post pull-right" href="#next">Next Post <span
						class="fa fa-arrow-right" aria-hidden="true"></span></a>
				</div> -->
				<div class="single-pagination clearfix">
				
					<div class="btn_right" style="float: right;  display:flex;">
						
						<form method="post" id="deleteFrm"> 
						<div id="deletBtn">	
							<button class="btn button-style d-flex ml-auto" onclick="boardObj.fn_delete()" style="margin: 20px 0; color: #fff;">삭제</button>
<!-- 			                 <a class="btn button-style d-flex ml-auto" id="deletBtn" onclick="boardObj.fn_delete()" style="color: #fff; display:none;">삭제</a>-->
						</div>	
		             	</form>
 					
						<a class="btn button-style d-flex ml-auto" href="textboardList" style="color: #fff;">목록</a>						
					</div>
				</div>
				
				<!-- //blog single -->
				<!-- feedback -->
				<section class="w3l-comments-9-main mt-5">
					<form id="fbFrm" name="fbFrm" method="post" action="/board/textboardView">
						<input type="hidden" id="linkSeq" name="boardSsn" value="">
						<div class="row">
							<div id="fbClone"></div>
							<div id="fbCron" style="display: none;">
								<div class="gallery-32">
								<div style="display: -webkit-box;">
									<h3 class="title-main2-blog-single">Feedback</h3>
								</div>
								<div class="comment-grid" style="width: 950px; display: flow-root;">
									<h4 id="fb_title"></h4>
									<i class="fa fa-quote-left" aria-hidden="true"></i> 
									<p id="fb_contents" style="margin-left: 50px;"></p>
									<div class="testi-pos mt-3 d-flex align-items-center" style="float: right;">
										<div class="right-coment">
											<span id="fb_dt"></span>
										</div>
									</div>
								</div>
								</div>
							</div>
						</div>
					</form>
				</section>
				<!-- //feedback -->
				<!-- comments section blog single -->
				<br><br>
					<section class="w3l-comments-9-main mt-5">
						<div class="gallery-32">
						<div style="display: -webkit-box;">
							<h3 class="title-main2-blog-single">Comments</h3>(<h4 id="req_comments" style="padding-top: 6px;display: inline-flex;"></h4>)
						</div>
						<form id="boardFrm" name="boardFrm" method="post" action="/board/textboardView">
							<input type="hidden" id="linkSeq" name="boardSsn" value="">
							<div class="row">
								<div id="listClone" style="display: contents;"></div>
								<div class="col-md-6 mt-4" id="listCron" style="display: none;">
									<div class="comment-grid">
										<p id="req_contents" style="overflow: hidden; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; height: 5rem;">
											<i class="fa fa-quote-left" aria-hidden="true"></i> 
										</p>
										<div class="testi-pos mt-3 d-flex align-items-center">
											<div class="right-coment">
												<h4 id="req_regNm"></h4>
												<span id="req_dt"></span>
											</div>
										</div>
										<a href="#reply" class="reply-blog"><i class="fa fa-reply"></i>Reply</a>
									</div>
								</div>
							</div>
							</form>
						</div>
					</section>
			
				<!-- comments section blog single -->
				<!-- comments form blog single -->
				
				<section class="w3l-form-comments-sec mt-5">
					<div class="coments-forms-sub">
						<h3 class="title-main2-blog-single">Leave A Message</h3>
						<div class="form-commets">
							<sec:authorize access="isAuthenticated()">
							<form name="commentFrm" action="/board/postComment" method="post" data-parsley-validate>
								<!-- <div class="row mb-4">
									<div class="col-md-6">
										<input type="text" name="Name" required="Name"
											placeholder="Your Name">
									</div>
									<div class="col-md-6 mt-md-0 mt-4">
										<input type="email" name="Email" required="Email"
											placeholder="Your Email">
									</div>
								</div> -->

                  			<%-- 	<input type="hidden" id="regNm">
                  				<%=request.getAttribute("regNm") %> --%>
<%--                   				 <c:if test="${account ne null }">
 --%>			                 <%-- var userName='<%=(String)session.getAttribute(name) %> --%>
 						<%-- 		<%
								    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
								    Object principal = authentication.getPrincipal();
								    String loginUserName = "";
								    if(principal != null) {
								    	loginUserName = authentication.getName();
								    }
								%> --%>
<%--  								<input id="regNm" name="regNm" value='<%=loginUserName %>'>
 --%>			                <sec:authentication property="principal" var="login"/>
			                  	<input type="hidden" id="regNm" name="regNm" value="${login.username}">
								<input type="hidden" id="linkSeq" name="linkSeq" value="">
								<textarea name="Message" id="contents" required="required"
									placeholder="Write your comments here"></textarea>
								<button class="btn button-style d-flex ml-auto" type="button" onclick="saveComment()">Post	comment</button>
							</form>
							</sec:authorize>
							<sec:authorize access="isAnonymous()">
								<div style="display: flow-root;">
									<div>로그인 하시면 댓글을 남길 수 있습니다.</div>
								    <div class="form-group-2 mt-4 login-button find-id-mention-button">
						                <button type="button" id="btn_login" name="btn_login" class="btn button-style d-flex ml-auto" onclick="location.href='/member/login'">로그인</button>
						            </div>
						    	</div>
							</sec:authorize>
						</div>
					</div>
				</section>
				
					
				<!-- //comments form blog single -->
			</div>
		</div>
	</div>
</section>

<!-- //blog single -->
<script type="text/javascript">
var boardSsn="${boardSsn}";
    $(document).ready(function(){
    	boardObj.fn_getBoardInfo(boardSsn);
    	boardObj.fn_getCommentList("${linkSeq}");
    	boardObj.fn_getFeedbackList("${linkSeq}");
    });
    
    let boardObj = {
    	fn_getBoardInfo : function(boardSsn) {
    		console.log(boardSsn);
    		var param = "boardSsn="+boardSsn;
			ajaxParamExecute(param, "/board/getBoardInfo", "post", false, false, boardObj.fn_getBoardInfoReturn);
		},
		fn_getBoardInfoReturn : function(rst) {
 			console.log(rst)
 			//$('#req_seq').text(rst.resultInfo.seq);
 			$('#req_title').text(rst.resultInfo.title);
 			$('#req_date').text(rst.resultInfo.regDtYmd);
 			if(rst.resultInfo.attFile != null){
 				$('#req_file').show()
 				$('#req_file').attr("src", "/common/imageload?fullImageFileNm="+rst.resultInfo.attFile);
 			}
 			$('#req_hash').text(rst.resultInfo.hashTag);
 			$('#req_content').html(rst.resultInfo.contents);
 			$('#req_comments').text(rst.resultInfo.comments);
  			if(rst.userInfo == rst.resultInfo.id){
 				//console.log("내가 쓴글!!!");
 				$('#deletBtn').show();
 			}else{
 				//console.log("내가 쓴글 아님!!!");
 				$('#deletBtn').hide();
 			} 			
		},
		fn_getCommentList : function() {
			$('#linkSeq').val('${boardSsn}');
    		var cParam = "linkSeq="+'${boardSsn}';
    		console.log(cParam);
			ajaxParamExecute(cParam, "/board/getCommentList", "post", false, false, boardObj.fn_getCommentListReturn);
		},
		fn_getCommentListReturn : function(rst) {
 			console.log(rst)
 			$('#listClone').html('');
 						
			if (rst.resultList.length > 0) {
				for (var i in rst.resultList) {
					
					var html = $('#listCron').clone().removeAttr('contents').show();

					html.find('#req_contents').text(rst.resultList[i].contents);
					 
					html.find('#req_regNm').text(rst.resultList[i].regNm);
						
					html.find('#req_dt').text(rst.resultList[i].regDtYmd);

					$('#listClone').append(html); 
				}
			} else {
				$('#listClone').html(''); 			
			}
	    },
		fn_view : function() {
			$("#commentFrm").prop("action", "/board/textboardView");
			$("#commentFrm").submit();
		},
		fn_delete : function() {
		     if (confirm("삭제하시겠습니까?")) {
		            alert("삭제되었습니다.");
		            
		        	var param = "boardSsn="+boardSsn;
					ajaxParamExecute(param, "/board/deletePosting", "post", false, false, boardObj.fn_deleteReturn);
		        }
		},
		fn_deleteReturn : function(rst) {
	//		console.log(rst);
			$('#deleteFrm').attr('action','/board/textboardList');
			$('#deleteFrm').submit();
		},
		fn_getFeedbackList : function() {
			$('#linkSeq').val('${boardSsn}');
			var cParam = "linkSeq="+'${boardSsn}';
			console.log(cParam);
			ajaxParamExecute(cParam, "/board/getFeedback", "post", false, false, boardObj.fn_getFeedbackListReturn);
		},
		fn_getFeedbackListReturn : function(rst) {
			//console.log(rst);
			$('#fbClone').html('');
							
			if (rst.resultList.length > 0) {
				for (var i in rst.resultList) {
					
					var html = $('#fbCron').clone().removeAttr('contents').show();
	
					html.find('#fb_title').text(rst.resultList[i].title);
					
					html.find('#fb_contents').text(rst.resultList[i].contents);
					 					
					html.find('#fb_dt').text(rst.resultList[i].regDtYmd);
	
					$('#fbClone').append(html); 
				}
			} else {
				$('#fbClone').html(''); 			
			}
		}
 }
    function saveComment(){
		var linkSeq = $('#linkSeq').val('${boardSsn}');
		var contents = $('#contents').val();

		if(!contents){
			alert("댓글 입력해주세요.");
			$("#contents").focus();
		}else {
			saveReturn();
		}
	}
	function saveReturn(){
		$.ajax({
			url : "/board/postComment",
			type : 'POST',
			data : {
				"regNm" : $("#regNm").val(),
				"linkSeq" : ${boardSsn},
				"contents" : $("#contents").val()
			},
			success : function(data){
				if(data == true){
					alert("댓글이 등록되었습니다.");
					location.reload();
				} else {
					alert("댓글 등록 실패");
				}
			}
		})
	}
   /*  fn_save : function() {
    	if (!$('#contents').val() || !$('#contents').val().trim()) {
			alert("댓글을 입력해주세요.");
			$('#contents').focus();
			return false;
		}
    	if (confirm('등록하시겠습니까?'))
    		ajaxFormExecute("commentFrm", "/board/postComment", "post", false,	false, boardObj.fn_saveReturn);
    },	
    fn_saveReturn : function(rst) {
		if (rst) {
			alert('등록되었습니다.');
			console.log(rst);
			boardObj.fn_view();
		} else {
			alert('등록에 실패하였습니다. \n관리자에게 문의바랍니다.');
		}
	} */
</script>
<!-- Js scripts -->
<!-- move top -->
<button onclick="topFunction()" id="movetop" title="Go to top">
	<span class="fa fa-level-up" aria-hidden="true"></span>
</button>
<script>
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function () {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("movetop").style.display = "block";
            } else {
                document.getElementById("movetop").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
    </script>
<!-- //move top -->

<!-- common jquery plugin -->
<script src="assets/js/jquery-3.3.1.min.js"></script>
<!-- //common jquery plugin -->

<!-- theme switch js (light and dark)-->
<script src="assets/js/theme-change.js"></script>
<script>
        function autoType(elementClass, typingSpeed) {
            var thhis = $(elementClass);
            thhis.css({
                "position": "relative",
                "display": "inline-block"
            });
            thhis.prepend('<div class="cursor" style="right: initial; left:0;"></div>');
            thhis = thhis.find(".text-js");
            var text = thhis.text().trim().split('');
            var amntOfChars = text.length;
            var newString = "";
            thhis.text("|");
            setTimeout(function () {
                thhis.css("opacity", 1);
                thhis.prev().removeAttr("style");
                thhis.text("");
                for (var i = 0; i < amntOfChars; i++) {
                    (function (i, char) {
                        setTimeout(function () {
                            newString += char;
                            thhis.text(newString);
                        }, i * typingSpeed);
                    })(i + 1, text[i]);
                }
            }, 1500);
        }

        $(document).ready(function () {
            // Now to start autoTyping just call the autoType function with the 
            // class of outer div
            // The second paramter is the speed between each letter is typed.   
            autoType(".type-js", 200);
        });
    </script>
<!-- //theme switch js (light and dark)-->

<!-- MENU-JS -->
<script>
        $(window).on("scroll", function () {
            var scroll = $(window).scrollTop();

            if (scroll >= 80) {
                $("#site-header").addClass("nav-fixed");
            } else {
                $("#site-header").removeClass("nav-fixed");
            }
        });

        //Main navigation Active Class Add Remove
        $(".navbar-toggler").on("click", function () {
            $("header").toggleClass("active");
        });
        $(document).on("ready", function () {
            if ($(window).width() > 991) {
                $("header").removeClass("active");
            }
            $(window).on("resize", function () {
                if ($(window).width() > 991) {
                    $("header").removeClass("active");
                }
            });
        });
    </script>
<!-- //MENU-JS -->

<!-- disable body scroll which navbar is in active -->
<script>
        $(function () {
            $('.navbar-toggler').click(function () {
                $('body').toggleClass('noscroll');
            })
        });
    </script>
<!-- //disable body scroll which navbar is in active -->
<!--bootstrap-->
<script src="assets/js/bootstrap.min.js"></script>
<!-- //bootstrap-->
<!-- //Js scripts -->
