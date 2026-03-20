<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <style type="text/css">
	    	/*table里面的文本框css*/
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
	            <div class="ibox-title">
	                <h5>出库明细</h5>
	                <div class="ibox-tools">
	                    <a class="collapse-link">
	                        <i class="fa fa-chevron-up"></i>
	                    </a>
	                </div>
	            </div>
	            <div class="ibox-content ibox-content-table">
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
	</div>
	<div class="sonpage-footer">
	    <button id="commit" class="btn btn-primary" type="button">出库确认</button>
	    <button id="cancel" class="btn btn-white" type="button">取消</button>
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
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
	function queryParams(param) {
		var json_obj = {};
		json_obj['limit'] =param.limit;
		json_obj['offset'] =param.offset;
		json_obj['sortName'] =this.sortName;
		json_obj['sortOrder'] =this.sortOrder;
		json_obj['sortOrder'] =this.sortOrder;
		json_obj['downshelf_id'] ='${downshelf_id}';
	    return json_obj;
	}
	
	//修改后刷新表格并汇总
	function end_function(index, layero){
		load_sum_list("${context}/csu/getTableCollectDataBK",{'queryId':'${queryId}','downshelf_id':'${downshelf_id}'},$table);
 	}
	
	var $table = $('#table');
	load_sum_list_first("${context}/csu/getTableCollectDataBK",{'queryId':'${queryId}','upshelf_id':'${upshelf_id}'});
	$(document).ready(function () {
		
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		$('#commit').on('click', function () {
			
			ajax_function_ask_and_close("是否确认？","confirmOutBoundToShelves","post",{'downshelf_id':'${downshelf_id}'},'确认成功');
			
		});
		
		//加载字典数据
		get_dictionary("${context}",null);
		//bootstrap初始化		
		initialize_table_editable($table,"getOutBoundShelvesConfirmList",${tableHeader},queryParams,"#tableTool",550,"editOutBoundItem");
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		//重写config方法，否则重新刷新会同时刷新guid
		function table_column_config_layer($config,type,title,url,$table){
			$config.on('click', function () {
				  parent.layer.open({
		              type: 2,
		              title:title,
		              moveOut:true,
		              area: ['820px', '580px'],
		              skin: 'layui-layer-rim', //加上边框
		              content: url,
		              end:function () {
		            	  $table.bootstrapTable('refresh');
		            	  //location.reload();
		              }
		          }); 				
			 });
		}
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
	});
	
// 	//编辑页面
// 	 function toEdit(ItemExclusiveCode){
// 		 var downshelf_id = '${downshelf_id}';
// 		 open_layer_end(2,'商品下架','outBoundUpshelfItemEdit?ItemExclusiveCode='+ItemExclusiveCode+'&downshelf_id='+downshelf_id,['600px', '350px'],false,end_function)
// 	 }	
	
// 	function renderOperator(value,row,index){
// 		var str = "";
// 		str += "<a onclick=\"toEdit('" + row.ItemExclusiveCode + "')\">编辑</a>"
// 		str += "&nbsp;&nbsp;";
// 		return str;
// 	}
	</script>
</html>