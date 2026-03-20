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
	<div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
        	<div class="ibox-content search-content">
	            <form id="form_search" class="form-inline">
	            <div class="col-xs-11">
					  <div class="form-group input-group inline-small">
					    <label>财务分类：</label>
                        <select name="purchase_cw_type" class="dictionary search-items" data-id-start="f090" data-id-end="f091">
                        	<option></option>
				    	</select>
					  </div>
				 </div>
				 <div class="col-xs-1 search-group-button">
				  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
				  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
            </div>
            
            <div class="ibox-content">
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
            <div class="ibox-content search-content">
	            <form id="form" class="form-inline">
	             <div class="col-xs-12">
					  <div class="form-group input-group inline-large">
					    <label >明细备注：</label>
					    <textarea rows="3" cols="60" name="item_memo" class="form-control search-items"></textarea>
					    <input type="hidden" name="report_id" value="${param.report_id}">
					  </div>
					  <button type="button" class="btn btn-primary btn-xs" id="save">保存</button>
				 </div>
				</form>
            </div>
        </div>
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
   	  		json_obj['account_month'] ='${param.account_month}';
   	  	    json_obj['account_month_all_end'] ='${param.account_month}';
   	        json_obj['account_month_all_start'] ='${param.account_month}';
   	  		json_obj['source_type'] ='${param.source_type}';
   	        return json_obj;
		}
		
		load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}', 'account_month':'${param.account_month}', 'source_type':'${param.source_type}'});
		$(document).ready(function () {			
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"getSaleReportAgencyItemsList",${tableHeader},queryParams,"#tableTool",400);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			ajax_function_dosuccess('querySaleReportItemMemo',"post",{'report_id':'${param.report_id}'}, function(data){
				$("textarea[name='item_memo']").val(data.item_memo);
			});
			
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function_no_close("updateSaleReportItemMemo","post",$("#form").serialize(),"修改完成！");
				}
			});
			
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 json_data_list['source_type']='${param.source_type}';
				 json_data_list['account_month'] ='${param.account_month}';
				 json_data_list['account_month_all_end'] ='${param.account_month}';
				 json_data_list['account_month_all_start'] ='${param.account_month}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getSaleReportAgencyItemsList",$('#table'));
			});
	   });
	</script>
</html>