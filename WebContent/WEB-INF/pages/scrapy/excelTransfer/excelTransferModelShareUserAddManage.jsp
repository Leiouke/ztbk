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
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form" class="form-inline">
							<div class="col-xs-12">
								<div class="form-group input-group inline-small not-null">
					    			<label >使用人：</label>
					    			<input type="text" name="user_name" id = "user_name" class="form-control search-items">
					    		<div class="input-group-btn">
	                        		<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            		<span class="caret"></span>
	                       			 </button>
	                       			 <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        		</div>
                        		<input type="hidden" name="user_code" id = "user_code" class="form-control search-items">
					  			</div>
					  		</div>
							<div class="form-group input-group middle-space col-xs-12" style="display:none">
								<label >模版编号：</label>
								<input type="text" name="template_no" id = "template_no" class="search-items" value = '${param.template_no}'>
							</div>
						</form>
		            </div>
       		</div>       			
		</div>
	</div>
	<div class="col-xs-12"  style = "text-align:center">
	    <button id="save" class="btn btn-primary" type="button">新增</button>
	    <button id="cancel" class="btn btn-white" type="button">取消</button>
	</div>
	</body>
	<!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>


    <!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
		
		$(document).ready(function () {
			
			$('#save').on('click', function () {
				
				if(!has_null($("#form"))){
					ajax_function_ask_and_close("是否新增？","addExcelTransferModelShareUser","post",$('#form').serialize(),'新增成功');
				}
			});
			
			initialize_bsSuggest_user("${context}", "user_name", "user_code");      // 放用户信息
		});
	</script>
</html>