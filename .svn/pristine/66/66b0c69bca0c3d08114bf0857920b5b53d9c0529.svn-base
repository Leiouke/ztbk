<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
		<div style="padding:20px;">
			<div class="col-md-12">
			   <form id="form" class="form-horizontal">
			   <input type="hidden" name="messageType" value="公告">
			        <div class="form-group" style="width:650px">
			        		<div class="input-group">
						      <div class="input-group-addon control-label">标题：</div>
						      <div>						      
							    <input type="text" name="title" class="form-control">
							  </div>	
						    </div>
			         </div>
			         <div class="form-group">
						    <div class="input-group">
						      <div class="input-group-addon control-label">内容：</div>
						      <div>						      
							    <script id="editor" type="text/plain" style="width:580px;height:300px;">
								</script>
							 </div>
						    </div>
					</div>
			        <div class="form-group" >
				                 <div>
			                     <button id="save" class="btn btn-primary" type="button">发布</button>
			                     <button id="cancel" class="btn btn-white" type="button">取消</button>
		                     	 </div>
		            </div>
		       </form>
			 </div>
		</div>
	</body>
	<!-- 配置文件 -->
    <script type="text/javascript" src="${context}/js/plugins/ueditor/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${context}/js/plugins/ueditor/ueditor.all.js"></script>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript">
			    //实例化编辑器
			  var ue = UE.getEditor('editor',{
				  textarea:'content'
			  });
	</script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#save').on('click', function () {
				$.ajax({ 
			        url: "sendNotice", 
			        method: "post",
			        dataType: "json",
			        traditional:true,
			        //传送请求数据
			        data: $('#form').serialize(),
			        success: function (data) { 
			        	layer.msg('发布成功');
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
	</script>
</html>