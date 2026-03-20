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
	    <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	</head>
	<body>
		<div class="sonpage-body-small">
			<div class="col-md-12"> 
                            <div class="panel-body">
	                            <div class="row row-lg">                    
					                    <div class="col-sm-12">
					                                <div class="btn-group hidden-xs" id="tableTool" role="group">
					                                    <button type="button" class="btn btn-outline btn-default" id="config">
					                                        <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
					                                    </button>
					                                   <select class="form-control" >
					                                   		<option value="all">导出全部</option>
											                <option value="basic">导出当页</option>	
											            </select>
					                                </div>
					                                <table id="table" data-mobile-responsive="true">
					                                    
					                                </table>
					                    </div>
					            </div>
                            </div><!-- panel-body -->
			 </div>
		</div><!-- sonpage-body -->
		<div class="sonpage-footer">
		              <button id="cancel" class="btn btn-white" type="button">返回</button>
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
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script> 

	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
		var $table = $('#table');
		var json_data_list={};
		json_data_list['fh_id'] =parent.$("input[name='fh_id']").val();
		json_data_list['queryId']='${queryId}';
		//search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getSendOutPoolSum",$table);
		load_sum_list_first("${context}/csu/getTableCollectData",json_data_list);
		$(document).ready(function () {
			function queryParams(param) {
				var json_obj ={};
				json_obj['limit'] =param.limit;
				json_obj['offset'] =param.offset;
				json_obj['sortName'] =this.sortName;
				json_obj['sortOrder'] =this.sortOrder;
				json_obj['fh_id'] =parent.$("input[name='fh_id']").val();
			    return json_obj;
			}			
			//bootstrap初始化			
			initialize_table($table,"getFinanceAgentClient",${tableHeader},queryParams,"#tableTool",500);
			//表格配置 layer
			var $config=$("#config");			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			//导出选择
			$("tableTool").find('select').change(function () {
				$table.bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
		});
	</script>
</html>