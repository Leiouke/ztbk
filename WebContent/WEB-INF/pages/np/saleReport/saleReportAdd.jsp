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
				    	<div class="form-group large-space col-xs-12 not-null">	
	                  		<label>报表描述：</label>
	                        <input type="text" name="report_description" >
		                </div>		                
				    </div>
				    <div class="row">
				    	<div class="form-group small-space col-xs-4">	
	                  		<label>报表类型：</label>
	                        <select name="report_type" class="dictionary" >
					    	</select>
		                </div>  
		                <div class="form-group small-space col-xs-4 not-null">
		       				<label >报表年月：</label>
		             		<input type="text" name="account_month">
							<div class="input-group-btn">
			                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
			                      	<span class="caret"></span>
			                    </button>
			                    <ul class="dropdown-menu dropdown-menu-right" style="height:200px" role="menu"></ul>
			                </div>
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
			//加载字典数据
			get_dictionary("${context}",null);
			initialize_bsSuggest_account_month_not_close("${context}");  // 加载没有被关闭的年月

			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function_ask_and_close("确认新增报表？","addSaleReport","post",$("#form").serialize(),"新增完成！");
				}
			 });
		});
	</script>
</html>