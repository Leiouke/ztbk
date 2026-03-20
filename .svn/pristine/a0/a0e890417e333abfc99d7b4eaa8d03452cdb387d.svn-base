<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="sonpage-body" style="padding-bottom:20px">
			   <form id="form" class="form-inline">
			   <div class="col-md-12">
			   	    <div class="row">
<!-- 				    	<div class="form-group input-group inline-middle">	 -->
<!-- 	                  		<label>文件名：</label> -->
<!-- 	                        <input type="text" name="tax_filename" > -->
<!-- 		                </div> -->
		                <div class="form-group input-group inline-middle not-null" >
							<label>导入文件：</label>
							<input type="file"  name="document" id="document" style = "height:30px;"> 
						</div>		                
				    	<div class="form-group input-group inline-small not-null">	
	                  		<label>应导记录数：</label>
	                        <input type="text" name="r_count" >
		                </div>		                
				    </div>
               </div>
		       </form>
			 
		</div><!-- sonpage-body -->
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-primary" type="button">新增</button>
	        <button id="cancel" class="btn btn-white" type="button">取消</button>
		</div>
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			
// 			$('#save').on('click', function () {
// 				if(!has_null($("#form"))){
// 					ajax_function_ask_and_close("确认新增退税信息?","addTaxImport","post",$("#form").serialize(),"新增完成！");
// 				}
// 			 });

			//提交按钮
			 $('#save').on('click', function () {
				 var index = parent.layer.getFrameIndex(window.name); //获取窗口索引 
				 if(!has_null($("#form"))){
					var formData = new FormData($('#form')[0]);
					if(confirm("是否新增")){
						$.ajax({
		                url: "addTaxImport",
		                data:  formData,
		                type: "Post",
		                //dataType: "formData",
		                cache: false,//上传文件无需缓存
		                processData: false,//用于对data参数进行序列化处理 这里必须false
		                contentType: false, //必须
		                success: function (data) {
		                	//console.log(data);
		                	var obj = JSON.parse(data);//转成json对象再判断
		                	//console.log(obj.success);
		                	if (obj.success){
		                		layer.msg("新增成功");        		
		                		setTimeout(function (){           		
		                            parent.layer.close(index);
		                    	   }, 1000); 
		                	} else {
// 		                		if(obj.error_msg = 11001){
// 		                			layer.msg("该投标信息已经存在, 不允许新增");
// 		                		}
		                		layer.close(index);
		                	}        	
		                },
		                error:function(data){
		                	layer.close(index);
		                	alert("请求失败!");        
		            	}
		            	})
					}
				}
			 });
		});
	</script>
</html>