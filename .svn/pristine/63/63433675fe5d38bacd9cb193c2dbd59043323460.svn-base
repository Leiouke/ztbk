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
			   <br/>
			   <input type="hidden" name="batch_id">
			   <input type="hidden" name="input_type">
			   <div class="col-md-12">
			   	    <div class="row">
				    	<div class="form-group middle-space-long-label col-xs-6 not-null">
							<label>到库日期：</label>
				           	<input type="text" id="actual_arrival_date" name="actual_arrival_date" class="search-items layer-date">
						</div>	                
				    </div>
               </div>
		       </form>
			 
		</div><!-- sonpage-body -->
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-primary" type="button">确认</button>
	        <button id="cancel" class="btn btn-white" type="button">取消</button>
		</div>
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
	var batch = dealOneJson('${oneJson}');
 	
	$(document).ready(function () {
		//加载单位类型字典
		get_dictionary('${context}',batch);
		
		//填充数据
		set_one_info($("#form"),batch);
		$("input[name='batch_id']").val(batch['batch_id']);
		$('input[name="input_type"]').val('2');
		
		//加载时间控件
		 $(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
			
		$('#save').on('click', function () {
			if(!has_null($("#form"))){
				ajax_function_ask_and_close("是否确认?","confirmDhBatch","post",$("#form").serialize(),"确认到库！");
			}
		});
	});
	</script>
</html>