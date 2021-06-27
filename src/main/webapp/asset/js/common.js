$(document).ready(function() {
	$(document).on("keyup", ".numberOnly", function() {
        $(this).val($(this).val().replace(/[^0-9]/gi, ""));
    });

	$.namespace = function() {
		var a = arguments, o = null, i, j, d;
		for (i = 0; i < a.length; i = i + 1) {
			d = a[i].split(".");
			o = window;
			for (j = 0; j < d.length; j = j + 1) {
				o[d[j]] = o[d[j]] || {};
				o = o[d[j]];
			}
		}
		return o;
	};

	$.namespace("App");
	App = {
		init: function() {
			App.chkBrowser();
			$("#wrap").addClass("loaded");
		},
		chkBrowser: function() {
			// 브라우저 및 버전을 구하기 위한 변수들.
			'use strict';

			if (/Android/i.test(navigator.userAgent)) {
				// 안드로이드
				$("body").addClass("android");
			} else if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
				// iOS 아이폰, 아이패드, 아이팟
				$("body").addClass("ios");
			}

			$(window).resize(function() {
				if (/Android/i.test(navigator.userAgent)) {
					// 안드로이드
					$("body").addClass("android");
				} else if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
					// iOS 아이폰, 아이패드, 아이팟
					$("body").addClass("ios");
				} else {
					$("body").removeClass("ios android");
				}
			});
		}
	}

	// 스크롤한방향 체크
	window.__scrollPosition = document.documentElement.scrollTop || 0;
	document.addEventListener('scroll', function() {
		let _documentY = document.documentElement.scrollTop;
		let _direction = _documentY - window.__scrollPosition >= 0 ? 1 : -1;
		windowTop = $(window).scrollTop();

		floating_banner();

		if (_direction < 0) {
			// scroll up
		}
		else {
			// scroll down
		}
		window.__scrollPosition = _documentY; // Update scrollY
	});

	// gnb 상단 고정시 사용
	// $(window).scroll(function(){
	// 	sct = $(window).scrollTop();
	// 	var navTop = $(".header_main").outerHeight(true);

	// 	if(sct >= navTop){
	// 		$(".gnb_wrap").css({
	// 			position:'fixed'
	// 		});
	// 		$("#container").addClass("fixed");
	// 	}else {
	// 		$(".gnb_wrap").css({
	// 			position:'relative'
	// 		});
	// 		$("#container").removeClass("fixed");
	// 	}
	// });

	// var wd_wd = $(window).outerWidth();
	// console.log(wd_wd)
	var pcCheck = matchMedia("screen and (max-width: 1300px)").matches;

	if (pcCheck) {
		// mo
		$(".gnb_wrap").removeClass("pc");
	}
	else {
		// PC
		$(".gnb_wrap").removeClass("on");
		$(".gnb_wrap").addClass("pc");
		$("html, body").removeClass("hidden");
		$(".gnb_wrap").removeClass("active");
		$(".gnb_shawdow").removeClass("active");
	}

	$(".navbar_toggle").click(function() {
		$(".gnb > .gnb_li > a").removeClass("active");
		$(".gnb > .gnb_li > a").siblings(".gnb_sub01").hide();
		$(".gnb_wrap").addClass("on");
		$("html, body").addClass("hidden");
		$(".gnb_wrap").addClass("active");
		$(".gnb_shawdow").addClass("active");
	});

	$(".gnb_shawdow, .gnb_wrap .close_btn").click(function() {
		$("html, body").removeClass("hidden");
		$(".gnb_wrap").removeClass("active");
		$(".gnb_shawdow").removeClass("active");
	});

	// floating_banner
	$(window).resize(function() {

		$(".floating_banner").removeClass("on");
		floating_banner2();

		$(".floating_banner").addClass("on");

		pcCheck = matchMedia("screen and (max-width: 1300px)").matches;
		if (pcCheck) {
			$(".gnb_wrap").removeClass("pc");
			$(".sub_bg").show();
		}
		else {
			$(".gnb_wrap").removeClass("on");
			$(".gnb_wrap").addClass("pc");
			if ($(".popup_area").hasClass("active") == false) {
				$("html, body").removeClass("hidden");
			}
			$(".gnb_wrap").removeClass("active");
			$(".gnb_shawdow").removeClass("active");
			$(".sub_bg").hide();
		}

	});
	floating_banner();
	$(".floating_banner").addClass("on");
	function floating_banner() {

		var windowTop2 = $(window).scrollTop();
		var windowHeight = $(window).outerHeight() / 2;
		var testHeight = $(".floating_banner").outerHeight() / 2;

		$(".floating_banner").css({ "top": windowTop2 + windowHeight - testHeight });
	}

	function floating_banner2() {

		$(".floating_banner").hide();

		var windowTop2 = $(window).scrollTop();
		var windowHeight = $(window).outerHeight() / 2;
		var testHeight = $(".floating_banner").outerHeight() / 2;

		$(".floating_banner").css({ "top": windowTop2 + windowHeight - testHeight });
		$(".floating_banner").show();
	}
	
    // banner_popup
    $(".banner_popup_wrap .banner_popup").each(function(index, item){
        $(item).css({"z-index":100-index});
    });

	// gnb 호버
	var gnbSpeed = 200;
    $(".gnb").mouseover(function(){
		if ($(".gnb_wrap").hasClass("pc")) {
			$(this).siblings(".sub_bg").stop().fadeIn(gnbSpeed);
			$(this).find(".gnb_sub01").stop().fadeIn(gnbSpeed);
		}
	});
	$(".gnb_wrap a").focus(function() {
		if ($(".gnb_wrap").hasClass("pc")) {
			$(".gnb_li").removeClass("active");
			$(this).parents(".gnb_li").addClass("active");
			$(".gnb").siblings(".sub_bg").stop().fadeIn(gnbSpeed);
			$(".gnb").find(".gnb_sub01").stop().fadeIn(gnbSpeed);
		}
	});

	$(".gnb_wrap").mouseleave(function() {
		if ($(".gnb_wrap").hasClass("pc")) {
			$(this).find(".sub_bg").stop().fadeOut(gnbSpeed);
			$(this).find(".gnb_sub01").stop().fadeOut(gnbSpeed);
		}
	});
	$(".gnb_wrap a").blur(function() {
		if ($(".gnb_wrap").hasClass("pc")) {
			$(".gnb_li").removeClass("active");
			$(".gnb_wrap").find(".sub_bg").stop().fadeOut(gnbSpeed);
			$(".gnb_wrap").find(".gnb_sub01").stop().fadeOut(gnbSpeed);
		}
	});
	
	$(".gnb > .gnb_li > a").off("click");
	$(".gnb > .gnb_li > a").on("click", function(e) {
		if (pcCheck) {
			e.preventDefault();
			$(this).toggleClass("active");
			$(this).siblings(".gnb_sub01").stop().slideToggle();
		}

	});

	// swiper
	//	var swiper1 = new Swiper('.visual_swiper', {
	//		loop: true,
	//		speed: 850,
	//		roundLengths: true,
	//		autoplay: {
	//			delay: 5500,
	//			disableOnInteraction: false,
	//		},
	//		pagination: {
	//			el: '.swiper-pagination',
	//			clickable: true,
	//			renderBullet: function (index, className) {
	//			  return '<span class="' + className + '">' + (index + 1) + '</span>';
	//			},
	//		  },
	//	});

	$(".visual_swiper").hover(
		function() {
			swiper1.autoplay.stop();
		}, function() {
			swiper1.autoplay.start();
		}
	);

	//	var swiper3 = new Swiper('.onair-container', {
	//		slidesPerView: '3',
	//		spaceBetween: 30,
	//		touchRatio: 0,
	//		breakpoints: {
	//			1300: {
	//				slidesPerView: 'auto',
	//				spaceBetween: 30,
	//				touchRatio: 1,
	//				centeredSlides: true,
	//			},
	//			768: {
	//				slidesPerView: 1.35,
	//				spaceBetween: 20,
	//				touchRatio: 1,
	//				centeredSlides: false,
	//			},
	//		},
	//	});


	//	var swiper2 = new Swiper('.swiper_banner', {
	//		loop: true,
	//		speed: 750,
	//		autoplay: {
	//			delay: 6500,
	//			disableOnInteraction: false,
	//		},
	//		navigation: {
	//		  nextEl: '.swiper-button-next',
	//		  prevEl: '.swiper-button-prev',
	//		},
	//	});



	var bfaft1 = new Swiper('.swiper_bfaft1', {
		observer: true,
		observeParents: true,
		//pagination: {
		//	el: '.pagination',
		//	clickable: true,
		//},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});

	var bfaft2 = new Swiper('.swiper_bfaft2', {
		observer: true,
		observeParents: true,
		//pagination: {
		//	el: '.pagination',
		//	clickable: true,
		//},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});
	var bfaft3 = new Swiper('.swiper_bfaft3', {
		observer: true,
		observeParents: true,
		//pagination: {
		//	el: '.pagination',
		//	clickable: true,
		//},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});
	var bfaft4 = new Swiper('.swiper_bfaft4', {
		observer: true,
		observeParents: true,
		//pagination: {
		//	el: '.pagination',
		//	clickable: true,
		//},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});
	var bfaft5 = new Swiper('.swiper_bfaft5', {
		observer: true,
		observeParents: true,
		//pagination: {
		//	el: '.pagination',
		//	clickable: true,
		//},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});

	var galleryThumbs = new Swiper('.gallery-thumbs', {
		observer: true,
		observeParents: true,
		spaceBetween: 10,
		slidesPerView: 4,
		freeMode: true,
		watchSlidesVisibility: true,
		watchSlidesProgress: true,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
	});
	var galleryTop = new Swiper('.gallery-top', {
		observer: true,
		observeParents: true,
		spaceBetween: 10,
		slidesPerView: 1,
		pagination: {
			el: '.swiper-pagination',
			type: 'progressbar',
		},
		on: {
			transitionStart: function() {
				var title = $(".gallery-top .swiper-slide-active").data("ttl");
				$(".hospital_area .mo_ttl").text(title);
			}
		},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		thumbs: {
			swiper: galleryThumbs
		},
	});

	$(".swiper_banner").hover(
		function() {
			swiper2.autoplay.stop();
		}, function() {
			swiper2.autoplay.start();
		}
	);

	$(".swiper-button-white").click(function() {
	});

	// 섹션01 호버효과 (background 익스문제로 js로 처리)
	// $(".sec01 .clinic a").mouseenter(function(){
	// 	$(this).parent(".clinic").addClass("active");
	// });
	// $(".sec01 .clinic a").focus(function(){
	// 	$(this).parent(".clinic").addClass("active");
	// });
	// $(".sec01 .clinic a").blur().mouseleave(function(){
	// 	$(this).parent(".clinic").removeClass("active");
	// });
	// $(".sec01 .clinic a").blur(function(){
	// 	$(this).parent(".clinic").removeClass("active");
	// });

	if ($("#bizFile").data("check")) {
		document.getElementById('bizFile').addEventListener('change', function() {
			var filename = document.getElementById('fileName');
			if (this.files[0] == undefined) {
				filename.innerText = '선택된 파일없음';
				return;
			}
			filename.innerText = this.files[0].name;
		});
	}

	// popup
	$(".popup_btn").click(function(){
		$("html, body").addClass("hidden");
		$($(this).data("popup")).addClass("active");
	});

	$(".popup_area .close_btn").click(function(e){
		e.preventDefault();
		$(this).parents(".popup_area").removeClass("active");
		$("html, body").removeClass("hidden");
	});

	$(".popup_area .shadow").click(function(e){
		$(this).parents(".popup_area").removeClass("active");
		$("html, body").removeClass("hidden");
	});

	// 전후사진 탭메뉴
	$(".bfaft_tab li").click(function(e){
		e.preventDefault();
		var index = $(this).index();
		var currentIndex = $(".bfaft_list li.active").index();

		$(".bfaft_tab li").removeClass("active");
		$(".bfaft_tab li").eq(index).addClass("active");
		$(".bfaft_list li").removeClass("active");
		$(".bfaft_list li").eq(index).addClass("active");

		var num = index+1;
		if ( currentIndex !== index && $(".bfaft_list li").eq(index).find(".ratio_area").data("ratio")){
			eval('bfaft'+num).slideTo(0 ,0 ,false)
		}
	});

    //  이미지 비율확인 (병원둘러보기)
    if($(".ratio_area").data("ratio")) {    
        fn_ratio_image();
    }
    
    if ($("#calendarBox").data("check")) {
		$('#calendarBox').datepicker({
			monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],	//한글 캘린더중 월 표시를 위한 부분
			monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],	//한글 캘린더 중 월 표시를 위한 부분
			dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
			dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분 
			constrainInput: true,   // prevent letters in the input field  
			minDate: new Date(),    // prevent selection of date older than today  
			showMonthAfterYear: true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			showOn: 'button',       // Show a button next to the text-field  
			altFormat: 'yyyy-mm-dd',  // Date Format used  
			// beforeShowDay: $.datepicker.noWeekends,     // Disable selection of weekends  
			firstDay: 0 // Start with Monday  
		})
	}

	$(".tab_list").on("click", ".tab_item", function(e){
		e.preventDefault();
		var index = $(this).index();
		var ttlTxt = $(this).children("a").text();

		// $(".indicator ol li:last-child").text(ttlTxt);

		$(".img_wrap .ttl span").removeClass("active");
		$(".img_wrap .ttl span").eq(index).addClass("active");

		$(".tab_list .tab_item").removeClass("active");
		$(".tab_list .tab_item").eq(index).addClass("active");

		$(".img_list .img_item").removeClass("active");
		$(".img_list .img_item").eq(index).addClass("active");
		
	});

    $(".quick_counseling").on("click", function(e){
		// e.preventDefault();

		var quickTop = $("#counselingWrap").offset().top;

		$("body, html").animate({
			scrollTop: quickTop
		}, 450);
	});

});
$(function() {
	App.init();
	// App.main.init();
});

var textI = -1;
var thisImg;
var imgList = [];
function fn_ratio_image(){
    $(".ratio_area").each(function(index, item){
        var ratio = $(item).data("ratio");
        $(item).find(".thumbnail").css({"padding-top":ratio+"%"});
        $(item).imagesLoaded( function() {
			$(item).find("img").each(function(index, item){
				textI++;
				console.log(textI);
				var imgSrc = $(item).attr("src");
				console.log(imgSrc);
				imgList[index] = $(item);

				imgList[index] = new Image();
				$(item).src = imgSrc;
				var w = this.width;
				var h = this.height;
				console.log("width : " + w + ", height : " + h);

				var ratioImg = h / w * 100;
				var ratioWrap = $(item).parents(".ratio_area").data("ratio");
				if ( ratioImg < ratioWrap){
					$(item).removeClass("portrait");
					$(item).addClass("landscape");
				} else {
					$(item).removeClass("landscape");
					$(item).addClass("portrait");
				}

			});
        });
    });
}