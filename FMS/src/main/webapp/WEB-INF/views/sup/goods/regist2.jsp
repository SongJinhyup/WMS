<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="lacaList" value="${dataMap.lacaList }" />
<c:set var="smcaList" value="${dataMap.smcaList }" />

<head>
<style>
th{
	text-align: center;
	vertical-align: center;
	width:15%;
}
/* td { */
/* 	width:35%; */
/* 	vertical-align: center; */
/* } */

.td1{
	width:35%;
}

</style>
</head>

<title>물품관리</title>

<body>
	<section class="content-header" style="padding: 0">
	
		<div style="padding:10px 0 0 10px;">
			<h4>물품 등록</h4> 
				<input type="button" id="a" name="a" style="float: right;" onclick="test();" value="시연">
		</div>
		
		<div class="row">
			<div class="col-sm-10">
		 	 <h3 class="card-title" style="padding:8px">물품 등록 작성법(Example)</h3>
			 </div>
			 <div class="float-right" style="padding:0 0 0 50px;">
			<!-- 		<h3 class="my-3">물품등록 -->
				<button type="button" class="btn btn-primary float-sm-right" id="registBtn" onclick="regist_go()">등 록</button>
				<button type="button" class="btn btn-default float-right" id="cancelBtn" onclick="history.go(-1);" style=" margin-right: 8px;">취 소</button>
			<!-- 			              </h3><hr style="margin-bottom:10px;"> -->
			 </div>
		</div>
	  
	  	<div class="info-box" style="margin-top: 10px; padding-top: 15px;background: #E6E6E6;">
            <div class="info-box-content" style="font-size: 14px;">
              <span class="info-box-text">*중복된 물품코드는 등록할 수 없습니다.</span>
              <span class="info-box-text">*이미지는 JPG/JPEG/PNG 파일만 등록가능합니다.</span>
              <span class="info-box-text">*해당사항이 없는 칸은 '0'으로 입력하십시오.</span>
              <span class="info-box-text">*추가적인 물품의 특성은 물품특성란에 작성하십시오.</span>
              <span class="info-box-text">*form을 작성한 후 등록버튼을 클릭해 물품을 등록합니다.</span>
            </div>
           <!-- /.info-box-content -->
      	</div>
	</section>

<jsp:include page="../js/regist_js.jsp" />
	
  
  <section >
		<form role="form" class="form-horizontal" action="regist2.do" name="registForm"  method="post">	 	
			<input type="hidden" name="sup_goods_img" />
				<div class="card-body" style="padding-top:10px;height:75vh;overflow-y:scroll;overflow-x:hidden">
		          <div class="row">
		            <div class="col-12 col-sm-4" style="padding-top:15px">
			              <div class="col-12">
							<div class="product-image" id="pictureView" style="border: 1px solid #D8D8D8; height:450px;"></div>														
							<div class="input-group input-group-sm" style="padding-top: 5px;">
		                        <label for="inputFile" class=" btn btn-warning btn-sm btn-flat input-group-addon">파일선택</label>
		                        <input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled/>
	<!-- 	                        <input id="inputFileName" class="form-control" type="text" name="sup_goods_img" disabled/> -->
		                        <span class="input-group-append-sm">                                 
		                         <button type="button" class="btn btn-info btn-sm btn-append" onclick="upload_go();">업로드</button>                                 
		                        </span>
							</div>		
		                   	<span style="color:red;font-weight:bold;">*</span>이미지를 업로드 하십시오.
	              		 </div>
                    </div>
	<!--             </div> -->
	            
		            <div class="col-12 col-sm-8">
						<div class="col-sm-12">
							<table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
					                
					                <tbody>
					                <tr role="row" class="odd">
					                  <th class="sorting_1">물품명<span style="color:red;font-weight:bold;">*</span></th>
					                  <td class="td1">
				                          <input type="text" class="form-control" id="sup_goods_name" name="sup_goods_name">
					                  </td>
					                  <th>물품코드<span style="color:red;font-weight:bold;">*</span></th>
					                  <td colspan="2">
					                  <input type="text" class="form-control" id="sup_goods_code" name="sup_goods_code">
									 </td>
					                </tr>
					                
					                <tr role="row" class="even">
					                  <th class="sorting_1">대분류<span style="color:red;font-weight:bold;">*</span></th>
					                  <td class="td1">	  
					               		<select class="form-control" id="idLaca" name="sup_goods_laca" onchange="getSmcaList();">
											<c:if test="${!empty lacaList}">
								  			<option value="">선택 </option>
								  			<c:forEach var ="lacaList" items="${lacaList}">
								  				<option value="${lacaList}" <c:if test="${map.laca eq lacaList}">selected</c:if> >${lacaList}</option>
								  			</c:forEach>
								  			</c:if>			
					                   </select>
						              </td>
					                  <th>소분류<span style="color:red;font-weight:bold;">*</span></th>
					                  <td colspan="2">
						                  <select class="form-control" name="sup_goods_smca" id="idSmca" >
									  		<c:if test="${!empty smcaList}">
									  		<option value="" >선택</option>
									  		<c:forEach var ="smcaList" items="${smcaList}">
									  			<option value="${smcaList}"  <c:if test="${map.smca eq smcaList}">selected</c:if> >${smcaList}</option>
									  		</c:forEach>
								  			</c:if>
									  	</select>			
					                  </td>
					                </tr>
					                
					                <tr role="row" class="odd">
					                  <th class="sorting_1">납품가(원)<span style="color:red;font-weight:bold;">*</span></th>
					                  <td class="td1">
					                     <input type="text" class="form-control" id="sup_goods_price" name="sup_goods_price">
					                  </td>
					                  <th>용량(단위)</th>
					                  <td>
					                      <input type="text" class="form-control" id="sup_goods_attr1" name="sup_goods_attr1">
					                  </td>
					                  <td>
					                     <input type="text" class="form-control" id="sup_goods_unit" name="sup_goods_unit">
					                  </td>
				                   </tr>	                
				
					                <tr role="row" class="even">
					                  <th class="sorting_1">포장재질</th>
					                  <td class="td1">	
					                      <input type="text" class="form-control" id="sup_goods_attr2" name="sup_goods_attr2">
					                  </td>
					                  <th>물품재질</th>
					                  <td colspan="2">
					                      <input type="text" class="form-control" id="sup_goods_attr3" name="sup_goods_attr3">
					                  </td>
					                </tr>
					                
					                <tr role="row" class="odd">
					                  <th class="sorting_1">가로(cm)</th>
					                  <td class="td1">
					                      <input type="text" class="form-control" id="sup_goods_attr4" name="sup_goods_attr4">
					                  </td>
					                  <th>세로(cm)</th>
					                  <td colspan="2">
					                      <input type="text" class="form-control" id="sup_goods_attr5" name="sup_goods_attr5">
					                  </td>
					                </tr>
					                
					                <tr role="row" class="even">
					                  <th class="sorting_1">높이(cm)</th>
					                  <td class="td1">
					                      <input type="text" class="form-control" id="sup_goods_attr6" name="sup_goods_attr6">
					                  </td>
					                  <th>무게(kg)</th>
					                  <td colspan="2">
					                      <input type="text" class="form-control" id="sup_goods_attr7" name="sup_goods_attr7">
					                  </td>
					                </tr>
					                
					                <tr role="row" class="odd" rowspan='4'>
					                  <th class="sorting_1" style="margin: 0">물품특성</th>
					                  <td colspan='4'>
						                  <textarea class="form-control" id="sup_goods_attr8" name="sup_goods_attr8"
						                  	 rows="5" placeholder="원재료 및 함유량, 재질 등 물품의 특성에 대해 작성하시오." ></textarea>
					                  </td>
					                </tr>
					               </tbody>
				              </table>
			             </div>
		           </div>
		         </div>
		     </div>
		</form>
</section>

<form role="imageForm" action="upload/picture.do" method="post" enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control" onchange="picture_go();"
			style="display:none;">
	<input id="oldFile" type="hidden" name="oldPicture" value="" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>

<script type="text/javascript">
	function getSmcaList(){
		var form= $('#searchFrom');
		var url ="<%=request.getContextPath()%>/sup/goods/searchSmca";
		var param = $("#idLaca option:selected").val();
		
// 		console.log(param);
		
		$.ajax({
			url 	: url,
			type	:"post",
			data	:param,
			contentType:'application/json',
			success:function(data){	//성공하면 data가 넘어옴
				var res = "<option value=''>전체</option>";
				console.log(data);
				$.each(data, function(i,v){
					res+="<option value='"+data[i]+"'>"+data[i]+"</option>"
				})
				$('#idSmca').html(res);
			}
		})
	}

</script>
<script>

function regist_go(){
	
	var form = document.registForm;
	if(form.sup_goods_name.value==""){
		alert("물품명 입력은 필수입니다.");
		return;
	}
	if(form.sup_goods_price.value==""){
		alert("납품가 입력은 필수입니다.");
		return;
	}
	if(form.sup_goods_laca.value==""){
		alert("대분류 선택은 필수입니다.");
		return;
	}
	if(form.sup_goods_smca.value==""){
		alert("물품종류 입력은 필수입니다.");
		return;
	}
	
	form.submit();
}


</script>
<script>
function test() {
	
  document.getElementById("sup_goods_name").value = "바닐라시럽";
  document.getElementById("sup_goods_code").value = "SG9061";
  document.getElementById("sup_goods_price").value = "2500";
  document.getElementById("sup_goods_attr1").value = "2";
  document.getElementById("sup_goods_unit").value = "L";
  document.getElementById("sup_goods_attr2").value = "폴리에틸렌";
  document.getElementById("sup_goods_attr3").value = "설탕,정제수,천영향료";
  document.getElementById("sup_goods_attr4").value = "15";
  document.getElementById("sup_goods_attr5").value = "10";
  document.getElementById("sup_goods_attr6").value = "28";
  document.getElementById("sup_goods_attr7").value = "1000";
  document.getElementById("sup_goods_attr8").innerHTML = "바닐라향 풍부";
  
  document.getElementById("sup_goods_attr8").innerHTML = "바닐라향 풍부";
  document.getElementById("sup_goods_attr8").innerHTML = "바닐라향 풍부";
  
}
</script>
</body>

