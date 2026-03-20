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
			   <form id="form" class="form-inline" enctype="multipart/form-data">
			   <input type="hidden" name="ItemExclusiveCode" value="${param.ItemExclusiveCode}"/>
               <input type="hidden" name="qk_dh_id" value="${param.qk_dh_id}"/>
               <input type="hidden" name="h_id" value="${param.h_id}"/>
			   <div class="col-md-12">
			   	    <div class="row">
				    	<div class="form-group large-space col-xs-6 not-null">	
	                  		<label>页码：</label>
	                        <textarea rows="3" name="pages"></textarea>
		                </div>		                
				    	<div class="form-group large-space col-xs-6">	
	                  		<label>问题文章标题：</label>
	                        <textarea rows="3" name="text_title"></textarea>
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group large-space col-xs-6">	
	                  		<label>问题文章中文译名：</label>
	                        <textarea rows="3" name="text_chinese"></textarea>
		                </div>  
				    	<div class="form-group large-space col-xs-6">	
	                  		<label>问题描述：</label>
	                        <textarea rows="3" name="text_describe"></textarea>
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group large-space-checkbox col-xs-12 not-null">	
	                  		<label>问题分类：</label>
	                        <div id="classify">

                            </div>
		                </div>  
				    </div>
				    <!-- <div class="row">
				    	<div class="form-group large-space col-xs-8">	
	                  		<label>附件：</label>
	                        <input type="file" name="file" id="file" style = "height:30px;"/>
		                </div>  
				    </div> -->
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
			// 渲染 问题分类 多选框
			var $select=$("#classify");
			$.ajax({
		        url: "../../system/getUsingDictionaryList", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: {"directoryId":73},
		        success: function (data) {
		        	$.each(data,function(dic_index,dic_info){
		        		var item="";
		        		item="<input type='checkbox' value='"+dic_info.code+"' name='text_type'>"+dic_info.remark + "</br>"
		        		$select.append(item);
		        	})
		        },
		        error:function(data){	
		        	alert("请求失败!");
		        }
		    });
			
			$('#save').on('click', function () {
				if(!has_null($("#form"))) {
					var hasCheck = false;
					$("input[name='text_type']").each(function() {
			        	if ($(this).is(':checked')) {
			        		hasCheck = true;
			        	}
			        });
					// 问题分类必须得选择1个
					if (!hasCheck) {
						alert("请选择问题分类！");
						return;
					}
					ajax_function_ask_and_close("确认新增政审关联明细?","addPoliticalCheckItem","post",$("#form").serialize(),"新增完成！");
				}
			})
			
			// 以下是带文件上传的保存
			/*$('#save').on('click', function () {
				if(!has_null($("#form"))){
					var formData = new FormData($('#form')[0]);
					
					if(confirm("是否新增?")){
						var index = layer.load(1, {
							  shade: [0.1,'#fff'] //0.1透明度的白色背景
						});
						$.ajax({
			                url: "addPoliticalCheckItem",
			                data:  formData,
			                type: "Post",
			                //dataType: "formData",
			                cache: false,//上传文件无需缓存
			                processData: false,//用于对data参数进行序列化处理 这里必须false
			                contentType: false, //必须
			                success: function (data) {
			                	var obj = JSON.parse(data);//转成json对象再判断
			                	if (obj.success){
		    	        			layer.close(index);
		    	        			layer.msg("新增成功！");
		    	    	        	setTimeout(function (){
		    	                		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
		    	                        parent.layer.close(index);//something you want delayed
		    	                	   }, 1000); // how long do you want the delay to be?
			    	        	} else {
			    	        		layer.close("新增失败");
			    	        		layer.msg(data.errorMsg);
			    	        	}
			                },
			                error:function(data){
			                	parent.layer.close(index);
			                	alert("请求失败!");        
			            	}
			            })
					}
				}
			 });*/
		});
		
		
	</script>
</html>