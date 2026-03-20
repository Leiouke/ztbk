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
			   <div class="ibox-content search-content">
			   	<div class="col-xs-11">
			   	    <div class="row">
				    	<div class="form-group input-group inline-middle not-null">
						    <label >客户编号：</label>
						    <input type="text" name="c_id" class="form-control search-items" >
						    <div class="input-group-btn">
		                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
		                            <span class="caret"></span>
		                        </button>
		                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
		                    </div>
						</div>
						<div class="form-group inline-middle">
						    <label >户号(_客户名称)：</label>
						    <input type="text" name="c_name" class="form-control search-items" disabled>
						</div>       
				    </div>
				    <div class="row">
				    	<div class="form-group inline-middle not-null">
						    <label >时间段：</label>
						    <input type="text" class="form-control  layer-date search-items" name="start_date" id="start_date">
						    -
						    <input type="text" class="form-control  layer-date search-items" name="end_date" id="end_date">
						</div>  
		          		<div class="form-group input-group inline-small not-null">
	                 		<label >年月批次：</label>
	                        <input type="text" name="account_month_all" class="form-control search-items">
					        <div class="input-group-btn">
		                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
		                            <span class="caret"></span>
		                        </button>
		                        <ul class="dropdown-menu dropdown-menu-right" style="height:200px" role="menu"></ul>
	                        </div>
	                	</div>              
				    </div>
			   	</div>
               </div>
			</form>
			 
		</div><!-- sonpage-body -->
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-primary" type="button">生成</button>
	        <button id="cancel" class="btn btn-white" type="button">取消</button>
		</div>
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
		//加载时间控件
	 	$(".layer-date").each(function(){	
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		$(document).ready(function () {
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function_ask_and_close("确认生成代销结存？","createAgencyBalanceOperate","post",$("#form").serialize(),"完成！");
				}
			 });
			
			//自动搜索填补
			initialize_bsSuggest_client("${context}");
			initialize_bsSuggest_account_month("${context}");
		});
	</script>
</html>