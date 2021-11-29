<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="boardList" value="${dataMap.orderList }" />
<c:set var="franList" value="${dataMap.franList }" />
<c:set var="cri" value="${pageMaker.cri }" />

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
.content {
	font-family: 'Noto Sans KR', sans-serif;
}
.table {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 13px;
    text-align: center;
}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body class="sidebar-mini sidebar-collapse" style="height: auto;">
<div class="">
  <!-- Content Wrapper. Contains page content -->
  <div class="" style="min-height: 1071.31px;">
<!--     Content Header (Page header) -->
    <section class="content-header">

    </section>

<!--     Main content -->
    <section class="content">
      <div class="container-fluid">
<!--         SELECT2 EXAMPLE -->
        <div class="card card-default">
          <div class="card-header">
            <h3 class="card-title">가맹점 발주 관리</h3>
          </div>
<!--           /.card-header -->
          <div class="card-body" style="padding-bottom:0px; padding-top:10px;">
            <div class="row">
              <div class="col-md-3" data-select2-id="57">         
                <div class="form-group">
                  <label>승인 여부</label>
                  <select class="form-control select2 select2-hidden-accessible" name="apprSt" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
                    <option data-select2-id="3" value="0">승인여부선택</option>
                    <option data-select2-id="3" value="1" ${cri.keywordMap.apprSt=='1' ? 'selected' : '' }>승인</option>
                    <option data-select2-id="3" value="2" ${cri.keywordMap.apprSt=='2' ? 'selected' : '' }>미승인</option>
                  </select>
                </div>
                </div>
              <div class="col-md-3" data-select2-id="57">         
                <div class="form-group">
                  <label>발주 상태</label>
                  <select class="form-control select2 select2-hidden-accessible" name="orderSt" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
                    <option data-select2-id="3" value="">발주상태선택</option>
                    <option data-select2-id="3" value="1" ${cri.keywordMap.orderSt=='1' ? 'selected' : '' }>발주중</option>
                    <option data-select2-id="3" value="2" ${cri.keywordMap.orderSt=='2' ? 'selected' : '' }>발주 완료</option>
                  </select>
                </div>
                </div>
              <div class="col-md-3" data-select2-id="57">         
                <div class="form-group">
                  <label>가맹점명</label>
                  <select class="form-control select2 select2-hidden-accessible" name="franName" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
                  		<option value="">가맹점선택</option>
                  	<c:if test="${!empty franList }">
	                  	<c:forEach items="${franList }" var="franList" >
	                  		<option value="${franList.fran_code }" ${cri.keywordMap.franCode==franList.fran_code ? 'selected' : '' } >${franList.fran_name }</option> 
	                  	</c:forEach>
                  	</c:if>	
                  </select>
                </div>
                </div>
               <div class="col-md-3" data-select2-id="57">  
                <div class="form-group">
                  <label>발주 신청 일자</label>
                  

                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">
                        <i class="far fa-calendar-alt"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control float-right" name="orderDate" id="reservationTime" style="font-size:13px;">
                  </div>
                  <!-- /.input group -->
                </div>
               </div> 
               

         
            

<!--                 /.form-group -->
              </div>
<!--               /.col -->
	</div>

		<div class="col-12">
              <div class="card-body table-responsive p-0" style="padding-bottom:10px;">
                <table class="table table-hover" style="padding-bottom:10px;">
                  <thead>
                    <tr>
                      <th>발주코드</th>
                      <th>가맹점코드</th>
                      <th>발주일자</th>
                      <th>발주총금액</th>
                      <th>승인여부</th>
                      <th>발주상태</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${boardList }" var="orderList">
                   <tr onclick="OpenWindow('detail.do?fran_order_code=${orderList.fran_order_code }&fran_appr_st=${orderList.fran_appr_st }&fran_code=${orderList.fran_code }','','730','740');" style="cursor:pointer;" style='font-size:0.85em;'>
                      <td style="height: 20%;">${orderList.fran_order_code }</td>
                      <td>${orderList.fran_code }</td>
                      <td><fmt:formatDate value="${orderList.fran_order_date }" pattern="yyyy-MM-dd" /></td>
                      <td>${orderList.fran_order_price }</td>
                      <c:if test="${orderList.fran_appr_st eq 1}">
                      	<td>승인</td>
                      </c:if>
                      <c:if test="${orderList.fran_appr_st eq 2}">
                      	<td>미승인</td>
                      </c:if>
                      <c:if test="${orderList.order_st_code eq 1}">
                      	<td>발주중</td>
                      </c:if>
                      <c:if test="${orderList.order_st_code eq 2}">
                      	<td>발주완료</td>
                      </c:if>
                    </tr>
                  </c:forEach>  
        
                   
                  </tbody>
                </table>

              </div>
              <!-- /.card-body -->
	          <div class="card-footer">
				<nav aria-label="pds list Navigation">
					<ul class="pagination justify-content-center m-0">
						<%@ include file="/WEB-INF/views/common/paginationLStock.jsp" %>	
					</ul>
				</nav>
			</div>
            </div>
            <!-- /.card -->
   
            		

          </div>

		</div>
           </section>
		</div>
	  </div>

    <form id="searchForm">
	    <input type="hidden" name="fran_appr_st" id="apprSt">
	    <input type="hidden" name="order_st_code" id="orderSt">
	    <input type="hidden" name="fran_code" id="franName">
	    <input type="hidden" name="orderDate" id="orderDate">
<!-- 	    <input type="hidden" name="startDate" id="startDate"> -->
<!-- 	    <input type="hidden" name="endDate" id="endDate"> -->
    </form>


<script type="text/javascript">
	window.onload=function(){
				
		 //Initialize Select2 Elements
	    $('.select2').select2()

	    //Initialize Select2 Elements
	    $('.select2bs4').select2({
	      theme: 'bootstrap4'
	    });

		 
		 $('input#reservationTime').daterangepicker({
			    opens: 'left', locale :{ 
			        format: 'YYYY-MM-DD',
			        autoUpdateInput: false,
// 			        separator: ',',
			        applyLabel: "적용",
			        cancelLabel: "닫기"
			      }
		  }, function(start, end, label) {
// 		    alert("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
// 		    alert(start);
// 		    alert(end);
// 		    alert($('#reservationTime').val());
// 		    searchList();
		});
		 
		 $('input#reservationTime').on('apply.daterangepicker', function(ev, picker) {
			    $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
			});
		 
		if('${cri.keywordMap.startDate}'){
			$("input#reservationTime").val('${cri.keywordMap.startDate}' + " - " + '${cri.keywordMap.endDate}'); 
		}else{
			$("input#reservationTime").val('');
		}
		 
		$('select[name="apprSt"]').change(function(event){
// 			alert($(this).val());
			searchList();
		});
		$('select[name="orderSt"]').change(function(event){
// 			alert($(this).val());
			searchList();
		});
		$('select[name="franName"]').change(function(event){
// 			alert($(this).val());
			searchList();
		});
		$('#reservationTime').change(function(event){
// 			alert($(this).val());
			searchList();
		});
		/* $('input[name="orderDate"]').change(function(event){
			alert($(this).val());
// 			searchList();
		}); */
	}
	
	function searchList(){
// 		var orderDate = $('#reservationTime').val();
// 		var dateSplit = orderDate.split(',');
// 		var startDate = dateSplit[0];
// 		var endDate = dateSplit[1];
		var searchForm = $("#searchForm").get(0);
		$("#apprSt").val( $('select[name="apprSt"]').val() );
		$("#orderSt").val($('select[name="orderSt"]').val());
		$("#franName").val($('select[name="franName"]').val());
		$("#orderDate").val($('#reservationTime').val());

// 		$("#startDate").val($('#reservationTime').data('daterangepicker').startDate);
// 		$("#endDate").val($('#reservationTime').data('daterangepicker').endDate);
		searchForm.submit();
		
	}
</script>


</body>
</html>