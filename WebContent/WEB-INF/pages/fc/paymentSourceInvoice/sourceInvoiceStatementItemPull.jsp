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
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
	<div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-content search-content">
	            <form id="form_search" class="form-inline">
	            <div class="col-xs-11">
					  <div class="form-group input-group inline-middle">
						<label >货源编号：</label>
 						<input type="text" name="f_id" id="f_id" class="form-control search-items" >
						<div class="input-group-btn">
                          <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                              <span class="caret"></span>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
					  </div>
					  <div class="form-group inline-large">
					    <label >货源名称：</label>
					    <input type="text" name="f_department"  id="f_department"  class="form-control search-items" disabled>
					  </div>
					  <div class="form-group inline-middle">
					  	<label >来源单号：</label>
					    <input type="text" name="source_no" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >创建日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_date_start" id="input_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_date_end" id="input_date_end">
					  </div>
				 </div>
				 <div class="col-xs-1 search-group-button">
				  	<button type="button" class="btn btn-primary btn-xs" id="search_pull_items">查询</button>
				  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins" style="margin-bottom:0px">
            <div class="ibox-title">
                <h5>查询结果明细</h5>
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
                <div class="row row-lg" style="margin-top: 5px;text-align: center;">
               		<button type="button" class="btn btn-success" id="commit">提交</button>
                </div>
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
    <!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
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
   	        return json_obj;
		} 
		
		var cash_register_str='${oneJson}';
		cash_register_str=cash_register_str.replace(/\r\n/g,"\\r\\n")  
		cash_register_str=cash_register_str.replace(/\n/g,"\\n");
		cash_register_str=cash_register_str.replace(/\s/g," ");
		var cash_register=JSON.parse(cash_register_str);

		$(document).ready(function () {
			

			//填写已有数据
			set_one_info($("#form_search"),cash_register);
			
			//加载字典数据
			get_dictionary("${context}",null);
			
			 inistal_data('#input_date_start','#input_date_end');
			 //$("input[name='c_id']").val(parent.$("input[name='c_id']").val());
			 //$("input[name='c_name']").val(parent.$("input[name='c_name']").val());
			//加载字典数据
			//get_dictionary("${context}",null);			
			$('#commit').on('click', function () {
				var so_ids_money= $.map($table.bootstrapTable('getSelections'), function (row) {
	                return {'ps_id':row.ps_id, 'c_real_money':row.no_c_real_money, 'real_money':row.no_real_money};
	            });
				if(so_ids_money.length!=0) {
					ajax_function_ask_and_close_json_data("确认引入？","pullSourceInvoiceItem","post",JSON.stringify(so_ids_money),'引入成功');
				} else {
					layer.msg("未选择明细！");
				}
			});

			//bootstrap初始化
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",600);
			
			//表格配置 layer
			var $config=$("#config");
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {				 
				$('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });	
			
			$("#search_pull_items").on('click', function () {
				var json_data_list=formToJson($("#form_search"));
				json_data_list['queryId']='${queryId}';
				search_sum_list("${context}/csu/getTableCollectData", json_data_list, "getSourceInvoiceStatementItemPullList", $table);
			});
			
			//自动搜索填补
			initialize_bsSuggest_fc_factory("${context}", "f_department", "f_id");
	     });
	</script>
</html>