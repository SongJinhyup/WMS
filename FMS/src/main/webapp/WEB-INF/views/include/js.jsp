<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/dist/js/adminlte.min.js"></script>
<!-- common.js -->
<script src="<%=request.getContextPath()%>/resources/js/common.js" ></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/chart.js/Chart.js" ></script>
<!-- summernote -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.min.js"></script>
<!-- Select2 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/moment/moment.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/inputmask/jquery.inputmask.bundle.min.js"></script>
<!-- date-range-picker -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Bootstrap Switch -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- jgrid -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jsgrid/demos/db.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jsgrid/jsgrid.min.js"></script>

<!-- Select2 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/select2/js/select2.full.min.js"></script>

<!-- toast ui Grid -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/tui-time-picker/dist/tui-time-picker.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/tui-date-picker/dist/tui-date-picker.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/tui-grid/dist/tui-grid.js"></script>

<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var start_date = "";
var end_date ="";
  $(function () {
  	var startDate = '';
	if (!start_date) {
		startDate = '2021-04-12';
	}
	var endDate = '';
	if (!end_date) {
		endDate = new Date().getDate();
	}
    //Date range picker
    $('#reservation').daterangepicker({
                "locale": {
                    "format": "YYYY년 MM월 DD일",
                    "separator": " ~ ",
                    "applyLabel": "확인",
                    "cancelLabel": "취소",
                    "fromLabel": "From",
                    "toLabel": "To",
                    "customRangeLabel": "Custom",
                    "weekLabel": "W",
                    "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
                    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
                    "firstDay": 1
                },
                "startDate": startDate,
                "endDate": endDate,
                "drops": "down"
    });
    //Date range picker with time picker
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Timepicker
    $('#timepicker').datetimepicker({
      format: 'LT'
    })
    
    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    });

    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    });

  })
</script>

 <script>
	$(function () {
	  $("#jsGrid1").jsGrid({
			height: "100%",
			width: "100%",
  
			sorting: true,
			paging: true,
  
			data: db.clients,
  
			fields: [
				 { name: "Name", type: "text", width: 150 },
				 { name: "Age", type: "number", width: 50 },
				 { name: "Address", type: "text", width: 200 },
				 { name: "Country", type: "select", items: db.countries, valueField: "Id", textField: "Name" },
				 { name: "Married", type: "checkbox", title: "Is Married" }
			]
	  });
	});
 </script>
