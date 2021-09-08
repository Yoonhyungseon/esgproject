<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<!-- 
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
	height: 15px;
	margin-top: 10px;
}

progress::-webkit-progress-bar {
	background-color: rgb(192, 192, 192);
	width: 100%;
	border-radius: 15px;
}

progress::-webkit-progress-value {
	background-color: #0abf53;
	color: white;
	padding: 1%;
	text-align: right;
	font-size: 20px;
	border-radius: 15px;
}-->
<<style>
.Yrow{
	display: flow-root;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}
</style> 
<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">Board</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="../index">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2" aria-hidden="true"></span>BoardList</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->
<!-- blog section -->
<div class="w3l-blog-sec py-5">
	<div class="services-layout py-md-4 py-3">
		<div class="container">
			<h3 class="title-big mb-4 pb-2">Blog Posts</h3>
			<div class="Yrow">
				<div id="listClone"></div>
				<div id="listCron" style="display: none;">
					<div class="col-lg-4 col-md-6 column column-img" id="zoomIn" style="float: left; margin: 10px 0">
						<div class="services-gd" style="height:400px;">
							<div class="serve-info">
								<h3 class="date"></h3>
								<a class="req_title"><img class="img-responsive" id="req_file" alt="blog-image"></a>
								<h3>
									<a href="#none" id="req_title" class="req_title"></a>
								</h3>
								<ul class="admin-list">
									<li><div id="req_regName"><span	class="fa fa-user-circle" aria-hidden="true"></span></div></li>
									<li id="pick-switch-range" style="font-size: 15px;text-transform: capitalize;">
									<div id="linkSeq" value="" style="display:none;"></div>
		                             	<c:choose>
		                                	<c:when test="${req_likes eq '1'}"> <!--   board_scrapVO.regId!=null   -->
												<a id="pick-switch" value="${linkSeq}"><span class="fa fa-heart req_scrap" aria-hidden="true" style="color:#0abf53;!important"></span></a>
											</c:when>
											<c:otherwise>
												<a id="pick-switch" value="${linkSeq}"><span class="fa fa-heart req_scrap" aria-hidden="true" style="color: #6b6768;"></span></a>
											</c:otherwise>
										</c:choose>
									</li>
									<li style="display: inline-table; font-size: 15px;text-transform: capitalize; color: #6b6768;">
										<span class="fa fa-comments req_comments" aria-hidden="true"></span> Comments</li>
								</ul>
<!-- 								<progress id="progressbar" max="100" value="50"></progress>
 -->							</div>
						</div>
					</div>
				</div>
				<form id="boardFrm" name="boardFrm" method="post" action="/board/textboardView">
					<input type="hidden" id="boardSsn" name="boardSsn" value="">
			</form>
			</div>
			
			<button class="btn button-style d-flex ml-auto"
					onClick="location.href='${pageContext.request.contextPath}textboardWrite'"
					type="submit">Posting</button>
			<!-- pagination -->
			<div class="pagination">
				<ul>
					<li><a href="#none" class="not-allowed" disabled=""> <span
							class="fa fa-angle-double-left" aria-hidden="true"></span>
					</a></li>
					<li><a class="active" href="#page">1</a></li>
					<li><a href="#page">2</a></li>
					<li><a href="#page">3</a></li>
					<li><a href="#page"><span class="fa fa-angle-double-right"
							aria-hidden="true"></span> </a></li>
				</ul>
			</div>
			<!-- //pagination -->
		</div>
	</div>
</div>
<!-- //blog section -->
<script type="text/javascript">
var boardSsn="${boardSsn}";
var regId="${login.name}";
    $(document).ready(function(){
    	boardObj.fn_getBoardList(boardSsn);
    });
  /*   $(document).on("click", "#pick-switch-range", function() {
		//var boardSsn='${boardSsn}';
		boardObj.fn_scrap("${linkSeq}");
	}); */
	let boardObj = {
		fn_getBoardList : function(boardSsn) {
			var param="boardSsn="+boardSsn;
			ajaxParamExecute(param, "/board/getBoardList", "post", false, false, boardObj.fn_getBoardListReturn);
		},
		fn_getBoardListReturn : function(rst) {
 			console.log(rst);
 			$('#listClone').html('');
 						
			if (rst.resultList.length > 0) {
				for (var i in rst.resultList) {
					
					var html = $('#listCron').clone().removeAttr('title').show();
									    
					html.find('#req_title').text(rst.resultList[i].title);
					html.find('.req_title').attr('onclick', 'boardObj.fn_view(\''+rst.resultList[i].boardSsn+'\')');
	               
					html.find('.date').text(rst.resultList[i].regDtYmd);

					html.find('.req_comments').text(rst.resultList[i].comments);
					
					html.find('#req_file').attr("src", "/common/imageload?fullImageFileNm="+rst.resultList[i].attFile);

					html.find('#req_regName').text(rst.resultList[i].uName);

					html.find('.req_scrap').text(rst.resultList[i].scraps);

					html.find('.req_likes').text(rst.resultList[i].likes);

					html.find('#linkSeq').text(rst.resultList[i].boardSsn);
					
					$('#listClone').append(html); 
				}
			} else {
				$('#listClone').html('');
			}
		},
		fn_view : function(boardSsn) {
 			console.log(boardSsn);
			$('#boardSsn').val(boardSsn);
			$('#boardFrm').submit();
		}/* ,
		fn_scrap : function(boardSsn){
			console.log(boardSsn);
			//var boardSsn = $(this).children().attr('value');
			$('#linkSeq').val('${boardSsn}');
    		var cParam = "linkSeq="+'${boardSsn}';
    		console.log(cParam);
			ajaxParamExecute(cParam, "/board/updateScrap", "post", false, false, boardObj.fn_scrapReturn);
		},
		fn_scrapReturn : function(result){
			console.log(result);
			if(result.like == '0'){
				$(this).children("#pick-switch").html("<span class='fa fa-heart'/>");
			}else if(result.like == '1'){
				$(this).children("#pick-switch").html("<span class='fa fa-heart' style='color: #0abf53;'/>");
			}
		} */
	}

</script>
<script type="text/javascript">
$(document).on("click", "#pick-switch-range", function() {
		//var linkSeq = "${boardSsn}";
		var linkSeq = $(this).children().attr('value');
		//var linkSeq = $(this).children().val('${boardSsn}');
		
		alert(linkSeq);
		$.ajax({
			type:"post",
			data:{ "linkSeq" : linkSeq},
			dataType:"json",
			url:"/board/updateScrap",
			context : this, 
			success:function(result){
				if(result.like == '0'){
					$(this).children("#pick-switch").html("<span class='fa fa-heart'/>");
				}else if(result.like == '1'){
					$(this).children("#pick-switch").html("<span class='fa fa-heart' style='color: #0abf53;'/>");
				}
			}
		});
	});
</script>
											
											<!-- bootstrap javascipt -->
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
