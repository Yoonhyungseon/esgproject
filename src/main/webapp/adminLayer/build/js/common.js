var lchar = /["']/;

var localeLang = getCookie('selectLocale');
if (localeLang == null ||localeLang == "") {
    localeLang = "ko";
}

function getCookie(name) {
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null) {
        return unescape(arr[2]);
    } else {
        return null;
    }
}

// jquery.i18n.properties-min-1.0.9.js
$(document).ready(function() {
    $(document).on("keyup", ".numberOnly", function() {
        $(this).val($(this).val().replace(/[^0-9]/gi, ""));
    });

    $(document).on("keyup", ".limit", function() {
		if(lchar.test($(this).val())) {
			$(this).val($(this).val().replace(lchar, ""));
		}
    });

	 $(document).on("keyup", ".inputLngCheck", function() {
		    var str = $(this).val();
			var objName = $(this).attr("alt");
			var minLng = $(this).attr("min");
			var maxLng = $(this).attr("max");
			var maxValue = "";

			var keycode = "";

			// input value length Check
			//var valLength = str.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g, "$&$1$2").length;
			
			if(typeof $(this).attr("maxValue") != 'undefined'){
				maxValue = $(this).attr("maxValue");
			}
			
			var sw = true;
			if(maxValue != ""){
				if(Number($(this).val()) > Number(maxValue)){
					alert($.i18n.prop("msg.enter.up.error", maxValue));
					
					$(this).val("");
					$(this).focus();
					sw = false;
				}
			}
			
			if(sw){
				var valLength = str.length;
	
				if (valLength > maxLng) {
					alert($.i18n.prop("msg.input.valueCheck.length", objName, minLng, maxLng, valLength));
					$(this).val($(this).val().substring(0, maxLng));
					return false;
				}else{
					return true;
				}
			}
    });

    $(document).on("keyup", ".numberDotOnly", function() {
        $(this).val($(this).val().replace(/[^0-9|.]/gi, ""));
        if ($(this).val().split(".").length > 2) {
            $(this).val($(this).val().substring(0, ($(this).val().length - 1)));
        } else
            if ($(this).val().indexOf(".") == 0) {
                $(this).val("0" + $(this).val());
            }
    });
    
    $(document).on("keyup", ".numberDot", function() {
        $(this).val($(this).val().replace(/[^0-9|.]/gi, ""));
        if ($(this).val().indexOf(".") == 0) {
            $(this).val("0" + $(this).val());
        }
    });
    
    $(document).on("keyup", ".numberSlashOnly", function() {
        $(this).val($(this).val().replace(/[^0-9|/]/gi, ""));
        if ($(this).val().split("/").length > 2) {
            $(this).val($(this).val().substring(0, ($(this).val().length - 1)));
        } else
            if ($(this).val().indexOf("/") == 0) {
                $(this).val("0" + $(this).val());
            }
    });
    
    $(document).on("keyup", ".telOnly", function() {
        $(this).val($(this).val().replace(/[^0-9]/gi, ""));
        $(this).val($(this).val().replace(/(0(?:2|[0-9]{2}))([0-9]+)([0-9]{4}$)/, "$1-$2-$3"));
    });
    
    $(document).on("keyup", ".engNumberOnly", function() {
        $(this).val($(this).val().replace(/[^a-z0-9]/gi, ""));
    });
    
    $(document).on("keyup", ".lowerOnly", function() {
        $(this).val($(this).val().toLowerCase());
    });
    
    $(document).on("keyup", ".bizNumber", function() {
    	$(this).val($(this).val().replace(/[^0-9]/gi, ""));
        $(this).val($(this).val().replace(/(\d{3})(\d{2})(\d{5})/g, "$1-$2-$3"));
    });
    
    $(document).on("keyup", ".engKorNumberOnly", function() {
        
        var deny_char = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;

    	if (!deny_char.test($(this).val())) {
	    	$(this).val($(this).val().substr(0, $(this).val().length - 1));
    	}
        
    });
	
	$(document).on("keyup", ".inputBytesLngCheck", function() {
		inputBytesLngCheck($(this));
	});
	
	$('input:file').bind('change', function(){
		var input = $(this);
		var label = input.val().replace(/\\/g, '/').replace(/.*\//, ''); 
		$("#" + input.data("display-target")).html(label);
	});
	
    //크로스 사이트 스크립팅 처리 및 길이제한 체크
    $(document).on("keyup", "input:text, textarea", function() {    	
    	if(!$(this).hasClass("exp")){
    		var regExp = /[<>()#&\'\"]/gi

	    	var val = $(this).val();

	    	if(regExp.test(val)){
	    		$(this).val(val.replace(regExp,""));
			}
	    	
	    	var lng = $(this).attr("length");
	    	if($.isNumeric(lng)){
	    		$(this).val(fnCut($(this).val(), lng, true));
	    	}
    	}    	
    });

    //loadMessages();
});

function inputBytesLngCheck(obj){
	var str = $(obj).val();
	var objName = $(obj).attr("alt");
	var minLng = $(obj).attr("min");
	var maxLng = $(obj).attr("max");
	var txtId = $(obj).attr("txtId");
	var maxValue = "";

	var keycode = "";

	// input value length Check
	var valLength = str.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g, "$&$1$2").length;
	
	if(typeof $(obj).attr("maxValue") != 'undefined'){
		maxValue = $(obj).attr("maxValue");
	}
	
	var sw = true;
	if(maxValue != ""){
		if(valLength > Number(maxValue)){
			alert(maxValue + "자 이상 입력하실 수 없습니다.");
			
			$(obj).val("");
			$(obj).focus();
			sw = false;
		}
	}
	
	if(sw){
		//var valLength = str.length;

		if (valLength > maxLng) {
			jsAlert.alert("경고", objName + " 값의 길이는 " + minLng + "~" + maxLng + " bytes 이어야 합니다.[" + valLength + " bytes]");
//			$(this).val($(this).val().substring(0, maxLng));
			$(obj).val(calByte.cutByteLength(str, maxLng));
			if(typeof(txtId) != undefined && txtId != null && txtId != ''){
				$('#' + txtId).html(maxLng);
			}
			return false;
		}else{
			if(typeof(txtId) != undefined && txtId != null && txtId != ''){
				$('#' + txtId).html(valLength);
			}
			return true;
		}
	}
}

var calByte = {
		getByteLength : function(s) {

			if (s == null || s.length == 0) {
				return 0;
			}
			var size = 0;

			for ( var i = 0; i < s.length; i++) {
				size += this.charByteSize(s.charAt(i));
			}

			return size;
		},
			
		cutByteLength : function(s, len) {

			if (s == null || s.length == 0) {
				return 0;
			}
			var size = 0;
			var rIndex = s.length;

			for ( var i = 0; i < s.length; i++) {
				size += this.charByteSize(s.charAt(i));
				if( size == len ) {
					rIndex = i + 1;
					break;
				} else if( size > len ) {
					rIndex = i;
					break;
				}
			}

			return s.substring(0, rIndex);
		},

		charByteSize : function(ch) {

			if (ch == null || ch.length == 0) {
				return 0;
			}

			var charCode = ch.charCodeAt(0);

			if (charCode <= 0x00007F) {
				return 1;
			} else if (charCode <= 0x0007FF) {
				return 2;
			} else if (charCode <= 0x00FFFF) {
				return 3;
			} else {
				return 4;
			}
		}
	};

function loadMessages() {
    $.i18n.properties({ name : 'message', path : base + '/resources/messages/',
    // path:'/phc/WEB-INF/classes/messages/',
    mode : 'both', language : localeLang, callback : function() {
    // i18nExamples();
    // alert( msg.a.userId );
    } });
    
    $.i18n.properties({ name : 'common', path : base + '/resources/messages/',
    // path:'/phc/WEB-INF/classes/messages/',
    mode : 'both', language : localeLang, callback : function() {
    // i18nExamples();
    // alert( msg.a.userId );
    } });
}

//input, textarea length 체크
function fnCut(str, lengths, sw) // str은 inputbox에 입력된 문자열이고,lengths는 제한할 문자수 이다.
{
	var lenSw = false;
	var len = 0;
	var newStr = '';

	for (var i=0;i<str.length; i++){
		var n = str.charCodeAt(i); // charCodeAt : String개체에서 지정한 인덱스에 있는 문자의 unicode값을 나타내는 수를 리턴한다.
        // 값의 범위는 0과 65535사이이여 첫 128 unicode값은 ascii문자set과 일치한다.지정한 인덱스에 문자가 없다면 NaN을 리턴한다.

        var nv = str.charAt(i); // charAt : string 개체로부터 지정한 위치에 있는 문자를 꺼낸다.

        if ((n>= 0)&&(n<256)) len ++; // ASCII 문자코드 set.
        else len += 2; // 한글이면 2byte로 계산한다.

        if (len>lengths){
        	lenSw = true;
        	break; // 제한 문자수를 넘길경우.
        }else newStr = newStr + nv;
	}

	if(sw && lenSw){
		jsAlert.alert("경고", lengths + "byte 이상 입력하실 수 없습니다.");
	}

	return newStr;
}

function periodCheck(startId, endId, searchType){

	var startDate = $('#' + startId).val();
	var endDate = $('#' + endId).val();

	if(startDate != '' && endDate != ''){
		if(Date.parse(startDate) > Date.parse(endDate)){
			if(searchType == "start"){
				jsAlert.alert("확인", "시작일이 종료일보다 클 수 없습니다.", $('#' + startId));
				$('#' + startId).val("");
			}else{
				jsAlert.alert("확인", "종료일이 시작일 보다 작을 수 없습니다.", $('#' + endId));
				$('#' + endId).val("");				
			}
		}
	}
	return false;
}


//HTML로 넘어온 파라미터 받기
function locationParameter(){
	var parameter = location.search;                                     // 주소창의 값을 전부 가져옴
	var paramIndex = parameter.indexOf("?");                             // ?(물음표) 뒤부터 파라미터이므로, 우선 물음표의 위치를 찾음
	parameter = parameter.substring(paramIndex+1);						 // 물음표 + 1 ( 여기부터 파라미터이므로 ) 자리를 잘라서 담음

	var params = new Object();

	for(var i = 0 ; location.search.split("&")[i] ; i++ ) {              // 반복문을 돌면서(&가 있을때까지-즉,파라미터갯수만큼)
		var param = parameter.split("&")[i];

		var key = "";
		var value = "";

		if(param.indexOf("=") > -1){
			var paramArg = param.split("=");
			key = paramArg[0];
			value = paramArg[1];
		}else{
			key = param;
		}
		//console.log("param : " + param + ", key : " + key + ", value : " + value);
		params[key] = value;
	}

	//console.log("params : " + JSON.stringify(params));
	return params;
}

/**
 * ************************************************ 
 * @MethodName : formSubmit
 * @Description: 폼 아이디 값으로 서브및 처리
 * @param formId
 * @returns any
 * @Author     : joon
 * @Version    : 2017. 5. 15.
*************************************************
 */
function formSubmit(formId){
	appendAjaxLoading();
	$('#' + formId).submit();
}

/**
 * ************************************************ 
 * @MethodName : goMenu
 * @Description: URL 이동
 * @param url
 * @returns any
 * @Author     : joon
 * @Version    : 2017. 5. 15.
*************************************************
 */
function goMenu(url){
	appendAjaxLoading();
	location.href = url;
}

function numberWithCommas(x) {	
	if(x == null || x == "") x = 0;
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function fn_cutString(str, cutLng, suffix, strong){
	if(calByte.getByteLength(str) < cutLng)
		return str;
	else	
		return calByte.cutByteLength(str, cutLng) + suffix;
}

var calByte = {
		getByteLength : function(s) {

			if (s == null || s.length == 0) {
				return 0;
			}
			var size = 0;

			for ( var i = 0; i < s.length; i++) {
				size += this.charByteSize(s.charAt(i));
			}

			return size;
		},
			
		cutByteLength : function(s, len) {

			if (s == null || s.length == 0) {
				return 0;
			}
			var size = 0;
			var rIndex = s.length;

			for ( var i = 0; i < s.length; i++) {
				size += this.charByteSize(s.charAt(i));
				if( size == len ) {
					rIndex = i + 1;
					break;
				} else if( size > len ) {
					rIndex = i;
					break;
				}
			}

			return s.substring(0, rIndex);
		},

		charByteSize : function(ch) {

			if (ch == null || ch.length == 0) {
				return 0;
			}

			var charCode = ch.charCodeAt(0);

			if (charCode <= 0x00007F) {
				return 1;
			} else if (charCode <= 0x0007FF) {
				return 2;
			} else if (charCode <= 0x00FFFF) {
				return 3;
			} else {
				return 4;
			}
		}
	};

//다음 우편번호 ##################################################
//param(postid:우편번호 ID,addrid:주소ID , detailAddrid:상세주소ID)
function fn_daum_zipcode_search(postid,addrid,detailAddrid) {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            document.getElementById(detailAddrid).value="";

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById(postid).value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById(addrid).value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById(detailAddrid).focus();
        }
    }).open();
}

var chart_colors = ['#ff616c', '#fe744d', '#4ac8b0', '#337fdc', '#60a038', '#27a8d0', '#5762ce', '#9a57ce', '#a4ba29', '#e9b926'];
var chart_colors_hover = ['#b14f56', '#a63d1f', '#41796e', '#42699a', '#3b5828', '#3b8399', '#4a4f87', '#6d488a', '#748033', '#af933d'];

/**
 * @description 파이 차트 생성
 * @param idNm 차트 생성 canvas id
 * @param data 		ex) [10, 20, 30, 33, 21, 22]
 * @param labels	ex) ['10대', '20대', '30대', '40대', '50대', '60대 이상']
 * @param legend_position : top, left, bottom, right
 * @returns
 */
function fn_make_PieChart(idNm, data, labels, legend_position){
	
	if(legend_position == null) legend_position = 'top';
	
	var ctx = document.getElementById(idNm);
	
	var chart_data = {
		    datasets: [{
		        data: data,
		      	backgroundColor: chart_colors,
		      	hoverBackgroundColor: chart_colors_hover,
		      	hoverBorderColor: "rgba(234, 236, 244, 1)",
		    }],

		    // These labels appear in the legend and in the tooltips when hovering different arcs
		    labels: labels
		};
	var options = {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: true,
	      caretPadding: 10
	    },
	    legend: {
	      display: true,
	      position:legend_position,
	      labels: {
	    	  boxWidth:12
	      }	      
	    },
	    cutoutPercentage: 0	//도넛 구멍 크기 
	  };
	
	var myPieChart = new Chart(ctx,{
	    type: 'pie',
	    data: chart_data,
	    options: options
	});
	
	return myPieChart;
}

/**
 * @description 라인 차트 생성
 * @param idNm 차트 생성 canvas id
 * @param data 		ex) [
 *							{label:'10대',data:[10, 20, 30, 40, 30, 20, 10, 50, 13, 2, 31, 40]},
 *							{label:'20대',data:[1, 13, 3, 40, 30, 2, 10, 5, 13, 3, 40, 30]},
 *							{label:'30대',data:[3, 11, 33, 40, 30, 20, 10, 50, 3, 11, 33, 40]},
 *							{label:'40대',data:[13, 2, 31, 40, 3, 20, 1, 5, 2, 31, 40, 3]},
 *							{label:'50대',data:[14, 10, 0, 40, 30, 20, 10, 50, 0, 40, 30, 20]},
 *							{label:'60대 이상',data:[20, 22, 30, 40, 30, 20, 10, 5, 30, 20, 10, 5]}
 *						]
 * @param labels	ex) ['2019년 1월', '2019년 2월', '2019년 3월', '2019년 4월', '2019년 5월', '2019년 6월', '2019년 7월', '2019년 8월', '2019년 9월', '2019년 10월', '2019년 11월', '2019년 12월']
 * @param legend_position : top, left, bottom, right
 * @returns
 */
function fn_make_lineChart(idNm, data, labels, legend_position){
	
	if(legend_position == null) legend_position = 'top';
	
	var ctx = document.getElementById(idNm);
	
	var chart_data = {
			labels: labels,
			datasets: [],
	};

	var dataset = new Array();
	for(var i=0;i<data.length;i++){		
		var tmp_dataset = {
				label: data[i].label,
				fill: false,
				lineTension: 0.3,
				backgroundColor: chart_colors[i],
				borderColor: chart_colors[i],
				pointRadius: 3,
				pointBackgroundColor: "#fff",
				pointBorderColor: chart_colors[i],
				pointHoverRadius: 3,
				pointHoverBackgroundColor: "#fff",
				pointHoverBorderColor: chart_colors_hover[i],
				pointHitRadius: 10,
				pointBorderWidth: 2,
				data: data[i].data,
	    };
		
		chart_data.datasets.push(tmp_dataset);
	}
	
	var options = {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'date'
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {	          
	          maxTicksLimit: 7
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          maxTicksLimit: 5,
	          padding: 10,
	          // Include a dollar sign in the ticks
	          callback: function(value, index, values) {
	            return number_format(value);
	          }
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: true,
	      position:legend_position,
	      labels: {
	    	  boxWidth:12
	      }	      
	    },
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      intersect: false,
	      mode: 'index',
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem, chart) {
	          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
	          return datasetLabel + ' : ' + number_format(tooltipItem.yLabel);
	        }
	      }
	    }
	  };
	
	var myLineChart = new Chart(ctx, {
		  type: 'line',
		  data: chart_data,
		  options: options
	});
	
	return myLineChart;
}

//Pie 차트 업데이트
function fn_pie_chart_update(chartObj, data, labels){
	
	//차트 라벨 / 데이터 초기화
	chartObj.data.labels.length = 0;
	chartObj.data.datasets[0].data.length = 0;
	
	//라벨 업데이트
	chartObj.data.labels = labels;
	chartObj.data.datasets[0].data = data;

	chartObj.update();
}

//라인 차트 업데이트
function fn_line_chart_update(chartObj, data, labels){
	
	//차트 라벨 / 데이터 초기화
	chartObj.data.labels.length = 0;
	chartObj.data.datasets.length = 0;
	
	//라벨 업데이트
	chartObj.data.labels = labels;

	//데이터 업데이트
	var dataset = new Array();
	for(var i=0;i<data.length;i++){		
		var tmp_dataset = {
				label: data[i].label,
				fill: false,
				lineTension: 0.3,
				backgroundColor: chart_colors[i],
				borderColor: chart_colors[i],
				pointRadius: 3,
				pointBackgroundColor: "#fff",
				pointBorderColor: chart_colors[i],
				pointHoverRadius: 3,
				pointHoverBackgroundColor: "#fff",
				pointHoverBorderColor: chart_colors_hover[i],
				pointHitRadius: 10,
				pointBorderWidth: 2,
				data: data[i].data,
	    };
		
		chartObj.data.datasets.push(tmp_dataset);
	}
	
	chartObj.update();
}

function number_format(number, decimals, dec_point, thousands_sep) {
	  // *     example: number_format(1234.56, 2, ',', ' ');
	  // *     return: '1 234,56'
	  number = (number + '').replace(',', '').replace(' ', '');
	  var n = !isFinite(+number) ? 0 : +number,
	    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
	    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
	    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
	    s = '',
	    toFixedFix = function(n, prec) {
	      var k = Math.pow(10, prec);
	      return '' + Math.round(n * k) / k;
	    };
	  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
	  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	  if (s[0].length > 3) {
	    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	  }
	  if ((s[1] || '').length < prec) {
	    s[1] = s[1] || '';
	    s[1] += new Array(prec - s[1].length + 1).join('0');
	  }
	  return s.join(dec);
}

function fn_br_chrome_browser_check(){
	var agent = navigator.userAgent.toLowerCase();
	if (agent.indexOf("chrome") < 0) {
		return false;
	}
	return true;
}

//차트 초기 데이터 숨김 처리
//type : show / hide
function fn_chart_legend_hide_or_show(chart, sNum, eNum, type){
	for(var i=sNum;i<=eNum;i++){
		if(type == 'show'){
			chart.getDatasetMeta(i).hidden=false;
		}else{
			chart.getDatasetMeta(i).hidden=true;
		}
	}
	chart.update();
}