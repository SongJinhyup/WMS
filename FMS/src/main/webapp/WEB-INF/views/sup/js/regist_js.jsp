<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<script>
var formData="";

function picture_go(){
	
	formData = new FormData($('form[role="imageForm"]')[0]);

   var form = $('form[role="imageForm"]');
   var picture = form.find('[name=pictureFile]')[0];
   
   //이미지 확장자 jpg 확인
   var fileFormat=
	      picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
   if(!(fileFormat=="JPG" || fileFormat=="JPEG" || fileFormat=="PNG")){
      alert("이미지는 jpg/jpeg/png 형식만 가능합니다.");
      picture.value="";      
      return;
   } 
   
   //이미지 파일 용량 체크
   if(picture.files[0].size>1024*1024*5){
      alert("사진 용량은 5MB 이하만 가능합니다.");
      picture.value="";
      return;
   };
   
   
   //업로드 확인변수 초기화 (사진변경)
   form.find('[name="checkUpload"]').val(0);
   
   document.getElementById('inputFileName').value=picture.files[0].name;
   
   if (picture.files && picture.files[0]) {
	      var reader = new FileReader();
	       reader.onload = function (e) {
	    	 //이미지 미리보기	   
	    	   $('div#pictureView')
	              .css({'background-image':'url('+e.target.result+')',
	                 'background-position':'center',
	                 'background-size':'cover',
	                 'background-repeat':'no-repeat'
	                 });
	        }
	      reader.readAsDataURL(picture.files[0]);
	      
	   }

}


function upload_go(){
// 	alert("good");
  if($('input[name="pictureFile"]').val()==""){
      alert("사진을 선택하세요.");
      $('input[name="pictureFile"]').click();
      return;
   };   
   
   if($('input[name="checkUpload"]').val()==1){
      alert("이미업로드 된 사진입니다.");
      return;      
   }
   
   $.ajax({
	      url:"picture.do",
	      data:formData,
	      type:'post',
	      processData:false,
	      contentType:false,
	      success:function(data){
	    	  //업로드 확인변수 세팅
	          $('input[name="checkUpload"]').val(1);
	          //저장된 파일명 저장.
	          $('input#oldFile').val(data); // 변경시 삭제될 파일명	          
	          $('form[role="form"]  input[name="sup_goods_img"]').val(data);	    	  
	    	  alert("사진이 업로드 되었습니다.");
	      },
	      error:function(error){
	          alert("현재 사진 업로드가 불가합니다.\n 관리자에게 연락바랍니다.");
	       }
	    });	         
}
</script>