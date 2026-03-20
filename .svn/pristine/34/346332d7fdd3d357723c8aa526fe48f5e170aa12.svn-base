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
		<div class="sonpage-body">
			<div class="col-md-12">
			   <form id="form" class="form-inline">
                <div class="panel-body">
                      <div class="col-sm-6 form-horizontal">
	                 	<div class="row">                    
			                <div class="col-sm-12 form-horizontal">		
			                    <!-- <div class="form-group">
					                 <label class="col-sm-3 control-label">导出开票批次号：</label>
					                 <div class="col-sm-9">
					                 	<input type="text" id="kp_batch_id" name="kp_batch_id" class="form-control">
					                 </div>
						        </div>	  -->  		
						        <div class="form-group">
					                 <label class="col-sm-3 control-label">文件：</label>
					                 <div class="col-sm-9">
					                 	<input type="file" id="excel" name="excel" class="form-control">
					                 </div>
						        </div>
						        <div class="form-group" >
					                 <div class="col-sm-offset-3 col-sm-9">
					                     <button id="upload" class="btn btn-success" type="button">导入开票</button>
					                     <a href="${context}/download/downloadTemplate?filename=batchKp">
					                     <button class="btn btn-success" type="button">下载模板</button></a>
			                     	 </div>
					            </div>
			               </div>
			           	</div>
	                 </div>      	
                  </div>
		       </form>
			 </div>
		</div><!-- sonpage-body -->
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	   <!-- ajaxfileupload-->
	<script src="${context}/js/plugins/ajaxfileupload/ajaxfileupload.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			//上传Excel文件
			 $('#upload').on('click', function () {
				 /*if ($("#kp_batch_id").val()=="" || $("#kp_batch_id").val()==null) {
					 alert("请填写导出开票批次号!");
					 return;
				 }*/
				 
				 var index = layer.load(1, {
					  shade: [0.1,'#fff'] //0.1透明度的白色背景
				 });

				 $.ajaxFileUpload({ 
						url:'uploadKpBatch',			  
				        secureuri:false,
				        method:'post',
				        fileElementId:'excel',	//与页面处理代码中file相对应的ID值
				        dataType: 'json',		//返回数据类型:text，xml，json，html,scritp,jsonp五种
				        //elementIds: ["flag"], //传递参数到服务器 没办法 这个无效了
				        success: function (returnData){
							  if(returnData.success==false){
								   layer.close(index);
								   layer.msg("数据有误, 请检查数据!");
							  }else {
								  // 假如返回明细检查都通过的话, 下面才是真正的业务逻辑
								  ajax_function_dosuccess("addKpItems","post",{},query_success);
				  			}
				        },
				        error: function (data,status,e){
				        	layer.close(index);
				        	layer.msg("数据有误");	
				        }
				});	
				 
				 function query_success(data){
					 layer.close(index);
					 layer.msg("完成批量导入发票号！");
					 close_layer();
		    	}
			 });
		});
	</script>
</html>