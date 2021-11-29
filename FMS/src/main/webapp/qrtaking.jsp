<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<html>

<head>

<meta charset="utf-8">
<title>qr 실사</title>
	<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<!-- Font Awesome -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
	<!--  QRCODE -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jsQR.js"></script>

<style type="text/css">
main {
	width: 100%;
	height: 100%;
	text-align: center;
}

main>div {
	float: left;
	width: 1%;
	height: 98%;
}

main>div:first-child {
	width: 49%;
}

main>div:last-child {
	background-color: #D3D3D3;
	width: 49%;
}

div#output {
	background-color: #BDBEBD;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 10px;
	padding-bottom: 10px;
}

div#frame {
	border: 2px solid #005666;
	background-color: #FFFFFF;
	margin-left: 10px;
	margin-right: 10px;
	padding-left: 8px;
	padding-right: 8px;
	padding-top: 8px;
	padding-bottom: 8px;
}

div#outputLayer {
	text-align: left;
}

canvas {
	display: block;
	margin: auto;
	text-align: center;
	width: 80%;
	height: 100%
}

input {
	height: 9rem;
	width: 350px;
	font-size: 60px;
}

.buttons {
	min-height: 200px;
}

#alt {
	position: absolute;
	top: 23vh;
	right: 13vh;
}

#alt .alarm {
	margin: 6px 0 0;
	padding: 18px;
	display: none;
}

.alt {
	border: 1px solid #F1D031;
	opacity: 0.6;
	color: #444;
	background: #FFFFA3;
	padding : 3vh 5vh;
	text-align: left;
	border-radius: 5px;
	-moz-border-radius: 26px;
	-webkit-border-radius: 26px;
	font-family: arial;
	font-size: 50px;
	white-space: pre;
	position: relative;
}

.timerWrap {
	position: absolute;
	bottom: 4px;
	left: 4px;
	overflow: hidden;
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
}

.timer {
	display: block;
	height: 4px;
	width: 0;
	background-color: #F1D031;
}
.bottom-group {
	font-size: 2rem;
}
.bottom-input {
	height: 1.5em;
    font-size: 1.2em;
}
.card-body {
	padding: 1.25rem;
    margin: 0.1rem;
    border: solid;
}
</style>
</head>
<body>
<script type="text/javascript">
$(window).on("beforeunload", function() { 
    return confirm("Do you realwant to close?"); 
}) 
</script>
	<div class="row">
        <div class="col-md-12" >
                 <button type="button"  onclick="donefn();" class="btn btn-block btn-danger btn-xs" style="height: 150px; font-size: 7em;" value="done">저장</button>
		</div>
	</div>
        
	<div class="row" style="height: 650px; background-color: white;">
		<div class="col-md-12">
			<div id="loadingMessage">
			🎥 비디오 스트림에 액세스 할 수 없습니다<br/>카메라가 활성화되어 있는지 확인하십시오
			</div>
			<div id="pictureView" style="display : none;" onclick="refresh();"></div>
			<canvas id="canvas"></canvas>
		</div>
	</div>
        
	<div class="row" style="background-color: white;">
		<div class="col-12">
			<table class="col-12">
				<tr>
					<td><h1>코드</h1></td> 
					<td><h1><input type="text" id="goodsCode" style="text-align: center;" readonly value=""></h1></td>
					<td><h1>품명</h1></td>
					<td><h1><input type="text" id="goodsName" style="text-align: center;" readonly value=""></h1></td>
				</tr>
				<tr>
					<td><h1>전산</h1></td>
					<td><h1><input id="comquan" type="number" pattern="\d*" style="text-align: center;" readonly  value=""></h1></td>
					<td><h1>실사</h1></td>
					<td><h1><input id="realquan" type="number"  pattern="\d*" style="text-align: center;" value="0"></h1></td>
				</tr>
			</table>
			<div class="col-12 row">
				<div class="col-6">
					<button id="plsbtn" type="button" onclick="plusfn();" class="btn btn-block btn-info btn-xs" style="height: 170px; font-size: 11em;"><i class="fas fa-plus"></i></button>
				</div>
				<div class="col-6">
					<button id="minusbtn" type="button" onclick="minusfn();" class="btn btn-block btn-info btn-xs" style="height: 170px; font-size: 11em;"><i class="fas fa-minus"></i></button>
				</div>
			</div>
		</div>
	</div>
	<div class="col-12 row" style="margin-top: 17px;">
		<button id="chkbtn" type="button" onclick="savefn();" class="btn btn-block btn-primary btn-xs" style="height: 170px; font-size: 7em;" >다음</button>
	</div>
	<div id="test">
		<div id="output">
			<div id="outputMessage">
			<!-- 				QR코드를 카메라에 노출시켜 주세요 -->
			</div>
			<div id="outputLayer" hidden>
				<span id="outputData"></span>
			</div>
		</div>
	</div>
	<div id="alt"></div>
	<div id="stockList"></div>
</body>
</html>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">	
var ws = "";
var url = "wss://192.168.45.40:8001/fms/takingSocket"
// var url = "wss://1.245.0.189:8001/fms/takingSocket"
var ws = new WebSocket(url); 
ws.onopen = function (message) {
	//기존 임시저장데이터가 있는지 확인
};
ws.onmessage = function (event) {
	var text = "";
	var msg = JSON.parse(event.data);
	text = msg.takingData;
};
function disconnect() { 
	ws.close(); 
	ws = null; 
} 
function sendMessage(msg) { 
	// send 명령을 이용해서 전송을 한다. 
	ws.send(JSON.stringify(websocketData)); 
}



var idx = 0;
var comquan   = document.getElementById("comquan");
var realquan  = document.getElementById("realquan");
var goodsName = document.getElementById("goodsName");
var goodsCode = document.getElementById("goodsCode");
var logisCode = "${logis_code}";
var takingCode = "${taking_code}";
var whCode = "${wh_code}";
var chk = "";
var goods= "";
var done = "";
var websocketData = "";
function drawingQR() {
	var video = document.createElement("video");		
	var canvasElement = document.getElementById("canvas");
	var canvas = canvasElement.getContext("2d");
	var loadingMessage = document.getElementById("loadingMessage");
	var outputContainer = document.getElementById("output");
	var outputMessage = document.getElementById("outputMessage");
	var outputData = document.getElementById("outputData");


	function drawLine(begin, end, color) {
		canvas.beginPath();
		canvas.moveTo(begin.x, begin.y);
		canvas.lineTo(end.x, end.y);
		canvas.lineWidth = 4;
		canvas.strokeStyle = color;
		canvas.stroke();
	}
	navigator.mediaDevices.getUserMedia({ video: { facingMode: "environment" } }).then(function(stream) {
 		video.srcObject = stream;
		video.setAttribute("playsinline", true);
		video.height = 30;
		video.width = 30;
     	video.play();
		requestAnimationFrame(tick);
	});
	
	function tick() {
		loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."
		if(video.readyState === video.HAVE_ENOUGH_DATA) {
			loadingMessage.hidden = true;
			canvasElement.hidden = false;
			outputContainer.hidden = false;
			
			// 읽어들이는 비디오 화면의 크기
			canvasElement.height = video.videoHeight;
			canvasElement.width = video.videoWidth;
			canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);
			
			var imageData = canvas.getImageData(0, 0, canvasElement.width, canvasElement.height);
			var code = jsQR(imageData.data, imageData.width, imageData.height, {
			inversionAttempts : "dontInvert",
				});
	
				// QR코드 인식에 성공한 경우
			if(code) {
			       // 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성
				drawLine(code.location.topLeftCorner, code.location.topRightCorner, "#FF0000");
				drawLine(code.location.topRightCorner, code.location.bottomRightCorner, "#FF0000");
				drawLine(code.location.bottomRightCorner, code.location.bottomLeftCorner, "#FF0000");
				drawLine(code.location.bottomLeftCorner, code.location.topLeftCorner, "#FF0000");
				outputMessage.hidden = true;
				outputData.parentElement.hidden = false;
			
				// QR코드 메시지 출력
				goods = code.data;
				hqgoods(goods);
				if(chk=='scs'){
					alt('확인되었습니다.', 800);
					document.querySelector('#canvas').style.display = "none";
					document.querySelector('#pictureView').style.display = "";
			        return;
				}
			} else { // QR코드 인식에 실패한 경우
				outputMessage.hidden = false;
				outputData.parentElement.hidden = true;
			}
		}
			requestAnimationFrame(tick);
	}
	
	function hqgoods(data) {
		if (logisCode == ''){
			logisCode = 'L001';
		}
		if (whCode == '') {
			whCode = 'WH0001';
		}
		$.ajax({
			url : "keyword/logisGoodsTaking.do"
			, data : {"hgGoods" : data, "logisCode" : logisCode, "whCode" : whCode}
			, contentType: "application/json; charset=UTF-8"
			, success : function(data) {
				document.querySelector('#goodsCode').setAttribute('value', data.hq_goods_code);
				document.querySelector('#goodsName').setAttribute('value', data.sup_goods_name);
				document.querySelector('#comquan').setAttribute('value', data.logis_goods_stock);
				document.querySelector('#realquan').setAttribute('value', data.logis_goods_stock);
				comquan   = document.getElementById("comquan");
				realquan  = document.getElementById("realquan");
				goodsName = document.getElementById("goodsName");
				goodsCode = document.getElementById("goodsCode");
				goodsPicture(document.querySelector('#pictureView'), data.sup_goods_img);
				chk = 'scs';
			}
			, error : function() {
				chk = 'fls';
			}
		})
	}

}
	document.addEventListener("DOMContentLoaded", function() {
		drawingQR();
		});
	
	function donefn() {
		if(confirm('실사를 종료하겠습니까?')){
			done = 'done';
			websocketData = {'st' : 'finish' };
			sendMessage(websocketData);
			disconnect();
			$('.row').hide();		
		}
	}
	
	function refresh() {
		document.querySelector('#canvas').style.display = "";
		document.querySelector('#pictureView').style.display = "none";
		document.querySelector('#goodsCode').setAttribute('value', "");
		document.querySelector('#goodsName').setAttribute('value', "");
		document.querySelector('#comquan').setAttribute('value', "");
		document.querySelector('#realquan').setAttribute('value', "");
		drawingQR();
	}
	function plusfn() {
		if(chk!='scs'){
			return;
		}
		realquan.value = +realquan.value + 1
	}
	
	function minusfn() {
		if(chk!='scs'){
			return;
		}
		realquan.value = +realquan.value - 1
	}
	
	function savefn() {
		if(chk!='scs'){ // 세이브 펑션 접근 불가
			return;
		}
		//데이터 받기
		comquan   = document.getElementById("comquan").value;  
		realquan  = document.getElementById("realquan").value; 
		goodsName = document.getElementById("goodsName").value;
		goodsCode = document.getElementById("goodsCode").value;
		//실사 진행한 것이 있는지 확인
		var detailArr = new Array;
		detailArr = $('.hqcode')
		detailArr.each(function(i){
			if (detailArr[i].defaultValue == goodsCode) {
				chk ='fls';
				if(!confirm('이미 실사를 진행한 물품입니다. \n 기존 데이터에 새로운 데이터를 넣으시겠습니까?')) {
					refresh();
					return;
				}
				websocketData = {'goodsCode' : goodsCode, 'goodsName' : goodsName, 'comquan' : comquan, 'realquan' : realquan, 'st' : 'update'};
				detailArr.eq(i).parent().parent().parent().remove();
				appendData(goodsCode, goodsName, comquan, realquan, idx++); //다음 버튼 아래 실사한 데이터 삽입
				// 웹소켓으로 데이터 전송
				sendMessage(websocketData);
			}
		})
		//함수 아래 접근 막기
		if(chk!='scs'){ // 세이브 펑션 접근 불가
			return;
		}
		websocketData = {'goodsCode' : goodsCode, 'goodsName' : goodsName, 'comquan' : comquan, 'realquan' : realquan, 'st' : 'insert'};
		// 웹소켓으로 데이터 전송
		sendMessage(websocketData);
		
		refresh();
		appendData(goodsCode, goodsName, comquan, realquan, idx++); //다음 버튼 아래 실사한 데이터 삽입
		chk= 'fls';
	}
	
	function appendData(goodsCode, goodsName, comquan, realquan, num) {
		var list = "";
		list += '	<div class="card-body row taking-data" id="taking'+num+'">                                                            ';      
		list += '		<div class="form-group row bottom-group col-6">                                    ';
		list += '			<label for="text" class="col-sm-3 col-form-label">코드</label>                   ';
		list += '			<div class="col-sm-8">                                                         ';
		list += '				<input type="text" class="form-control bottom-input hqcode" value="'+goodsCode+'" disabled>';
		list += '			</div>                                                                         ';      
		list += '		</div>                                                                             ';
		list += '		<div class="form-group row bottom-group col-6">                                    ';
		list += '			<label for="text" class="col-sm-3 col-form-label">품명</label>                   ';
		list += '			<div class="col-sm-8">                                                         ';
		list += '				<input type="text" class="form-control bottom-input" value="'+goodsName+'" disabled>';
		list += '			</div>                                                                         ';      
		list += '		</div>                                                                             ';
		list += '		<div class="form-group row bottom-group col-6">                                    ';
		list += '			<label for="text" class="col-sm-3 col-form-label">전산</label>                   ';
		list += '			<div class="col-sm-8">                                                         ';
		list += '				<input type="text" class="form-control bottom-input" value="'+comquan+'" disabled>  ';
		list += '			</div>                                                                         ';      
		list += '		</div>                                                                             ';
		list += '		<div class="form-group row bottom-group col-6">                                    ';
		list += '			<label for="text" class="col-sm-3 col-form-label">실사</label>                   ';
		list += '			<div class="col-sm-8">                                                         ';
		list += '				<input type="text" class="form-control bottom-input" value="'+realquan+'" disabled> ';
		list += '			</div>                                                                         ';
		list += '		</div>                                                                             ';
		list += '	</div>                                                                                 ';
	
		$('#stockList').append(list);
	}
	//파일불러오기
	function goodsPicture(targetObj, fileName){  
		targetObj.style.backgroundImage="url('<%=request.getContextPath()%>/sup/goods/getPicture.do?sup_goods_img="+fileName+"')";
		targetObj.style.backgroundPosition="center";
		targetObj.style.backgroundRepeat="no-repeat";
		targetObj.style.backgroundSize="auto";
		targetObj.style.width="auto";
		targetObj.style.height="37vh";
	}
    function fillWidth(elem, timer, limit) {
        if (!timer) { timer = 2000; }	
        if (!limit) { limit = 100; }
        var width = 1;
        var id = setInterval(frame, timer / 100);
            function frame() {
            if (width >= limit) {
                clearInterval(id);
            } else {
                width++;
            }
        }
    };
    
    function alt(msg, timer) {
        if (!timer) { timer = 2000; }
        var $elem = $("<div class='alarm'><span class='alt'>" + msg + "<b></b><div class='timerWrap'><div class='timer'></div></div></span></div>");
        $("#alt").append($elem); //top = prepend, bottom = append
        $elem.slideToggle(100, function() {
            $('.timerWrap', this).first().outerWidth($elem.find('.alt').first().outerWidth() - 10);
            if (!isNaN(timer)) {
                fillWidth($elem.find('.timer').first()[0], timer);
                setTimeout(function() {
                    $elem.fadeOut(function() {
                        $(this).remove();
                    });
                }, timer);			
            }
        });
    }
    
    $(document).on('click', '.taking-data', function(e){
    	e.preventDefault();
    		if(confirm('삭제하시겠습니까?')){
    			$(this).remove();
    		}
    })
</script>