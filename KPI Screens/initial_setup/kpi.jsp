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
 <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="<%=request.getContextPath()%>/resources/js/html5shiv.js"></script>
    <![endif]--> 
 <!--DWR-->
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/interface/KPIAjax.js"></script>
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/engine.js"></script> 
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/util.js"></script>
	<!-- DWR -->


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
	<script  src="<%=request.getContextPath() %>/resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
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
		<div id="header"  style="padding-top: 3px;padding-left: 50px;width: 1600px;height:80px;background: #01009E;">
		<label class="fomtsizeAndColor" style="margin-top:20px">ระบบวัดผลการดำเนินงานกองทัพเรือ - หน้าจอบันทึกข้อมูลตัวชี้วัด</label>
		</div> 
		
     		<div id="_content"  style="margin-left:3px;padding-top: 3px;width: 1100px">
     		<table style="width: 1100px;">
     			<tr>
     				<td>
   <form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" >
 <div  style="padding-left:20px">
		หน่วยงาน :
	 <span  id="orgSelection">
    </span> 
      <span style="padding-left:10px;">
		รหัสตัวชี้วัด : <input type="text" id="kpiCode" style="width: 100px"/>
    </span> 
     <span style="padding-left:10px;">
		ชื่อตัวชี้วัด : <input type="text" id="kpiName" style="width: 300px"/>
    </span> 
      <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px" onclick="searchKPI()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">ค้นหา</span></a>
    </span>
	<div class="controls" style= "width:1100px;">
		<label style="width:1000px;padding-top:10px;">การใช้งาน </label>
		<label style="width:1000px;">1.การค้นหาข้อมูล คลิกที่ปุ่ม "ค้นหา" เพื่อแสดงรายงานข้อมูลทั้งหมดของตัวชี้วัด และสามารถค้นหาข้อมูลได้โดยคลิกเลือกชื่อหน่วยงาน หรือระบุรหัสตัวชี้วัด หรือระบุชื่อตัวชี้วัด แล้วคลิกที่ปุ่ม "ค้นหา" </label>
		<label style="width:1100px;">2.การเพิ่มข้อมูลของตัวชี้วัด หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "เพิ่ม" จากนั้นระบบจะแสดงหน้าจอให้กรอกข้อมูลให้ครบถ้วน หากต้องการแนบไฟล์ให้คลิกปุ่ม "แนบไฟล์" ทำการเลือกไฟล์แล้วคลิกที่ปุ่ม "บันทึก" </label>
		<label style="width:1000px;">3.การแก้ไขข้อมูลของตัวชี้วัด หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "แก้ไข" <i class="icon-edit"></i> ระบบจะแสดงหน้าจอให้ทำการแก้ไขข้อมูล หากต้องการแนบไฟล์ให้คลิกปุ่ม "แนบไฟล์" ทำการเลือกไฟล์แล้วคลิกที่ปุ่ม "บันทึก" </label>
		<label style="width:1000px;">4.การลบไฟล์ของตัวชี้วัด หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "แก้ไข" <i class="icon-edit"></i> ระบบจะแสดงหน้าจอให้ทำการแก้ไขข้อมูล คลิกปุ่ม "ลบ" ที่ชื่อไฟล์แล้วคลิกปุ่ม "อัพโหลดไฟล์" </label>
		<label style="width:1000px;">5.การลบข้อมูลของตัวชี้วัด  หลังจากทำการค้นหาแล้ว คลิกที่ปุ่ม "ลบ" <i class="icon-trash"></i> ระบบจะแสดงหน้าจอเพื่อยืนยัน เลือกคลิกที่ปุ่ม "ใช่" </label>   
	</div>
  </div> 
</form> 
<div id="dialog-confirmDelete" title="ลบตัวชี้วัด" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<div class="imageicon" style="background-image:url('<%=request.getContextPath() %>/resources/img/shock.jpg');">
	</div>
	<label style="padding-top:15px;padding-left:55px;">
		ต้องการลบหรือไม่?
	</label>
</div>

<div id="dialog-confirmDeleteFile" title="ลบไฟล์" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
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
		<div id="dialog-Message" style="display: block;padding-left: 3px;width: 1122px" >
<form   style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:0px;padding-bottom:8px" action="" method="post" >
<div> 
	 <div style="padding: 10px;overflow: auto;height: 415px;width overflow-x:hidden" id="search_section">	
    </div>
  </div> 
  </form>
  </div>
  
<div id="dialog-form"  style="display: none;">
<form class="form-horizontal"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > 
<input type="hidden" id="mode" />
<input type="hidden" id="kpiId" />
<input type="hidden" id="orgId" />
<input type="hidden" id="lastkpiId" />
 <table style="width: 100%">
 <label style="padding-left:20px">การใช้งาน</label>
 <label style="padding-left:20px">1.การเพิ่มข้อมูลของตัวชี้วัด กรอกข้อมูลตัวชี้วัดให้ครบถ้วนแล้วคลิกที่ปุ่ม "บันทึก" ระบบจะแสดงหน้าจอสำหรับกรอกช่วงคะแนน</label>
 <label style="padding-left:20px">2.การแนบไฟล์ คลิกที่ปุ่ม "แนบไฟล์" เลือกไฟล์ และคลิกปุ่ม "อัพโหลดไฟล์" หากต้องการยกเลิกอัพโหลดไฟล์ก่อนจะอัพโหลดไฟล์คลิกปุ่มยกเลิกตรงแถวเดียวกับไฟล์</label>
	<tr>
 		<td>
			<div style="width:100px; float:left;height:40px;"> <span style="padding-left:20px">หน่วยงาน : </span> </div> 
			<span> 
				<div id="orgPanel" class="orgPanelCalss"> </div>
				<!--<input class="input_snp" type="text" id="kpi_organization_input" />-->
			</span>
 		</td>
 	<tr>
 	<tr>
 		<td>
			<div style="float:left;height:40px;width:100px"> <span style="padding-left:20px">รหัสตัวชี้วัด : </span> </div> 
			<span><input class="input_snp" type="text" id="kpi_code_input" style="width:550px;" />(ตัวอักษร)</span>
 		</td>
 	<tr>
 	<tr>
 		<td>
			<div style="width:100px; float:left;height:40px;"> <span style="padding-left:20px">ชื่อตัวชี้วัด : </span> </div> 
			<span> <input class="input_snp" type="text" id="kpi_name_input" style="width:550px;" />(ตัวอักษร)</span>
 		</td>
 	<tr>
 	<tr>
 		<td>
 		  <div style="width:100px; float:left;height:40px;"> <span style="padding-left:20px">มิติประเมินผล : </span> </div> 
		  <span>
		  <div id="perspectivePanel" class="perspectivePanelCalss" > </div>
		  </span>
 		</td>
 	<tr>
	
  	<tr>
 		<td>
 		  <div style="width:100px;height:40px; float:left;"> <span style="padding-left:20px;">หน่วยวัด : </span> </div> 
		  <span> 			  
		    <div id="uomPanel" class="uomPanelCalss"> </div>
		  </span>
 		</td>
 	<tr>
 	<tr>
	 	
 </table>
	<div style="text-align: center;"><a class="btn btn-primary"  onclick ="doSubmitAction()">&nbsp;<span style="color: white;font-weight: bold;">1. บันทึก</span></a></div>
</form>
		<form style="margin-top:10px" id="fileupload" action="/pentaho/uploadFile" method="POST" enctype="multipart/form-data">
                <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                <div class="row fileupload-buttonbar">
                    <div class="span7">
                        <!-- The fileinput-button span is used to style the file input field as button -->
                        <span class="btn btn-success fileinput-button">
                        <div id="btnUpfile" style="height: 20px; width: 70px;  cursor:pointer;" onclick="getFile()">2. แนบไฟล์</div>
						<div style='height: 0px;width:0px; overflow:hidden;'><input id="upfile" type="file"  multiple /></div>
							<!--style="position:absolute;visibility:hidden;"-->
                        </span>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button  type="button" class="btn btn-warning " onclick="addFile()" style="display:none" >
                            <span>3. อัพโหลดไฟล์</span>
                        </button>
						<button id="btnHideFileupload" type="button" class="start" style="display:none">
                            <span>3. อัพโหลดไฟล์</span>
                        </button>

                    </div>
                    
                </div>
                <!-- The loading indicator is shown during file processing -->
                <div class="fileupload-loading"></div>
                <br>
                <!-- The table listing the files available for upload/download -->
                <table role="presentation" class="table table-striped"><tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery"></tbody></table>
            </form>
	   
		<div id="fileNameDiv" class="fileNameClass">
		</div>
		
</div>
</td>
	</tr>
  </table>
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
     $(document).ready(function() {
	 listOrg();
	
     	$("#kpiName").keypress(function(event) {
       if ( event.which == 13 ) {
          event.preventDefault();
          searchKPI();
        } 
     });
     	$("#kpiCode").keypress(function(event) {
            if ( event.which == 13 ) {
               event.preventDefault();
               searchKPI();
             } 
          });
     	$( "#kpiName" ).autocomplete({
  		  source: function( request, response ) { 
  				var query="SELECT kpi_code,kpi_name FROM "+SCHEMA_G+".kpi where kpi_name like '%"+request.term+"%'";
				
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
     	$( "#kpiCode" ).autocomplete({
  		  source: function( request, response ) { 
  			var query="SELECT kpi_code,kpi_name FROM "+SCHEMA_G+".kpi where kpi_code like '%"+request.term+"%'";
  				KPIAjax.listMaster(query,{
  					callback:function(data){ 
  						if(data!=null && data.length>0){
  							response( $.map( data, function( item ) {
  					          return {
  					        	  label: item.id,
  					        	  value: item.id
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
  		  close: function() {f
  		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
  		  }
  		}); 

     }); 
	 
	function listOrg(){
	var query="select organization_id,organization_short_name  from "+SCHEMA_G+".organization where (organization_short_name IN (<%=getRole%>) OR 'Administrator'IN (<%=getRole%>) OR 'สปช.ทร.' IN (<%=getRole%>)) and organization_status ='active';";
	KPIAjax.listMaster(query,{
		callback:function(data){
			 var str="<select id=\"orgElement\" style=\"width:100px\" >";
			 //   str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){
				for(var i=0;i<data.length;i++){
				if(indexAdmin>=0 || indexOrg>=0){//SET ADMIN
				if(i==0)
					{
						str=str+"<option value=\"all\">ทั้งหมด</option>";
					}
				}
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
			} 
			str=str+"</select>";
			$("#orgSelection").html(str); 
		}
   });
}
	
    function searchKPI(){
     	var kpiName =jQuery.trim($("#kpiName").val());
     	var kpiCode =jQuery.trim($("#kpiCode").val());
		var orgId = jQuery.trim($("#orgElement").val());
     	var kpiWhere="";
     	var haveWhere=false;
		kpiWhere += " where kpi.organization_id = org.organization_id " ;
		
		if(orgId == "all"){
			orgId = "";
		}
		else{
			kpiWhere += " and org.organization_id = '"+orgId+"'";
		}
     	  if(kpiName.length>0){
			kpiWhere=kpiWhere+" and kpi.kpi_name like '%"+kpiName+"%'";
     		haveWhere=true; 
     	}
     	if(kpiCode.length>0){
			kpiWhere=kpiWhere+" and kpi.kpi_code like '%"+kpiCode+"%'";
     		haveWhere=true; 
     	} 
     	var query="SELECT org.organization_name,kpi.kpi_code,kpi.kpi_name,kpi.kpi_id,org.organization_id FROM "+SCHEMA_G+".kpi kpi,"+SCHEMA_G+".organization org "+kpiWhere;
     	//alert(query);
		KPIAjax.searchObject(query,{
     		callback:function(data){
     			var str="<div align=\"left\" style=\"padding-bottom: 4px;width:1090px\"> <a class=\"btn\" onclick=\"showForm('add','0')\"><i class=\"icon-plus-sign\"></i>&nbsp;<span style=\"font-weight: normal;\">เพิ่ม</span></a></div>"+
     			 		"	  <table id=\"showData\" class=\"table table-bordered \" border=\"1\" style=\"font-size: 12px;width:1090px\"> "+
     			        "	<thead> 	"+
     			        "  		<tr class=\"altheader\"> "+
     			        " 			<th width=\"30%\"><div class=\"th_class\">หน่วยงาน</div></th>"+
     			        "   		<th width=\"10%\"><div class=\"th_class\">รหัสตัวชี้วัด</div></th>"+ 
     			        "   		<th width=\"40%\"><div class=\"th_class\">ชื่อตัวชี้วัด</div></th>"+ 
     			        "    		<th width=\"20%\"><div class=\"th_class\">แก้ไข&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;กำหนดช่วงคะแนน&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ลบ</div></th>     "+
     			        " 		</tr>"+
     			        "	</thead>"+
     			        "	<tbody class=\"showDataTbody\">   "; 
     			  		
     			   if(data!=null && data.length>0){
     				   for(var i=0;i<data.length;i++){
					    if(i % 2 == 0){
						
     					   str=str+ "  	<tr style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+",'"+data[i][3]+"','"+data[i][2]+"')\" >"+
     				        "  		<td style=\"text-align: center;\"> "+data[i][0]+" </td>"+
     				        "    	<td style=\"text-align: center;\">"+data[i][1]+"</td>  "+
							"    	<td style=\"text-align: center;\">"+data[i][2]+"</td>  "+
     				        "    	<td style=\"text-align: center;\">"+
     				        "    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][1]+"','"+data[i][3]+"','"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
     				        "    	<i title=\"กำหนดช่วงการให้คะแนน\" onclick=\"showFormBaseline('"+data[i][0]+"','"+data[i][1]+"','"+data[i][2]+"','"+data[i][3]+"')\" style=\"cursor: pointer;\" class=\"icon-th-list\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
     				        "    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][3]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
						    "    	</td> "+
     				        "  	</tr>  ";
							}
							
						else{
							str=str+ "  <tr class=\"alt\" style=\"cursor: pointer;\" id=\"tr_row"+i+"\" onclick = \"visited(tr_row"+i+",'"+data[i][3]+"','"+data[i][2]+"')\" >"+
     				        "  		<td style=\"text-align: center;\"> "+data[i][0]+" </td>"+
     				        "    	<td style=\"text-align: center;\">"+data[i][1]+"</td>  "+
							"    	<td style=\"text-align: center;\">"+data[i][2]+"</td>  "+
     				        "    	<td style=\"text-align: center;\">"+
     				        "    	<i title=\"แก้ไข\" onclick=\"showForm('edit','"+data[i][1]+"','"+data[i][3]+"','"+data[i][4]+"')\" style=\"cursor: pointer;\" class=\"icon-edit\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
     				        "    	<i title=\"กำหนดช่วงการให้คะแนน\" onclick=\"showFormBaseline('"+data[i][0]+"','"+data[i][1]+"','"+data[i][2]+"','"+data[i][3]+"')\" style=\"cursor: pointer;\" class=\"icon-th-list\"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
     				        "    	<i title=\"ลบ\" onclick=\"confirmDelete('"+data[i][3]+"')\" style=\"cursor: pointer;\" class=\"icon-trash\"></i>"+
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
						   str=str+ "<div id =\"listFilePanel\" class=\"listFileClassPanel\"></div>";
     			$("#search_section").html(str);
     		}
     	}); 
     }
	function showPageBaseline(org,kpicode,kpiname,kpiid){
		window.location = "kpi_baseline.jsp?org="+org+"&kpicode="+kpicode+"&kpiname="+kpiname+"&kpiid="+kpiid;
	 }
	 
	function showFormBaseline(org,kpicode,kpiname,kpiid){
		window.open(_path+"/initial_setup/kpi_baseline.jsp?org="+org+"&kpicode="+kpicode+"&kpiname="+kpiname+"&kpiid="+kpiid+"", "_blank", "scrollbars=1,resizable=1,height=620,width=1100");
	}
	
    function showForm(mode,kpiCode,kpiId,orgId){
	//var fileUpload = $("#fileUpload");
	//alert(fileUpload.val());
	$("#mode").val(mode);
	$("#modeBline").val(mode);
	$(".fileNameClass").empty();
	$("#kpiId").val(kpiId);
	$("#orgId").val(orgId);
	$("tr.template-upload").remove();
		if(mode == "add"){
		var query="select organization_id,organization_short_name  from "+SCHEMA_G+".organization where (organization_short_name IN (<%=getRole%>) OR 'Administrator'IN (<%=getRole%>) OR 'สปช.ทร.' IN (<%=getRole%>)) and organization_status ='active';";
		KPIAjax.listMaster(query,{
		callback:function(data){
		//alert(data);
			 var str="<select id=\"org_input\" style=\"width:100px; \">";
			if(data!=null && data.length>0){
				for(var i=0;i<data.length;i++){
				//alert(data[i].id);
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
			} 
			str=str+"</select>";
			$(".orgPanelCalss").empty().html(str); 
			
		}
		});
		}else if(mode == "edit"){
			$(".orgPanelCalss").empty().html("<input class=\"input_snp\" type=\"text\" id=\"kpi_organization_input\" />");	
			checkFile($("#kpiId").val());
		}
 
          var query="select * FROM  "+SCHEMA_G+".perspective";    	 
    		KPIAjax.listMaster(query,{
    			callback:function(data){
    				var str="<select  id=\"perspective_input\">";
    				if(data!=null && data.length>0){ 
    					for(var i=0;i<data.length;i++){
    						str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
    					} 
    				}
    				str=str+"</select>";
    				$(".perspectivePanelCalss").html(str);
    				 query="select * FROM  "+SCHEMA_G+".uom";  
    				 KPIAjax.listMaster(query,{
    		    			callback:function(data){
    		    				var str="<select id=\"uom_input\">";
    		    				if(data!=null && data.length>0){
    		    					for(var i=0;i<data.length;i++){
    		    						str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
    		    					} 
    		    				}
    		    				str=str+"</select>";
    		    				$(".uomPanelCalss").html(str);
    		    		    				$("#mode").val(mode);
    		    		    		     	if(mode=='add'){
    		    		    		     		$('#kpi_code_input').attr('readonly', false); 
    		    		    		     		 $("#kpi_code_input").val("");
		    		    		                    $("#kpi_name_input").val("");
		    		    		                    $("#perspective_input").val("");
		    		    		                    $("#uom_input").val("");
		    		    		                    $("#organization_input").val("");
    		    		    		     		$( "#dialog-form" ).dialog({
    		    		    		     			position: 'top',
    		    		    		     			 height: 550,
    		    		    		     			 width:777,
    		    		    		     			 modal: true,
    		    		    		     			  hide: 'fold',
    		    		    		     		      show: 'blind' 
    		    		    		     		});
    		    		    		     	}else{ //edit
    		    		    		     		$('#kpi_organization_input').attr('readonly', true);
    		    		    		     		var query=" SELECT org.organization_name,kpi.kpi_code,kpi.kpi_name FROM "+SCHEMA_G+".kpi kpi,"+SCHEMA_G+".organization org where kpi.kpi_code='"+kpiCode+"' and org.organization_id = kpi.organization_id";
    		    		    		     		KPIAjax.searchObject(query,{
    		    		    		     			callback:function(data){
    		    		    		     				//alert(data);  
    		    		    		                    $("#kpi_code_input").val(data[0][1]);
    		    		    		                    $("#kpi_name_input").val(data[0][2]);
    		    		    		                    $("#kpi_organization_input").val(data[0][0]);
    		    		    		     				$( "#dialog-form" ).dialog({ 
    		    		    		     					position: 'top',
    		    		    		     					 height: 550,
    		    		    		     					 width:777,
    		    		    		     					modal: true,
    		    		    		     					 hide: 'fold',
    		    		    		     				     show: 'blind' 
    		    		    		     				});
    		    		    		     			}
    		    		    		     		});
    		    		    		     	}
    		    			}
    		    	    }); 
    			}
    	    }); 

     }
	 
	 function checkFile(kpiId){
		if($("#mode").val()=="add"){
		var query_MaxkpiId="select MAX(kpi_id) from "+SCHEMA_G+".kpi"
			KPIAjax.searchObject(query_MaxkpiId,{
			callback:function(data){
				kpiId = data;
				var queryFile = "select attached_file_name from "+SCHEMA_G+".kpi_attached_file where kpi_id='"+kpiId+"'";
				//string listfile for dialogform
				var strfileName = '';
				//string listfile for pageform
				var strlistFile ='';
				$(".fileNameClass").empty();
				$(".listFileClassPanel").empty();
					//alert(queryFile);
					KPIAjax.searchObject(queryFile,{
						callback:function(data){
						if(data!=null && data.length>0){
							for(var i=0;i<data.length;i++){
								strfileName += "<div ><a style=\"float:left;width:600px;\" href=\""+_path+"kpi_file_upload/"+data[i]+"\">"+
								data[i]+" </a><a style=\"margin-top:8px\" > <b><u onclick=\"confirmDelFile('"+kpiId+"','"+data[i]+"') \">	ลบ</u></b> </a></div>";
								if(!($("#mode").val()=="edit")){
									strlistFile += "<div ><a style=\"float:left;width:600px;\" href=\""+_path+"kpi_file_upload/"+data[i]+"\">"+data[i]+"</a></div>";
								}
							}
							
							$(".fileNameClass").empty().html(strfileName);
							$(".listFileClassPanel").empty();
								
							//}
						}
					}
				});
				
				}
			});
		}
		else{
			var queryFile = "select attached_file_name from "+SCHEMA_G+".kpi_attached_file where kpi_id='"+kpiId+"'";
				//string listfile for dialogform
				var strfileName = '';
				//string listfile for pageform
				var strlistFile ='';
				$(".fileNameClass").empty();
				$(".listFileClassPanel").empty();
					//alert(queryFile);
					KPIAjax.searchObject(queryFile,{
						callback:function(data){
						if(data!=null && data.length>0){
							for(var i=0;i<data.length;i++){
								strfileName += "<div ><a style=\"float:left;width:600px;\" href=\""+_path+"kpi_file_upload/"+data[i]+"\">"+
								data[i]+" </a><a style=\"margin-top:8px\" > <b><u onclick=\"confirmDelFile('"+kpiId+"','"+data[i]+"') \">	ลบ</u></b> </a></div>";
								if(!($("#mode").val()=="edit")){
									strlistFile += "<div ><a style=\"float:left;width:600px;\" href=\""+_path+"kpi_file_upload/"+data[i]+"\">"+data[i]+"</a></div>";
								}
							}
							
							$(".fileNameClass").empty().html(strfileName);
							$(".listFileClassPanel").empty().html(strlistFile);
								
							//}
						}
					}
				});
		}
		
	 }
	 
	 function confirmDelFile(kpiId,filename){
		var queryDelfile="delete  FROM "+SCHEMA_G+".kpi_attached_file where kpi_id='"+kpiId+"' and attached_file_name = '"+filename+"'";
		//alert(queryDelfile);
		$( "#dialog-confirmDeleteFile" ).dialog({
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
		var elFilename = document.getElementsByName("fileName");
		var filenames = '';
    	var kpi_code_input= jQuery.trim($("#kpi_code_input").val());
        var kpi_name_input= jQuery.trim($("#kpi_name_input").val());
        var perspective_input= jQuery.trim($("#perspective_input").val());
        var uom_input= jQuery.trim($("#uom_input").val());
        var organization_id_input= jQuery.trim($("#org_input").val());
		var organization_id_edit = jQuery.trim($("#orgId").val());
		var kpiId = jQuery.trim($("#kpiId").val());
     	var mode=$("#mode").val();
     	var query="";
		var queryCheckDuplicate="";
		var lastkpiId = $("#lastkpiId").val();
		var orgName_input=$("#org_input").find('option:selected').text();
     	if(mode=='add'){
     			query="insert into "+SCHEMA_G+".kpi set organization_id='"+organization_id_input+"', kpi_code='"+kpi_code_input+"',"+
     			" kpi_name='"+kpi_name_input+"', perspective_id='"+perspective_input+"', uom_id='"+uom_input+"',"+
     			" created_dt=now(),updated_dt=now(),created_by='"+username+"',updated_by='"+username+"'";
     			queryCheckDuplicate=" SELECT * FROM "+SCHEMA_G+".kpi where kpi_code='"+kpi_code_input+"'";
				
     	}else {
     		  query="update  "+SCHEMA_G+".kpi set organization_id='"+organization_id_edit+"', kpi_code='"+kpi_code_input+"',"+
     			" kpi_name='"+kpi_name_input+"', perspective_id='"+perspective_input+"', uom_id='"+uom_input+"',"+
     			" updated_dt=now(),updated_by='"+username+"' where kpi.kpi_id = '"+kpiId+"'";

     	}
		
		if(kpi_code_input.trim().length==0){
			alert("กรุณากรอกรหัสตัวชี้วัด");
			$("#kpi_code_input").focus();
		}
		else if(($("#kpi_code_input").val()).length>50){
			alert("รหัสตัวชี้วัดมีตัวอักษรเกิน 50 ตัว");
			$("#kpi_code_input").focus();
		}
	    else if(kpi_name_input.trim().length==0){
			alert("กรุณากรอกชื่อตัวชี้วัด");
			$("#kpi_name_input").focus();
		}
		else if(($("#kpi_name_input").val()).length>255){
			alert("ชื่อตัวชี้วัดมีตัวอักษรเกิน 255 ตัว");
			$("#kpi_name_input").focus();
		}
		
		else if(queryCheckDuplicate.length>0){
			KPIAjax.searchObject(queryCheckDuplicate,{
			callback:function(data){
				if(data!=null && data.length>0){
					alert("ไม่สามารถเพิ่มข้อมูลได้เนื่องจากมีรหัสตัวชี้วัดซ้ำกัน ");
				}else{
				
					KPIAjax.executeQuery(query,{
					callback:function(data){
						if(data!=0){
						
							findLastKpiId(orgName_input,kpi_code_input,kpi_name_input);
							searchKPI();
						}
					}
					});
								
					} 
						}
					});
				}
				else{
					KPIAjax.executeQuery(query,{
					callback:function(data){
						if(data!=0){
						//alert(kpi_name_input);
							searchKPI();
							alert("บันทึกข้อมูลเรียบร้อยแล้ว หากต้องการแนบไฟล์ให้คลิกปุ่ม \"แนบไฟล์\"");
						}
					}
					});
				}
    }
	
	function findLastKpiId(orgName_input,kpi_code_input,kpi_name_input){
			queryMaxkpiId="select MAX(kpi_id) from "+SCHEMA_G+".kpi"
				KPIAjax.searchObject(queryMaxkpiId,{
				callback:function(data){
					$("#lastkpiId").val(data);
					var lastkpiId = $("#lastkpiId").val();
					window.open(_path+"/initial_setup/kpi_baseline.jsp?org="+orgName_input+"&kpicode="+kpi_code_input+"&kpiname="+kpi_name_input+"&kpiid="+lastkpiId+"", "_blank", "scrollbars=1,resizable=1,height=620,width=1100");
					
				}
				
			});
	}
	
    function addFile(paramFileName){
		var elFilename = document.getElementsByName("fileName");
		var filename = '';
		var queryUpfile = "";
		var mode = $("#mode").val();
		var kpiId = $("#kpiId").val();
		var query_MaxkpiId = "";
		var query_fileName = "";
		var maxId='';
		//alert(query);
		
						//for(var i=0; i<elFilename.length; i++) {
							//filename = elFilename[0].value;
							filename = paramFileName;
							//Upload file add mode
							query_fileName = "select attached_file_name from "+SCHEMA_G+".kpi_attached_file where attached_file_name = '"+filename+"'";
							KPIAjax.searchObject(query_fileName,{
							callback:function(data){
								
								if(data!=null && data.length>0){
									alert("มีชื่อไฟล์นี้อยู่ในระบบแล้ว กรุณาคลิกปุ่ม \"ยกเลิก\" เพื่อยกเลิกการอัพโหลดไฟล์");
								}
								else {
									var query_MaxkpiId="select MAX(kpi_id) from "+SCHEMA_G+".kpi"
									KPIAjax.searchObject(query_MaxkpiId,{
									callback:function(data){
									maxId=data;
										if(mode=="add"){
											queryUpfile=" insert "+SCHEMA_G+".kpi_attached_file set attached_file_name='"+filename+"',kpi_id='"+data+"', created_dt=now(),updated_dt=now(),"+
											"created_by='"+username+"',updated_by='"+username+"'";
										}
										//Upload file edit mode
										else{
											queryUpfile=" insert "+SCHEMA_G+".kpi_attached_file set attached_file_name='"+filename+"',kpi_id='"+kpiId+"', created_dt=now(),updated_dt=now(),"+
											"created_by='"+username+"',updated_by='"+username+"'";
										}
										//alert(queryUpfile);
											KPIAjax.executeQuery(queryUpfile,{
											callback:function(data){
												if(data==0){
													alert("อัพโหลดไฟล์ไม่สำเร็จ");
												}
												else{
												if(mode=="add")
												{
													checkFile(maxId);
													}
												else{
													checkFile(kpiId);
												}
													//statusFile += "true,"
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
										});
									}
							}
							});	
							//}
						//}
					//});
						searchKPI(); 
						//$( "#dialog-form" ).dialog("close");
    }
	
	function doDeletefile(queryDelFile){
	//alert(queryDelFile);
		KPIAjax.executeQuery(queryDelFile,{
			callback:function(data){
				if(data==0){
					alert(ไม่สามารถลบได้);
				}
				//searchKPI();
				
				checkFile($("#kpiId").val());
				searchKPI();
			}
		});
	}
	 
    function doAction(id){
        var queryDelfile="delete  FROM "+SCHEMA_G+".kpi_attached_file where kpi_id='"+id+"'";
		var queryDelBaseline="";
		var query="";
     		KPIAjax.executeQuery(queryDelfile,{
     			callback:function(data){
					queryDelBaseline="delete  FROM "+SCHEMA_G+".kpi_baseline where kpi_id='"+id+"'";
					KPIAjax.executeQuery(queryDelBaseline,{
					callback:function(data){
						//queryDelResult="delete  FROM "+SCHEMA_G+".kpi_result where kpi_id='"+id+"'";
						//KPIAjax.executeQuery(queryDelResult,{
						//callback:function(data){
								query= "delete  FROM "+SCHEMA_G+".kpi where kpi_id='"+id+"'";
								KPIAjax.executeQuery(query,{
								callback:function(data){
								if(data==0){
									alert("ไม่สามารถลบได้เนื่องจากข้อมูลถูกใช้งาน");
									
								}
									searchKPI();
								}
								});
							//}
							//});	
					}
					});						
     			}
     		});
     }
	 
    function visited(tr,kpiId,kpiName) {
		$("tbody.showDataTbody tr").removeAttr("style");
		tr.style.backgroundColor = "#F5E79E";
		//alert(kpiId);
		var str="";
		
				var queryFile = "select attached_file_name from "+SCHEMA_G+".kpi_attached_file where kpi_id='"+kpiId+"'";
				var str = '';
				str += "<div><h5>ไฟล์ประกอบข้อมูลตัวชี้วัด  <br> "+kpiName+"</h5></div>";
				$(".listFileClassPanel").empty();
					KPIAjax.searchObject(queryFile,{
						callback:function(data){
						if(data!=null && data.length>0){
							for(var i=0;i<data.length;i++){
								str += "<div ><a  href=\""+_path+"kpi_file_upload/"+data[i]+"\">"+
								data[i]+" </a></div>";
							}
							
						}
						$(".listFileClassPanel").empty().html(str);
					}
				});
				
	}
	
	function getFile(){
        document.getElementById("upfile").click();
    }
	
	$("#btnAddBline").click(function() {
		showFormBaselineInput('add',$("#lastkpiId").val());
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
