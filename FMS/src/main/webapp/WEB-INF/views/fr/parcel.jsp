<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>



<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap-theme.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/tracking-tropical.css">
 

<style>
.th {
	background-color: silver;
}

.tab {
	width: 1000px;
	margin-left: 10%;
}

#tekbeCompnayList, #invoiceNumberText {
    width: 500px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #0000ff;
    border: 1px solid #006fff;
    border-radius: 3px;
    
}

#tekbeCompnayName, #invoiceNumber{
  color:black; 
  font-weight: bold; 
  margin-right: 20px;
  font-size: 18px;
}


table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>

<script>

$(document).ready(function(){
	var myKey = "c5SuYTxYWlOZlLu6O2x0kw"; // sweet tracker에서 발급받은 자신의 키 넣는다.
	
		// 택배사 목록 조회 company-api
        $.ajax({
            type:"GET",
            dataType : "json",
            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
            success:function(data){
            		
            		// 방법 1. JSON.parse 이용하기
            		var parseData = JSON.parse(JSON.stringify(data));
             		console.log(parseData.Company); // 그중 Json Array에 접근하기 위해 Array명 Company 입력
            		
            		// 방법 2. Json으로 가져온 데이터에 Array로 바로 접근하기
            		var CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
            		console.log(CompanyArray); 
            		
            		var myData="";
            		$.each(CompanyArray,function(key,value) {
	            			myData += ('<option value='+value.Code+'>' +'key:'+key+', Code:'+value.Code+',Name:'+value.Name + '</option>');        				
            		});
            		$("#tekbeCompnayList").html(myData);
            }
        });

		// 배송정보와 배송추적 tracking-api
        $("#myButton1").click(function() {
        	
        	var t_code = $('#tekbeCompnayList option:selected').attr('value');
        	var t_invoice = $('#invoiceNumberText').val();
        	console.log(t_code);
            $.ajax({
                type:"GET",
                dataType : "json",
	
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                	console.log(data);
                	var myInvoiceData = "";
                	if(data.status == false){
                		myInvoiceData += ('<p>'+data.msg+'<p>');
                	}else{
	            		myInvoiceData += ('<div class="header-area">베송조회</div>');            	
	            		myInvoiceData += ('<div class="title-border"></div>');            	
	            		myInvoiceData += ('<div class="title-content">');            	
	            		myInvoiceData += ('<div class="title-notice">운송장 번호</div>');            	
	            		myInvoiceData += ('<div class="title-invoice">'+data.invoiceNo +'</div>');      
	            		myInvoiceData += ('<div class="title-notice">물품 정보</div>');     
	            		myInvoiceData += ('<div class="title-invoice">베트남로부스타</div>');            	
	            		myInvoiceData += ('<div class="title-invoice">에티오피아원두</div>');            	
/* 	            		myInvoiceData += ('<div class="title-invoice">'+data.itemName+'</div>');            	 */
	            		myInvoiceData += ('<div class="col-xs-12 info-area no-padding">');            	
	            		myInvoiceData += ('<div class="info-back-line">');            	
	            		myInvoiceData += ('<div class="col-xs-15 text-center">');            	
	            		myInvoiceData += ('<img src="<%=request.getContextPath() %>/resources/images/ic_tropical_delivery_step1_off.png" class="parcel-img">');            	
	            		myInvoiceData += ('<div class="info-parcel-text-none">상품인수</div>');    
	            		myInvoiceData += ('</div>');     
	            		myInvoiceData += ('<div class="col-xs-15 text-center">');     
	            		myInvoiceData += ('<img src="<%=request.getContextPath() %>/resources/images/ic_tropical_delivery_step2_off.png" class="parcel-img">');     
	            		myInvoiceData += ('<div class="info-parcel-text-none">상품이동중</div>'); 
	            		myInvoiceData += ('</div>');  
	            		myInvoiceData += ('<div class="col-xs-15 text-center">');   
	            		myInvoiceData += (' <img src="<%=request.getContextPath() %>/resources/images/ic_tropical_delivery_step3_off.png" class="parcel-img">');  
	            		myInvoiceData += ('<div class="info-parcel-text-none">배송지도착</div>');  
	            		myInvoiceData += ('</div>');
	            		myInvoiceData += ('<div class="col-xs-15 text-center">');  
	            		myInvoiceData += ('<img src="<%=request.getContextPath() %>/resources/images/ic_tropical_delivery_step4_off.png" class="parcel-img">');
	            		myInvoiceData += ('<div class="info-parcel-text-none">배송출발</div>');
	            		myInvoiceData += ('</div>');
	            		myInvoiceData += ('<div class="col-xs-15 text-center">');
	            		myInvoiceData += ('<img src="<%=request.getContextPath() %>/resources/images/ic_tropical_delivery_step5_on.png" class="parcel-img">');
	            		myInvoiceData += ('<div class="info-parcel-text-active">배송완료</div>');
	            		myInvoiceData += ('</div>');
	            		myInvoiceData += ('</div>');
	            		myInvoiceData += ('</div>');
	            		
	            		 		
                	}
        			
                	
                	$("#myPtag").html(myInvoiceData)
                	
                	var trackingDetails = data.trackingDetails;
                	
                	
            		var myTracking="";
            		var header ="";
            	
            		
            		$.each(trackingDetails,function(key,value) {
	            		
            		    myTracking += ('<div class="col-xs-12 tracking-status-item-list" style="padding-left: 0px; padding-right: 0px;">'); 
                		myTracking += ('<div class="tracking-status-item">'); 
                		myTracking += ('<div class="list-circle"></div>'); 
                		myTracking += ('<span class="location-text">'+value.where+'</span>|<span class="status-text">'+value.kind +'</span>'); 
                		myTracking += ('<div class="time-text">'+value.timeString+'</div>'); 
                		myTracking += ('<div class="vertical-line"></div>'); 
                		myTracking += ('</div>'); 
                		myTracking += ('</div>');  
            			
            			
            					            	
            		});
            		
            		$("#myPtag2").html(myTracking);
                	
                }
            });
        });
		
		
		$("#resetBtn").on("click", function(){
			$("#myPtag").empty();
			$("#myPtag2").empty();
		});
		
});

function inquiry_history() {
	location.href="<%=request.getContextPath()%>/fr/deliver/history";
}
function deliver() {
	location.href="<%=request.getContextPath()%>/fr/deliver/list";
}

</script>


</head>
<body>

	<!-- Main content -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row md-2">
				<div class="col-sm-6">
					<h2 style="font-size: 30px;">배송조회</h2>
				</div>
				<div class="col-sm-6">
				
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="list.do"> <i
								class="fa fa-dashboard"></i>
						</a></li>
						<!-- <li class="breadcrumb-item active"></li> -->
					</ol>
				</div>
			</div>
		</div>
	</section>

	<section class="content">
		<div class="card">
			<div class="">
				<!-- <button type="button" class="btn btn-primary" onclick="OpenWindow('registForm.do', '업체등록', '800', '700');" >업체등록</button> -->
				<!-- <div class="card-header p-0 pt-1">
					<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
						<li class="nav-item" onclick="javascript:deliver();"><a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false" style="background-color:#696969; color:white;">배송조회</a></li>
						<li class="nav-item" onclick="javascript:inquiry_history();"><a class="nav-link" id="custom-tabs-one-profile-tab" data-toggle="pill" href="#custom-tabs-one-profile" role="tab" aria-controls="custom-tabs-one-profile" aria-selected="false" style="background-color:#696969; color:white;">조회내역</a></li>
					</ul>
				</div> -->
			</div>


		</div>
	</section>

	<div class="row">
		<div class="col-12 col-sm-12">
			<div class="card card-primary card-tabs">

				<div class="card-body"
					style="height: 90vh; overflow-y: scroll; overflow-x:hidden;">
					<div class="tab-content" id="custom-tabs-one-tabContent">
						<div id="custom-tabs-one-home" role="tabpanel"
							aria-labelledby="custom-tabs-one-home-tab">
							<!-- 						<div class="tab-pane fade active show" id="custom-tabs-one-home"
							role="tabpanel" aria-labelledby="custom-tabs-one-home-tab"> -->

							<!-- <div class="card-body" style="text-align:center;"> -->
							<div class="row">
								<div class="col-sm-12"></div>
								<form>
									<div class="card-tools">
										<button type="button" id="myButton1" class="btn btn-primary" style="position:relative; left:200%; top: 3px;">배송조회</button>
										<!-- <button type="button" id="myButton1" class="btn btn-primary" style="position:relative; left:200%; margin-bottom: 15px;">배송조회</button> -->
										<button type="reset" id="resetBtn" class="btn btn-primary"3
											style="position: relative; left: 202%; top: 3px; ">초기화</button>
										<input type="button" id="a" name="a" style="position: relative; left: 1050px;" onclick="test();" value="시연">
									</div>

									<span id="tekbeCompnayName" style="margin-left: 100px; position: relative; bottom: 30px;">택배회사명:
									</span> <select id="tekbeCompnayList" name="tekbeCompnayList"
										style="width: 300px; position: relative; bottom: 30px;">
										<option selected="" disabled="">택배사 선택</option>
										<option data-code="04" data-name="CJ대한통운">CJ대한통운</option>
										<option data-code="01" data-name="우체국택배">우체국택배</option>
										<option data-code="05" data-name="한진택배">한진택배</option>
										<option data-code="08" data-name="롯데택배">롯데택배</option>
										<option data-code="06" data-name="로젠택배">로젠택배</option>
										<option data-code="54" data-name="홈픽택배">홈픽택배</option>
										<option data-code="24" data-name="CVSnet 편의점택배(GS25)">CVSnet
											편의점택배(GS25)</option>
										<option data-code="46" data-name="CU 편의점택배">CU 편의점택배</option>
										<option data-code="23" data-name="경동택배">경동택배</option>
										<option data-code="22" data-name="대신택배">대신택배</option>
										<option data-code="11" data-name="일양로지스">일양로지스</option>
										<option data-code="32" data-name="합동택배">합동택배</option>
										<option data-code="18" data-name="건영택배">건영택배</option>
										<option data-code="17" data-name="천일택배">천일택배</option>
										<option data-code="20" data-name="한덱스">한덱스</option>
										<option data-code="16" data-name="한의사랑택배">한의사랑택배</option>
										<option data-code="12" data-name="EMS">EMS</option>
										<option data-code="13" data-name="DHL">DHL</option>
										<option data-code="25" data-name="TNT Express">TNT
											Express</option>
										<option data-code="14" data-name="UPS">UPS</option>
										<option data-code="21" data-name="Fedex">Fedex</option>
										<option data-code="26" data-name="USPS">USPS</option>
										<option data-code="34" data-name="i-Parcel">i-Parcel</option>
										<option data-code="33" data-name="DHL Global Mail">DHL
											Global Mail</option>
										<option data-code="37" data-name="LX판토스">LX판토스</option>
										<option data-code="28" data-name="GSMNtoN">GSMNtoN</option>
										<option data-code="38" data-name="ECMS Express">ECMS
											Express</option>
										<option data-code="30" data-name="KGL네트웍스">KGL네트웍스</option>
										<option data-code="40" data-name="굿투럭">굿투럭</option>
										<option data-code="45" data-name="호남택배">호남택배</option>
										<option data-code="41" data-name="GSI Express">GSI
											Express</option>
										<option data-code="44" data-name="SLX택배">SLX택배</option>
										<option data-code="47" data-name="우리한방택배">우리한방택배</option>
										<option data-code="52" data-name="세방">세방</option>
										<option data-code="57" data-name="Cway Express">Cway
											Express</option>
										<option data-code="60" data-name="YJS글로벌(영국)">YJS글로벌(영국)</option>
										<option data-code="51" data-name="성원글로벌카고">성원글로벌카고</option>
										<option data-code="62" data-name="홈이노베이션로지스">홈이노베이션로지스</option>
										<option data-code="63" data-name="은하쉬핑">은하쉬핑</option>
										<option data-code="66" data-name="Giant Network Group">Giant
											Network Group</option>
										<option data-code="64" data-name="FLF퍼레버택배">FLF퍼레버택배</option>
										<option data-code="53" data-name="농협택배">농협택배</option>
										<option data-code="65" data-name="YJS글로벌(월드)">YJS글로벌(월드)</option>
										<option data-code="67" data-name="디디로지스">디디로지스</option>
										<option data-code="69" data-name="대림통운">대림통운</option>
										<option data-code="70" data-name="LOTOS CORPORATION">LOTOS
											CORPORATION</option>
										<option data-code="43" data-name="애니트랙">애니트랙</option>
										<option data-code="72" data-name="성훈물류">성훈물류</option>
										<option data-code="71" data-name="IK물류">IK물류</option>
										<option data-code="79" data-name="로지스밸리택배">로지스밸리택배</option>
										<option data-code="81" data-name="제니엘시스템">제니엘시스템</option>
										<option data-code="84" data-name="스마트로지스">스마트로지스</option>
										<option data-code="87" data-name="이투마스(ETOMARS)">이투마스(ETOMARS)</option>
										<option data-code="85" data-name="풀앳홈">풀앳홈</option>
										<option data-code="82" data-name="프레시솔루션">프레시솔루션</option>
										<option data-code="88" data-name="큐런택배">큐런택배</option>
										<option data-code="89" data-name="두발히어로">두발히어로</option>
										<option data-code="91" data-name="하이브시티">하이브시티</option>
										<option data-code="94" data-name="오늘의픽업">오늘의픽업</option>
										<option data-code="93" data-name="팬스타국제특송(PIEX)">팬스타국제특송(PIEX)</option>
										<option data-code="92" data-name="지니고 당일배송">지니고 당일배송</option>
										<option data-code="96" data-name="로지스밸리">로지스밸리</option>
										<option data-code="99" data-name="롯데국제특송">롯데국제특송</option>
										<option data-code="100" data-name="나은물류">나은물류</option>
										<option data-code="101" data-name="한샘서비스원 택배">한샘서비스원
											택배</option>
										<option data-code="102" data-name="배송하기좋은날 (SHIPNERGY)">배송하기좋은날
											(SHIPNERGY)</option>
										<option data-code="103" data-name="NDEX KOREA">NDEX
											KOREA</option>
										<option data-code="104" data-name="도도플렉스(dodoflex)">도도플렉스(dodoflex)</option>
										<option data-code="105" data-name="브릿지로지스㈜">브릿지로지스㈜</option>
										<option data-code="106" data-name="허브넷로지스틱스">허브넷로지스틱스</option>
										<option data-code="108" data-name="MEXGLOBAL">MEXGLOBAL</option>
										<option data-code="49" data-name="A.C.E EXPRESS INC">A.C.E
											EXPRESS INC</option>
										<option data-code="113" data-name="썬더히어로">썬더히어로</option>
										<option data-code="112" data-name="1004홈">1004홈</option>
										<option data-code="114" data-name="㈜캐나다쉬핑">㈜캐나다쉬핑</option>
										<option data-code="110" data-name="부릉">부릉</option>
										<option data-code="117" data-name="YUNDA EXPRESS">YUNDA
											EXPRESS</option>
										<option data-code="120" data-name="발렉스 특수물류">발렉스 특수물류</option>
										<option data-code="109" data-name="윈핸드해운항공">윈핸드해운항공</option>
										<option data-code="119" data-name="핑퐁">핑퐁</option>
										<option data-code="121" data-name="바바바(bababa)">바바바(bababa)</option>
										<option data-code="122" data-name="BAIMA EXPRESS">BAIMA
											EXPRESS</option>
										<option data-code="123" data-name="엔티엘피스">엔티엘피스</option>
										<option data-code="124" data-name="LTL">LTL</option>
										<option data-code="125" data-name="GTS 로지스">GTS 로지스</option>
										<option data-code="126" data-name="㈜올타코리아">㈜올타코리아</option>
										<option data-code="128" data-name="판월드로지스틱㈜">판월드로지스틱㈜</option>
										<option data-code="95" data-name="큐익스프레스">큐익스프레스</option>
									</select> <span class="select_item"> </span>
							</div>
							
							
							<br /> <span id="invoiceNumber"
								style="margin-left: 40px; position: relative; bottom: 80px; left: 500px;">운송장번호:
							</span> <input type="text" id="invoiceNumberText"
								name="invoiceNumberText"
								style="width: 300px; position: relative; bottom: 80px; left: 500px;"><br />
							<br />

							</form>
							<br /> <br />
							<div style="position: relative; bottom: 70px;">
								<table id="myPtag"></table>
							</div>
							<br />
							<div style="position: relative; bottom: 95px;">
								<table id="myPtag2"></table>
							</div>


							<!-- col-sm-12 -->
						</div>
						<!-- row -->
						<%-- <div class="card-footer">
								<%@ include file="/WEB-INF/views/common/paginationhq.jsp" %>    		
							</div> --%>
					</div>
					<!-- card-body -->



				</div>

			</div>
		</div>
		<!-- /.card -->

	</div>

	<script src="<%=request.getContextPath() %>/resources/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/smart-download-module.js"></script>
		
	<script>
	function test() {
		document.getElementById("tekbeCompnayList").value = "04";	
		document.getElementById("invoiceNumberText").value = "552637712641";	
		
	}
	</script>
</body>
</html>






