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
		<label class="fomtsizeAndColor" style="margin-top:20px">ระบบวัดผลการดำเนินงานกองทัพเรือ - หน้าจอบันทึกข้อมูลหน่วยงาน</label>
		</div>  
     	<div id="_content" style="margin-left:3px;padding-top: 3px;width: 1100px"> 
     	<table style="width: 1100px;"><tr><td>
      		 <!--  <fieldset style="font-family: sans-serif;padding-top:0px;width: 1100px">   -->
      		  <form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
 
 <div class="control-group">
    <label class="control-label">ชื่อหน่วยงาน :</label>
    <div class="controls">
   <!--  <input type="hidden" id="employeeElement" />
     <input type="text" id="employeeSelection" /> -->
      <input class="input_snp" type="text"  id="organizationName" style="width:500px" > <a class="btn btn-primary" onclick="searchOrganization()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">ค้นหา</span></a>
    </div>
	<div style="padding-left:92px">
	<label style="margin-top:5px; margin-left: 90px;">การใช้งาน </label>
		<label style="margin-left: 90px;">1.การค้นหาข้อมูล คลิกที่ปุ่ม "ค้นหา" เพื่อแสดงรายชื่อทั้งหมดของหน่วยงาน หรือต้องการค้นหาตามชื่อหน่วยงาน ให้กรอกชื่อในกล่องข้อความ แล้วคลิกที่ปุ่ม "ค้นหา" </label>
		<label style="margin-left: 90px;">2.การเพิ่มหน่วยงาน หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "เพิ่ม" จากนั้นระบบจะแสดงหน้าจอให้กรอกข้อมูลให้ครบถ้วน แล้วคลิกที่ปุ่ม "บันทึก"</label>
		<label style="margin-left: 90px;">3.การแก้ไขหน่วยงาน หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "แก้ไข" <i class="icon-edit"></i> ระบบจะแสดงหน้าจอให้แก้ไขข้อมูล แล้วคลิกที่ปุ่ม "บันทึก" </label>
		<label style="margin-left: 90px;">4.การลบหน่วยงาน หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "ลบ"<i class="icon-trash"></i> ระบบจะแสดงหน้าจอเพื่อยืนยัน เลือกคลิกที่ปุ่ม "ใช่"</label>
	</div>	
  </div> 
</form> 
<div id="dialog-confirmDelete" title="ลบหน่วยงาน" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
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
<!-- <div id="dialog-Message" style="margin-top:-15px; padding-top: 17px;display: block;height: 380px; overflow: auto;overflow-x:hidden" > -->
<!-- <div id="dialog-Message" style="display: none;padding-left: 3px;width: 1098px" >
<form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > -->
<div id="dialog-Message" style="display: block;padding-left: 3px;width: 1098px" >
<form     style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div> 
	 <div style="padding: 10px;overflow: auto; height: 450px; width overflow-x:hidden;" id="search_section">
	 
    </div>
  </div> 
  </form>
  </div>
  <div id="dialog-form"  style="display: none;">
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
    <input type="hidden" id="mode"/>
	<input type="hidden" id="organid"/>
  <div class="control-group">
      <label class="control-label">รหัสหน่วยงาน :</label>
    <div class="controls">
      <input class="input_snp"  type="text" style = "width :400px" id="organizationCode_Form" >
	  (ตัวอักษร)
    </div>
    <label class="control-label">ชื่อหน่วยงาน :</label>
    <div class="controls">
      <input class="input_snp"  type="text" style = "width :400px" id="organizationName_Form" >
	(ตัวอักษร)
    </div>
	<label class="control-label">ชื่อย่อ :</label>
	<div class="controls">
      <input class="input_snp"  type="text" style = "width :400px" id="organizationShortName_Form" >
	(ตัวอักษร)
    </div>
	<br>
	<div class="controls">
		<input type="radio" name="status" id="input_status_ac" value="0" checked> ใช้งาน
		
		&nbsp;
		<input type="radio" name="status" id="input_status_no" value="1" > ไม่ใช้งาน
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
     	<!-- </div>
     </div>  -->
<%@ include file="/WEB-INF/jsp/schema.jsp" %> 
<script type="text/javascript"> 
var _path='<%=request.getContextPath()%>'+'/';
var username = '<%=request.getRemoteUser()%>';
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG;
var dataCodeEdit; // Gobal variable for edit organization_code.
	$(document).ready(function() {
		$("#organizationName").keypress(function(event) {
	  if ( event.which == 13 ) {
		 event.preventDefault();
		 searchOrganization();
	   } 
	});   
		$( "#organizationName" ).autocomplete({
			  source: function( request, response ) {
					var query="SELECT organization_id,organization_name,organization_code FROM "+SCHEMA_G+".organization where organization_name like '%"+request.term+"%'";
				   
					KPIAjax.listMaster(query,{
						callback:function(data){ 
							if(data!=null && data.length>0){
								response( $.map( data, function( item ) {
								  return {
									  label: item.name,
									  value: item.name
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

	}); 
	function searchOrganization(){
		var organization_Name =jQuery.trim($("#organizationName").val());
		var organizationNameWhere="";
		if(organization_Name.length>0)
			organizationNameWhere=" where organization_name like '%"+organization_Name+"%'";
		var query="SELECT organization_id,organization_code,organization_name,organization_short_name,organization_status FROM "+SCHEMA_G+".organization "+organizationNameWhere;
		KPIAjax.searchObject(query,{
			callback:function(data){
				var str="<div align=\"left\" style=\"padding-bottom: 4px;width:1070px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">เพิ่ม</span></a></div>"+
						"	  <table id=\"showData\" class=\"table table-bordered \" border=\"1\" style=\"font-size: 12px;width:1070px\"> "+
						"	<thead> 	"+
						"  		<tr class=\"altheader\" > "+
						" 			<th width=\"15%\"><div class=\"th_class\">รหัสหน่วยงาน</div></th>"+
						"   		<th width=\"50%\"><div class=\"th_class\">ชื่อหน่วยงาน</div></th>"+ 
						"   		<th width=\"15%\"><div class=\"th_class\">ชื่อย่อ</div></th>"+ 
						"   		<th width=\"10%\"><div class=\"th_class\">สถานะ</div></th>"+ 
						"    		<th width=\"10%\"><div class=\"th_class\">แก้ไข&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ลบ</div></th>     "+
						" 		</tr>"+
						"	</thead>"+
						"	<tbody class=\"showDataTbody\">   "; 
						
				   if(data!=null && data.length>0){
					   for(var i=0;i<data.length;i++){
					   var strStatus="";
					   if(data[i][4]=="nonactive"){
						strStatus="ไม่ใช้งาน";
					   }
					   else{
						strStatus="ใช้งาน";
					   }
					   if(i % 2 == 0){
						   str=str+ "  	<tr style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+")\" >"+
							"  		<td width=\"15%\" style=\"text-align: center;\"> "+data[i][1]+" </td>"+    
							"    	<td width=\"50%\" style=\"text-align: center;\">"+data[i][2]+"</td>  "+
							"    	<td width=\"15%\" style=\"text-align: center;\">"+data[i][3]+"</td>  "+ 
							"    	<td width=\"10%\" style=\"text-align: center;\">"+strStatus+"</td>  "+ 
							"    	<td width=\"10%\" style=\"text-align: center;\">"+
							"    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][0]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
							"    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][0]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
							"    	</td> "+
							"  	</tr>  ";
							}
							else{
							str=str+ "  <tr  class=\"alt\" style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+")\" >"+
							"  		<td width=\"15%\" style=\"text-align: center;\"> "+data[i][1]+" </td>"+    
							"    	<td width=\"50%\" style=\"text-align: center;\">"+data[i][2]+"</td>  "+
							"    	<td width=\"15%\" style=\"text-align: center;\">"+data[i][3]+"</td>  "+ 
							"    	<td width=\"10%\" style=\"text-align: center;\">"+strStatus+"</td>  "+ 
							"    	<td width=\"10%\" style=\"text-align: center;\">"+
							"    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][0]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
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
	$("#organid").val("");
	$("#organizationCode_Form").val("");
    $("#organizationName_Form").val("");
	$("#organizationShortName_Form").val("");
    $("#mode").val(mode);
	$('#input_status_ac').prop('checked', true);
	if(mode=='add'){
		$("#id_element").hide();
		$( "#dialog-form" ).dialog({ 
			position: 'top',
			height: 250,
			width:727,
			modal: true,
			hide: 'fold',
		    show: 'blind' 
		});
	}else{ //edit
		$("#id_element").show(); 
		var query="SELECT organization_id,organization_code,organization_name,organization_short_name,organization_status FROM "+SCHEMA_G+".organization where organization_id="+id;
		KPIAjax.searchObject(query,{
			callback:function(data){
					dataCodeEdit = data[0][1];
					$("#organid").val(data[0][0]);
					$("#organizationCode_Form").val(data[0][1]);
					$("#organizationName_Form").val(data[0][2]);
					$("#organizationShortName_Form").val(data[0][3]);
				if(data[0][4]=="nonactive"){
					$('#input_status_ac').prop('checked', false);
					$('#input_status_no').prop('checked', true);
				}
				$( "#dialog-form" ).dialog({ 
					position: 'top',
					 height: 250,
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
	//alert("testSave");
	var input_status_ac = document.getElementById("input_status_ac").checked;
	var input_status_no = document.getElementById("input_status_no").checked;
	var organizationId=$("#organid").val();
    var organizationName=$("#organizationName_Form").val();
	var organizationCode=$("#organizationCode_Form").val();
	var organizationShortName=$("#organizationShortName_Form").val();
	
	var mode=$("#mode").val();
	var query="";
	// --------------------------------- validate text organization -----------------------------
	if(organizationCode.trim() == ""){
		alert("กรุณากรอกรหัสหน่วยงาน");
		$("#organizationCode_Form").focus();
	}else if(organizationCode.trim().length>50){
		alert("รหัสหน่วยงานมีจำนวนตัวอัษกรเกิน 50 ตัว");
		$("#organizationCode_Form").focus();
	}
	else if(organizationName.trim() == ""){
		alert("กรุณากรอกชื่อหน่วยงาน");
		$("#organizationName_Form").focus();
	}
	else if(organizationName.trim().length>50){
		alert("ชื่อหน่วยงานมีจำนวนตัวอัษกรเกิน 50 ตัว");
		$("#organizationName_Form").focus();
	}
	else if(organizationShortName.trim() == ""){
	alert("กรุณากรอกชื่อย่อหน่วยงาน");
		$("#organizationShortName_Form").focus();
	}
	else if(organizationShortName.trim().length>50){
	alert("ชื่อย่อหน่วยงานมีจำนวนตัวอัษกรเกิน 50 ตัว");
		$("#organizationShortName_Form").focus();
	}
	else{
		if(mode=='add'){
		// ------------------------- validate when user input code repeatedly ---------------------------------------
			//var QryCheckCode = "SELECT * FROM "+SCHEMA_G+".organization WHERE organization_code = '"+organizationCode+"'";
			//KPIAjax.searchObject(QryCheckCode,{
			//callback:function(data){
				//if(data != null){
					//alert("รหัสหน่วยงานซ้ำ1");
					//$("#organizationCode_Form").focus();
				//}else {
				var queryActive="";
				if(input_status_ac){
					queryActive = ",organization_status='active'";
				}
				else{
					queryActive=",organization_status='nonactive'";
				}
					query="insert into "+SCHEMA_G+".organization set organization_name='"+organizationName+"', organization_code='"+organizationCode+"',organization_short_name='"+organizationShortName+"'  ,created_by='"+username+"', created_dt=now(),updated_by='"+username+"',updated_dt=now()"+queryActive;
					addOrUpdate(query);
				//alert("1"+query);
				//}// else
			//}//end callback:function(data)
			//});//end KPIAjax.searchObject
		}else {//edit
			//alert("var dataCodeEdit; "+dataCodeEdit);
			//var QryCheckCode = "SELECT * FROM "+SCHEMA_G+".organization WHERE organization_code = '"+organizationCode+"'"+" AND organization_code <> '"+dataCodeEdit+"'";
			//KPIAjax.searchObject(QryCheckCode,{
			//callback:function(data){
				//if(data != null){
				//	alert("รหัสหน่วยงานซ้ำ2");
					//$("#organizationCode_Form").focus();
				//}else {
				var queryActive="";
				if(input_status_ac){
					queryActive = ",organization_status='active'";
				}
				else{
				
					queryActive=",organization_status='nonactive'";
				}
				
					query="update "+SCHEMA_G+".organization set organization_name='"+organizationName+"',organization_code='"+organizationCode+"',organization_short_name='"+organizationShortName+"',updated_by='"+username+"',updated_dt=now() "+queryActive+" where organization_id='"+organizationId+"'";
				  	
					addOrUpdate(query);
				//}
			//}
			//});

		  	
		}
	}//end else validate text organization  
}//end function doSubmitAction()

// ------------------  add or Update data by lamtharn --------------------
	function addOrUpdate(query){
		//alert(query);
			KPIAjax.executeQuery(query,{
			callback:function(data){ 
				if(data!=0){
					searchOrganization(); 
					$( "#dialog-form" ).dialog("close");
				}
			}
		});
	}

	function doAction(id){ 
	   var query="delete  FROM "+SCHEMA_G+".organization where organization_id ="+id;
			KPIAjax.executeQuery(query,{
				callback:function(data){
					if(data==0)
						alert("ไม่สามารถลบข้อมูลเนื่องจากยังมีการใช้งานอยู่");
					searchOrganization();
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