<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String context = request.getContextPath();
	request.setAttribute("context",context);
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
	<!-- <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>报表明细列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div> -->
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
	                    <div class="btn-group hidden-xs" id="tableTool" role="group">
	                    	<button type="button" class="btn btn-outline btn-default" id="add">
                                <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
                            </button>
                            <button type="button" class="btn btn-outline btn-default" id="upload">
                                <i class="glyphicon glyphicon-import" aria-hidden="true"></i>
                       	    </button>
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
        <!-- </div>
    </div> -->
    
    <div class="sonpage-footer">
		<button id="batchCheckPass" class="btn btn-success" type="button">批量审读通过</button>	                  
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
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
    
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">			
		var $table = $('#table');
		
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	  		json_obj['qk_dh_id'] ='${param.qk_dh_id}';
   	        return json_obj;
		}
		
		load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}'});
		$(document).ready(function () {			
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"getProxyDeliveryOrderItemsList",${tableHeader},queryParams,"#tableTool",600);
			
			var $toAdd=$("#add");
			// 类型2代表打开的是新页面, 类型1代表打开的是本页面元素
			button_click_layer_refresh($toAdd,2,"新增代理到货明细",'proxyDeliveryOrderItemAdd?qk_dh_id=${param.qk_dh_id}',$table,false,['600px', '500px']);
			
			//打开上传页面
			var $upload=$("#upload");
			button_click_layer_refresh($upload,2,"上传任务明细",'proxyDeliveryOrderItemUploadAdd?qk_dh_id=${param.qk_dh_id}',$table,false,['750px', '280px']);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
	    });
		
		function toPoliticalCheck(qk_dh_id, ItemExclusiveCode) {
			open_layer_refresh(2,'审读','proxyItemPoliticalCheck?qk_dh_id=' + qk_dh_id + '&ItemExclusiveCode=' + ItemExclusiveCode,$table,['750px', '500px'],true);
		}
		
		function toDel(qk_dh_id, ItemExclusiveCode){
			ajax_function_ask_and_refresh("确认删除？","deleteProxyDeliveryOrderItem","post",{'qk_dh_id':qk_dh_id, 'ItemExclusiveCode': ItemExclusiveCode},"删除成功！", $table);
		}
		
		function renderOperator(value,row,index) {
			var str="";
			str += "<a onclick=\"toPoliticalCheck('" + row.qk_dh_id + "','" + row.ItemExclusiveCode + "')\">审读</a> ";
			str += "<a onclick=\"toDel('"+row.qk_dh_id + "','" + row.ItemExclusiveCode + "')\">删除</a> ";
			return str;
		}
		
		$("#batchCheckPass").on('click',function() {
			// 代销source_type为01
			var item_ids= $.map($table.bootstrapTable('getSelections'), function (row) {
                return {'qk_dh_id':row.qk_dh_id,'ItemExclusiveCode':row.ItemExclusiveCode, 'zs_pop':row.zs_pop, 'zs1_result':1};
            });
			
			if(item_ids.length != 0) {
				//ajax_function_ask_and_close_json_data("确认引入?","importDeliveryOrder","post",JSON.stringify(item_ids),"引入完成!");
				
				ajax_function_ask_and_refresh_postdata("确认批量审读通过?","batchPoliticalCheckPass","post",JSON.stringify(item_ids),"批量审读完成！",$table)
				
				// 点了之后 按钮让他灰一段时间, 设定3秒, 保证不会连续提交
				$("#batchCheckPass").attr("disabled", true);
				setTimeout(function() {
					$("#batchCheckPass").attr("disabled", false);
				}, 3000);
			} else {
				layer.msg("未选择明细！");
			}
		});
	</script>
</html>