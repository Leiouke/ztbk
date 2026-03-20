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
<!-- 	                    	<button type="button" class="btn btn-outline btn-default" id="add"> -->
<!--                                 <i class="glyphicon glyphicon-plus" aria-hidden="true"></i> -->
<!--                        	    </button>  -->
<!--                        	    <button type="button" class="btn btn-outline btn-default" id="delete_items"> -->
<!-- 	                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i> -->
<!-- 	                        </button> -->
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
            <div class="sonpage-footer">
			    <button id="ff_commit" class="btn btn-primary" type="button">分发确认</button>
			    <button id="cancel" class="btn btn-white" type="button">取消</button>
			</div>
            <div class="sonpage-footer-left">
	            <!--<button id="save" class="btn btn-primary" type="button">保存</button>-->
	            <button id="tt_commit" class="btn btn-success" type="button">打印贴头</button>
	            <button id="onshelf_commit" class="btn btn-success" type="button">打印上架单</button>
	        </div>
<!--         </div> -->
<!--     </div> -->
    
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
		

		function end_function(index, layero){
			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','batchid':'batch_id'},$table);
		}
		
		load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}', 'qk_dh_id': '${param.qk_dh_id}'});
		$(document).ready(function () {			
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"getPaperDhItemList",${tableHeader},queryParams,"#tableTool",600);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			var $add=$("#add");
			button_click_windows_end($add,2,"引入发票明细",'dhBatchItemPull',true,['750px', '580px'],end_function);
			
			if(${param.dh_flag} == "1"){
				$('#ff_commit').hide();
			}
			
			$('#ff_commit').on('click', function () {
				var qk_dh_id ='${param.qk_dh_id}';
				ajax_function("magffCommit","post",{'qk_dh_id':qk_dh_id},'分发确认成功');
			 });
			
			$('#onshelf_commit').on('click', function () {
				var qk_dh_id ='${param.qk_dh_id}';
				ajax_function("magOnshelfCommit","post",{'qk_dh_id':qk_dh_id},'生成上架单成功');
			 });
			
			$('#tt_commit').on('click', function () {
				var qk_dh_id ='${param.qk_dh_id}';
				ajax_function("qkDhttCommit","post",{'qk_dh_id':qk_dh_id},'贴头打印成功');
			 });
			
			
			
// 			$('#delete_items').on('click',function(){
// 				var inv_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
// 	                return row.inv_id;
// 	            });
// 				if(inv_ids.length!=0) {
// 					ajax_function_ask_and_dosuccess("确认删除？","deleteDhBatchItem","post",{'inv_ids':inv_ids},load_table_data_success);
// 				} else {
// 					layer.msg("未选择明细！");
// 				}
// 			});
	   });
		
		function load_table_data_success(data){
			if (data.success){
	   			layer.msg("操作成功！");
	   			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','qk_dh_id':'qk_dh_id'},$table);
	    	} else {
	    		layer.msg(data.errorMsg);
	    	}
		}
		
// 		function toff(ItemExclusiveCode){
// 			open_layer_refresh(2,'明细分发修改','toMagffEdit?ItemExclusiveCode='+ItemExclusiveCode,$table,['750px', '500px'],true);
// 		}
		
// 		function toff(ItemExclusiveCode,mail_code){
// 			open_layer_refresh(2,'明细分发修改','toMagffEdit?ItemExclusiveCode='+ItemExclusiveCode+'&mail_code_one='+mail_code,$table,['750px', '500px'],true);
// 		}

		function toff(ItemExclusiveCode,period_id,ps_date,subscribe_date,h_amount_dh){
			open_layer_refresh(2,'明细分发修改','toMagffEdit?ItemExclusiveCode='+ItemExclusiveCode+'&period_id='+period_id+'&ps_date='+ps_date+
					'&subscribe_date='+subscribe_date+'&h_amount_dh='+h_amount_dh,$table,['750px', '500px'],true);
		}
		
		function renderOperator(value,row,index){
			var str = "";
			
			var ps_date_type = new Date(row.ps_date);
			var ps_date = getSmpFormatDate(ps_date_type, false);
			var subscribe_date_type = new Date(row.subscribe_date);
			var subscribe_date = getSmpFormatDate(subscribe_date_type, false);
			if(row.ps_date==undefined){
				ps_date = "";
			}
			if(row.subscribe_date==undefined){
				subscribe_date = "";
			}
			
			//str += "<a onclick=\"toff('"+row.ItemExclusiveCode+"','"+row.mail_code+"')\">分发</a>";
			
			str += "<a onclick=\"toff('"+row.ItemExclusiveCode+"','"+row.period_id+"','"+ps_date+"','"+subscribe_date+"','"+row.h_amount_dh+"')\">分发</a>";
			
			return str;
		}
	</script>
</html>