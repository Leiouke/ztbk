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
				    	<div class="form-group input-group inline-middle not-null">
						    <label >报刊站点货源：</label>
						    <input type="text" name="dh_f_id" class="form-control search-items auto-not-null" >
						    <div class="input-group-btn">
	                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                <span class="caret"></span>
	                            </button>
	                            <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                        </div>
						</div>
						<div class="form-group inline-large">
						    <label >货源名称：</label>
							<input type="text" name="dh_f_department" class="form-control search-items" readonly />
						</div>               
				    </div>
				    <div class="row">
				    	<div class="form-group input-group inline-middle not-null">
						    <label >代销站点货源：</label>
						    <input type="text" name="dx_f_id" class="form-control search-items auto-not-null" >
						    <div class="input-group-btn">
	                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                <span class="caret"></span>
	                            </button>
	                            <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                        </div>
						</div>
						<div class="form-group inline-large">
						    <label >货源名称：</label>
							<input type="text" name="dx_f_department" class="form-control search-items" readonly />
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
			initialize_bsSuggest_yh_factory_by_input("${context}", "dh_f_department", "dh_f_id", "ZT02");
			initialize_bsSuggest_yh_factory_by_input("${context}", "dx_f_department", "dx_f_id", "ZT51");

			$('#save').on('click', function () {
				if(!has_null($("#form")) && !auto_not_matching($("#form"))){
					ajax_function_ask_and_close("确认新增关联？","addFactoryMapping","post",$("#form").serialize(),"新增完成！");
				}
			 });
		});
	</script>
</html>