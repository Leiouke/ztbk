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
            <div class="ibox-content search-content">
	            <form id="form_search" class="form-inline">
	            <div class="col-xs-11">	
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
					  <div class="form-group inline-middle">
					    <label >户号(_货源名称)：</label>
					    <input type="text" name="f_name" class="form-control search-items" disabled>
					  </div>
					  <div class="form-group inline-small">
					    <label >货源名称(模糊)：</label>
					    <input type="text" name="c_department" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >录入日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_date_start" id="input_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_date_end" id="input_date_end">
					  </div>
					  <div class="form-group inline-middle">
					    <label >进货单号：</label>
					    <input type="text" name="jh_id" class="form-control search-items" >
					  </div>
					  <div class="form-group input-group inline-small">
					    <label >业务员：</label>
					    <input type="text" name="o_id_operator_name" class="form-control search-items" />
					    <div class="input-group-btn">
                               <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                   <span class="caret"></span>
                               </button>
                               <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="o_id_operator" class="form-control search-items" />
					  </div>
					  <div class="form-group inline-small">
						  <label >进货单号(多个)：</label>
						  <textarea rows="3" cols="15" name="jh_ids" class="form-control search-items"></textarea>
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
                            <button type="button" class="btn btn-outline btn-default" id="batchImport">
                              	批量引入
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
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
    
	<script type="text/javascript">		
		//加载时间控件
	 	$(".layer-date").each(function(){	
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		var $table = $('#table');
		
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	        return json_obj;
		}
		
		load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}'});
		$(document).ready(function () {			
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",600);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');			
			
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getStatementEdPullList",$('#table'));
			});
			
			//自动搜索填补
			initialize_bsSuggest_fc_factory("${context}", "f_name", "f_id");
			
			initialize_bsSuggest_fc_user("${context}", "o_id_operator_name", "o_id_operator");      // 放用户信息
	    });
		
		$("#batchImport").on('click',function() {
			// 代销source_type为01
			var item_ids= $.map($table.bootstrapTable('getSelections'), function (row) {
                return {'f_id':row.f_id,'source_no':row.jh_id,'real_money':row.real_money,'total_money':row.total_money,'memo':row.memo, 
                	'sales_code': row.sales_code, 'op_code':row.input_code, 'op_date': format_date(row.input_date), 'money_arrear':row.money_arrear, 'pici':row.pici};
            });
			
			if(item_ids.length != 0) {
				ajax_function_ask_and_close_json_data("确认引入?","importEdStatement","post",JSON.stringify(item_ids),"引入完成!");
			} else {
				layer.msg("未选择明细！");
			}
		});
	</script>
</html>