<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %> 
<html> 
<head>
<title>BackOffice</title>
<!--  <meta charset="UTF-8" />   --> 
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script  src="<%=request.getContextPath() %>/resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/smoothness/jquery-ui-1.9.2.custom.min.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
 <script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath() %>/resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"  type="text/css"/>    
 <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="<%=request.getContextPath() %>/resources/js/html5shiv.js"></script>
    <![endif]--> 
 <!-- 
	DWR
	-->
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/interface/KPIAjax.js"></script>
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/engine.js"></script> 
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/util.js"></script>
        	<style>
 .ui-datepicker-trigger{
 cursor: pointer;
 }
</style>
 <style type="text/css">
 /*  fieldset { width: 100%; }
  fieldset legend { width: 100%; }
  fieldset legend div { margin: 0.3em 0.5em; }
  fieldset .field { margin: 0.5em; padding: 0.5em; }
  fieldset .field label { margin-right: 0.4em; } */
</style>
<style>
.imageicon {
        width: 45px;
        height: 45px;
        float: left;
        background-size: fill;
        background-repeat:no-repeat;
}
.imageholder {
        width: 83px;
        height: 83px;
        float: left;
        background-size: fill;
        background-repeat:no-repeat;
}
#showData tr.alt {
    color: #000000;
    background-color: #E3E3E3;
}

#showData tr.altheader {
    color: #000000;
    background-color: #428BCA;
}
.fomtsizeAndColor
{
    font-size:24px;
    font-weight:bold ;
    color:White;
}

.ui-widget { font-family: Trebuchet MS, Tahoma, Verdana,
 Arial, sans-serif; font-size: 12px; }
input[type=text] {
	height: 30px;
	line-height: 30px
}
label, input, button, select, textarea {
font-size: 12px;
font-weight: normal;
line-height: 20px;
}
table > tbody{font-size: 12px}
input {
font-size: 12px;
font-weight: normal;
line-height: normal;
}
 form {
margin: 0 0 0px;
}
.input_number{
width:50px;
text-align: right;
}
 </style>
<style type="text/css">
/*.th_class{font-family: Tahoma;font-size: 13px;text-align: center;*/
.th_class{text-align: center;
}
a{cursor: pointer;}
.ui-autocomplete-loading {
    background: white url('<%=request.getContextPath() %>/resources/css/smoothness/images/ui-anim_basic_16x16.gif') right center no-repeat;
  } 
</style>
<!-- <style type="text/css"> 
th{ font-family:Tahoma; font-size:12px; font-weight:bold;
 color: #fff;background:url(/MISSExamBackOffice/resources/images/tr_back-theme1.gif) repeat-x scroll 0 0 #80838A;padding: 5px 8px;border:1px solid #fff; 
} 
</style> -->  

</head> 
<body> <!-- 
  <div class="row-fluid"  style="position:fixed;"> 
     	<div class="span7"> -->
	<div class="imageholder" style="background-image:url('<%=request.getContextPath() %>/resources/img/rtn.jpg');">
	</div>
	<div id="header"  style="padding-top: 3px;padding-left: 50px;width: 2000px;height:80px;background: #01009E;">
		<label class="fomtsizeAndColor" style="margin-top:20px">ระบบวัดผลการดำเนินงานกองทัพเรือ - หน้าจอกำหนดรอบประเมินผล</label>
	</div>
     	<div id="_content" style="margin-left:3px;padding-top: 3px;width: 1100px"> 
      		 <!-- <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px">   -->
      		 <table style="width: 1100px;">
     			<tr>
     				<td>
<form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 <div  style="padding-left:20px"> 
  	<span style="padding-left:30px;">
	ปีงบประมาณ: 
	<span id="yearSelection">
    </span> 
	
    </span> 
     <span style="padding-left:10px;">
	รอบประเมินผล: 
	<span id="peroidSelection">
    </span> 
     <span style="padding-left:10px;">
	คำอธิบาย: <input type="text" id="periodDesc" style="width: 300px"/>
    </span> 
    <span style="padding-left:10px;">
     <input type="hidden" id="periodNo_hidden"/>
     <input type="hidden" id="periodDesc_hidden"/>
    <!--  <input type="text" id="periodDesc_result" readonly="readonly" style="width: 300px"/> -->
    </span>
     <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px" onclick="updateTable()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">ค้นหา</span></a>
    </span> 
	
  </div> 
  	<div style="padding-left:50px">
	<label style="margin-top:5px;width:500px; margin-left: 75px;">การใช้งาน </label>
		<label style="margin-left: 75px;">1.การค้นหาข้อมูล ให้กรอกข้อมูลปีงบประมาณ รอบประเมินผล หรือชื่อปีงบประมาณในกล่องข้อความ แล้วคลิกที่ปุ่ม "ค้นหา" </label>
		<label style="margin-left: 75px;">2.การเพิ่มรอบประเมินผล หลังจากทำการค้นหาข้อมูลแล้วคลิกที่ปุ่ม "เพิ่ม" ระบบจะแสดงหน้าจอให้กรอกข้อมูลให้ครบถ้วนแล้วคลิกปุ่ม บันทึก </label>
		<label style="margin-left: 75px;">3.การแก้ไขรอบประเมินผล หลังจากทำการค้นหาข้อมูลแล้วคลิกที่ปุ่ม แก้ไข <i class="icon-edit"></i> ระบบจะแสดงหน้าจอให้กรอกข้อมูลให้ครบถ้วนแล้วคลิกปุ่ม บันทึก </label>
		<label style="margin-left: 75px;">4.การลบรอบประเมินผล หลังจากทำการค้นหาข้อมูลแล้วคลิกที่ปุ่ม ลบ <i class="icon-trash"></i> ระบบจะแสดงหน้าจอเพื่อยืนยันแล้วคลิกปุ่ม ใช่</label>

	</div>
</form> 
<div id="dialog-confirmDelete" title="ลบรอบประเมินผล" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<div class="imageicon" style="background-image:url('<%=request.getContextPath() %>/resources/img/shock.jpg');">
	</div>
	<label style="padding-top:15px;padding-left:55px;">
		ต้องการลบหรือไม่?
	</label>
</div>
<div id="dialog-Message-alert" title="Message" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<span id="_message_show"></span>
</div>
</td>
				</tr>
  			</table>
 </div>
  <div style="">
<table style="width: 1100px">
	<tr>
		<td>
<!-- <div id="dialog-Message" style="margin-top:-15px; display: block;height: 300px; overflow: auto;overflow-x:hidden" >
<form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > -->
<div id="dialog-Message" style="display: block;padding-left: 3px;width: 1098px" >
<form     style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div> 
	 <div style="padding: 10px;overflow: auto;height: 430px;overflow-x:hidden" id="search_section">
	 
    </div>
  </div> 
  </form>
  </div>
  <div id="dialog-form"  style="display: none;">
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
   <input type="hidden" id="mode" />
  <div class="control-group" id="id_element">
    <label class="control-label" >ปีงบประมาณ:</label>
	<div class="controls">
		<input class="input_snp"  type="text"  id="year_input" style="width: 50px" onkeypress="handleKey(this)" onkeyup="handleKey(this)" />
		(ตัวเลข)
	</div>
  </div>
  <div class="control-group">
    <label class="control-label" > รอบประเมินผล:</label>
	<div class="controls">
		<input class="input_snp"  type="text"  id="period_input" style="width: 50px" onkeypress="handleKey(this)" onkeyup="handleKey(this)" />
		(ตัวเลข)
	</div> 
  </div> 
  <div class="control-group">
    <label class="control-label"> คำอธิบาย:</label>
    <div class="controls">
		<input class="input_snp"  type="text"  id="period_desc_input" style="width: 400px"/>
		(ตัวอักษร)
	</div>
  </div>
   <div class="control-group">
    <label class="control-label">วันเริ่มบันทึกข้อมูล:</label>
    <div class="controls">
      <input type="text" id="start_date" name="start_date" readonly="readonly" style="width: 100px"/>
    </div>
  </div> 
   <div class="control-group">
    <label class="control-label">วันสิ้นสุดบันทึกข้อมูล:</label>
    <div class="controls">
      <input type="text" id="end_date" name="end_date" readonly="readonly"  style="width: 100px"/>
    </div>
  </div> 
  <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" onclick="doSubmitAction()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">บันทึก</span></a>
    </div>
  </div>
</form> 
</div>
<!-- </fieldset> -->
</td>
	</tr>
  </table>
      	</div> 
 <%@ include file="/WEB-INF/jsp/schema.jsp" %>  
     <script type="text/javascript">
//var _path="/KPIWebTest/";
//var SCHEMA_G='mcic_kpi_app_test';
//var SCHEMA_G='FSD2';
var _path='<%=request.getContextPath()%>'+'/';
var username = '<%=request.getRemoteUser()%>';
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG;   
var intRegex = /^\d+$/;
//var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+))$/;
var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+)|(-\d+(\.\d *)?)|((-\d*\.)?\d+))$/;

$(document).ready(function() {
	listYear();
	$("#start_date" ).datepicker({
		showOn: "button",
		buttonImage: _path+"resources/images/calendar.gif",
		buttonImageOnly: true,
		dateFormat:"dd/mm/yy" ,
		changeMonth: true,
		changeYear: true
	});
	$("#end_date" ).datepicker({
		showOn: "button",
		buttonImage: _path+"resources/images/calendar.gif",
		buttonImageOnly: true,
		dateFormat:"dd/mm/yy" ,
		changeMonth: true,
		changeYear: true
	});
	
	$( "#periodDesc" ).autocomplete({
		  source: function( request, response ) {  
			  var periodWhere=""; 
				var periodNo =jQuery.trim($("#periodNo").val());
				var year =jQuery.trim($("#year").val());
			    if(year.length>0)
			    	periodWhere=periodWhere+" and year like  '%"+year+"%'   ";	
			    if(periodNo.length>0)
			    	periodWhere=periodWhere+" and period_no like  '%"+periodNo+"%'   ";	
				var query="SELECT period_no,period_desc  FROM "+SCHEMA_G+".period where period_desc like '%"+request.term+"%'   "+periodWhere;		
				KPIAjax.searchObject(query,{
					callback:function(data){ 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label: item[1],
					        	  value: item[0] 
					          }
					        }));
						}else{
							var xx=[]; 
							response( $.map(xx));
						}
					}
			 });		  
		  },
		  minLength: 2,
		  select: function( event, ui ) { 
			  this.value = ui.item.label;
			   $("#periodDesc").val(ui.item.label);
			  /*  $("#employeeCode").val("");
			   
			   $("#employeeCode_hidden").val(ui.item.value);
			   $("#employeeName_hidden").val(ui.item.label);  */
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		});

	}); 
 	function listYear(){

	var query="SELECT distinct result.year FROM "+SCHEMA_G+".period result order by result.year desc ";
	KPIAjax.listYears(query,{
		callback:function(data){
			   var str="<select id=\"yearElement\" style=\"width: 75px\" onchange=\"listPeriod()\">";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i]+"\">"+(data[i]+543)+"</option>";
				}  
			}
			str=str+"</select>";
			$("#yearSelection").empty().html(str); 
			listPeriod();
		}
    });
	} 
	
	function listPeriod(){
		var year=$("#yearElement").val();
		var period_query="";
		if(year!='all'){
			period_query=" where year=" +year;
		}
		 
	var query="select period_no,period_desc  from "+SCHEMA_G+".period "+period_query;
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			 var str="<select id=\"periodElement\" style=\"width: 70px\">";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].id+"</option>";
				}
			} 
			str=str+"</select>";
			$("#peroidSelection").empty().html(str);
			
		}
    });
	}

function updateTable(){

	var year =jQuery.trim($("#yearElement").val());
	var periodNo =jQuery.trim($("#periodElement").val());
	var periodDesc =jQuery.trim($("#periodDesc").val()); 
	var periodWhere="";
	
	var haveWhere=false;
	if(year.length>0){
		if(haveWhere)
			periodWhere=periodWhere+" and  year like '%"+year+"%'";
		else
			periodWhere=periodWhere+" where  year like '%"+year+"%'";
		haveWhere=true; 
	}
	if(periodNo.length>0){
		if(haveWhere)
			periodWhere=periodWhere+" and  period_no = '"+periodNo+"'";
		else
			periodWhere=periodWhere+" where  period_no = '"+periodNo+"'";
		haveWhere=true; 
	} 
	if(periodDesc.length>0){
		if(haveWhere)
			periodWhere=periodWhere+" and  period_desc like '%"+periodDesc+"%'";
		else
			periodWhere=periodWhere+" where  period_desc like '%"+periodDesc+"%'";
		haveWhere=true; 
	}  
	var query="SELECT year,period_no,period_desc,start_date,end_date,period_id FROM "+SCHEMA_G+".period "+periodWhere;
	//alert(query);
	KPIAjax.searchObject(query,{
		callback:function(data){
			var str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">เพิ่ม</span></a></div>"+
			 		"	  <table id=\"showData\" class=\"table table-bordered \" border=\"1\" style=\"font-size: 12px\"> "+
			        "	<thead> 	"+
			        "  		<tr class=\"altheader\"> "+
			        " 			<th width=\"10%\"><div class=\"th_class\">ปีงบประมาณ</div></th>"+
			        "   		<th width=\"10%\"><div class=\"th_class\">รอบประเมินผล</div></th>"+ 
			        "   		<th width=\"35%\"><div class=\"th_class\">คำอธิบาย</div></th>"+
			        "   		<th width=\"15%\"><div class=\"th_class\">วันเริ่มบันทึกข้อมูล</div></th>"+ 
			        "   		<th width=\"15%\"><div class=\"th_class\">วันสิ้นสุดบันทึกข้อมูล</div></th>"+ 
			        "    		<th width=\"15%\"><div class=\"th_class\">แก้ไข&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ลบ</div></th>"+
			        " 		</tr>"+
			        "	</thead>"+
			        "	<tbody class=\"showDataTbody\">   "; 
			        
			   if(data!=null && data.length>0){
				   for(var i=0;i<data.length;i++){
				   if(i % 2 == 0){
					   str=str+ "  	<tr style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+")\" >"+
				        "  		<td style=\"text-align: center;\"> "+(data[i][0]+543)+" </td>"+    
				        "    	<td style=\"text-align: center;\">"+data[i][1]+"</td>  "+
				        "    	<td style=\"text-align: left;\">"+data[i][2]+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+$.datepicker.formatDate('dd/mm/yy', data[i][3])+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+$.datepicker.formatDate('dd/mm/yy', data[i][4])+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+
				        "    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][5]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				        "    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][0]+"','"+data[i][1]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
				        "    	</td> "+
				        "  	</tr>  ";
						}
					else{
						str=str+ "  	<tr class=\"alt\" style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+")\" >"+
				        "  		<td style=\"text-align: center;\"> "+(data[i][0]+543)+" </td>"+    
				        "    	<td style=\"text-align: center;\">"+data[i][1]+"</td>  "+
				        "    	<td style=\"text-align: left;\">"+data[i][2]+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+$.datepicker.formatDate('dd/mm/yy', data[i][3])+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+$.datepicker.formatDate('dd/mm/yy', data[i][4])+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+
				        "    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][5]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				        "    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][0]+"','"+data[i][1]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
				        "    	</td> "+
				        "  	</tr>  ";
					}					
						
				   }
			   }else{
				   var str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add','0','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">เพิ่ม</span></a></div>"+
			    "<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\">"+
		    		"<thead>"+
		    		"<tr> "+
	      			"<th colspan=\"3\" width=\"100%\"><div class=\"th_class\">ไม่มีข้อมูล</div></th>"+ 
	      		"</tr>"+
	    	"</thead>"+
	    	"<tbody>"; 
			   }
			        str=str+  " </tbody>"+
					   "</table> "; 
			$("#search_section").html(str);
		}
	});
}

function showForm(mode,id){
	//year_input period_no_input period_desc_input start_date end_date
	 $("#year_input").val("");
     $("#period_input").val("");
     $("#period_desc_input").val("");
     $("#start_date").val("");
     $("#end_date").val("");
     $("#mode").val(mode);
	
	if(mode=='add'){
		//$("#id_element").hide();
		document.getElementById("year_input").readOnly=false;
		document.getElementById("period_input").readOnly=false;
		$( "#dialog-form" ).dialog({ 
			position: 'top',
			 height: 382,
			 width:727,
			modal: true,
			  hide: 'fold',
		      show: 'blind' 
		});
	}else{
	//edit
		 $('#year_input').attr('readonly', true);
	     $('#period_input').attr('readonly', true);
		var query="SELECT year,period_no,period_desc,start_date,end_date FROM "+SCHEMA_G+".period where period_id = '"+id+"'";
		//alert(query);
		KPIAjax.searchObject(query,{
			callback:function(data){
				 $("#year_input").val((data[0][0])+543);
			     $("#period_input").val(data[0][1]);
			     $("#period_desc_input").val(data[0][2]);
			     $("#start_date").val($.datepicker.formatDate('dd/mm/yy', data[0][3]));
			     $("#end_date").val($.datepicker.formatDate('dd/mm/yy', data[0][4]));
			     
				$( "#dialog-form" ).dialog({ 
					position: 'top',
					 height: 382,
					 width:727,
					modal: true,
					 hide: 'fold',
				     show: 'blind' 
				});
			}
		});
	}
	 
}
function confirmDelete(id_year,id_period){
	$( "#dialog-confirmDelete" ).dialog({
		/* height: 140, */
		modal: true,
		buttons: {
			"ใช่": function() { 
				$( this ).dialog( "close" );
				$("#mode").val('delete');
				doAction(id_year,id_period);
			},
			"ไม่ใช่": function() {
				$( this ).dialog( "close" );
				return false;
			}
		}
	});
}
function doSubmitAction(){
	
	var year_input= jQuery.trim($("#year_input").val());
    var period_no_input= jQuery.trim($("#period_input").val());
    var period_desc_input=jQuery.trim( $("#period_desc_input").val());
    var start_date=jQuery.trim( $("#start_date").val());
    var end_date= jQuery.trim($("#end_date").val());
	var mode=$("#mode").val();
	
	//alert(year_input);
	if(year_input == "") {
        alert('กรุณากรอกปีงบประมาณ'); 
        $("#year_input").focus();
        return false;
     }else if(year_input.toString().length!=4) {
        alert('ปีงบประมาณมีจำนวนเกิน 4 ตำแหน่ง'); 
        $("#year_input").focus();
        return false;
     }else if(period_no_input=="") {
        alert('กรุณากรอกรอบประเมินผล'); 
        $("#period_input").focus();
        return false;
     }else if(period_no_input.length>3) {
        alert('รอบประเมินผลมีจำนวนเกิน 3 ตำแหน่ง'); 
        $("#period_input").focus();
        return false;
     }else if(period_desc_input=="") {
        alert('กรุณากรอกคำอธิบาย');
        $("#period_desc_input").focus(); 
        return false;
     }else if(period_desc_input.length>255) {
        alert('คำอธิบายมีตัวอักษรเกิน 255 ตัว');
        $("#period_desc_input").focus(); 
        return false;
     }else if(start_date.length==0) {
        alert('กรุณาเลือกวันที่เริ่มต้น');
        $("#start_date").focus(); 
        return false;
     }else if(end_date.length==0) {
        alert('กรุณาเลือกวันที่สิ้นสุด'); 
        $("#end_date").focus(); 
        return false;
     }
	year_input = year_input-543;
	var start_date_array=start_date.split("/");
	var end_date_array=end_date.split("/");
	var start_date_formated=start_date_array[2]+"-"+start_date_array[1]+"-"+start_date_array[0];
	var end_date_formated=end_date_array[2]+"-"+end_date_array[1]+"-"+end_date_array[0];
	
	var  startDate = new Date(start_date_array[2], start_date_array[1]-1, start_date_array[0]);
	var  endDate = new Date(end_date_array[2], end_date_array[1] -1, end_date_array[0]);
    if(endDate<startDate){
    	alert(' วันที่สิ้นสุดต้องมากกว่าวันที่เริ่มต้น !!!'); 
    	return false;
    }
	var query="";
	 var queryCheck="SELECT * FROM "+SCHEMA_G+".period where ('"+start_date_formated+"' BETWEEN start_date AND end_date  "+
	 " or  '"+end_date_formated+"' BETWEEN start_date AND end_date ) ";   
	var queryCheckDuplicate=""; 
	if(mode=='add'){
			query="insert into "+SCHEMA_G+".period set year="+year_input+",period_no="+period_no_input+",period_desc='"+period_desc_input+"',"+
			" start_date='"+start_date_formated+"', end_date='"+end_date_formated+"', created_dt=now(),updated_dt=now(),created_by='"+username+"',updated_by='"+username+"'";
			 queryCheck=queryCheck+"  and year ="+year_input; 
			 queryCheckDuplicate=" SELECT * FROM "+SCHEMA_G+".period    where year ="+year_input+" and period_no="+period_no_input;
	}else {//edit
		  query="update  "+SCHEMA_G+".period set period_desc='"+period_desc_input+"' ,start_date='"+start_date_formated+"', end_date='"+end_date_formated+"'"+
		  ",updated_dt=now(),updated_by='"+username+"' where year="+year_input+" and period_no="+period_no_input; 
		  queryCheck=queryCheck+"  and year ="+year_input+" and period_no!="+period_no_input; 
	}
	if(queryCheckDuplicate.length>0){
		KPIAjax.searchObject(queryCheckDuplicate,{
			callback:function(data){ 
				 if(data!=null && data.length>0){
						alert("ปีงบประมาณและรอบประเมินผลซ้ำ");
				 }else{
					 doSubmit(queryCheck,query);
				 } 
			}
		});
	}else{
		doSubmit(queryCheck,query);
	}
}
	function doSubmit(queryCheck,query){
		KPIAjax.searchObject(queryCheck,{
		callback:function(data){
				 KPIAjax.executeQuery(query,{
						callback:function(data){ 
							if(data!=0){
								alert("บันทึกข้อมูลเรียบร้อย");
								updateTable();
								listYear();
								$( "#dialog-form" ).dialog("close");
							}
						}
					});
			}
		});
	}
	function doAction(id_year,id_period){ 
    var query="delete  FROM "+SCHEMA_G+".period where year="+id_year+" and period_no="+id_period;
		KPIAjax.executeQuery(query,{
			callback:function(data){
				if(data==0)
					alert("ไม่สามารถเพิ่มข้อมูลได้เนื่องจากข้อมูลนี้ถูกใช้งาน");
				updateTable();
				listYear();
			}
		}); 
	}   
  
     function visited(tr) {
		$("tbody.showDataTbody tr").removeAttr("style");
		tr.style.backgroundColor = "#F5E79E";	
	}
	function handleKey(el){
		var invalidChars = /[^0-9|\.]/gi;
		if(invalidChars.test(el.value)) {
		el.value = el.value.replace(invalidChars,"");
	}	
	}
</script> 
</body>
</html>  
 