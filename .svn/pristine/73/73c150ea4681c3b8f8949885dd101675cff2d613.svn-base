<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%
	String context = request.getContextPath();
	request.setAttribute("context",context);
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
	        <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">	
		<script type="text/javascript">
			function submitPersonal(){
				$.ajax
		        ({ 
		            url: "../system/editPersonal", 
		            method: "post",
		            dataType: "json",  // 返回的结果类型是json...
		            //传送请求数据
		            data: $('#personalForm').serialize(),
		            success: function (data) { 
		            	if (data.success){
		            		//关闭modal框
		            		$('#modal-personal').modal('hide'); 
		            	}
		            }
		        })
			}
			
			$("#modal-personal").on("hidden.bs.modal", function() {
				$(this).removeData("bs.modal");
			});
		</script>
	</head>
	<body>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>个人资料</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-wrench"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-md-12">
			   <form id="form" class="form-horizontal">
			        <div class="form-group">
			                  <label class="col-sm-3 control-label">用户账号：</label>
			                  <input type="hidden" name="id" value="${user.id}">
			                  <div class="col-sm-6">
			                         <label class="control-label">${user.account} </label>
			                  </div>
			         </div>
			         <div class="form-group">
			                  <label class="col-sm-3 control-label">工号：</label>
			                  <input type="hidden" name="job_no" value="${user.job_no}">
			                  <div class="col-sm-6">
			                         <label class="control-label">${user.job_no} </label>
			                  </div>
			         </div>
			         <div class="form-group">
			                  <label class="col-sm-3 control-label">用户头像：</label>
			                  <div class="col-sm-6">
			                        <img alt="image" class="img-circle" width="100" src="/images/${user.portrait}" />
			                        <div id="uploader">
								    <!--用来存放item-->
								    <div id="fileList" class="uploader-list"></div>
								    <div id="filePicker">选择图片</div>
									</div>			                        
			         		</div>
			         </div>
			         <div class="form-group" >
		                    <label class="col-sm-3 control-label">用户姓名：</label>
		                    <div class="col-sm-6">
		                        <input type="text" class="form-control" name="userName" value="${user.userName}">
		                    </div>
			        </div>
			        <div class="form-group">
		                  <label class="col-sm-3 control-label">电话：</label>
		                  <div class="col-sm-6">
		                        <input type="text" name="mobile" class="form-control" value="${user.mobile}"> <!-- <span class="help-block m-b-none">说明文字</span> -->
		                  </div>
			         </div>
			         <div class="form-group">
		                  <label class="col-sm-3 control-label">E-mail：</label>
		                  <div class="col-sm-6">
		                        <input type="text" name="email" class="form-control" value="${user.email}"> <!-- <span class="help-block m-b-none">说明文字</span> -->
		                  </div>
			         </div>
			        <div class="form-group" >
			        				<label class="col-sm-3 control-label" ></label>
				                 <div class="col-sm-6">
			                     <button id="save" class="btn btn-primary" type="button">修改</button>
			                     <button id="cancel" class="btn btn-white" type="button">取消</button>
		                     	 </div>
		            </div>
		       </form>
			 </div>
                </div>
            </div>
        </div>
			
	</body>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	<%-- <script src="${context}/js/demo/webuploader-demo.js"></script> --%>
	 <!-- Web Uploader -->
    <script type="text/javascript">
    $(document).ready(function () {
		$('#save').on('click', function () {
			$.ajax({ 
		        url: "editPersonal", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: $('#form').serialize(),
		        success: function (data) { 
		        	layer.msg('修改成功');
		        	setTimeout(function (){
		        		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	                    parent.layer.close(index);//something you want delayed
		        	   }, 1000); // how long do you want the delay to be? 		        	
		        },
		        error:function(data){	
		        	alert("请求失败!");	
		        }
		    });			
		 });
		$('#cancel').on('click', function () {
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
            parent.layer.close(index);
		});
	});
        // 添加全局站点信息
        var BASE_URL = 'js/plugins/webuploader';
        jQuery(function() {
            var $ = jQuery,
                $list = $('#fileList'),
                // 优化retina, 在retina下这个值是2
                ratio = window.devicePixelRatio || 1,

                // 缩略图大小
                thumbnailWidth = 100 * ratio,
                thumbnailHeight = 100 * ratio,

                // Web Uploader实例
                uploader;

            // 初始化Web Uploader
            uploader = WebUploader.create({

                // 自动上传。
                auto: true,

                // swf文件路径
                swf: BASE_URL + '/Uploader.swf',

                // 文件接收服务端。
                server: 'editPortrait',

                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: {
                    id: '#filePicker',
                    //name:"portrait",  //这个地方 name 没什么用，虽然打开调试器，input的名字确实改过来了。但是提交到后台取不到文件。如果想自定义file的name属性，还是要和fileVal 配合使用。
                    label: '修改头像',
                    multiple:false            //默认为true，true表示可以多选文件，HTML5的属性
                },
				
                // 只允许选择文件，可选。
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/jpg,image/jpeg,image/png'
                },
                formData: {  
                	my_user_id : '${user.id}',
                	job_no: '${user.job_no}'
                }  
            });
            // 文件上传过程中创建进度条实时显示。
            uploader.on( 'uploadProgress', function( file, percentage ) {
                var $li = $( '#'+file.id ),
                    $percent = $li.find('.progress span');

                // 避免重复创建
                if ( !$percent.length ) {
                    $percent = $('<p class="progress"><span></span></p>')
                            .appendTo( $li )
                            .find('span');
                }

                $percent.css( 'width', percentage * 100 + '%' );
            });

            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
            uploader.on( 'uploadSuccess', function( file ) {
                $( '#'+file.id ).addClass('upload-state-done');
                alert("修改成功");
                location.reload();
            });

            // 文件上传失败，现实上传出错。
            uploader.on( 'uploadError', function( file ) {
                var $li = $( '#'+file.id ),
                    $error = $li.find('div.error');

                // 避免重复创建
                if ( !$error.length ) {
                    $error = $('<div class="error"></div>').appendTo( $li );
                }

                $error.text('上传失败');
            });

            // 完成上传完了，成功或者失败，先删除进度条。
            uploader.on( 'uploadComplete', function( file ) {
                $( '#'+file.id ).find('.progress').remove();
            });
        });        
    </script>
</html>