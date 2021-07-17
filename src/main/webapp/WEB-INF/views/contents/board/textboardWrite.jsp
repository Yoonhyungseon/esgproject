<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		CKEDITOR.replace('ckeditor', {
			width : '70%',
			height : '200px',
		});
	});
</script>
<style>
.container {
	width: 750px%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}
</style>

<!-- inner banner -->
<div class="inner-banner">
	<section class="w3l-breadcrumb">
		<div class="container">
			<h4 class="inner-text-title font-weight-bold mb-sm-3 mb-2">Board</h4>
			<ul class="breadcrumbs-custom-path">
				<li><a href="../index">Home</a></li>
				<li class="active"><span class="fa fa-chevron-right mx-2"aria-hidden="true"></span>Upload Posting</li>
				
			</ul>
		</div>
	</section>
</div>
<!-- //inner banner -->

<!-- Write Posting -->
<section class="w3l-form-comments-sec mt-5 ">
	<div class="container ">
		<h3 class="title-big mb-4 pb-2">Write your posting</h3>
		<div class="form-commets">
			<form action="#" method="post" id="form" name="form" class="main-input" action="" enctype="multipart/form-data">
				<div class="row mb-4">
					<div class="col-md-6">
						<input type="text" name="Title" required="Title"
							placeholder="Posting Title">
					</div>
					<br>
					<div class="col-md-6 mt-md-0 mt-4">
						<input type="file" name="postImage" placeholder="Posting Image">
					</div>
				</div>
				<textarea name="content" id="ckeditor" placeholder="Write your contents here"></textarea>
				<button class="btn button-style d-flex ml-auto" type="submit">Posting</button>
			</form>
		</div>
	</div>
</section>
<!-- //Write Posting -->
<!--script-->
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
</script><!-- //move top -->
