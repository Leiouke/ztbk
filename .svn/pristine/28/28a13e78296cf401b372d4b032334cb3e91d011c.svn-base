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
               <input type="hidden" name="zs_id"/>
               <input type="hidden" name="zs_pop" value="${param.zs_pop}"/>
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
               </div>
		       </form>
			 
		</div><!-- sonpage-body -->
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-primary" type="button">保存</button>
	        <button id="cancel" class="btn btn-white" type="button">取消</button>
		</div>
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
		function get_item_political_funtion(data) {
			$("textarea[name='pages']").val(data['pages']);
			$("textarea[name='text_title']").val(data['text_title']);
			$("textarea[name='text_chinese']").val(data['text_chinese']);
			$("textarea[name='text_describe']").val(data['text_describe']);
	    }	
	
		$(document).ready(function () {
			var politicalCheckItem = JSON.parse('${oneJson}');		
			//填写已有数据
			set_one_info($("#form"), politicalCheckItem);
			
			// 有换行可能的文本框回填 必须得使用单独的后台调用模式
			ajax_function_dosuccess('queryPoliticalCheckItem',"post",{'ItemExclusiveCode':'${param.ItemExclusiveCode}', 'zs_id': '${param.zs_id}'}, get_item_political_funtion);
			
			var text_type_str = politicalCheckItem.text_type;
			var text_type_array = text_type_str.split(',');
			
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
		        		// 假如包含就选中状态
		        		if ($.inArray(dic_info.code, text_type_array) >= 0) {
		        			item="<input type='checkbox' value='"+dic_info.code+"' name='text_type' checked>"+dic_info.remark + "</br>";
		        		} else {
		        			item="<input type='checkbox' value='"+dic_info.code+"' name='text_type'>"+dic_info.remark + "</br>";
		        		}
		        		$select.append(item);
		        	})
		        },
		        error:function(data){	
		        	alert("请求失败!");	
		        }
		    });
			
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
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
					ajax_function_ask_and_close("确认修改政审关联明细?","editPoliticalCheckItem","post",$("#form").serialize(),"修改完成！");
				}
			})
		});
	</script>
</html>