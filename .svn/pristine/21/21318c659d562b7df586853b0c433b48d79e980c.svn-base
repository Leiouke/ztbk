<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="h_importResource.jsp"></jsp:include>
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
	                            	<div class="form-group large-space col-xs-12">
				                  		<textarea rows="12" cols="80" name="help_content"></textarea>
				                	</div>
							    </div>
							    <div class="row">
							    	<button id="save" class="btn btn-primary" type="button">保存</button>
							    	<input type="hidden" name="jsp_address" value="${param.jsp_address}" />
							    </div>
                  		</div>
						</form>
		            </div>
       		  </div>
		    </div>
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
			$('#save').on('click', function () {
				if(!has_null($("#form")))
					ajax_function_ask_and_close("确认保存？","updateHelp","post",$('#form').serialize(),"帮助已保存！");
			 });
			
			//加载字典数据
			var content_str='${oneJson}';
			content_str=content_str.replace(/\r\n/g,"\\r\\n");
        	content_str=content_str.replace(/\n/g,"\\n");
			content_str=content_str.replace(/\s/g," ");
			
			if (content_str != '') {
				var content=JSON.parse(content_str);
				
				set_one_info($("#form"),content);
			}

			// 只有超级管理员才可以维护
			if ('${sessionScope.user.account}' != 'wkh') {
				$('#save').hide();
			}
		});
	</script>
</html>