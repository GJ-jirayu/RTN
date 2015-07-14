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
  <link rel="stylesheet" media="screen" type="text/css" href="<%=request.getContextPath() %>/resources/css/colorpicker.css" />
    <script src="<%=request.getContextPath() %>/resources/js/colorpicker.js"></script>

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

.ui-widget { 
	font-family: Trebuchet MS, Tahoma, Verdana, Arial, sans-serif; 
	font-size: 12px; 
}

input[type=text] {
	height: 30px;
	line-height: 30px;
}

.fomtsizeAndColor
{
    font-size:24px;
    font-weight:bold ;
    color:White;
}

label, input, button, select, textarea {
font-size: 12px;
font-weight: normal;
line-height: 20px;
}

form {
	margin: 0 0 0px;
}

input[type=number] {-moz-appearance: textfield;}
::-webkit-inner-spin-button { -webkit-appearance: none;}
::-webkit-outer-spin-button { -webkit-appearance: none;}

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
</head> 
<body> 
	<div class="imageholder" style="background-image:url('<%=request.getContextPath() %>/resources/img/rtn.jpg');">
	</div>
	<div id="header"  style="padding-top: 3px;padding-left: 50px;width: 2000px;height:80px;background: #01009E;">
		<label class="fomtsizeAndColor" style="margin-top:20px">ระบบวัดผลการดำเนินงานกองทัพเรือ - หน้าจอกำหนดสีของช่วงคะแนน</label>
	</div>
     	<div id="_content"  style="margin-left:3px;padding-top: 3px;width: 1100px">
     		<table style="width: 1100px;"><tr><td>
      		<!--  <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px"> -->  
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:10px" action="" method="post" >
 <div >
    <label class="control-label">ชื่อช่วงคะแนน :</label>
    <div class="controls" style= "width:900px;">
        <input  type="text"  id="thresholdName" > <a onclick="searchThreshold()" class="btn btn-primary" ><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">ค้นหา</span></a>
	</div>
	<div style="padding-left:90px">
	<label style="margin-top:5px; margin-left: 90px;">การใช้งาน </label>
		<label style="margin-left: 90px;">1.การค้นหาข้อมูล คลิกที่ปุ่ม "ค้นหา" เพื่อแสดงรายชื่อทั้งหมดของช่วงคะแนน หรือต้องการค้นหาตามชื่อช่วงคะแนน ให้กรอกชื่อในกล่องข้อความ แล้วคลิกที่ปุ่ม "ค้นหา" </label>
		<label style="margin-left: 90px;">2.การเพิ่มช่วงคะแนน หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "เพิ่ม" จากนั้นระบบจะแสดงหน้าจอให้กรอกข้อมูลให้ครบถ้วน แล้วคลิกที่ปุ่ม "บันทึก" (การเลือกสีของช่วงคะแนนสามารถ คลิกที่กล่องข้อความและเลือกสี แล้วคลิกที่ icon รูปวงกลมสีรุ้ง ) </label>
		<label style="margin-left: 90px;">3.การแก้ไขช่วงคะแนน หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "แก้ไข"<i class="icon-edit"></i> ระบบจะแสดงหน้าจอให้แก้ไขข้อมูล แล้วคลิกที่ปุ่ม "บันทึก" (การเลือกสีของช่วงคะแนนสามารถ คลิกที่กล่องข้อความและเลือกสีแล้วกด แล้วคลิกที่ icon รูปวงกลมสีรุ้ง  ) </label>
		<label style="margin-left: 90px;">4.การลบช่วงคะแนน หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "ลบ" <i class="icon-trash"></i> ระบบจะแสดงหน้าจอเพื่อยืนยัน เลือกคลิกที่ปุ่ม "ใช่"</label>

	</div>
  </div> 
  
</form> 
<div id="dialog-confirmDelete" title="ลบช่วงคะแนน" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
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
   <div >
<table style="width: 1100px">
	<tr>
		<td>
<div id="dialog-Message" style="display: block;padding-left: 3px;width: 1098px" >
<form   style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div> 
	 <div style="padding: 10px;overflow: auto;height: 450px;overflow-x:hidden" id="search_section">	
    </div>
  </div> 
  </form>
  </div>
  <div id="dialog-form"  style="display: none;">
  <form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > 
   <input type="hidden" id="mode" />
  <!--<div class="control-group" id="id_element">
    <label class="control-label" for="inputEmail">Threshold ID:</label>
    <div class="controls">
      <input class="input_snp" type="text" id="thresholdID_form" readonly="readonly" >
    </div>
  </div>-->
  <type = "hidden" id="maxthreshold_form">
  <type = "hidden" id="minthreshold_form">  
  <type="hidden" id="thresholdID_form">
  <div class="control-group">
    <label class="control-label">ชื่อช่วงคะแนน :</label>
    <div class="controls">
      <input class="input_snp" type="text" id="thresholdName_form">
	  (ตัวอักษร)
    </div>
  </div>
  <div class="control-group">
    <label class="control-label">ช่วงคะแนนเริ่มต้น :</label>
    <div class="controls">
		  <input type="text" id="thresholdBegin_form" onkeypress="handleKey(this)" onkeyup="handleKey(this)">
		(ตัวเลข)
	</div>
	
  </div>
  <div class="control-group">
    <label class="control-label">ช่วงคะแนนสิ้นสุด :</label>
    <div class="controls">
      <input class="input_snp" type="text" id="thresholdEnd_form" onkeypress="handleKey(this)" onkeyup="handleKey(this)"  >
		(ตัวเลข)
	</div>
	
  </div>
  <div class="control-group">
    <label class="control-label">สี :</label> <input type="hidden" id="colorpick_code" />
    <div class="controls">
      <input class="input_snp" type="text"  id="colorpickerfield" style="width: 80px;"> 
	  (ตัวอักษร)
    </div>
  </div>
  <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" onclick="doSubmitAction()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">บันทึก</span></a>
    </div>
  </div>
</form> 
</div>
</td>
	</tr>
  </table>
      	</div> 
<!-- </fieldset>
      	</div>
     	</div>
     </div>  -->
     <%@ include file="/WEB-INF/jsp/schema.jsp" %>  
     <script type="text/javascript">

		var username = '<%=request.getRemoteUser()%>';
		var _path='<%=request.getContextPath()%>'+'/'; 
		var mail_toG;
		var mail_subjectG;
		var mail_messageG;
		var mail_attachG;

	$(document).ready(function() {

	 $('#colorpickerfield').ColorPicker({
	        onSubmit: function(hsb, hex, rgb, el, parent) {
	           // $(el).val("#"+hex);
	            $(el).val(hex.toUpperCase());
	            $(el).ColorPickerHide();
				$('#colorpickerfield').css('backgroundColor', '#' + hex);
				
	        },
	        onBeforeShow: function () {
	            $(this).ColorPickerSetColor(this.value);
				$('#colorpickerfield').css('backgroundColor', '#' + hex);
	        },

			
	    })
	    .bind('keyup', function(){
	        $(this).ColorPickerSetColor(this.value);
			
	    }); 
		$("#thresholdName").keypress(function(event) {
			  if ( event.which == 13 ) {
			     event.preventDefault();
			     searchThreshold();
			   } 
			});
		$( "#thresholdName" ).autocomplete({
			  source: function( request, response ) { 
					var query="SELECT threshold_id,threshold_name FROM "+SCHEMA_G+".threshold where threshold_name like '%"+request.term+"%'";
				   
					KPIAjax.listMaster(query,{
						callback:function(data){ 
							if(data!=null && data.length>0){
								response( $.map( data, function( item ) {
						          return {
						        	  label: item.name,
						        	  value: item.name
						            //label: item.name + (item.adminName1 ? ", " + item.adminName1 : "") + ", " + item.countryName,
						            //value: item.name 
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
				 // $("#employeeElement").val(ui.item.value);
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

function handleKey(el){
	var invalidChars = /[^0-9|\.]/gi;
	if(invalidChars.test(el.value)) {
    el.value = el.value.replace(invalidChars,"");
	}	
}

function visited(tr) {
    $("tbody.showDataTbody tr").removeAttr("style");
	//$(tr).removeClass("alt");
	tr.style.backgroundColor = "#F5E79E";	
}

function searchThreshold(){
	var thresholdName =jQuery.trim($("#thresholdName").val());
	var thresholdNameWhere="";
	if(thresholdName.length>0)
		thresholdNameWhere=" where threshold_name like '%"+thresholdName+"%'";
	var query="SELECT * FROM "+SCHEMA_G+".threshold "+thresholdNameWhere;
	

	KPIAjax.searchObject(query,{
		callback:function(data){
			var str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">เพิ่ม</span></a></div>"+
			 		"	  <table id=\"showData\" class=\"table table-bordered \" border=\"1\" style=\"font-size: 12px\"> "+
			        "	<thead> 	"+
			        "  		<tr class=\"altheader\"> "+
			        <!--" 			<th width=\"10%\"><div class=\"th_class\">Threshold ID</div></th>"+-->
			        "   		<th width=\"45%\"><div class=\"th_class\">ชื่อช่วงคะแนน</div></th>"+ 
			        "   		<th width=\"15%\"><div class=\"th_class\">ช่วงคะแนนเริ่มต้น</div></th>"+ 
			        "   		<th width=\"15%\"><div class=\"th_class\">ช่วงคะแนนสิ้นสุด</div></th> "+ 
			        "   		<th width=\"15%\"><div class=\"th_class\">สี</div></th>"+ 
			        "    		<th width=\"10%\"><div class=\"th_class\">แก้ไข&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ลบ</div></th>     "+
			        " 		</tr>"+
			        "	</thead>"+
			        "	<tbody class=\"showDataTbody\" >   ";  
			   if(data!=null && data.length>0){
				   for(var i=0;i<data.length;i++){
					if( i % 2 == 0){
					   str=str+ "  	<tr style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+")\">"+
				        <!--"  		<td style=\"text-align: left;\"> "+data[i][0]+" </td>"+-->
				        "    	<td style=\"text-align: left;\">"+data[i][1]+"</td>  "+  
				        "    	<td>"+data[i][2]+"</td>   "+  
			           	"    	<td style=\"text-align: left;\">"+data[i][3]+"</td>  "+  
			           	"    	<td>"+data[i][4]+"</td>  "+  
				        "    	<td style=\"text-align: center;\">"+
				        "    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][0]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				        "    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][0]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
				        "    	</td> "+
				        "  	</tr>  ";
					}else{
						str=str+ "<tr class=\"alt\" style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+")\">"+
				        <!--"  		<td style=\"text-align: left;\"> "+data[i][0]+" </td>"+-->
				        "    	<td style=\"text-align: left;\">"+data[i][1]+"</td>  "+  
				        "    	<td>"+data[i][2]+"</td>   "+  
			           	"    	<td style=\"text-align: left;\">"+data[i][3]+"</td>  "+  
			           	"    	<td>"+data[i][4]+"</td>  "+  
				        "    	<td style=\"text-align: center;\">"+
				        "    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][0]+"')\" style=\"cursor: pointer; align: left;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				        "    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][0]+"')\" style=\"cursor: pointer; align: right;\" class=\"icon-trash\"></i>"+
				        "    	</td> "+
				        "  	</tr>  ";
					}
				   }
			   }else{
				   var str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">เพิ่ม</span></a></div>"+
			    		"<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\">"+
		    		"<thead>"+
		    		"<tr> "+
	      			"<th colspan=\"6\" width=\"100%\"><div class=\"th_class\">ไม่มีข้อมูล</div></th>"+ 
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

	 $("colorpickerfield");
	 $("#thresholdID_form").val("");
     $("#thresholdName_form").val(""); 
     $("#thresholdBegin_form").val(""); 
     $("#thresholdEnd_form").val(""); 
     $("#colorpickerfield").val("");  
     $("#mode").val(mode);
	if(mode=='add'){
		$("#id_element").hide();
		$("#colorpickerfield").css("backgroundColor", "#FFFFFF");
		$( "#dialog-form" ).dialog({ 
			position: 'top',
			 height: 345,
			 width:727,
			modal: true,
			  hide: 'fold',
		      show: 'blind' 
		});
	}else{ //edit
		$("#id_element").show(); 
		var query="SELECT * FROM "+SCHEMA_G+".threshold where threshold_id="+id;
		KPIAjax.searchObject(query,{
			callback:function(data){
			   $("#colorpickerfield");
			   
                $("#thresholdID_form").val(data[0][0]);
                $("#thresholdName_form").val(data[0][1]);
                $("#thresholdBegin_form").val(data[0][2]); 
                $("#thresholdEnd_form").val(data[0][3]); 
                $("#colorpickerfield").val(data[0][4]);
				$("#colorpickerfield").css("backgroundColor", $("#colorpickerfield").val());
				$( "#dialog-form" ).dialog({ 
					position: 'top',
					 height: 395,
					 width:727,
					modal: true,
					 hide: 'fold',
				     show: 'blind' 
				});
			}
		});
	}
	 
}
function confirmDelete(id){
	$( "#dialog-confirmDelete" ).dialog({
		/* height: 140, */
		modal: true,
		buttons: {
			"ใช่": function() { 
				$( this ).dialog( "close" );
				$("#mode").val('delete');
				doAction(id);
			},
			"ไม่": function() {
				$( this ).dialog( "close" );
				return false;
			}
		}
	});
}
function doSubmitAction(){
    var thresholdID=$("#thresholdID_form").val();
    var thresholdName=$("#thresholdName_form").val();
    var thresholdBegin=$("#thresholdBegin_form").val();
    var thresholdEnd=$("#thresholdEnd_form").val();
    var thresholdcolor=$("#colorpickerfield").val(); 
	var mode=$("#mode").val();
	
	var query="";
	var queryCheck="SELECT * FROM "+SCHEMA_G+".threshold where ("+thresholdBegin+" BETWEEN begin_threshold AND end_threshold  "+
	" or  "+thresholdEnd+" BETWEEN begin_threshold AND end_threshold) ";   
	var queryCheckMaxMin="SELECT * FROM "+SCHEMA_G+".sys_conf";
	if(mode=='add'){
			query="insert into "+SCHEMA_G+".threshold set threshold_name='"+thresholdName+"',color_code='"+thresholdcolor+"',"+
			"begin_threshold="+thresholdBegin+",end_threshold="+thresholdEnd+",created_dt=now(),updated_dt=now(),created_by='"+username+"',updated_by='"+username+"'";
	}else {//edit
		
		  query="update  "+SCHEMA_G+".threshold set threshold_name='"+thresholdName+"',color_code='"+thresholdcolor+"',"+
			"begin_threshold="+thresholdBegin+",end_threshold="+thresholdEnd+",updated_dt=now(),updated_by='"+username+"' where threshold_id="+thresholdID; 
		  queryCheck=queryCheck+" and threshold_id <> "+thresholdID;
	}
	//alert(queryCheck);
	KPIAjax.searchObject(queryCheck,{
			callback:function(data){
				if(data!=null && data.length>0){
					alert("มีช่วงคะแนนนี้อยู่ในระบบแล้ว");
					$("#thresholdBegin_form").focus();
				}else if(thresholdcolor == ""){
					alert("กรุณาเลือกสีสำหรับช่วงคะแนน");
					$("#colorpickerfield").focus();
					return false;
				}else{
					KPIAjax.executeQuery(query,{
						callback:function(data){
							if(data!=0){
								searchThreshold(); 
								$( "#dialog-form" ).dialog("close");
							}
						}
					});
				} 
			}
			});	
	/*KPIAjax.searchObject(queryCheckMaxMin,{
	callback:function(data){
		if(data==null){
			var max = parseInt(data[0][1]);
			var min = parseInt(data[1][1]);
			var begin = parseInt(thresholdBegin);
			var end = parseInt(thresholdEnd);
			

			if(thresholdName == ""){
				alert("กรุณาใส่ชื่อช่วงคะแนน");
				$("#thresholdName_form").focus();
				return false;
			}else if(thresholdBegin == ""){
				alert("กรุณาใส่ค่าช่วงคะแนนเริ่มต้น");
				$("#thresholdBegin_form").focus();
				return false;
			}else if(thresholdEnd == ""){
				alert("กรุณาใส่ค่าช่วงคะแนนสิ้นสุด");
				$("#thresholdEnd_form").focus();
				return false;
			}else if(end < begin){
				alert("ค่าช่วงคะแนนสิ้นสุดน้อยกว่าค่าช่วงคะแนนเริ่มต้น");
				$("#thresholdBegin_form").focus();
				return false;
			}else if(end <= max && begin >= min ){
			//alert(queryCheck);
			KPIAjax.searchObject(queryCheck,{
			callback:function(data){
				if(data!=null && data.length>0){
					alert("มีช่วงคะแนนนี้อยู่ในระบบแล้ว");
					$("#thresholdBegin_form").focus();
				}else if(thresholdcolor == ""){
					alert("กรุณาเลือกสีสำหรับช่วงคะแนน");
					$("#colorpickerfield").focus();
					return false;
				}else{
					KPIAjax.executeQuery(query,{
						callback:function(data){
							if(data!=0){
								searchThreshold(); 
								$( "#dialog-form" ).dialog("close");
							}
						}
					});
				} 
			}
			});			
			
			}
			else {
				alert("ช่วงคะแนนไม่อยู่ในขอบเขต "+min+" - "+max);
				$("#thresholdBegin_form").focus();
				}
		}
		else {
			
			alert("กรุณาตั้งค่า สูงสุด-ต่ำสุด ในตาราง sys_conf");
		}
	}
	});*/
	 
}
function doAction(id){ 
   var query="delete  FROM "+SCHEMA_G+".threshold where threshold_id="+id;
		KPIAjax.executeQuery(query,{
			callback:function(data){
				if(data==0)
					alert("ไม่สามารถลบได้เนื่องจากข้อมูลถูกใช้งาน");
				searchThreshold();
			}
		}); 
}   

</script> 
</body>
</html>  
 
 