<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>반품신청등록</title>

<head>
<!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
</head>
<body>
   <div class="card card-primary">
              <div>
                <div>
                <button type="button" id="listBtn" class="btn btn-secondary" onclick="CloseWindow();" style="float: right">닫기</button>
                <button type="button" id="submitBtn" class="btn btn-primary" onclick="submit();" style="float: right">승인</button>
                <h2 style="text-align: center;">가맹점신청</h2><span style="float: right;"><strong><i class="fas fa-pencil-alt mr-1"></i> 임시코드 : ${detail.fran_code }</strong></span>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-header">
                <h3 class="card-title"><strong><i class="far fa-file-alt mr-1">&nbsp;</i>인적사항</strong></h3>
              </div>
              <div class="card-body row col-12">
                <div class="form-group col-3">
                  <label for="exampleInputBorder">신청자</label>
                  <input type="text" class="form-control form-control-border" id="exampleInputBorder" value="${detail.fran_owner }" readonly>
                </div>
                <div class="form-group col-3">
                  <label for="exampleInputBorder">연락처</label>
                  <input type="text" class="form-control form-control-border" id="exampleInputBorder" value="${detail.fran_tel }" readonly>
                </div>
                <div class="form-group col-3">
                  <label for="exampleInputBorder">이메일</label>
                  <input type="text" class="form-control form-control-border" id="exampleInputBorder" value="${detail.fran_email }" readonly>
                </div>
                <div class="form-group col-2">
                  <label for="exampleInputBorderWidth2">점포구분</label>
                  <c:if test="${detail.fran_se eq '1' }">
                  <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" value="본인" readonly>
                  </c:if>
                  <c:if test="${detail.fran_se eq '2' }">
                  <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" value="임대" readonly>
                  </c:if>
                </div>
                
              </div>                
                <div class="card-header">
                  <h3 class="card-title"><strong><i class="fas fa-info">&nbsp;&nbsp;</i>점포상세</strong></h3>
                </div>
                <div class="cord-body row col-12">
                
                <div class="form-group col-4">
                  <label for="exampleInputBorderWidth2">층</label>
                  <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" value="${detail.floor }층" readonly>
                </div>
                <div class="form-group col-4">
                  <label for="exampleInputBorderWidth2">토지면적</label>
                  <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" value="${detail.land_area }평" readonly>
                </div>
                <div class="form-group col-4">
                  <label for="exampleInputBorderWidth2">전용면적</label>
                  <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" value="${detail.dedicated_area }평" readonly>
                </div>
                </div>
                <div class="cord-body row col-12">
                <div class="form-group col-4">
                  <label for="exampleInputBorderWidth2">보증금</label>
                  <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" value="${detail.fran_gtn }원" readonly>
                </div>
                <div class="form-group col-4">
                  <label for="exampleInputBorderWidth2">임대료</label>
                  <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" value="${detail.fran_rent_charge }원" readonly>
                </div>
                <div class="form-group col-4">
                  <label for="exampleInputBorderWidth2">관리비</label>
                  <input type="text" class="form-control form-control-border border-width-2" id="exampleInputBorderWidth2" value="${detail.fran_rent_charge }원" readonly>
                </div>
                <div class="form-group col-6">
                  <label for="exampleInputBorder">주 소</label>
                  <input type="text" class="form-control form-control-border" id="exampleInputBorder" value="${detail.fran_addr } ${detail.fran_detail_addr}" readonly>
                </div>
                
                <div class="form-group col-12">
                <i class="fas fa-info-circle"></i>
                  <label for="exampleInputBorderWidth2">기타</label>
                  <textarea cols="105" rows="8" readonly>${detail.fran_memo }</textarea>
                </div>
                
                <div class="form-group col-sm-12">
		               <i class="fas fa-save"></i>
		               <label for="fran_name">첨부파일</label> 
                        <div class="card-footer">
                           <div class="row">
                              <c:if test="${empty attachList }">
                              <strong style="text-align: center;">첨부파일이 없습니다.</strong>
                              </c:if>
                              <c:forEach items="${attachList }" var="attach">
                                 <div class="col-md-4 col-sm-4 col-xs-12"  style="cursor:pointer;" onclick="location.href='<%=request.getContextPath()%>/hq/com/getFile.do?attach_no=${attach.attach_no }';">
                                    <div class="info-box" style="width:250px; height:20px; ">
                                        <span class="info-box-icon bg-yellow">
                                          <i class="fa fa-copy"></i>
                                       </span>
                                       <div class="info-box-content">
                                          <span class ="info-box-number">${attach.file_name }</span>
                                       </div>
                                    </div>
                                  </div>                     
                              </c:forEach>
                           </div>
                        </div>
                  </div>
               </div><!--end card-body  -->
          </div>
              <!-- /.card-body -->
<form name="submitInsert" action="<%=request.getContextPath()%>/hq/updateAppliCheckSt.do" method="post">
	<input type="hidden" name="fran_applidoc_code" value="${detail.fran_applidoc_code }" />
	<input type="hidden" name="franRegSt" value="2" />
	<input type="hidden" name="fran_applidoc_appr_st" value="2" />
	
	<input type="hidden" name="fran_code" value="${detail.fran_code }" />
	<input type="hidden" name="fran_addr" value="${detail.fran_addr }" />
</form>
<script>
function submit() {
// 	alert("ddd");
		$('form[name="submitInsert"]').submit();
}
</script>

</body>