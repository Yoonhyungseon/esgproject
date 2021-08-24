<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2"
				style="font-weight: 900 !important;">Notice</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="index.html">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"
					aria-hidden="true"></span>Notice</li>
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="/table/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="/table/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="/table/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/table/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="/table/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="/table/vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="/table/css/util.css">
<link rel="stylesheet" type="text/css" href="/table/css/main.css">

<div class="limiter">
	<div class="container-table100">
		<div class="wrap-table100">
			<div class="table100 ver1 m-b-110">
				<div class="table100-head">
					<table>
						<thead>
							<tr class="row100 head">
								<th class="cell100 column1">No</th>
								<th class="cell100 column2">제목</th>
								<th class="cell100 column3">작성자</th>
								<th class="cell100 column4">작성일</th>
							</tr>
						</thead>
					</table>
				</div>

				<div class="table100-body js-pscroll">
					<table>
						<tbody id="listClone">
						</tbody>
						<tr class="row100 body" id="listCron" style="display: none;">
							<td class="cell100 column1 req_seq"></td>
							<td class="cell100 column2 req_title"><a href="noticeView"></a></td>
							<td class="cell100 column3 req_Id"></td>
							<td class="cell100 column4 req_regDt"></td>
						</tr>
					</table>
				</div>
				<form id="boardFrm" name="boardFrm" method="post"
					action="/board/noticeView">
					<input type="hidden" id=seq name="seq" value="">
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
    	noticeObj.fn_getNoticeList();
    });
    
	let noticeObj = {
		fn_getNoticeList : function() {
			ajaxParamExecute("", "/board/getNoticeList", "post", false, false, noticeObj.fn_getNoticeListReturn);
		},
		fn_getNoticeListReturn : function(rst) {
 			console.log(rst);
			$('#listClone').html('');
			
			if (rst.resultList.length > 0) {
				for (var i in rst.resultList) {
					
					var html = $('#listCron').clone().removeAttr('title').show();
					
					html.find('.req_seq').text(rst.resultList[i].seq);
				
					html.find('.req_title').text(rst.resultList[i].title);
					html.find('.req_title').attr('onclick', 'noticeObj.fn_view(\''+rst.resultList[i].seq+'\')');
					
					html.find('.req_Id').text(rst.resultList[i].regId);
	               
					html.find('.req_regDt').text(rst.resultList[i].regDtYmd);

					$('#listClone').append(html);
				}
			} else {
				$('#listClone').html('');
			}
		},
		fn_view : function(seq) {
 			console.log(seq);
			$('#seq').val(seq);
			$('#boardFrm').submit();
		}
	}
    </script>


<script src="/table/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="/table/vendor/bootstrap/js/popper.js"></script>
<script src="/table/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/table/vendor/select2/select2.min.js"></script>
<script src="/table/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
	</script>
<script src="js/main.js"></script>
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
