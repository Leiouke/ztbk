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
		            <div class="search-content">
			            <form id="form" class="form-inline">
			            <div class="col-md-12">
                            	<div class="row">
                            		<div class="col-xs-2">
                            		</div>
	                            	<div class="form-group small-space col-xs-6">
				                  		<label >本次结账月度：</label>
				                        <input type="text" name="month_name" readonly> 
				                	</div>
							    </div>
	                            <div class="row">
	                            	<div class="col-xs-2">
                            		</div>
	                            	<div class="form-group textarea-group small-space col-xs-6">
				                  		<label >说明：</label>
				                  		<textarea rows="8" cols="30" name="close_memo"></textarea>
				                	</div>
							    </div>
                  		</div>
						</form>
		            </div>
       		</div>
		</div>
	</div>
	<div class="sonpage-footer">
        <button id="month_close" class="btn btn-primary" type="button">结账</button>
        <!-- <button id="clear" class="btn btn-success" type="button">清账</button> -->
	</div>
	</body>
	<!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>

	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#month_close').on('click', function () {
				if(!has_null($("#form")))
					ajax_function_ask_and_dosuccess("确认关账？","closeMonth","post",$('#form').serialize(),verifySuccess);
			 });
			//加载字典数据
			var month_close=JSON.parse('${oneJson}');
			set_one_info($("#form"),month_close);
		});
		function verifySuccess(data) {
			if (data.success){				
				layer.msg("关账完成");
				setTimeout(function (){
					location.reload();
            	   }, 1000);
        	} else {
        		alert(data.errorMsg);
        	}
        }
	</script>
</html>