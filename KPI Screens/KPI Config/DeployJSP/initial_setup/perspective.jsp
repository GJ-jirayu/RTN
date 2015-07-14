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
 form {
margin: 0 0 0px;
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
</head> 
<body>
	<div class="imageholder" style="background-image:url('<%=request.getContextPath() %>/resources/img/rtn.jpg');">
	</div>
	<div id="header"  style="padding-top: 3px;padding-left: 50px;width: 2000px;height:80px;background: #01009E;">
		<label class="fomtsizeAndColor" style="margin-top:20px">ระบบวัดผลการดำเนินงานกองทัพเรือ - หน้าจอบันทึกข้อมูลมิติการประเมินผล</label>
	</div> 
  <!-- <div class="row-fluid"  style="position:fixed;">     	 
     	<div class="span7"> -->
     	<div id="_content"  style="margin-left:3px;padding-top: 3px;width: 1100px">
     		<table style="width: 1100px;"><tr><td>
      		 <!--  <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px"> -->  
      		  <form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
 <div class="control-group">
    <label class="control-label">มิติการประเมินผล :</label>
    <div class="controls">
        <input class="input_snp" type="text"  id="perspectiveName"> <a class="btn btn-primary" onclick="searchPerSpective()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">ค้นหา</span></a>

	</div>
	<div style="padding-left:72px;">
		<label style="margin-top:5px;margin-left:100px;">การใช้งาน </label>
		<label style="margin-left: 100px;">1.การค้นหาข้อมูล คลิกที่ปุ่ม "ค้นหา" เพื่อแสดงรายชื่อทั้งหมดของมิติการประเมินผล หรือต้องการค้นหาตามชื่อมิติการประเมินผล ให้กรอกชื่อในกล่องข้อความ แล้วคลิกที่ปุ่ม "ค้นหา" </label>
		<label style="margin-left: 100px;">2.การเพิ่มมิติการประเมินผล หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "เพิ่ม" จากนั้นระบบจะแสดงหน้าจอให้กรอกข้อมูลให้ครบถ้วน แล้วคลิกที่ปุ่ม "บันทึก"</label>
		<label style="margin-left: 100px;">3.การแก้ไขมิติการประเมินผล หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "แก้ไข" <i class="icon-edit"></i> ระบบจะแสดงหน้าจอให้แก้ไขข้อมูล แล้วคลิกที่ปุ่ม "บันทึก" </label>
		<label style="margin-left: 100px;">4.การลบมิติการประเมินผล หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "ลบ"<i class="icon-trash"></i> ระบบจะแสดงหน้าจอเพื่อยืนยัน เลือกคลิกที่ปุ่ม "ใช่"</label>
	</div>
  </div> 
</form> 
<div id="dialog-confirmDelete" title="ลบมิติการประเมินผล" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
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
<div id="dialog-Message" style="display: block;padding-left: 3px;width: 1098px" >
<form     style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div> 
	 <div style="padding: 10px;overflow: auto;height: 450px; overflow-x:hidden" id="search_section">
	 
    </div>
  </div> 
  </form>
  </div>
  <div id="dialog-form"  style="display: none;">
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
   <input type="hidden" id="mode" />
   <input type="hidden" id="perspectiveID_form" />
  <!--<div class="control-group" id="id_element">
    <label class="control-label" for="inputEmail">Perspective ID:</label>
    <div class="controls">
      <input class="input_snp" type="text" id="perspectiveID_form" readonly="readonly">
    </div>
  </div>-->
  <div class="control-group">
    <label class="control-label">มิติการประเมินผล :</label>
    <div class="controls">
      <input class="input_snp"  type="text" id="perspectiveName_form" >
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
/* var SCHEMA_G='mcic_kpi_app_test';  */
var _path='<%=request.getContextPath()%>'+'/'; 
var username = '<%=request.getRemoteUser()%>';
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG;   
$(document).ready(function() {
	$("#perspectiveName").keypress(function(event) {
  if ( event.which == 13 ) {
     event.preventDefault();
     searchPerSpective();
   } 
});
	$( "#perspectiveName" ).autocomplete({
		  source: function( request, response ) { 
				var query="SELECT perspective_id,perspective_name FROM "+SCHEMA_G+".perspective where perspective_name like '%"+request.term+"%'";
			   
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
							//alert("not have data")
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
	//searchPerSpective();
}); 
function searchPerSpective(){
	var perspectiveName =jQuery.trim($("#perspectiveName").val());
	var perspectiveNameWhere="";
	if(perspectiveName.length>0)
		perspectiveNameWhere=" where perspective_name like '%"+perspectiveName+"%'";
	var query="SELECT * FROM "+SCHEMA_G+".perspective "+perspectiveNameWhere;
	KPIAjax.searchObject(query,{
		callback:function(data){
			var str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">เพิ่ม</span></a></div>"+
			 		"	  <table id=\"showData\" class=\"table table-bordered \" border=\"1\" style=\"font-size: 12px\"> "+
			        "	<thead> 	"+
			        "  		<tr class=\"altheader\"> "+
			        <!--" 			<th width=\"10%\"><div class=\"th_class\">Perspective ID</div></th>"+-->
			        "   		<th width=\"85%\"><div class=\"th_class\">มิติการประเมินผล</div></th>"+ 
			        "    		<th width=\"15%\"><div class=\"th_class\">แก้ไข&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
					"			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ลบ</div></th>"+
			        " 		</tr>"+
			        "	</thead>"+
			        "	<tbody class=\"showDataTbody\">   "; 
			  		
			   if(data!=null && data.length>0){
				   for(var i=0;i<data.length;i++){
				   if(i % 2 == 0){
					   str=str+ " <tr style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+")\" >"+   
				        "    	<td style=\"text-align: center;\">"+data[i][1]+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+
				        "    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][0]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				        "    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][0]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
				        "    	</td> "+
				        "  	</tr>  ";
						}
						else{
						str=str+ "<tr class=\"alt\" style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+")\" >"+   
				        "    	<td style=\"text-align: center;\">"+data[i][1]+"</td>  "+   
				        "    	<td style=\"text-align: center;\">"+
				        "    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][0]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				        "    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][0]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
				        "    	</td> "+
				        "  	</tr>  ";
						}
				   }
			   }else{
			   alert("ไม่มีข้อมูล");
				   var str="<div align=\"left\" style=\"padding-bottom: 4px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">เพิ่ม</span></a></div>"+
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
	 $("#perspectiveID_form").val("");
     $("#perspectiveName_form").val("");
     $("#mode").val(mode);
	if(mode=='add'){
		$("#id_element").hide();
		$( "#dialog-form" ).dialog({ 
			position: 'top',
			 height: 195,
			 width:727,
			modal: true,
			  hide: 'fold',
		      show: 'blind' 
		});
	}else{ //edit
		$("#id_element").show(); 
		var query="SELECT * FROM "+SCHEMA_G+".perspective where perspective_id="+id;
		KPIAjax.searchObject(query,{
			callback:function(data){
				//alert(data); 
               $("#perspectiveID_form").val(data[0][0]);
               $("#perspectiveName_form").val(data[0][1]);
				$( "#dialog-form" ).dialog({ 
					position: 'top',
					 height: 245,
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
			"ไม่ใช่": function() {
				$( this ).dialog( "close" );
				return false;
			}
		}
	});
}
function doSubmitAction(){ 
    var perspectiveID=$("#perspectiveID_form").val();
    var perspectiveName=$("#perspectiveName_form").val();
	var mode=$("#mode").val();
	var query="";
	if(mode=='add'){
			query="insert into "+SCHEMA_G+".perspective set perspective_name='"+perspectiveName+"', created_dt=now(),updated_dt=now(),created_by='"+username+"',updated_by='"+username+"'";
	}else {//edit
		  query="update  "+SCHEMA_G+".perspective set perspective_name='"+perspectiveName+"',updated_dt=now(),updated_by='"+username+"' where perspective_id="+perspectiveID; 
	}

	if(perspectiveName == ""){
		alert("กรุณากรอกมิติการประเมิณผล");
		$("#perspectiveName_form").focus();
	}
	else if(perspectiveName.length>255){
		alert("ชื่อมิติประเมินผลมีตัวอักษรเกิน 255 ตัว");
		$("#perspectiveName_form").focus();
	}
	else{
		KPIAjax.executeQuery(query,{
			callback:function(data){ 
				if(data!=0){
					searchPerSpective(); 
					$( "#dialog-form" ).dialog("close");
				}
			}
		});
	} 
}
function doAction(id){
   var query="delete  FROM "+SCHEMA_G+".perspective where perspective_id="+id;
		KPIAjax.executeQuery(query,{
			callback:function(data){
				if(data==0)
					alert("ไม่สามารถลบข้อมูลได้เนื่องจากข้อมูลถูกใช้งานอยู่");
				searchPerSpective();
			}
		}); 
}
function visited(tr) {
    $("tbody.showDataTbody tr").removeAttr("style");
	//$(tr).removeClass("alt");
	tr.style.backgroundColor = "#F5E79E";	
}
</script> 
</body>
</html>  
