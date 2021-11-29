<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<style>
table{
	text-align: center;
}
.card-header{
	margin:0px 6px;
}
</style>

</head>

<title>물품상세내용</title>

<body>
	 
	 <!-- Main content -->
    <section class="content" style="height:90vh;overflow-y:scroll;overflow-x:hidden ">		
		<div class="card">
			<div class="col-sm-12" style="padding:20px 30px 0px 5px; margin-bottom: 10px;">
				<c:if test="${supGoods.supVO.sup_contract_st eq 1}">
					<button type="button" class="btn btn-primary btn-sm float-right" id="registBtn" onclick="OpenWindow('buyReqForm.do?sup_goods_code=${supGoods.sup_goods_code}','물품구매요청',800,600);">구매요청</button>				
					<button type="button" class="btn btn-default btn-sm float-right" id="listBtn" onclick="location.href='buy.do'" style="margin-right:8px;">물품목록</button>				
				</c:if>
				<c:if test="${supGoods.supVO.sup_contract_st ne 1}">
					<button type="button" class="btn btn-success btn-sm float-right">공급업체계약요청</button>
				</c:if>
			</div>
			
			<!-- -------------------- -->
			<div class="row">
	          <div class="col-12">
	            <div class="card" style="padding:0px 20px;">
	              <div class="card-header" style="background-color:#E6E6E6;padding-bottom: 5px;">
	              	<i class="fas fa-info-circle float-left" style="padding:4px 5px 0 0; "></i><span class="card-title" style="font-size:16px;"><b>물품상세정보</b></span>
	              	<span class="float-right" style="font-size: 10px; padding-top:15px;"><span style="color:red;font-weight:bold;">*</span>물품상세정보 수정은 공급업체에 문의하십시오.</span>
	              </div>
	              <!-- /.card-header -->
	              <div class="col-sm-12">
		              <table id="example2" class="table table-bordered dataTable" role="grid" aria-describedby="example2_info" style="font-size:15px;">
<!-- 		                <thead> -->
		                <tr role="row">
		                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="2" style="width:150px;">물품이미지</th>
		                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">물품명</th>
		                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">납품가(원)</th>
		               
		                </tr>
<!-- 		                </thead> -->
<!-- 		                <tbody> -->
		                <tr role="row" >
		                  <td class="sorting_1" rowspan="9" colspan="2">
		                  	<div class="product-image col-sm-2" id="pictureView" 
									style="height:350px; background-image:url('<%=request.getContextPath()%>/sup/goods/getPicture.do?sup_goods_img=${supGoods.sup_goods_img}');background-repeat:no-repeat;background-position:center;background-size:cover;"></div>
		                  </td>
		                  <td class="sorting_1" colspan="2">${supGoods.sup_goods_name }</td>
		                  <td colspan="2"><fmt:formatNumber value="${supGoods.sup_goods_price}" pattern="#,###"></fmt:formatNumber> </td>
		                 
		                </tr>
<!-- 		                </tbody> -->
<!-- 		                <thead> -->
		                 <tr role="row">
		                  <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">물품분류</th>
		                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">물품종류</th>
		                </tr>
<!-- 		                </thead> -->
<!-- 		                <tbody> -->
		                <tr role="row" >
		                 <td colspan="2">${supGoods.sup_goods_laca}</td>
		                  <td colspan="2">${supGoods.sup_goods_smca}</td>
		                </tr>
<!-- 		                </tbody> -->
<!-- 		                <thead> -->
		                 <tr role="row">
		                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">물품재질</th>
		                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">포장재질</th>
		                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">용량(단위)</th>
		                </tr>
<!-- 		                </thead> -->
<!-- 		                <tbody> -->
		                <tr role="row" >
		                  <td class="sorting_1" colspan="2">${supGoods.sup_goods_attr2}</td>
		                  <td>${supGoods.sup_goods_attr3}</td>
 		                  <td>${supGoods.sup_goods_attr1}${supGoods.sup_goods_unit}</td>
		                </tr>
<!-- 		                </tbody> -->
<!-- 		                <thead> -->
		                 <tr role="row">
		                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">가로(cm)</th>
		                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">세로(cm)</th>
		                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">높이(cm)</th>
		                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">무게(kg)</th>
		                </tr>
<!-- 		                </thead> -->
<!-- 		                <tbody> -->
		                <tr role="row" >
		                  <td>${supGoods.sup_goods_attr4}</td>
		                  <td>${supGoods.sup_goods_attr5}</td>
		                  <td>${supGoods.sup_goods_attr6}</td>
		                  <td>${supGoods.sup_goods_attr7}</td>
		                </tr>
<!-- 		                </tbody> -->
<!-- 		                <thead> -->
		                 <tr role="row">
		                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="4">제품특성</th>
		                </tr>
<!-- 		                </thead> -->
<!-- 		                <tbody> -->
		                <tr role="row" >
		                  <td class="sorting_1" colspan="4">${supGoods.sup_goods_attr8}</td>
		                </tr>
<!-- 		                </tbody> -->
		              </table>
	              </div><!-- /.card-body -->
	            </div><!-- /.card -->
	            
	            <div class="card"  style="padding:0px 20px;"><!-- card supply 정보-->
	              <div class="card-header" style="background-color:#E6E6E6;">
	                <i class="fas fa-warehouse float-left" style="padding:4px 5px 0 0;"></i>
	                <span class="card-title" style="font-size:16px;"><b>공급업체정보</b></span>
	              </div>
	              <!-- /.card-header -->
	              <div class="col-sm-12">
		              <table id="example2" class="table table-bordered dataTable" role="grid" aria-describedby="example2_info" style="font-size:14px;">
		                <c:if test="${supGoods.supVO.sup_contract_st eq 1}">
			                <thead>
				                <tr role="row">
					                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">공급업체명</th>
					                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">대표명</th>
					                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">전화번호</th>
					                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">이메일</th>
				                </tr>
			                </thead>
			                <tbody>
				                <tr role="row" >
				                  <td class="sorting_1" colspan="2">${supGoods.supVO.sup_name }
<%-- 				                  	<button type="button" class="btn btn-warning">${codeName}</button> --%>
				                  </td>
				                  <td>${supGoods.supVO.sup_owner}</td>
				                  <td>${supGoods.supVO.sup_tel}</td>
				                  <td>${supGoods.supVO.sup_email}</td>
				                </tr>
			                </tbody>
		                </c:if>
					
					<c:if test="${supGoods.supVO.sup_contract_st ne 1}">
					 	<thead>
			                <tr role="row">
								 <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="3">공급업체명</th>
				                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">계약종료일</th>
			                </tr>
		                </thead>
		                <tbody>
			                <tr role="row" >
				              <td class="sorting_1" colspan="3">${supGoods.supVO.sup_name }&nbsp;&nbsp;
					             <button type="button" class="btn btn-warning" style="font-size: 13px;"><b>계약중</b></button>
					          </td>
			                  <td class="sorting_1" colspan="2">
			                  	<fmt:formatDate value="${supGoods.supContInfoVO.sup_cont_end }" pattern="yyyy-MM-dd" />
			                  </td>
			                </tr>
		                </tbody>
		                <thead>
				                <tr role="row">
					                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">대표명</th>
					                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">전화번호</th>
					                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">이메일</th>
				                </tr>
			                </thead>
			                <tbody>
				                <tr role="row" >
				                  <td>${supGoods.supVO.sup_owner}</td>
				                  <td colspan="2">${supGoods.supVO.sup_tel}</td>
				                  <td colspan="2">${supGoods.supVO.sup_email}</td>
				                </tr>
			                </tbody>
					</c:if>

		                <thead>
			                <tr role="row">
				                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="3">주소</th>
				                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">사업자등록번호</th>
			                </tr>
		                </thead>
		                <tbody>
			                <tr role="row" >
			                  <td class="sorting_1" colspan="3">${supGoods.supVO.sup_zip}${supGoods.supVO.sup_addr}${supGoods.supVO.sup_detail_addr}</td>
			                  <td colspan="2">${supGoods.supVO.sup_business_no}</td>
			                </tr>
		                </tbody>
		                <thead>
			                <tr role="row">
				                <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">주요거래물품</th>
				                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1">거래은행</th>
				                <th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="2">계좌번호</th>
			                </tr>
		                </thead>
		                <tbody>
			                <tr role="row" >
			                  <td class="sorting_1" colspan="2">${supGoods.supVO.sup_prod}</td>
			                  <td colspan="1">${supGoods.supVO.sup_bank}</td>
			                  <td colspan="2">${supGoods.supVO.sup_account}</td>
			                </tr>
		                </tbody>
		              </table>
	              </div><!-- /.card-body -->
	            </div><!-- /.card supply -->
	          </div>
	        </div>
			<div class="card-footer">
			</div>
		</div>
		
    </section>
    <!-- /.content -->

</body>

