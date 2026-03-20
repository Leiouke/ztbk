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
	    <style type="text/css">
	    .ibox-content-table input[type='text']{
	    	width:70px;
	        text-align: right;
	    }
	    </style>
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
       		<div class="ibox float-e-margins">
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
        </div>       			
		</div>
	</div>
	<div class="sonpage-footer">
		<button id="cancel" class="btn btn-white" type="button">取消</button>
	</div>
	<div class="sonpage-footer-left">
        <button id="updateRackNo" class="btn btn-info" type="button">统一修改架号</button>
        <button id="batchOnshelves" class="btn btn-info" type="button">统一上架</button>
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
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
		function queryParams(param) {
			var json_other_in_bound = {};
			json_other_in_bound['limit'] =param.limit;
			json_other_in_bound['offset'] =param.offset;
			json_other_in_bound['sortName'] =this.sortName;
			json_other_in_bound['sortOrder'] =this.sortOrder;
			json_other_in_bound['bi_id'] = '${param.bi_id}';
		    return json_other_in_bound;
		}
		var $table = $('#table');

		$(document).ready(function () {
			//bootstrap初始化
			initialize_table_editable($table,"getBackIssueInBoundDetailList", ${tableHeader}, queryParams, "#tableTool", 550, "backIssueInBoundItemUpdate");			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			button_click_layer_refresh($('#updateRackNo'),2,"统一修改架号",'toBackIssueInBoundItemRackNoUpdate?bi_id=${param.bi_id}',$table,false,['350px', '200px']);
			
			$("#batchOnshelves").click(function(){
				var item_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
	                return row.id;
	            });
				
				if(item_ids.length!=0) {
					ajax_function_ask_and_refresh("确认统一上架？","batchBackIssueInBoundItemOnShelves","post",{'ids':item_ids, bi_id: '${param.bi_id}'}, '统一上架完成！',$table);
				} else {
					layer.msg("未选择明细！");
				}
			});
		});
		
		function toShelves(bi_id, id){
			layer.confirm('确认上架？', {
				  btn: ['确认','取消'] //按钮
				}, function(index){
					ajax_function_refresh('backIssueInBoundItemOnShelves','post',{'bi_id': bi_id, 'id': id},'上架成功!',$table);
				});
	 	}
		
		function renderOperator(value,row,index){
			var str = '';
			if(!row.is_onshelves)
				 str += "<a onclick=\"toShelves('" + row.bi_id + "','" + row.id +"')\">上架</a>";
			return str;
		}
	</script>
</html>