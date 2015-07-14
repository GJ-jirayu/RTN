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
    font-size:20px;
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
 .ui-autocomplete-loading {
    background: white url('<%=request.getContextPath() %>/resources/css/smoothness/images/ui-anim_basic_16x16.gif') right center no-repeat;
  } 
 </style>
<style type="text/css">
/*.th_class{font-family: Tahoma;font-size: 13px;text-align: center;*/
.th_class{text-align: center;
}
a{cursor: pointer;}
</style>
<!-- <style type="text/css"> 
th{ font-family:Tahoma; font-size:12px; font-weight:bold;
 color: #fff;background:url(/MISSExamBackOffice/resources/images/tr_back-theme1.gif) repeat-x scroll 0 0 #80838A;padding: 5px 8px;border:1px solid #fff; 
} 
</style> -->  

</head> 
<body> 
		<div class="imageholder" style="background-image:url('<%=request.getContextPath() %>/resources/img/rtn.jpg');">
		</div>
		<div id="header"  style="padding-top: 3px;padding-left: 50px;width: 1600px;height:80px;background: #01009E;">
		<label class="fomtsizeAndColor" style="margin-top:20px">ระบบวัดผลการดำเนินงานกองทัพเรือ - หน้าจอกำหนดช่วงคะแนน</label>
		</div>
     	<div id="_content"  style="margin-left:3px;padding-top: 3px;width: 1100px">
      		   <!-- <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px"> -->  
      		   <table style="width: 1100px;">
     			<tr>
     				<td>
<form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 <div  style="padding-left:20px">
  <span style="padding-left:10px;"> 
  <div  style= "padding-left:10px; width:70px; float:left;" >
		หน่วยงาน : 
	</div>  
	<input type="text" id="depment" readonly="readonly" style="width: 240px" value='<%= request.getParameter("org")%>'/>
    </span> 
	<br>
	
  <span style="padding-left:10px;">
    <div  style= "padding-left:10px; width:70px; float:left;" >
		 รหัสตัวชี้วัด :  
	</div> 
   <input type="text" id="kpiCode" readonly="readonly" style="width: 90px" value='<%= request.getParameter("kpicode")%>'/>
    </span> 
    <span style="padding-left:10px;">
     <input type="hidden" id="kpiCode_hidden"/>
     <input type="hidden" id="kpiName_hidden"/>
     <input type="text" id="kpiName_result" readonly="readonly" style="width: 400px" value='<%= request.getParameter("kpicode")+"-"+request.getParameter("kpiname")%>'/>
    </span>
     <span style="padding-left:20px;">
    	<a class="btn" style="font-size:12px" onclick="showForm('add','<%= request.getParameter("kpiid")%>')" ><i class="icon-plus-sign"></i>&nbsp;<span style="font-weight: bold;font-size: 12px;">เพิ่ม</span></a>
    </span>
	<div class="controls" style= "width:1000px;margin-left:10px;">
        <label style="width:1020px;margin-top:10px;margin-left: 80px;">การใช้งาน</label>
		<label style="width:1020px;margin-left: 80px;">1.การเพิ่มข้อมูลของค่าเริ่มต้นตัวชี้วัด หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "เพิ่ม" จากนั้นระบบจะแสดงหน้าจอให้กรอกข้อมูลให้ครบถ้วน แล้วคลิกที่ปุ่ม "บันทึก" </label>
		<label style="width:1020px;margin-left: 80px;">2.การแก้ไขข้อมูลของค่าเริ่มต้นตัวชี้วัด หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "แก้ไข" <i class="icon-edit"></i> ระบบจะแสดงหน้าจอให้แก้ไขข้อมูล แล้วคลิกที่ปุ่ม "บันทึก" </label>
		<label style="width:1020px;margin-left: 80px;">3.การลบข้อมูลของค่าเริ่มต้นตัวชี้วัด  หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "ลบ" <i class="icon-trash"></i> ระบบจะแสดงหน้าจอเพื่อยืนยัน เลือกคลิกที่ปุ่ม "ใช่" </label>
	</div>
  </div>
  
   
  <!-- <div class="control-group">
    <div class="controls"> 
      <a class="btn btn-primary" ><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Submit</span></a>
    </div>
  </div> -->
</form>
<div id="dialog-confirmDelete" title="ลบค่าพื้นฐานตัวชี้วัด" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<div class="imageicon" style="background-image:url('<%=request.getContextPath() %>/resources/img/shock.jpg');">
	</div>
	<label style="padding-top:15px;padding-left:55px;">
		ต้องการลบหรือไม่?
	</label>
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
  <form style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div> 
	 <div style="padding: 10px;overflow: auto;height: 415px;overflow-x:hidden" id="search_section">

    </div>
  </div>
  </form>
  </div>
   <div id="dialog-form"  style="display: none;">
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
   <input type="hidden" id="mode" />
   <input type="hidden" id="baselineID" />
  <div class="control-group">
    <label class="control-label" id="username" >ค่าเริ่มต้นข้อมูลฐาน :</label>
    <div class="controls">
      <input class="input_snp"  type="text" id="begin_baseline_input" onkeypress="handleKey(this)" onkeyup="handleKey(this)" >
	  (ตัวเลข)
    </div>
  </div> 
   <div class="control-group">
    <label class="control-label">ค่าสิ้นสุดข้อมูลฐาน :</label>
    <div class="controls">
      <input class="input_snp"  type="text" id="end_baseline_input" onkeypress="handleKey(this)" onkeyup="handleKey(this)" >
	  (ตัวเลข)
    </div>
	
  </div> 
   <div class="control-group">
    <label class="control-label">คำอธิบาย :</label>
    <div class="controls">
      <input class="input_snp" style="width:400px"  type="text" id="desc_input" >
	  (ตัวอักษร)
    </div>
	
  </div> 
  <div class="control-group">
    <label class="control-label">คะแนน :</label>
    <div class="controls">
      <input class="input_snp"  type="text" id="actual_score_input" onkeypress="handleKey(this)" onkeyup="handleKey(this)" >
	  (ตัวเลข)
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
<%@ include file="/WEB-INF/jsp/schema.jsp" %> 
     <script type="text/javascript">
var _path='<%=request.getContextPath()%>'+'/'; 
var username = '<%=request.getRemoteUser()%>';
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG;
var intRegex = /^\d+$/;
var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+)|(-\d+(\.\d *)?)|((-\d*\.)?\d+))$/;


$(document).ready(function() {

	$( "#kpiCode" ).autocomplete({
		  source: function( request, response ) { 
				var query="SELECT kpi_code,kpi_name FROM "+SCHEMA_G+".kpi where kpi_code like '%"+request.term+"%'";// and etl_flag = 'Y' ";		      
				KPIAjax.searchObject(query,{
					callback:function(data){ 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label: item[0],
					        	  value: item[1] 
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
			  $("#kpiName_result").val(ui.item.label+" "+ui.item.value);
			  $("#kpiName").val("");
			  
			  $("#kpiCode_hidden").val(ui.item.label);
			  $("#kpiName_hidden").val(ui.item.value); 
			 
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		}); 
	$( "#kpiName" ).autocomplete({
		  source: function( request, response ) { 
				var query="SELECT kpi_code,kpi_name FROM "+SCHEMA_G+".kpi where kpi_name like '%"+request.term+"%' ";// and etl_flag = 'Y' ";		      
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
			   $("#kpiName_result").val(ui.item.value+" "+ui.item.label);
			   $("#kpiCode").val("");
			   
			   $("#kpiCode_hidden").val(ui.item.value);
			   $("#kpiName_hidden").val(ui.item.label); 
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		});
		loadData();
}); 

function loadData(){
		var kpiId = '<%= request.getParameter("kpiid")%>';
		var query="SELECT begin_baseline,end_baseline,description,actual_score,baseline_id FROM "+SCHEMA_G+".kpi_baseline where kpi_id = '"+kpiId+"'";
		var str="";
		KPIAjax.searchObject(query,{
     		callback:function(data){
				if(data!=null && data.length>0){
     			str +="	  <table id=\"showData\" class=\"table table-bordered \" border=\"1\" style=\"font-size: 12px;width:1070px\"> "+
     			        "	<thead> 	"+
     			        "  		<tr class=\"altheader\" > "+
     			        " 			<th width=\"20%\"><div class=\"th_class\">ค่าเริ่มต้น</div></th>"+
     			        "   		<th width=\"20%\"><div class=\"th_class\">ค่าสิ้นสุด</div></th>"+ 
     			        "   		<th width=\"25%\"><div class=\"th_class\">คำอธิบาย</div></th>"+ 
						"   		<th width=\"20%\"><div class=\"th_class\">คะแนน</div></th>"+ 
     			        "    		<th width=\"15%\"><div class=\"th_class\">แก้ไข&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ลบ</div></th>     "+
     			        " 		</tr>"+
     			        "	</thead>"+
     			        "	<tbody class=\"showDataTbody\">"; 

     				   for(var i=0;i<data.length;i++){
							if(i % 2 == 0){
							
								str += " <tr style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+")\" >"+
								"  		<td style=\"text-align: right;\"> "+data[i][0]+" </td>"+
								"    	<td style=\"text-align: right;\">"+data[i][1]+"</td>  "+
								"    	<td style=\"text-align: right;\">"+data[i][2]+"</td>  "+
								"    	<td style=\"text-align: right;\">"+data[i][3]+"</td>  "+
								"    	<td style=\"text-align: center;\">"+
								"    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
								"    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
								"    	</td> "+
								"  	</tr>  ";
							}
							else{
								str += " <tr class=\"alt\" style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+")\" >"+
								"  		<td style=\"text-align: right;\"> "+data[i][0]+" </td>"+
								"    	<td style=\"text-align: right;\">"+data[i][1]+"</td>  "+
								"    	<td style=\"text-align: right;\">"+data[i][2]+"</td>  "+
								"    	<td style=\"text-align: right;\">"+data[i][3]+"</td>  "+
								"    	<td style=\"text-align: center;\">"+
								"    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
								"    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
								"    	</td> "+
								"  	</tr>  ";
							}
					   }
     			   
     			        str +=  " </tbody>"+
     					   "</table> ";
						   }
     			$("#search_section").html(str);
     		}
     	});
}

function loadDynamicPage(pageId){
	pageId=_path+"ending_periodic_data_entry/template/"+pageId+".jsp";  
			$.ajax({
				  type: "get",
				  url: pageId,
				  cache: false 
				}).done(function( data ) {
					if(data!=null){
						  appendContent(data);
					  }
				});
}

function showForm(mode,id){
	$("#baselineID_input").val("");
    $("#begin_baseline_input").val("");
    $("#end_baseline_input").val("");
    $("#actual_score_input").val("");
	$("#desc_input").val("");
    $('#baselineID_input').attr('readonly', false);
    $("#mode").val(mode);
	if(mode=='add'){
	//	$("#id_element").hide();
		$( "#dialog-form" ).dialog({ 
			position: 'top',
			 height: 340,
			 width:727,
			modal: true,
			  hide: 'fold',
		      show: 'blind' 
		});
	}else{ //edit
		//$("#id_element").show(); 
	$('#baselineID_input').attr('readonly', true);
	var query="SELECT * FROM "+SCHEMA_G+".kpi_baseline where baseline_id='"+id+"'";
	//	var query="SELECT * FROM "+SCHEMA_G+".uom where uom_id="+id;
	
		KPIAjax.searchObject(query,{
			callback:function(data){
	$("#baselineID").val(data[0][0]);
    $("#begin_baseline_input").val(data[0][2]);
    $("#end_baseline_input").val(data[0][3]);
    $("#actual_score_input").val(data[0][4]);
	$("#desc_input").val(data[0][5]);
            /*   $("#uomID_form").val(data[0][0]);
              $("#uomName_form").val(data[0][1]); */
				$( "#dialog-form" ).dialog({ 
					position: 'top',
					 height: 340,
					 width:727,
					modal: true,
					 hide: 'fold',
				     show: 'blind' 
				});
			}
		});
	}
	 
}
function confirmDelete(id1){
	$( "#dialog-confirmDelete" ).dialog({
		/* height: 140, */
		modal: true,
		buttons: {
			"ใช่": function() { 
				$( this ).dialog( "close" );
				$("#mode").val('delete');
				doAction(id1);
			},
			"ไม่ใช่": function() {
				$( this ).dialog( "close" );
				return false;
			}
		}
	});
}
function doSubmitAction(){
   var kpi_id = '<%= request.getParameter("kpiid")%>';
   var baselineID= jQuery.trim($("#baselineID").val());
   var begin_baseline_input= jQuery.trim($("#begin_baseline_input").val());
   var end_baseline_input= jQuery.trim($("#end_baseline_input").val());
   var actual_score_input= jQuery.trim($("#actual_score_input").val());
   var desc_input = jQuery.trim($("#desc_input").val());
	var mode=$("#mode").val();
	var query="";
	//var query="SELECT  kpi_code,baseline_id,begin_baseline,end_baseline,actual_score FROM "+SCHEMA_G+".kpi_baseline "+kpiWhere;
	 var queryCheck="SELECT * FROM "+SCHEMA_G+".kpi_baseline where ("+begin_baseline_input+" BETWEEN begin_baseline AND end_baseline  "+
	 " or  "+end_baseline_input+" BETWEEN begin_baseline AND end_baseline ) ";   
	 if(mode=='add'){
			query="insert into "+SCHEMA_G+".kpi_baseline set kpi_id='"+kpi_id+"'"+
			",description='"+desc_input+"',begin_baseline="+begin_baseline_input+",end_baseline="+end_baseline_input+",actual_score="+actual_score_input+",created_dt=now(),updated_dt=now(),created_by='"+username+"',updated_by='"+username+"' ";
			  queryCheck=queryCheck+"  and kpi_id ='"+kpi_id+"'";
	}else {//edit
		  query="update  "+SCHEMA_G+".kpi_baseline set "+
			" description='"+desc_input+"' ,begin_baseline="+begin_baseline_input+",end_baseline="+end_baseline_input+",actual_score="+actual_score_input+",updated_dt=now(),updated_by='"+username+"' where kpi_id='"+kpi_id+"' and baseline_id='"+baselineID+"'"; 
		  queryCheck=queryCheck+" and baseline_id != '"+baselineID +"' and kpi_id ='"+kpi_id+"'";
	} 
	  var begin_baseline_input_number= parseFloat(jQuery.trim($("#begin_baseline_input").val()));
	  var end_baseline_input_number= parseFloat(jQuery.trim($("#end_baseline_input").val()));
	   
	//alert(query)
	if(begin_baseline_input == ""){
		alert("กรุณากรอกค่าเริ่มต้นข้อมูลฐาน");
		$("#begin_baseline_input").focus();
		return false;
	}else if($("#begin_baseline_input").val().length>3){
		alert("ค่าเริ่มต้นข้อมูลฐานมีจำนวนตัวเลขเกิน 3 หลัก");
		$("#begin_baseline_input").focus();
		return false;
	}else if(end_baseline_input == ""){
		alert("กรุณากรอกค่าสิ้นสุดข้อมูลฐาน");
		$("#end_baseline_input").focus();
		return false;
	}else if($("#end_baseline_input").val().length>3){
		alert("ค่าสิ้นสุดข้อมูลฐานมีจำนวนตัวเลขเกิน 3 หลัก");
		$("#end_baseline_input").focus();
		return false;
	}else if(begin_baseline_input_number>=end_baseline_input_number){
		alert("ค่าสิ้นสุดข้อมูลฐานน้อยกว่าค่าเริ่มต้นข้อมูลฐาน");
		$("#begin_baseline_input").focus();
		return false;
	}else if(desc_input.trim() == ""){
		alert("กรุณากรอกคำอธิบาย");
		$("#desc_input").focus();
		return false;
	}else if($("#desc_input").val().length>255){
		alert("คำอธิบายมีตัวอักษรเกิน 255 ตัว");
		$("#desc_input").focus();
		return false;
	}else if(actual_score_input == ""){
		alert("กรุณากรอกคะแนน");
		$("#actual_score_input").focus();
		return false;
	}else if(actual_score_input.length>3){
		alert("คะแนนมีจำนวนตัวเลขเกิน 3 หลัก");
		$("#actual_score_input").focus();
		return false;
	}else{
		KPIAjax.searchObject(queryCheck,{
			callback:function(data){
				if(data!=null && data.length>0){
						alert("ค่าเริ่มต้นข้อมูลและค่าสิ้นสุดข้อมูลฐาน \n มีอยู่ในฐานข้อมูลที่มีในฐานข้อมูล");
				 }else{
				 //alert(query);
					 KPIAjax.executeQuery(query,{
							callback:function(data){ 
								if(data!=0){
									loadData(); 
									$( "#dialog-form" ).dialog("close");
								}else{
									alert("ไม่สามารถเพิ่มข้อมูลได้เนื่องกรอกข้อมูลไม่ถูกต้อง ");
								}
							}
						});
				 } 
			}
		});
	 }
}
function doAction(id){ 
   var query="delete  FROM "+SCHEMA_G+".kpi_baseline where baseline_id='"+id+"'";
		KPIAjax.executeQuery(query,{
			callback:function(data){
				if(data==0)
				{
					alert("ไม่สามารถลบข้อมูลได้เนื่องจากมีการใช้งาน.");
				}
					loadData();
			}	
		});
}

function setBaseline(){ 
	$("#kpi_code").val("KPI001");
	$("#kpi_name").val("ยอดขายสินค้าเทียบเป้า");
	$("#dialog-Message_1").slideUp("slow", function() {
	    // Animation complete.
		$("#dialog-Message_2").slideDown("slow"); 
	});
	
}

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
</script> 
</body>
</html>   
