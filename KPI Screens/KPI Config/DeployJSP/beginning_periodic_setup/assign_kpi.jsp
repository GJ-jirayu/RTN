<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="org.springframework.security.userdetails.User" %>
<%@ page import="org.springframework.security.Authentication" %>
<%@ page import="org.springframework.security.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.GrantedAuthority" %>
<%@ page import="java.util.*"%>
<html> 
<head>
<title>BackOffice</title>
<!--  <meta charset="UTF-8" />   --> 
<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="<%=request.getContextPath() %>/resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script src="<%=request.getContextPath()%>/resources/js/smoothness/jquery-ui-1.9.2.custom.min.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js" type="text/javascript" ></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 
<link href="<%=request.getContextPath()%>/resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"  type="text/css"/>    
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap-filestyle.min.js"> </script>   
 
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
textarea,fieldset ,select,a{font-size: 12px
}
table > tbody{font-size: 12px;
}
table th, .table td {
line-height: 10px;
}
input {
font-size: 12px;
font-weight: normal;
line-height: normal;
}
 form {
margin: 0 0 0px;
}
.input_number{
width: 100px;
text-align:right;
}
.input_text{
width: 350px;
}
 
 </style>
 <style>
 .ui-datepicker-trigger{
 cursor: pointer;
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
.input_kpi{
 height: 20px;
 line-height: 20px;
 }
</style>

</head> 
<% //Authentication
	Authentication a = SecurityContextHolder.getContext().getAuthentication();
	User currentUser = (User)a.getPrincipal();

	//out.println("user : "+currentUser.getUsername());
	//out.println("<br/>");
	//out.println("Authorities : ");
	//auth
	int i = 0;
	String getRole = "";
	GrantedAuthority[] list1 = currentUser.getAuthorities();
	List<GrantedAuthority> a1 = Arrays.asList(list1);
	ListIterator litr = a1.listIterator();
	while(litr.hasNext()) {
		Object element = litr.next();
		if(i==0){
			getRole = "'"+element+"'";
			
		}else{
			getRole += ",'"+element+"'";	
		}//end else
       //	out.println(element);
       	i++;
    }//end while(litr.hasNext())
   // out.println(getRole+"-"+i);
%>
<body> 
	<script src="<%=request.getContextPath() %>/resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/smoothness/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script> 

    <script src="<%=request.getContextPath()%>/js/tmpl.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/load-image.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/canvas-to-blob.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-image-gallery.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.iframe-transport.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.fileupload.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.fileupload-fp.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.fileupload-ui.js"></script>
    <script src="<%=request.getContextPath()%>/js/locale.js"></script>
    <script src="<%=request.getContextPath()%>/js/main.js"></script>

	<div class="imageholder" style="background-image:url('<%=request.getContextPath() %>/resources/img/rtn.jpg');">
	</div>
	<div id="header"  style="padding-top: 3px;padding-left: 50px;width: 2000px;height:80px;background: #01009E;">
		<label class="fomtsizeAndColor" style="margin-top:20px">ระบบวัดผลการดำเนินงานกองทัพเรือ - หน้าจอกำหนดตัวชี้วัดของหน่วยงาน</label>
	</div>
     	<div id="_content" style="margin-left:3px;padding-top: 3px;width: 1100px">
      		<!--   <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px"> --> 
      		<table style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px;width: 1100px;"><tr><td>
<!-- <form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px" action="" method="post" >
   -->
  <div style="padding-left:10px;padding-top: 5px">
	<input type="hidden" id="arrKpiresId"/>
	<input type="hidden" id="arrKpiId"/>
	<input type="hidden" id="statusPeriod"/>
	<input type="hidden" id="countRow"/>
	<input type="hidden" id="lastEvt"/>
	<input type="hidden" id="saveStatus"/>
	<input type="hidden" id="row"/>
    <span style="padding-left:10px;">
		<div style = "width:100px; float:left; padding-left:30px; padding-top:10px;">
			หน่วยงาน:
		</div>
		<span id="orgSelection">
		</span> 
    </span> 
	<br>	
     <span style="padding-left:10px;">
	    <div style = "width:100px; float:left; padding-left:30px; padding-top:10px;">
    	   ปีงบประมาณ:
		</div>
		<span id="yearSelection">
		</span>
    </span>
	<br>
    <span style="padding-left:10px;">
	    <div style = "width:100px; float:left; padding-left:30px; padding-top:10px;"  >
    	     รอบประเมินผล:
		</div>
		<input type="checkbox" id="periodCheckbox" checked="checked" onClick="checkPeriod()" >&nbsp; ทุกรอบประเมินผล &nbsp;&nbsp;
		<span id="peroidSelection">
		</span>
    </span>
   <a class="btn btn-primary" id="btnSearch"  style="font-size:12px;margin-top: -10px;margin-left:20px" onclick="loaddata('search')" ><span align="center" style="color: white;font-weight: bold;font-size: 12px;">ค้นหา</span></a>
   
   
   
   <div >
   <br>
   <label style="margin-top:5px;font-size:12px;padding-left:30px;">การใช้งาน </label>
		<label style="font-size:12px;padding-left:30px;">1.การค้นหาข้อมูล กรอกข้อมูล หน่วยงาน ปีงบประมาณ รอบประเมินผล แล้วคลิกปุ่ม "ค้นหา" </label>
		<label style="font-size:12px;padding-left:30px;">2.การมอบหมายตัวชี้วัดหรือเพิ่มตัวชี้วัด หลังจากทำการค้นหา คลิกที่ปุ่ม มอบหมายตัวชี้วัด ระบบจะมอบหมายตัวชี้วัดทั้งหมดเข้ามาในตาราง และกรอกข้อมูล ค่าถ่วงน้ำหนัก เป้าหมาย (ตัวเลข) แล้วคลิกปุ่ม "บันทึก"</label>
		<label style="font-size:12px;padding-left:30px;">3.การแก้ไขตัวชี้วัด หลังจากทำการมอบหมายตัวชี้วัด ให้แก้ไข ค่าถ่วงน้ำหนัก,เป้าหมาย (ตัวเลข) แล้วคลิกปุ่ม "บันทึก"</label>
		<label style="font-size:12px;padding-left:30px;">4.การลบตัวชี้วัด หลังจากทำการมอบหมายตัวชี้วัดแล้วคลิกปุ่ม "ลบ"<i class="icon-trash"></i> ระบบจะแสดงหน้าจอเพื่อยืนยัน เลือกคลิกที่ปุ่ม "ใช่"</label>
    </div>
	</div>
    </td></tr>
  </table> 
  </div>
  <table style="width: 1100px">
	<tr>
		<td>
		<div id="dialog-Message" style="display: block;padding-left: 3px;width: 1098px" >

		<form style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div> 
	 <div style="padding: 10px;overflow: auto;height: 415px;overflow-x:hidden;width: 800px;" id="search_section"></div>  
  </div> 
  </form>
  </div>
</td>
	</tr>
  </table>
  
   </td>
	</tr>
  </table>
 <div id="dialog-confirmDelete" title="ลบตัวชี้วัดของหน่วยงาน" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<div class="imageicon" style="background-image:url('<%=request.getContextPath() %>/resources/img/shock.jpg');">
	</div>
	<label style="padding-top:15px;padding-left:55px;">
	ต้องการลบหรือไม่?
	</label>
</div>
 
 <%@ include file="/WEB-INF/jsp/schema.jsp" %>  
     <script type="text/javascript">
//var _path="/KPIWebTest/";
//var SCHEMA_G='mcic_kpi_app_test';
//var SCHEMA_G='FSD2';

var username = '<%=request.getRemoteUser()%>';
var _path='<%=request.getContextPath()%>'+'/'; 
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG; 
var intRegex = /^\d+$/;
var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+)|(-\d+(\.\d *)?)|((-\d*\.)?\d+))$/;

$(document).ready(function() {
	listYear();
	listOrg();
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
		
	});
	
	function checkPeriod()
	{
		if(document.getElementById('periodCheckbox').checked == true)
		{
			$('#periodElement').css('display', 'none');
			
		}
		else {
			$('#periodElement').removeAttr("style");
			$('#periodElement').css('width','300px');
		}
	}
	
	function listOrg(){
	var query="select organization_id,organization_short_name  from "+SCHEMA_G+".organization where (organization_short_name IN (<%=getRole%>) OR 'Administrator'IN (<%=getRole%>) OR 'สปช.ทร.' IN (<%=getRole%>)) and organization_status ='active';";
	//alert(query);
	KPIAjax.listMaster(query,{
		callback:function(data){
			 var str="<select id=\"orgElement\" style=\"width:100px;\">";
			 //   str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){

					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
			} 
			str=str+"</select>";
			$("#orgSelection").html(str); 
		}
	});
	}

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
			$("#yearSelection").html(str); 
			listPeriod();
		}
    });
}

function listPeriod(){
	
	$('#periodCheckbox').prop('checked', true);
	 var year=$("#yearElement").val();
	 var period_query="";
		if(year!='all'){
			period_query=" where year=" +year;
		}
		 
	var query="select period_no,period_desc  from "+SCHEMA_G+".period "+period_query;
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			 var str="<select id=\"periodElement\" style=\"width: 300px;display:none\">";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
			} 
			str=str+"</select>";
			$("#peroidSelection").html(str); 
		}
   });
}
 
	function distplayKPI(){
				var str="";
				str=str+"<table id=\"dataTable\" class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\">"+
				"<thead>"+
		    	"<tr> "+
         		"<th width=\"30%\"><div class=\"th_class\">ลำดับตัวชี้วัด</div></th>"+
         		"<th width=\"20%\"><div class=\"th_class\">ชื่อตัวชี้วัด</div></th>"+
         		"<th width=\"15%\"><div class=\"th_class\">ชื่อหน่วยวัด</div></th>"+ 
         		"<th width=\"15%\"><div class=\"th_class\">ถ่วงน้ำหนัก</div></th>"+
         		"<th width=\"15%\"><div class=\"th_class\">เป้าหมาย</div></th>"+ 
         		"<th width=\"10%\"><div class=\"th_class\"></div></th>"+
       		"</tr>"+
     	"</thead>"+
     	"<tbody>";

			str=str+"</tbody> </table>";
			
			$("#search_section").html(str);
			
	}

function loaddata(mode){
		var arrKpiresId = new Array();
		var arrKpiId = new Array();
		var countRow = "";
		//ค้นหา
		if(mode=="search"){
			$("#lastEvt").val("search");
			var orgId = $("#orgElement").val();
			var year = $("#yearElement").val();
			var periodNo = $("#periodElement").val();
			var query="";
			if(document.getElementById('periodCheckbox').checked == true)
			{
			
				$("#statusPeriod").val("insert_all");
				/*query="select distinct kpi.kpi_name,uom.uom_name,kpires.kpi_weight,kpires.target_data,kpires.kpi_id from "+
				SCHEMA_G+".kpi_result kpires,"+SCHEMA_G+".kpi kpi,"+SCHEMA_G+".uom uom,"+SCHEMA_G+".organization org,"+
				SCHEMA_G+".period period where kpires.period_id = period.period_id and kpires.organization_id = org.organization_id "+
				"and kpires.kpi_id = kpi.kpi_id and kpi.uom_id = uom.uom_id ";
				var queryWhere = " and org.organization_id='"+orgId+"' and period.year ='"+year+"'";
				query+=queryWhere;
				query+=" order by 5";*/
				query="select kpi.kpi_name,uom.uom_name,kpires.kpi_weight,kpires.target_data,kpires.kpi_id, GROUP_CONCAT(period.period_no) AS period_no"+
				" from rtn_kpi.kpi_result kpires,rtn_kpi.kpi kpi,rtn_kpi.uom uom,rtn_kpi.organization org,rtn_kpi.period period"+
				" where kpires.period_id = period.period_id and kpires.organization_id = org.organization_id and kpires.kpi_id = kpi.kpi_id"+
				" and kpi.uom_id = uom.uom_id  and org.organization_id='"+orgId+"' and period.year ='"+year+"'"+
				" GROUP BY kpi.kpi_name,uom.uom_name,kpires.kpi_weight,kpires.target_data,kpires.kpi_id";
				
					KPIAjax.searchObject(query,{
						callback:function(data){
							var str="<div style=\"text-align: center;\" ><span ><button class=\"btn btn-success\" type=\"button\" onclick=\"loaddata('assignkpi')\" > มอบหมายตัวชี้วัด </button> </span> </div>"+
									"	  <table id=\"showData\" class=\"table table-bordered \" border=\"1\" style=\"font-size: 12px;margin-top:10px\"> "+
									"	<thead> 	"+
									"  		<tr class=\"altheader\" > "+
									" 			<th style=\" display:none;\" ></th>"+
									" 			<th style=\" display:none;\" ></th>"+
									"			<th  width=\"15%\"><div class=\"th_class\">รอบประเมินผล</div></</th>"+
									"			<th width=\"45%\"><div class=\"th_class\">ชื่อตัวชี้วัด</div></th>"+
									"   		<th width=\"12%\"><div class=\"th_class\">หน่วยวัด</div></th>"+ 
									"   		<th width=\"12%\"><div class=\"th_class\">ค่าถ่วงน้ำหนัก</div></th>"+ 
									"   		<th width=\"12%\"><div class=\"th_class\">เป้าหมาย</div></th>"+
									"   		<th width=\"4%\"><div class=\"th_class\">ลบ</div></th>"+
									
									" 		</tr>"+
									"	</thead>"+
									"	<tbody class=\"showDataTbody\">   "; 
									
							   if(data!=null && data.length>0){
							   //alert(data);
								   for(var i=0;i<data.length;i++){
								   arrKpiresId.push(data[i][4]);
								   arrKpiId.push(data[i][5]);
								   countRow=i;
								   
								   if(i%2==0){
								   
										   str=str+ "  	<tr style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+");updateRow("+i+")\"  >"+
											"  		<td id=\"kpiresid"+i+"\" style=\" display:none;\"> "+data[i][4]+" </td>"+
											"  		<td id=\"kpiid"+i+"\" style=\" display:none;\" >"+data[i][4]+" </td>"+
											"		<td  style=\"text-align: left;\"> "+data[i][5]+" </td>"+
											"		<td  style=\"text-align: left;\"> "+data[i][0]+" </td>"+
											"    	<td style=\"text-align: left;\">"+data[i][1]+"</td>  "+
											"    	<td style=\"text-align: right;\"><input type=\"textarea\"  id=\"weightdata"+i+"\" style=\"width: 50px\" value =\""+data[i][2]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
											"    	<td style=\"text-align: right;\"> <input type=\"textarea\"  id=\"targetdata"+i+"\" style=\"width: 50px\" value =\""+data[i][3]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+						
											"    	<td style=\"text-align: center;\">"+
											"    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
											"    	</td> "+
											"  	</tr>  ";
										}
										else{
											str=str+ "<tr class=\"alt\" style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+");updateRow("+i+")\" >"+
											"  		<td id=\"kpiresid"+i+"\" style=\" display:none;\"> "+data[i][4]+" </td>"+
											"  		<td id=\"kpiid"+i+"\" style=\" display:none;\" >"+data[i][4]+" </td>"+
											"		<td  style=\"text-align: left;\"> "+data[i][5]+" </td>"+
											"  		<td  style=\"text-align: left;\"> "+data[i][0]+" </td>"+
											"    	<td style=\"text-align: left;\">"+data[i][1]+"</td>  "+
											"    	<td style=\"text-align: right;\"><input type=\"textarea\" id=\"weightdata"+i+"\" style=\"width: 50px\" value =\""+data[i][2]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
											"    	<td style=\"text-align: right;\"> <input type=\"textarea\" id=\"targetdata"+i+"\" style=\"width: 50px\" value =\""+data[i][3]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
											"    	<td style=\"text-align: center;\">"+
											"    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
											"    	</td> "+
											"  	</tr>  ";
										}
								   }
								   $("#arrKpiresId").val(arrKpiresId);
								   $("#arrKpiId").val(arrKpiId);
								   $("#countRow").val(countRow);
								   //alert($("#arrKpiresId").val());
							   }else{
								if($("#saveStatus").val() == false){
									alert("ไม่มีข้อมูล");
								}
								var str="<div style=\"text-align: center;\" ><span ><button class=\"btn btn-success\" type=\"button\" onclick=\"loaddata('assignkpi')\" > มอบหมายตัวชี้วัด </button> </span> </div>"+
								"<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px;margin-top:10px;\">"+
								"<thead>"+
								"<tr> "+
								"<th colspan=\"3\" width=\"100%\"><div class=\"th_class\">ไม่มีข้อมูล</div></th>"+ 
							"</tr>"+
						"</thead>"+
						"<tbody>";
						$("#arrKpiresId").val("");
						$("#arrKpiId").val("");
						   }
						   
						   str=str+
									"</tbody> "+
									"</table> "+
									"<div style=\"text-align: center;\" ><span ><button class=\"btn btn-primary start\" type=\"button\" onclick=\"savedata()\" > บันทึก </button> </span> </div>";	   
							$("#search_section").html(str);

						}
					});
			}
			
			else{
			
				$("#statusPeriod").val("not_all");
				query="select kpi.kpi_name,uom.uom_name,kpires.kpi_weight,kpires.target_data,kpires.kpi_result_id,kpires.kpi_id from "+
				SCHEMA_G+".kpi_result kpires,"+SCHEMA_G+".kpi kpi,"+SCHEMA_G+".uom uom,"+SCHEMA_G+".organization org,"+
				SCHEMA_G+".period period where kpires.period_id = period.period_id and kpires.organization_id = org.organization_id "+
				"and kpires.kpi_id = kpi.kpi_id and kpi.uom_id = uom.uom_id ";
				var queryWhere = " and org.organization_id='"+orgId+"' and period.period_no ='"+periodNo+"' and period.year = '"+year+"'";
				query+=queryWhere;
				query+=" order by kpires.kpi_result_id";
				
				//alert(query);
					KPIAjax.searchObject(query,{
						callback:function(data){
							var str="<div style=\"text-align: center;\" ><span ><button class=\"btn btn-success\" type=\"button\" onclick=\"loaddata('assignkpi')\" > มอบหมายตัวชี้วัด </button> </span> </div>"+
									"	  <table id=\"showData\" class=\"table table-bordered \" border=\"1\" style=\"font-size: 12px;margin-top:10px\"> "+
									"	<thead> 	"+
									"  		<tr class=\"altheader\" > "+
									" 			<th style=\" display:none;\" ></th>"+
									" 			<th style=\" display:none;\" ></th>"+
									" 			<th width=\"35%\"><div class=\"th_class\">ชื่อตัวชี้วัด</div></th>"+
									"   		<th width=\"15%\"><div class=\"th_class\">หน่วยวัด</div></th>"+ 
									"   		<th width=\"15%\"><div class=\"th_class\">ค่าถ่วงน้ำหนัก</div></th>"+ 
									"   		<th width=\"15%\"><div class=\"th_class\">เป้าหมาย</div></th>"+
									"   		<th width=\"7%\"><div class=\"th_class\">ลบ</div></th>"+
									
									" 		</tr>"+
									"	</thead>"+
									"	<tbody class=\"showDataTbody\">   "; 
									
							   if(data!=null && data.length>0){
								   for(var i=0;i<data.length;i++){
								   arrKpiresId.push(data[i][4]);
								   arrKpiId.push(data[i][5]);
								   countRow=i;
								   if(i%2==0){
								   //style=\" display:none;\"
										   str=str+ "  	<tr style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+");updateRow("+i+")\"  >"+
											"  		<td id=\"kpiresid"+i+"\" style=\" display:none;\"> "+data[i][4]+" </td>"+
											"  		<td id=\"kpiid"+i+"\" style=\" display:none;\" >"+data[i][4]+" </td>"+
											"  		<td  style=\"text-align: left;\"> "+data[i][0]+" </td>"+
											"    	<td style=\"text-align: left;\">"+data[i][1]+"</td>  "+
											"    	<td style=\"text-align: right;\"><input type=\"textarea\"  id=\"weightdata"+i+"\" style=\"width: 50px\" value =\""+data[i][2]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
											"    	<td style=\"text-align: right;\"> <input type=\"textarea\"  id=\"targetdata"+i+"\" style=\"width: 50px\" value =\""+data[i][3]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+						
											"    	<td style=\"text-align: center;\">"+
											"    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
											"    	</td> "+
											"  	</tr>  ";
										}
										else{
											str=str+ "<tr class=\"alt\" style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+");updateRow("+i+")\" >"+
											"  		<td id=\"kpiresid"+i+"\" style=\" display:none;\"> "+data[i][4]+" </td>"+
											"  		<td id=\"kpiid"+i+"\" style=\" display:none;\" >"+data[i][4]+" </td>"+
											"  		<td  style=\"text-align: left;\"> "+data[i][0]+" </td>"+
											"    	<td style=\"text-align: left;\">"+data[i][1]+"</td>  "+
											"    	<td style=\"text-align: right;\"><input type=\"textarea\" id=\"weightdata"+i+"\" style=\"width: 50px\" value =\""+data[i][2]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
											"    	<td style=\"text-align: right;\"> <input type=\"textarea\" id=\"targetdata"+i+"\" style=\"width: 50px\" value =\""+data[i][3]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
											"    	<td style=\"text-align: center;\">"+
											"    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
											"    	</td> "+
											"  	</tr>  ";
										}
								   }
								   $("#arrKpiresId").val(arrKpiresId);
								   $("#arrKpiId").val(arrKpiId);
								   $("#countRow").val(countRow);
								   //alert($("#arrKpiresId").val());
							   }else{
							   if($("#saveStatus").val() == false){
									alert("ไม่มีข้อมูล");
								}
								var str="<div style=\"text-align: center;\" ><span ><button class=\"btn btn-success\" type=\"button\" onclick=\"loaddata('assignkpi')\" > มอบหมายตัวชี้วัด </button> </span> </div>"+
								"<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px;margin-top:10px;\">"+
								"<thead>"+
								"<tr> "+
								"<th colspan=\"3\" width=\"100%\"><div class=\"th_class\">ไม่มีข้อมูล</div></th>"+ 
							"</tr>"+
						"</thead>"+
						"<tbody>";
						$("#arrKpiresId").val("");
						$("#arrKpiId").val("");
						   }
						   
						   str=str+
									"</tbody> "+
									"</table> "+
									"<div style=\"text-align: center;\" ><span ><button class=\"btn btn-primary start\" type=\"button\" onclick=\"savedata()\" > บันทึก </button> </span> </div>";	   
							$("#search_section").html(str);

						}
					});
			}
		
		}
		else{
		//assign kpi
		if($("#lastEvt").val()=="save"){
			//alert("load");
			loaddata("search");
		}
		var arrKpiresId = $("#arrKpiresId").val();
		var arrKpiId = $("#arrKpiId").val();
		
		var year = $("#yearElement").val();
		var periodNo = $("#periodElement").val();
		var orgId = $("#orgElement").val();
		var queryPeriod = "select period_id from "+SCHEMA_G+".period where period_no = '"+periodNo+"' and year = '"+year+"' ";
		//alert(queryPeriod);
			if($("#statusPeriod").val()=="insert_all"){
				KPIAjax.searchObject(queryPeriod,{
				callback:function(data){
				var query2 = "select kpi.kpi_name,uom.uom_name,coalesce(cast(kpires.kpi_weight as unsigned), '') as kpi_weight,"+
				" coalesce(kpires.target_data, '') as target_data,coalesce(kpires.kpi_result_id, '') as kpi_result_id,"+
				" coalesce(kpires.kpi_id, kpi.kpi_id) AS kpi_id"+
				" from rtn_kpi.kpi kpi"+
				" left join rtn_kpi.kpi_result kpires on (kpires.kpi_id = kpi.kpi_id and kpires.period_id ='"+data+"' and kpires.organization_id = '"+orgId+"')"+
				" left join rtn_kpi.period period on (kpires.period_id = period.period_id and kpires.period_id ='"+data+"')"+
				" left join rtn_kpi.organization org on (kpires.organization_id = org.organization_id )"+
				" inner join rtn_kpi.uom uom on (kpi.uom_id = uom.uom_id)"+
				" where kpi.organization_id = '"+orgId+"'";
				KPIAjax.searchObject(query2,{
				callback:function(data){
				//alert(data);
					var str="<div style=\"text-align: center;\" > <span><button class=\"btn btn-success\"  type=\"button\" onclick=\"loaddata('assignkpi')\" > มอบหมายตัวชี้วัด </button> </span> </div> "+
							"	  <table id=\"showData\" class=\"table table-bordered \" border=\"1\" style=\"font-size: 12px;margin-top:10px;\"> "+
							"	<thead> 	"+
							"  		<tr class=\"altheader\"> "+
							" 			<th style=\" display:none;\" ></th>"+
							" 			<th style=\" display:none;\" ></th>"+
							" 			<th width=\"15%\"><div class=\"th_class\">รอบประเมินผล</div></th>"+
							" 			<th width=\"45%\"><div class=\"th_class\">ชื่อตัวชี้วัด</div></th>"+
							"   		<th width=\"12%\"><div class=\"th_class\">หน่วยวัด</div></th>"+ 
							"   		<th width=\"12%\"><div class=\"th_class\">ค่าถ่วงน้ำหนัก</div></th>"+ 
							"   		<th width=\"12%\"><div class=\"th_class\">เป้าหมาย</div></th>"+
							"   		<th width=\"4%\"><div class=\"th_class\">ลบ</div></th>"+
							" 		</tr>"+
							"	</thead>"+
							"	<tbody class=\"showDataTbody\">   "; 
							
					   if(data!=null && data.length>0){
							for(var i=0;i<data.length;i++){
							countRow=i;
							//style=\" display:none;\" 
							if(i%2==0){
								   str=str+ "  	<tr style=\"cursor: pointer;\"  id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+");updateRow("+i+")\"  >"+
									"  		<td id=\"kpiresid"+i+"\" style=\" display:none;\" > "+data[i][4]+" </td>"+
									"  		<td id=\"kpiid"+i+"\" style=\" display:none;\" > "+data[i][5]+" </td>"+
									"  		<td style=\"text-align: left;\"> ทุกรอบประเมินผล </td>"+
									"  		<td style=\"text-align: left;\"> "+data[i][0]+" </td>"+
									"    	<td style=\"text-align: left;\">"+data[i][1]+"</td>  "+
									"    	<td style=\"text-align: right;\"><input type=\"textarea\"  id=\"weightdata"+i+"\" style=\"width: 50px\" value =\""+data[i][2]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
									"    	<td style=\"text-align: right;\"> <input type=\"textarea\"  id=\"targetdata"+i+"\" style=\"width: 50px\" value =\""+data[i][3]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+						
									"    	<td style=\"text-align: center;\">"+
									"    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
									"    	</td> "+
									"  	</tr>  ";
								}
								else{
									str=str+ "<tr class=\"alt\" style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+");updateRow("+i+")\" >"+
									"  		<td id=\"kpiresid"+i+"\" style=\" display:none;\" > "+data[i][4]+" </td>"+
									"  		<td id=\"kpiid"+i+"\" style=\" display:none;\" > "+data[i][5]+" </td>"+
									"  		<td style=\"text-align: left;\"> ทุกรอบประเมินผล </td>"+
									"  		<td style=\"text-align: left;\"> "+data[i][0]+" </td>"+
									"    	<td style=\"text-align: left;\">"+data[i][1]+"</td>  "+
									"    	<td style=\"text-align: right;\"><input type=\"textarea\" id=\"weightdata"+i+"\" style=\"width: 50px\" value =\""+data[i][2]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
									"    	<td style=\"text-align: right;\"> <input type=\"textarea\" id=\"targetdata"+i+"\" style=\"width: 50px\" value =\""+data[i][3]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
									"    	<td style=\"text-align: center;\">"+
									"    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
									"    	</td> "+
									"  	</tr>  ";
								}
						   }
						   $("#countRow").val(countRow);
					   }else{
						  var str="<div style=\"text-align: center;\"> <a class=\"btn btn-success\" onclick=\"loaddata('assignkpi')\">&nbsp;<span style=\"font-weight: normal;\">มอบหมายตัวชี้วัด</span></a></div>"+
						"<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px;margin-top:10px\">"+
						"<thead>"+
						"<tr> "+
						"<th colspan=\"3\" width=\"100%\"><div class=\"th_class\">ไม่มีข้อมูล</div></th>"+ 
					"</tr>"+
				"</thead>"+
				"<tbody>";
				$("#arrKpiresId").val("");
				$("#arrKpiId").val("");
				   }
				   str=str+
							"</tbody> "+
							"</table> "+
							"<div style=\"text-align: center;\" > <span><button class=\"btn btn-primary start\" type=\"button\" onclick=\"savedata()\" > บันทึก </button> </span> </div>"+
							"<hr>";
							
					$("#search_section").html(str);
				}
				});
				}
			});
			}
			else{
					KPIAjax.searchObject(queryPeriod,{
					callback:function(data){
						var query2 = "select kpi.kpi_name,uom.uom_name,coalesce(cast(kpires.kpi_weight as unsigned), '') as kpi_weight,"+
						" coalesce(kpires.target_data, '') as target_data,coalesce(kpires.kpi_result_id, '') as kpi_result_id,"+
						" coalesce(kpires.kpi_id, kpi.kpi_id) AS kpi_id"+
						" from rtn_kpi.kpi kpi"+
						" left join rtn_kpi.kpi_result kpires on (kpires.kpi_id = kpi.kpi_id and kpires.period_id ='"+data+"' and kpires.organization_id = '"+orgId+"')"+
						" left join rtn_kpi.period period on (kpires.period_id = period.period_id and kpires.period_id ='"+data+"')"+
						" left join rtn_kpi.organization org on (kpires.organization_id = org.organization_id )"+
						" inner join rtn_kpi.uom uom on (kpi.uom_id = uom.uom_id)"+
						" where kpi.organization_id = '"+orgId+"'";
						//alert(query2);
						KPIAjax.searchObject(query2,{
						callback:function(data){
							var str="<div style=\"text-align: center;\" > <span><button class=\"btn btn-success\"  type=\"button\" onclick=\"loaddata('assignkpi')\" > มอบหมายตัวชี้วัด </button> </span> </div> "+
									"	  <table id=\"showData\" class=\"table table-bordered \" border=\"1\" style=\"font-size: 12px;margin-top:10px;\"> "+
									"	<thead> 	"+
									"  		<tr class=\"altheader\"> "+
									" 			<th style=\" display:none;\" ></th>"+
									" 			<th style=\" display:none;\" ></th>"+
									" 			<th width=\"35%\"><div class=\"th_class\">ชื่อตัวชี้วัด</div></th>"+
									"   		<th width=\"15%\"><div class=\"th_class\">หน่วยวัด</div></th>"+ 
									"   		<th width=\"15%\"><div class=\"th_class\">ค่าถ่วงน้ำหนัก</div></th>"+ 
									"   		<th width=\"15%\"><div class=\"th_class\">เป้าหมาย</div></th>"+
									"   		<th width=\"7%\"><div class=\"th_class\">ลบ</div></th>"+
									" 		</tr>"+
									"	</thead>"+
									"	<tbody class=\"showDataTbody\">   "; 
									
							   if(data!=null && data.length>0){
									for(var i=0;i<data.length;i++){
									countRow=i;
									//style=\" display:none;\" 
									if(i%2==0){
										   str=str+ "  	<tr style=\"cursor: pointer;\"  id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+");updateRow("+i+")\"  >"+
											"  		<td id=\"kpiresid"+i+"\" style=\" display:none;\" > "+data[i][4]+" </td>"+
											"  		<td id=\"kpiid"+i+"\" style=\" display:none;\" > "+data[i][5]+" </td>"+
											"  		<td style=\"text-align: left;\"> "+data[i][0]+" </td>"+
											"    	<td style=\"text-align: left;\">"+data[i][1]+"</td>  "+
											"    	<td style=\"text-align: right;\"><input type=\"textarea\"  id=\"weightdata"+i+"\" style=\"width: 50px\" value =\""+data[i][2]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
											"    	<td style=\"text-align: right;\"> <input type=\"textarea\"  id=\"targetdata"+i+"\" style=\"width: 50px\" value =\""+data[i][3]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+						
											"    	<td style=\"text-align: center;\">"+
											"    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
											"    	</td> "+
											"  	</tr>  ";
										}
										else{
											str=str+ "<tr class=\"alt\" style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+");updateRow("+i+")\" >"+
											"  		<td id=\"kpiresid"+i+"\" style=\" display:none;\" > "+data[i][4]+" </td>"+
											"  		<td id=\"kpiid"+i+"\" style=\" display:none;\" > "+data[i][5]+" </td>"+
											"  		<td style=\"text-align: left;\"> "+data[i][0]+" </td>"+
											"    	<td style=\"text-align: left;\">"+data[i][1]+"</td>  "+
											"    	<td style=\"text-align: right;\"><input type=\"textarea\" id=\"weightdata"+i+"\" style=\"width: 50px\" value =\""+data[i][2]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
											"    	<td style=\"text-align: right;\"> <input type=\"textarea\" id=\"targetdata"+i+"\" style=\"width: 50px\" value =\""+data[i][3]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
											"    	<td style=\"text-align: center;\">"+
											"    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
											"    	</td> "+
											"  	</tr>  ";
										}
								   }
								   $("#countRow").val(countRow);
							   }else{
								  var str="<div style=\"text-align: center;\"> <a class=\"btn btn-success\" onclick=\"loaddata('assignkpi')\">&nbsp;<span style=\"font-weight: normal;\">มอบหมายตัวชี้วัด</span></a></div>"+
								"<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px;margin-top:10px\">"+
								"<thead>"+
								"<tr> "+
								"<th colspan=\"3\" width=\"100%\"><div class=\"th_class\">ไม่มีข้อมูล</div></th>"+ 
							"</tr>"+
						"</thead>"+
						"<tbody>";
						$("#arrKpiresId").val("");
						$("#arrKpiId").val("");
						   }
						   str=str+
									"</tbody> "+
									"</table> "+
									"<div style=\"text-align: center;\" > <span><button class=\"btn btn-primary start\" type=\"button\" onclick=\"savedata()\" > บันทึก </button> </span> </div>"+
									"<hr>";
									
							$("#search_section").html(str);
						}
						});
					}
					});
			}
		}
	}

function updateRow(row){
	$("#row").val(row);
}

function savedata(){
	var queryInsertUpdate = "";
	var countRow =$("#countRow").val();
	var arrKpiId = $("#arrKpiId").val();
	var orgId = $("#orgElement").val();
	var yearName = $("#yearElement").val();
	var periodNo = $("#periodElement").val();
	var arrKpiresId = $("#arrKpiresId").val();
	var arStringResId = arrKpiresId.split(",");
	var periodId = "";
	var updateIsActive = false;
	$("#lastEvt").val("save");

	
	if($("#statusPeriod").val()=="not_all"){
	var searchquery = "select period_id from "+SCHEMA_G+".period where year='"+yearName+"' and period_no='"+periodNo+"'";
			KPIAjax.searchObject(searchquery,{
			callback:function(data){
				periodId = data[0];
				if(arrKpiresId.trim()==""){
					for(i=0;i<=countRow;i++){
						queryInsertUpdate ="insert into "+SCHEMA_G+
						".kpi_result (organization_id,period_id,kpi_id,kpi_order,kpi_weight,target_data,target_score,actual_data,actual_score,created_dt,updated_dt,created_by,updated_by)"+
						"values ('"+orgId+"','"+periodId+"','"+($("#kpiid"+i).text()).trim()+"',0,"+$("#weightdata"+i).val()+","+
						$("#targetdata"+i).val()+",0,0,0,now(),now(),'"+username+"','"+username+"')";
						//alert(queryInsertUpdate);
						execQuery(queryInsertUpdate);
						}
				}
				else{
				for(i=0;i<=countRow;i++){
					for(j=0;j<arStringResId.length;j++){
						if(arStringResId[j].trim()==($("#kpiresid"+i).text()).trim()){
						queryInsertUpdate = "update "+SCHEMA_G+".kpi_result set kpi_weight='"+$("#weightdata"+i).val()+"',target_data='"+
						$("#targetdata"+i).val()+"',updated_by='"+username+"' where kpi_result_id='"+($("#kpiresid"+i).text()).trim()+
						"' and period_id ='"+periodId+"'";
						updateIsActive = true;
						execQuery(queryInsertUpdate);
						}
					}
					if(!updateIsActive){
						queryInsertUpdate ="insert into "+SCHEMA_G+
						".kpi_result (organization_id,period_id,kpi_id,kpi_order,kpi_weight,target_data,target_score,actual_data,actual_score,created_dt,updated_dt,created_by,updated_by)"+
						"values ('"+orgId+"','"+periodId+"','"+($("#kpiid"+i).text()).trim()+"',0,"+$("#weightdata"+i).val()+","+
						$("#targetdata"+i).val()+",0,0,0,now(),now(),'"+username+"','"+username+"')";
						execQuery(queryInsertUpdate);
					}
					
					updateIsActive = false;
					}
				}
				if($("#saveStatus").val()=="true"){
					alert("บันทึกข้อมูลเรียบร้อย");
				}
				
			}
		});
		}
		else{
			//insert all period in year
			/*var queryInsertUpdate="";
			var strPeriod = "select period_id from "+SCHEMA_G+".period where year="+yearName;
			//alert(strPeriod);
			KPIAjax.searchObject(strPeriod,{
			callback:function(data){
			
				if(data!=null && data.length>0){
				
     				    for(var i=0;i<data.length;i++){
								var period_id = data[i];
								alert(period_id);
								var strKpi_result = "select kpi_id from "+SCHEMA_G+".kpi_result where period_id ="+period_id+" and organization_id = "+orgId;
								//alert(strKpi_result);
								KPIAjax.searchObject(strKpi_result,{
								callback:function(data2){
								for(var j=0;j<countRow;j++){
										if(data2==null){
											queryInsertUpdate ="insert into "+SCHEMA_G+
											".kpi_result (organization_id,period_id,kpi_id,kpi_order,kpi_weight,target_data,target_score,actual_data,actual_score,created_dt,updated_dt,created_by,updated_by)"+
											"values ('"+orgId+"','"+period_id+"','"+($("#kpiid"+j).text()).trim()+"',0,"+$("#weightdata"+j).val()+","+
											$("#targetdata"+j).val()+",0,0,0,now(),now(),'"+username+"','"+username+"')";
										}
										else{
											queryInsertUpdate = "update "+SCHEMA_G+".kpi_result set kpi_weight='"+$("#weightdata"+j).val()+"',target_data='"+
											$("#targetdata"+j).val()+"',updated_by='"+username+"' where kpi_result_id='"+data2[0]+
											"' and period_id ='"+period_id+"'";
										}
										execQuery(queryInsertUpdate);
										}
								}
								});
								
						}
				}
			}
			});
			*/
			var j=0;
			for(;j<=countRow;){
				
				
				//setTimeout(function(){
				var callProc = "CALL proc_add_kpi_all_period("+yearName+","+orgId+","+($("#kpiid"+j).text()).trim()+","+$("#weightdata"+j).val()+","+$("#targetdata"+j).val()+",'"+username+"','"+username+"')";
				//alert(callProc)
				execQuery(callProc);
				j++;
				//},1000);

			}
			
			
		}
	}
	
	
	function execQuery(query){
	//alert(query);
		KPIAjax.executeQuery(query,{
			callback:function(data){
				$("#saveStatus").val("true");
				loaddata('search');
				
			}
		}); 
	} 
	
function doAction(ids,tableID){
	if(ids.length>0){
		var whereStr="";
		for(var i=0;i<ids.length;i++){
			var id_array=ids[i].split("|");
			whereStr=whereStr+"( year="+id_array[0]+" and period_no="+id_array[1]+" and employee_code='"+id_array[2]+"' and kpi_code='"+id_array[3]+"' ) ";
			if((i+1)!=ids.length)
				whereStr=whereStr+" or ";
		}
	   var query="delete  FROM "+SCHEMA_G+".kpi_result where "+whereStr;
		KPIAjax.executeQuery(query,{
			callback:function(data){
				if(data==0)
					alert("Can not delete because this record is in use.");
				if(tableID=='dataTable2'){
					showPage('2');
				}else if(tableID=='dataTable3'){
					showPage('3');
				}
				
			}
		}); 
	}
}  

	function doDelete(kpiResId){
	var countRow =$("#countRow").val();
	var arrKpiId = $("#arrKpiId").val();
	var orgId = $("#orgElement").val();
	var yearName = $("#yearElement").val();
	if($("#statusPeriod").val()=="insert_all"){
		var rowActive = $("#row").val();
				var callProc = "CALL proc_delete_kpi_all_period("+yearName+","+orgId+","+($("#kpiid"+rowActive).text()).trim()+","+$("#weightdata"+rowActive).val()+","+$("#targetdata"+rowActive).val()+")";
				//alert(callProc);
				execQuery(callProc);
				loaddata('search'); 
	}
	
	else{
			queryDelBaseline="delete  FROM "+SCHEMA_G+".kpi_result_attached_file kpi_result_id='"+kpiResId+"'";
			KPIAjax.executeQuery(queryDelBaseline,{
			callback:function(data){
			
				var query="delete  FROM "+SCHEMA_G+".kpi_result where kpi_result_id ="+kpiResId;
				KPIAjax.executeQuery(query,{
					callback:function(data){
						if(data==0){
							alert("ไม่สามารถลบได้เนื่องจากมีการใช้งานอยู่");
						}else
							loaddata('search'); 
					}
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
				doDelete(id);
			},
			"ไม่ใช่": function() {
				$( this ).dialog( "close" );
				return false;
			}
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
					 height: 260,
					 width:727,
					modal: true,
					 hide: 'fold',
				     show: 'blind' 
				});
			}
		});
	}
}
	
	function checkNumber(txtVal){
		// alert(txtVal) 
		 if(!(intRegex.test(txtVal) || floatRegex.test(txtVal))) {
			  //  alert('Please fill Number !!!');
			  return true;
			}
		return false;
	} 
    function visited(tr) {
		$("tbody.showDataTbody tr").removeAttr("style");
		//$(tr).removeClass("alt");
		
		tr.style.backgroundColor = "#F5E79E";	
	}
	function handleKey(el){
		var invalidChars = /[^0-9|\.]/gi;
		if(invalidChars.test(el.value)) {
		el.value = el.value.replace(invalidChars,"");
		}	
	}
	function getFile(){
        document.getElementById("upfile").click();
    }
	
	//disable checkbox
	$( "input[type='checkbox']" ).prop({
		disabled: true
	});
	</script>
	 <script id="template-upload" type="text/x-tmpl">
            {% for (var i=0, file; file=o.files[i]; i++) { %}
        <tr class="template-upload fade">
            <td class="preview"><span class="fade">  </span></td>
            <td class="name"><span>{%=file.name %}<input type="hidden" name="fileName" value="{%=file.name%}"></span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            {% if (file.error) { %}	
            <td class="error" colspan="2"><span class="label label-important">ผิดพลาด</span> {%=file.error%}</td>
            {% } else if (o.files.valid && !i) { %}
			<td>
                <div style="width:150px;" class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>
            </td>
            <td class="start">{% if (!o.options.autoUpload) { %}
                <button class="btn btn-primary" style=" display:none;">
                    <i class="icon-upload icon-white"></i>
                    <span>บันทึก</span>
                </button>
                {% } %}</td>
            {% } else { %}
            <td colspan="2"></td>
            {% } %}
            <td class="cancel">{% if (!i) { %}
                <button class="btn btn-warning">
                    <i class="icon-ban-circle icon-white"></i>
                    <span>ยกเลิก</span>
                </button>
                {% } %}</td>
        </tr>
        {% } %}
    </script> 
	<script id="template-download" type="text/x-tmpl">
    </script>
</body>
</html>  
