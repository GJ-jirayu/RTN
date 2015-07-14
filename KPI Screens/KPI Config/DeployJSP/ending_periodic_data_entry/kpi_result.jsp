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
   <script  src="<%=request.getContextPath() %>/resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/smoothness/jquery-ui-1.9.2.custom.min.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="<%=request.getContextPath() %>/resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/>    
 
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
width: 100px;
text-align:right;
}
.input_text{
width: 350px;
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

<%
	Authentication a = SecurityContextHolder.getContext().getAuthentication();
	User currentUser = (User)a.getPrincipal();
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
	<script src="<%=request.getContextPath()%>/resources/js/smoothness/jquery-ui-1.9.2.custom.min.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/ckeditor/ckeditor.js" type="text/javascript"></script>
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
		<label class="fomtsizeAndColor" style="margin-top:20px">ระบบวัดผลการดำเนินงานกองทัพเรือ - หน้าจอบันทึกผลการดำเนินงาน</label>
	</div>
     	 <div id="_content" style="margin-left:3px;padding-top: 3px;width: 1100px">
			<input type="hidden" id="countRow"/>
			<input type="hidden" id="arrKpiId"/>
			<input type="hidden" id="arrKpiresId"/>
      		<table style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px;width: 1100px;"><tr><td>
 
  <div style="padding-left:20px;padding-top: 5px">
    	<span style="padding-left:10px;">
		<div style = "width:100px; float:left; padding-left:10px; padding-top:10px;">
			ปีงบประมาณ:
		</div>
		<span id="yearSelection">
		</span>
		
    </span> 
   
    </div>
    </td></tr>
<tr>	
<td>
       <div style="padding-left:20px;padding-top: 5px">
     
    <span  style="padding-left:10px;"> 
		<div style = "width:100px; float:left; padding-left:10px; padding-top:10px;">
			รอบประเมินผล:
		</div> 
		<span id="periodSelection">
		</span>
    </span>
   
    </div>
    </td></tr>

    <tr>
	<td> 
     <span style="padding-left:10px;">
        <div style = "width:100px; float:left; padding-left:30px; padding-top:10px;">
			หน่วยงาน:
		</div>
		<span id="orgSelection">
		</span> 
    </span>
	&nbsp; &nbsp; &nbsp;
     <span>  
     <a class="btn btn-primary" style="font-size:12px;margin-top: -10px" onclick="loadData()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">ค้นหา</span></a>
    </span> 
	
  	<div style="padding-left:30px;">
	<label style="margin-top:5px;width:500px;font-size:12px;">การใช้งาน </label>
		<label style="font-size:12px;">1.การค้นหาข้อมูล กรอกข้อมูล หน่วยงาน ปีงบประมาณ รอบประเมินผล แล้วคลิกปุ่ม "ค้นหา" </label>
		<label style="font-size:12px;">2.การแก้ไขผลลัพธ์ตัวชี้วัด หลังจากทำการมอบหมายตัวชี้วัด ให้แก้ไข ผลการดำเนินงาน (ตัวเลข) แล้วคลิกปุ่ม "บันทึก"</label>
	
	</div>
	
	</td>
	</tr>
	</table>
	
	</div>
<div id="dialog-Message-alert" title="Message" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<span id="_message_show"></span>
</div>


 
<div >
<table style="width: 1100px;">
	<tr>
		<td>

  <div id="dialog-Message" style="display: block;padding-left: 3px;width: 1099px;" >
  <input type="hidden" id="kpi_res_id">
  <input type="hidden" id="kpi_name">
  <form style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px;height:220px" action="" method="post" >
	 <div style="padding: 10px;overflow: auto;height: 200px;width overflow-x:hidden;width: 900px;" id="search_section">

    </div>

  </form>
	
	</td>
	</tr>
	</table>
      	</div>
		<div id="divFileupload" style="display:none">
		<div id="fileNameDiv" class="fileNameClass"></div>
		<form style="margin-top:10px" id="fileupload" action="/pentaho/uploadFileResult" method="POST" enctype="multipart/form-data">
                <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                <div class="row fileupload-buttonbar">
                    <div class="span7">
                        <!-- The fileinput-button span is used to style the file input field as button -->
                        <span class="btn btn-success fileinput-button">
                        <div id="btnUpfile" style="height: 20px; width: 70px;  cursor:pointer;" onclick="getFile()"> แนบไฟล์</div>
						<div style='height: 0px;width:0px; overflow:hidden;'><input id="upfile" type="file" multiple /></div>
							<!--style="position:absolute;visibility:hidden;"-->
                        </span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button id="btnFileupload" type="button" class="btn btn-warning" onclick="addFile()" style="display:none" >
                            <span> อัพโหลดไฟล์</span>
                        </button>
                        <button id="btnHideFileupload" type="button" class="start" style="display:none">
                            <span> อัพโหลดไฟล์</span>
                        </button>
                    </div>
                    <!-- The global progress information -->
                </div>
                <!-- The loading indicator is shown during file processing -->
                <div class="fileupload-loading"></div>
                <br>
                <!-- The table listing the files available for upload/download -->
                <table role="presentation" class="table table-striped"><tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery"></tbody></table>
            </form>
			
	</div>
	<div id="fileNameDiv" class="fileNameClass"></div>
<div id="dialog-confirmDelete" title="ลบไฟล์" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<div class="imageicon" style="background-image:url('<%=request.getContextPath() %>/resources/img/shock.jpg');">
	</div>
	<label style="padding-top:15px;padding-left:55px;">
		ต้องการลบหรือไม่?
	</label>
</div>

		
 <%@ include file="/WEB-INF/jsp/schema.jsp" %>  
     <script type="text/javascript">
var _path='<%=request.getContextPath()%>'+'/';
var username = '<%=request.getRemoteUser()%>';
var getRole = "<%=getRole%>";
var indexAdmin = getRole.indexOf('Administrator');
var indexOrg = getRole.indexOf('สปช.ทร.');
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG;   
var intRegex = /^\d+$/;
var floatRegex = /^((\d+(\.\d *)?)|((\d*\.)?\d+)|(-\d+(\.\d *)?)|((-\d*\.)?\d+))$/;

$(document).ready(function() {

	listYear();
	listOrg();
	$( "#employeeSelection" ).autocomplete({
		  source: function( request, response ) {
			  var position_value=$("#positionElement").val();
				var department_value=$("#departmentElement").val();
				var where_query="";
				var haveWhere=false;
				if(department_value!='all'){
					if(haveWhere)
						where_query=where_query+" and department_code ='"+department_value+"'";
					else
						where_query=where_query+" where department_code ='"+department_value+"'";
					haveWhere=true;
				}
				if(position_value!='all'){
					if(haveWhere)
						where_query=where_query+" and position_code ='"+position_value+"'";
					else
						where_query=where_query+" where position_code ='"+position_value+"'";
					haveWhere=true;
				}
			  var query="select * from (select distinct employee_code, concat(employee_name,' ',employee_surname) " +
				" as emp_name ,department_code,position_code from "+SCHEMA_G+".employee  "+where_query+" order by emp_name "+
				") as xx where emp_name like '%"+request.term+"%'";
			  
				KPIAjax.listMaster(query,{
					callback:function(data){
						 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label: item.name,
					        	  value: item.id 
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
			  $("#employeeElement").val(ui.item.value);
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

	function listOrg(){
	//var query="select organization_id,organization_name  from "+SCHEMA_G+".organization ";
	var query="select organization_id,organization_short_name  from "+SCHEMA_G+".organization where (organization_short_name IN (<%=getRole%>) OR 'Administrator'IN (<%=getRole%>) OR 'สปช.ทร.' IN (<%=getRole%>))  and organization_status ='active'; ";
	KPIAjax.listMaster(query,{
		callback:function(data){
			 var str="<select id=\"orgElement\" style=\"width:100px\">";
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
		var year=$("#yearElement").val();
		var period_query="";
			if(year!='all'){
				period_query=" where year=" +year;
			}
		 
		var query="select period_no,period_desc  from "+SCHEMA_G+".period "+period_query;
		KPIAjax.listMaster(query,{
			callback:function(data){
			var str="<select id=\"periodElement\" style=\"width: 300px\">";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
			} 
			str=str+"</select>";
			$("#periodSelection").html(str); 
		}
   });
}

	function loadData(){
		var year = $("#yearElement").val();
		var period = $("#periodElement").val();
		var organizationId = $("#orgElement").val();
		$("#fileupload").css('display', '');
		var arrKpiresId = new Array();
		var arrKpiId = new Array();
		var countRow = "";
		
		var query="SELECT kpi.kpi_name,kpires.kpi_weight,kpires.target_data,kpires.actual_data,kpires.kpi_result_id from "+SCHEMA_G+".kpi_result kpires , "+
		SCHEMA_G+".kpi kpi,"+SCHEMA_G+".period period,"+SCHEMA_G+".organization org where kpires.kpi_id = kpi.kpi_id and kpires.period_id = period.period_id and kpires.organization_id=org.organization_id";
		//var query="SELECT * FROM "+SCHEMA_G+".kpi_result";
		var whereQuery=" and period.year = '"+year+"' and period.period_no ='"+period+"' and org.organization_id='"+organizationId+"'";
		query+=whereQuery;
     	KPIAjax.searchObject(query,{
     		callback:function(data){
     			var str="	  <table id=\"showData\" class=\"table table-bordered \" border=\"1\" style=\"font-size: 12px;width:1570px\"> "+
     			        "	<thead> 	"+
     			        "  		<tr class=\"altheader\" > "+
						" 			<th style=\" display:none;\" ></th>"+
     			        " 			<th  width=\"45%;\"><div class=\"th_class\">ชื่อตัวชี้วัด</div></th>"+
     			        "   		<th  width=\"15%\"><div class=\"th_class\">ถ่วงน้ำหนัก</div></th>"+ 
     			        "   		<th  width=\"15%\"><div class=\"th_class\">เป้าหมาย</div></th>"+ 
						"   		<th width=\"15%\"><div class=\"th_class\">ผลการดำเนินงาน</div></th>"+
						"   		<th width=\"10%\"><div class=\"th_class\">อัพโหลดไฟล์</div></th>"+
     			        " 		</tr>"+
     			        "	</thead>"+
     			        "	<tbody class=\"showDataTbody\">   "; 
     			  		
     			   if(data!=null && data.length>0){
     				   for(var i=0;i<data.length;i++){
					   arrKpiresId.push(data[i][4]);
					   countRow=i;
							if(i%2==0){
								str=str+ " <tr style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+",'"+data[i][4]+"','"+data[i][0]+"')\" >"+
								"  		<td id=\"kpiresid"+i+"\" style=\" display:none;\"> "+data[i][4]+" </td>"+
								"  		<td  style=\"text-align: left;\"> "+data[i][0]+" </td>"+
								"    	<td style=\"text-align: right;\">"+data[i][1]+"</td>  "+
								"    	<td style=\"text-align: right;\">"+data[i][2]+"</td>  "+
								"    	<td style=\"text-align: right;\"> <input type=\"textarea\" id=\"actualdata"+i+"\" style=\"width: 50px\" value =\""+data[i][3]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
								"    	<td style=\"text-align: right;\"> <input type=\"button\" id=\"btnUpfilename\" onclick=\"showFormUpfile()\" value=\"อัพโหลดไฟล์\" > </td>  "+
								"  	</tr>  ";
							}
							else{
								str=str+ "  	<tr class=\"alt\" style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+",'"+data[i][4]+"','"+data[i][0]+"')\" >"+
								"  		<td id=\"kpiresid"+i+"\" style=\" display:none;\"> "+data[i][4]+" </td>"+
								"  		<td  style=\"text-align: left;\"> "+data[i][0]+" </td>"+
								"    	<td style=\"text-align: right;\">"+data[i][1]+"</td>  "+
								"    	<td style=\"text-align: right;\">"+data[i][2]+"</td>  "+
								"    	<td style=\"text-align: right;\"> <input type=\"textarea\" id=\"actualdata"+i+"\" style=\"width: 50px\" value =\""+data[i][3]+"\" onkeypress=\"handleKey(this)\" onkeyup=\"handleKey(this)\" /></td>  "+
								"    	<td style=\"text-align: right;\"> <input type=\"button\" id=\"btnUpfilename\" onclick=\"showFormUpfile()\" value=\"อัพโหลดไฟล์\" > </td>  "+
								"  	</tr>  ";
							}
					   }
					   	$("#arrKpiresId").val(arrKpiresId);
					    $("#countRow").val(countRow);
     			   }else{
				   alert("ไม่มีข้อมูล");
     				  var str="<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\">"+
   		    		"<thead>"+
   		    		"<tr> "+
   	      			"<th colspan=\"3\" width=\"100%\"><div class=\"th_class\">ไม่มีข้อมูล</div></th>"+ 
   	      		"</tr>"+
				"</thead>"+
				"<tbody>"; 
   			   }
			   
			   str=str+
     			           "</tbody> "+
     					   "</table> ";
				if(data!=null && data.length>0){
						   str=str+"<div style=\"text-align: center;\" ><span ><button class=\"btn btn-primary\" type=\"button\" onclick=\"dataRecord()\" > บันทึก </button> </span> </div>";
						 }
     			$("#search_section").html(str);
				$("#fileNameDiv").empty();
     		}
     	});
	}
	
	function showFormUpfile(){
	
		var yearName = $("#yearElement").val();
		var periodNo = $("#periodElement").val();
		var dateTime_now = new Date();
		var dateTime_begin;
		var dateTime_end;
		var searchquery = "select start_date,end_date from "+SCHEMA_G+".period where year='"+yearName+"' and period_no='"+periodNo+"'";
			KPIAjax.searchObject(searchquery,{
			callback:function(data){
					for(var i=0;i<data.length;i++){
						dateTime_begin = data[i][0];
						dateTime_end = data[i][1];
					}
					if(dateTime_now<dateTime_begin){
					
						alert("ไม่สามารถบันทึกได้ รอบประเมินผลที่เลือกไม่อยู่ในช่วงให้บันทึกข้อมูล");
				
					}
					else if (dateTime_now>dateTime_end){
						alert("ไม่สามารถบันทึกได้ รอบประเมินผลที่เลือกไม่อยู่ในช่วงให้บันทึกข้อมูล");
					}
					else{
						$( "#divFileupload" ).attr("title", "อัพโหลดไฟล์").dialog({
						position: 'top',
						height: 400,
						width:697,
						modal: true,
						hide: 'fold',
						show: 'blind' 
			});
					}
				}
			});

	}
	
	function dataRecord(){
		var yearName = $("#yearElement").val();
		var periodNo = $("#periodElement").val();
		var dateTime_now = new Date();
		var dateTime_begin;
		var dateTime_end;
		var searchquery = "select start_date,end_date from "+SCHEMA_G+".period where year='"+yearName+"' and period_no='"+periodNo+"'";
			KPIAjax.searchObject(searchquery,{
			callback:function(data){
					for(var i=0;i<data.length;i++){
						dateTime_begin = data[i][0];
						dateTime_end = data[i][1];
					}
					if(dateTime_now<dateTime_begin){
					
						alert("ไม่สามารถบันทึกได้ รอบประเมินผลที่เลือกไม่อยู่ในช่วงให้บันทึกข้อมูล");
				
					}
					else if (dateTime_now>dateTime_end){
						alert("ไม่สามารถบันทึกได้ รอบประเมินผลที่เลือกไม่อยู่ในช่วงให้บันทึกข้อมูล");
					}
					else{
						savedata();
					}
				}
			});
	}
	
	function savedata() {
		var queryInsertUpdate = "";
		var countRow =$("#countRow").val();
		var orgId = $("#orgElement").val();
		var yearName = $("#yearElement").val();
		var periodNo = $("#periodElement").val();
		var arrKpiresId = $("#arrKpiresId").val();
		var arStringResId = arrKpiresId.split(",");
		var periodId = "";
			var searchquery = "select period_id from "+SCHEMA_G+".period where year='"+yearName+"' and period_no='"+periodNo+"'";
			KPIAjax.searchObject(searchquery,{
			callback:function(data){
				periodId = data[0];

				for(i=0;i<=countRow;i++){
				
					for(j=0;j<arStringResId.length;j++){
						if(arStringResId[j].trim()==($("#kpiresid"+i).text()).trim()){
						//alert(arStringResId[j].trim()+"="+($("#kpiresid"+i).text()).trim());
						queryInsertUpdate = "update "+SCHEMA_G+".kpi_result set actual_data='"+$("#actualdata"+i).val()+"'"+
						" where kpi_result_id='"+($("#kpiresid"+i).text()).trim()+"' and period_id ='"+periodId+"'";
						//alert(queryInsertUpdate);
						execQuery(queryInsertUpdate);
						}
					}
				}
				alert("บันทึกข้อมูลเรียบร้อย");
			}
		});
	}
	//Upload file
	function addFile(paramFileName){
		//alert($("#kpi_res_id").val());
		var kpi_res_id = $("#kpi_res_id").val();
		var elFilename = document.getElementsByName("fileName");
		var elFileNum = document.getElementsByName("fileNum");
		var filename = '';
		var queryUpfile = "";
		var mode=$("#mode").val();
		var statusFile = "";
		var fileNameArray = new Array();
		var query_fileName = "";
						//for(var i=0; i<(elFilename.length); i++) {
							//filename = elFilename[0].value;		
							filename = paramFileName;
							//console.log(filename);
							//console.log("Start Loop");
							//console.log("Be -> "+i+"  File:"+filename);
							query_fileName = "select attached_file_name from "+SCHEMA_G+".kpi_result_attached_file where attached_file_name = '"+filename+"'";
							//alert(query_fileName);
							KPIAjax.searchObject(query_fileName,{
							callback:function(data){
								//alert(query_fileName);
								//console.log("Af -> "+i+"  File:"+filename);
								if(data!=null && data.length>0){
									alert("มีชื่อไฟล์นี้อยู่ในระบบแล้ว กรุณาคลิกปุ่ม \"ยกเลิก\" เพื่อยกเลิกการอัพโหลดไฟล์");
									status += "false,"
								}
								else{

									queryUpfile=" insert "+SCHEMA_G+".kpi_result_attached_file set attached_file_name='"+filename+"',kpi_result_id='"+kpi_res_id+"', created_dt=now(),updated_dt=now(),"+
									"created_by='"+username+"',updated_by='"+username+"'";
									//alert(queryUpfile);
									KPIAjax.executeQuery(queryUpfile,{
									callback:function(data){
									if(data==0){
										alert("อัพโหลดไฟล์ไม่สำเร็จ");
									}
									
									else{										
										checkFile($("#kpi_res_id").val(),$("#kpi_name").val());
										$("#btnUploadfile_"+
											filename.
												replace(".", "\\.").
												replace("-", "\\-").										
												replace("_", "\\_").
												replace(" ", "\\ ").
												replace("(", "\\(").
												replace(")", "\\)").
												replace("+", "\\+").
												replace("@", "\\@").
												replace("#", "\\#").
												replace("$", "\\$").
												replace("&", "\\&")									
										).trigger("click");
										}
									}
								}); 
									
								}
							}
							});
							//console.log("End Loop");
						//}
    }
	
	function execQuery(query){
		KPIAjax.executeQuery(query,{
			callback:function(data){
				if(data==0){
					//alert("ไม่สามารถบันทึกได้");
				}
			}
		}); 
	} 
	
    function visited(tr,kpi_res_id,kpiName) {
		$("#kpi_res_id").val(kpi_res_id);
		$("#kpi_name").val(kpiName);
		$("tbody.showDataTbody tr").removeAttr("style");
		//$(tr).removeClass("alt");
		tr.style.backgroundColor = "#F5E79E";
		checkFile(kpi_res_id,kpiName);
	}
	
	function checkFile(kpi_res_id,kpiName){
		var queryFile = "select attached_file_name from "+SCHEMA_G+".kpi_result_attached_file where kpi_result_id='"+kpi_res_id+"'";
				var str = '';
				$(".fileNameClass").empty();
				str += "<div><h5>ไฟล์ประกอบข้อมูลตัวชี้วัด  <br> "+kpiName+"</h5></div>";
				//alert(queryFile);
					KPIAjax.searchObject(queryFile,{
						callback:function(data){
						if(data!=null && data.length>0){
							for(var i=0;i<data.length;i++){
								str += "<div ><a style=\"float:left;width:400px;\" href=\""+_path+"kpi_result_file_upload/"+data[i]+"\">"+
								data[i]+" </a><a style=\"margin-top:8px\" > <b><u onclick=\"confirmDelFile('"+kpi_res_id+"','"+data[i]+"') \">	ลบ</u></b> </a></div>";
							}
							$(".fileNameClass").empty().html(str);
						}
						else{
							$(".fileNameClass").empty().html(str);
						}
					}
				});
	 }
	
	function confirmDelFile(kpiresId,filename){
		var queryDelfile="delete  FROM "+SCHEMA_G+".kpi_result_attached_file where kpi_result_id='"+kpiresId+"' and attached_file_name = '"+filename+"'";
		//alert(queryDelfile);
		$( "#dialog-confirmDelete" ).dialog({
     		/* height: 140, */
     		modal: true,
     		buttons: {
     			"ใช่": function() { 
     				$( this ).dialog( "close" );
     				doDeletefile(queryDelfile);
     			},
     			"ไม่ใช่": function() {
     				$( this ).dialog( "close" );
     				return false;
     			}
     		}
     	});
	}
	
	function doDeletefile(queryDelFile){
		KPIAjax.executeQuery(queryDelFile,{
			callback:function(data){
				if(data==0){
					alert(ไม่สามารถลบได้);
				}
				checkFile($("#kpi_res_id").val(),$("#kpi_name").val());
			}
		});
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
                <div style="width:50px;" class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="bar" style="width:0%;"></div></div>
            </td>
			
            <td >
				<span class="btn btn-primary fileinput-button">
                    <div id="btnUpfile" style="height: 20px; width: 120px;  cursor:pointer;" onclick="addFile('{%=file.name %}')" >อัพโหลดไฟล์ </div>
                </span>
                </td>
            <td class="start">{% if (!o.options.autoUpload) { %}
				<button id="btnUploadfile_{%=file.name %}" class="btn btn-primary" style="display:none" value="testVal"> <!--style="display:none" -->
                    <i class="icon-upload icon-white"></i>
                    <span>อัพโหลดไฟล์</span>
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
