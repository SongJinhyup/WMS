<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
<!-- summernote -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
</head>

<body>
	 <!-- Main content -->
			<section class="content-header">
    <div class="container-fluid">
      <div class="row md-2">
        <div class="col-sm-6">
          <h1>운영상태변경신청</h1>  				
        </div>
      </div>
    </div>
</section>
 
<!-- Main content -->
  <section class="content container-fluid">
  <div class="row justify-content-center">
    <div class="col-md-9" style="max-width:960px;">
      <div class="card card-outline card-info">
        <div class="card-header">
          <div class ="card-tools">
            <button type="button" class="btn btn-primary" id="registBtn" onclick="regist_go();">신 청</button>
            <button type="button" class="btn btn-warning" id="cancelBtn" onclick="CloseWindow();" >취 소</button>
          </div>
        </div><!--end card-header  -->
        <div class="card-body pad">
          <form role="form" method="post" action="regist.do" name="registForm">
            							
            <div class="form-group">
              <label for="fran_name">가맹점명</label> 
              <input type="text" id="fran_name"
                name='fran_name' class="form-control" value="${loginFran.fran_name }" readonly>
                <input type="hidden" name="fran_code" id="fran_code" value="${loginFran.fran_code }">
            </div>			

            <select class="form-control" name="appli_st" id="appli_st">
              <option value="" style="text-align:center;">신청할 운영상태 선택</option>
              <option value="1" style="text-align:center;">휴점</option>
              <option value="2" style="text-align:center;">폐점</option>
              <option value="3" style="text-align:center;">운영</option>
           </select>	
            <div class="form-group">
            </div>
            <div class="form-group" style="text-align: center;">
              <label>시작일</label>
              <input type="date" id="st_change_start" name="st_change_start">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <label>종료일</label>
              <input type="date" id="st_change_end" name="st_change_end">
            </div>
            <div class="form-group col-6">
            </div>
            <label for="st_change_reason">사 유</label>
            <div class="form-group">
              <textarea class="textarea" name="st_change_reason" id="st_change_reason" rows="8" cols="92"
                placeholder="1000자 내외로 작성하세요." ></textarea>
            </div>
          </form>
        </div><!--end card-body  -->
        <div class="card-footer" style="display:none">
        
        </div><!--end card-footer  -->
      </div><!-- end card -->				
    </div><!-- end col-md-12 -->
  </div><!-- end row -->
  </section>
    <!-- /.content -->

    
<script>
window.onload=function(){
	Summernote_start($('#content')); 
}

function regist_go(){
	var form = document.registForm;
	if(form.title.value==""){
		alert("제목은 필수입니다.");
		return;
	}
	
	form.submit();
}
</script>

<%@ include file="/WEB-INF/views/common/summernote.jsp" %>


</body>