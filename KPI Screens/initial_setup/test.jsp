<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>  
<html>
<head>
<title>BackOffice</title>
	<!-- Force latest IE rendering engine or ChromeFrame if installed -->
        <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
        <meta charset="utf-8">
        <title>jQuery File Upload Demo</title>
        <meta name="description" content="File Upload widget with multiple file selection, drag&amp;drop support, progress bar and preview images for jQuery. Supports cross-domain, chunked and resumable file uploads. Works with any server-side platform (Google App Engine, PHP, Python, Ruby on Rails, Java, etc.) that supports standard HTML form file uploads.">
        <meta name="viewport" content="width=device-width">
        <!-- Bootstrap CSS Toolkit styles -->
        <link href="<%=request.getContextPath()%>/resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
		<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/>
		<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"  type="text/css"/>    



</head> 
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

            <!-- The file upload form used as target for the file upload widget -->
            <form id="fileupload" action="/pentaho/uploadFile" method="POST" enctype="multipart/form-data">
                <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                <div class="row fileupload-buttonbar">
                    <div class="span7">
                        <!-- The fileinput-button span is used to style the file input field as button -->
                        <span class="btn btn-success fileinput-button">
                            <i class="icon-plus icon-white"></i>
                            <span>Add files...</span>
                            <input type="file" name="files[]"  multiple>
							
							<!--style="position:absolute;visibility:hidden;"-->
                        </span>
						<div id="yourBtn" style="height: 50px; width: 100px;border: 1px dashed #BBB; cursor:pointer;" onclick="getFile()">Click to upload!</div>
							<!-- this is your file input tag, so i hide it!-->
							<div style='height: 0px;width:0px; overflow:hidden;'><input id="upfile" type="file" value="upload"/></div>
                        <button type="submit" class="btn btn-primary start">
                            <i class="icon-upload icon-white"></i>
                            <span>Start upload</span>
                        </button>
                        <button type="reset" class="btn btn-warning cancel">
                            <i class="icon-ban-circle icon-white"></i>
                            <span>Cancel upload</span>
                        </button>

                    </div>
                    <!-- The global progress information -->
                    <div class="span5 fileupload-progress fade">
                        <!-- The global progress bar -->
                        <div class="progress progress-success progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                            <div class="bar" style="width:0%;"></div>
                        </div>
                        <!-- The extended global progress information -->
                        <div class="progress-extended">&nbsp;</div>
                    </div>
                </div>
                <!-- The loading indicator is shown during file processing -->
                <div class="fileupload-loading"></div>
                <br>
                <!-- The table listing the files available for upload/download -->
                <table role="presentation" class="table table-striped"><tbody class="files" data-toggle="modal-gallery" data-target="#modal-gallery"></tbody></table>
            </form>
			<div><input type="button" onclick="myFunction()"> </div>

			<script>
function myFunction() {
    $("#fileupload").submit();
}
</script>
        <!-- The template to display files available for upload -->
        <script id="template-upload" type="text/x-tmpl">
            {% for (var i=0, file; file=o.files[i]; i++) { %}
        <tr class="template-upload fade">
            <td class="preview"><span class="fade"></span></td>
            <td class="name"><span>{%=file.name%}</span></td>
            <td class="size"><span>{%=o.formatFileSize(file.size)%}</span></td>
            {% if (file.error) { %}	
            <td class="error" colspan="2"><span class="label label-important">Error</span> {%=file.error%}</td>
            {% } else if (o.files.valid && !i) { %}

            <td class="start">{% if (!o.options.autoUpload) { %}
                <button class="btn btn-primary" >
                    <i class="icon-upload icon-white"></i>
                    <span>Start</span>
                </button>
                {% } %}</td>
            {% } else { %}
            <td colspan="2"></td>
            {% } %}
            <td class="cancel">{% if (!i) { %}
                <button class="btn btn-warning">
                    <i class="icon-ban-circle icon-white"></i>
                    <span>Cancel</span>
                </button>
                {% } %}</td>
        </tr>
        {% } %}
    </script>
    <!-- The template to display files available for download -->
    <script id="template-download" type="text/x-tmpl">
    </script>
	<script>
	  function getFile(){
        document.getElementById("upfile").click();
    }
	</script>
</body>
</html>    
