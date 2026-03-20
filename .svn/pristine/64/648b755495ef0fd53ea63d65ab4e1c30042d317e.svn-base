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
			   <div class="float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form_search" class="form-inline">
			            <div class="col-xs-11">
				            <div class="row">
							  <div class="form-group input-group inline-small">
								    <label >记账年月： 从</label>
								    <input type="text" name="account_month_all_start" class="form-control search-items">
								    <div class="input-group-btn">
	                                       <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                           <span class="caret"></span>
	                                       </button>
	                                       <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
		                            </div>
							  </div>
							  <div class="form-group input-group inline-small">
								    <label >到</label>
								    <input type="text" name="account_month_all_end" class="form-control search-items">
								    <div class="input-group-btn">
	                                       <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                           <span class="caret"></span>
	                                       </button>
	                                       <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
		                            </div>
							  </div>
							  <div class="form-group inline-small">
								    <label>财务分类：</label>
			                        <select name="purchase_cw_type" class="form-control dictionary search-items" >
			                        	<option></option>
							    	</select>
							  </div>			
							  <div class="form-group input-group inline-middle">
							    <label >货源编号：</label>
							    <input type="text" name="f_id" class="form-control search-items" >
							    <div class="input-group-btn">
	                                <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                    <span class="caret"></span>
	                                </button>
	                                <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                                </div>
							  </div>
							  <div class="form-group inline-large">
								    <label >货源名称(_户号)：</label>
								    <input type="text" name="f_name" class="form-control search-items" disabled>
							  </div>						  					  
							</div>
						 </div>
						 <div class="col-xs-1 search-group-button">
						    <button type="button" class="btn btn-primary btn-xs" id="search_sale_invoice_account_summary">查询</button>
							<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
						 </div>
						</form>
		            </div>
       		</div>
       		<br/>
       		<div class="float-e-margins">
	            <div class="ibox-title">
	                <h5>汇总记录</h5>
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
    
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">

	function queryParams(param) {
		var json_obj = formToJson($("#form_search"));
		json_obj['limit'] =param.limit;
		json_obj['offset'] =param.offset;
		json_obj['sortName'] =this.sortName;
		json_obj['sortOrder'] =this.sortOrder;
	    return json_obj;
	}	
	
	var $table = $('#table');
		$(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",null);
			//填写已有数据
			//set_one_info($("#form"),null);
			//bootstrap初始化
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",500);
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			$("#search_sale_invoice_account_summary").on('click',function(){
				 if(!has_null($("#form_search"))){
					 var json_data_list=formToJson($("#form_search"));
					 json_data_list['queryId']='${queryId}';
					 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getAccountSummaryList",$table);
				 }				 
			});
			
			//自动搜索填补
			initialize_bsSuggest_account_month_by_input("${context}", "account_month_all_start");
			initialize_bsSuggest_account_month_by_input("${context}", "account_month_all_end");
		    initialize_bsSuggest_all_type_factory("${context}");
		});
	</script>
</html>