<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		
	 <script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script> 

	
	<link href="fileinput/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
		
	
	<script type="text/javascript" src="js/jquery-form.js"></script>
	
	<script type="text/javascript">
	function uploadImage() {
		alert('haha');
		var fileReader = new FileReader();
        fileReader.onload = function (e) {
            var img = new Image();
            img.onload = function () {
                var MAX_WIDTH = 400;
                var MAX_HEIGHT = 320;
                var width = img.width;
                var height = img.height;

                if (width > height) {
                    if (width > MAX_WIDTH) {
                        height *= MAX_WIDTH / width;
                        width = MAX_WIDTH;
                    }
                } else {
                    if (height > MAX_HEIGHT) {
                        width *= MAX_HEIGHT / height;
                        height = MAX_HEIGHT;
                    }
                }

                var canvas = document.createElement("canvas");
                canvas.width = width;
                canvas.height = height;
                canvas.getContext("2d").drawImage(this, 0, 0, width, height);
                this.src = canvas.toDataURL();
                document.body.appendChild(this);//remove this if you don't want to show it
                var attachment = canvas.toDataURL("image/jpeg"); 
                
                var options = {  
                        url : "uploadPhoto",  
                        type : "POST",  
                        data: 'fileupload='+attachment,
                        success : function(msg) {
                        	//alert("msg:"+msg);
                        	$("#img-result").attr('src',msg);
                        }
                    };  
                    $("#f-upload").ajaxSubmit(options);
                    return false;
            };
            //img.src = e.target.result;
        };
        fileReader.readAsDataURL($('#photo').files[0]);
		
    }
	function test(){
		$("#img-result").attr('src','images/d1.jpg');
	}
	</script>
	
	<script src="js/imageside/canvas-to-blob.min.js"></script>
	<script src="fileinput/js/fileinput.js"></script>
	
	<script src="js/jquery-image/jquery.canvasResize.js"></script>
	<script src="js/jquery-image/canvasResize.js"></script>
	
  </head>
  
  <body>
  	<div class="container">
  		<div class="jumbotron">
		  <h1 class="text-center">Hello, world!</h1>
		  <h2 class="text-center">The hello Cambodia!</h2>
		</div>
  		<form id="f-upload" action="uploadPhoto" method="post" enctype="multipart/form-data">
		  <div class="form-group">
		    <label for="photo">Email address</label>
		    
		    <input class="file-loading" id="photo" type="file" name="fileupload" class="form-control" accept="image/*" multiple data-show-preview="true">
			<script>
			$(document).on('ready', function() {
				    $("#photo").fileinput({
				    	uploadUrl: "uploadPhoto",
				        showUpload: true,
				        allowedFileExtensions: ["jpg", "png", "gif"],
				        maxImageWidth: 200,
				        maxFileCount: 5,
				        resizeImage: true,
				        uploadAsync: true,
				        mainClass: "input-group-md"
				    }).on('filepreupload', function() {
				    alert("preuploaded");
					}).on('fileuploaded', function(event, data) {
					    alert("fileuploaded,data:"+data);
					    $("#img-result").attr('src',msg);
					});
				    
				    $("#photo").change(function (e) {
				    	alert('haha');
				        var fileReader = new FileReader();
				        fileReader.onload = function (e) {
				            var img = new Image();
				            img.onload = function () {
				                var MAX_WIDTH = 400;
				                var MAX_HEIGHT = 320;
				                var width = img.width;
				                var height = img.height;

				                if (width > height) {
				                    if (width > MAX_WIDTH) {
				                        height *= MAX_WIDTH / width;
				                        width = MAX_WIDTH;
				                    }
				                } else {
				                    if (height > MAX_HEIGHT) {
				                        width *= MAX_HEIGHT / height;
				                        height = MAX_HEIGHT;
				                    }
				                }

				                var canvas = document.createElement("canvas");
				                canvas.width = width;
				                canvas.height = height;
				                canvas.getContext("2d").drawImage(this, 0, 0, width, height);
				                this.src = canvas.toDataURL();
				                alert(canvas.toDataURL());
				                document.body.appendChild(this);//remove this if you don't want to show it
				            }
				            img.src = e.target.result;
				        }
				        fileReader.readAsDataURL(e.target.files[0]);
				    });
				});
			</script>

		  </div>
		  <button type="button" class="btn btn-default" onclick="uploadImage();">Submit</button>
		</form>
		<img id="img-chose" class="img-responsive" alt="" src="">
  		<img id="img-result" class="img-responsive" alt="" src="">
  		<div class="clearfix" style="height:50px;"></div>
  	</div>
  </body>
</html>
