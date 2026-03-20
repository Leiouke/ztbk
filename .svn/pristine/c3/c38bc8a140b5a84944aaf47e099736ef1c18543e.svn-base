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
            <div class="ibox-title">
                <h5>查询</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content search-content">
	            <form id="form_search" class="form-inline">
	            <div class="col-xs-11">
					  <div class="form-group input-group inline-middle">
						    <label >客户编号：</label>
						    <input type="text" name="c_id" class="form-control search-items" >
						    <div class="input-group-btn">
	                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                <span class="caret"></span>
	                            </button>
	                            <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                        </div>
					  </div>
					  <div class="form-group inline-large">
						    <label >户号(_客户名称)：</label>
						    <input type="text" name="c_name" class="form-control search-items" disabled>
					  </div>
					  <div class="form-group inline-small">
							  <label >开票号(多个)：</label>
							  <textarea rows="3" cols="15" name="kp_nos" class="form-control search-items"></textarea>
					  </div>
				 </div>
				 <div class="col-xs-1 search-group-button">
					  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
					  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins" style="margin-bottom:0px">
            <div class="ibox-title">
                <h5>发票明细</h5>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
	        			<div class="btn-group hidden-xs" id="tableTool_result" role="group">	                                    
		                    <button type="button" class="btn btn-outline btn-default" id="config">
		                        <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
		                    </button>
	                    </div>                         
	                    <table id="table_result" data-mobile-responsive="true">
	                        
	                    </table>
                    </div>
                </div>                
                <div class="row row-lg" style="margin-top: 5px;text-align: center;">
                		<button type="button" class="btn btn-primary" id="select_in">选择</button>
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
    	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
    	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
		$table_result=$("#table_result");
		function queryParams_result(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	  		//json_obj['c_id'] =parent.$("input[name='c_id']").val();
   	        return json_obj;
		}
		
		function renderOperator(value,row,index){
			return "-";
		}
		
		$(document).ready(function () {
			$("input[name='c_id']").val(parent.$("input[name='c_id']").val());
			$("input[name='c_name']").val(parent.$("input[name='c_name']").val());
			//加载字典数据		
			$('#commit').on('click', function () {
				var item_codes = $.map($table_pull_in.bootstrapTable('getData'), function (row) {
	                return row.item_code;
	            });
				if(item_codes.length!=0)
					ajax_function_ask_and_close("确认引入？","pullInvoiceDhItem","post",{'item_codes':item_codes},'引入成功');
				else
					layer.msg("未选择明细！");
			});
			//bootstrap初始化
			initialize_table($table_result,"getPayableSaleInvoiceList",${tableHeader},queryParams_result,"#tableTool_result",350);
			$("#select_in").on('click', function () {
				var has_all_pull_in=true;
				$.each($('#table_result').bootstrapTable('getSelections'),function(index,result_row){
					var has_pull=false;
					$.each(parent.$('#table').bootstrapTable('getData'),function(index,row){
					 	if(row.kp_id==result_row.kp_id){
					 		has_pull=true;
					 		has_all_pull_in=false;
					 	}
				 	});
					if(!has_pull)
						parent.$('#table').bootstrapTable('append',result_row);
				});
				if(!has_all_pull_in)
					layer.msg("有明细已经添加！");
				//layer.msg("操作成功");
				close_layer();
			});
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			initialize_bsSuggest_client("${context}");
			
			$("#search").on('click',function(){
				var json_data_list=formToJson($("#form_search"));
				json_data_list['queryId']='${queryId}';
				search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getPayableSaleInvoiceList",$table_result);
		    });
	     });
	</script>
</html>