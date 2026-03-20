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
	<div class="wrapper wrapper-content animated fadeInRight" style="padding-bottom:0px">
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
					  <div class="form-group input-group inline-small">
						    <label >业务员：</label>
						    <input type="text" name="o_id_operator_name" class="form-control search-items">
						    <div class="input-group-btn">
                                <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                                <input type="hidden" name="o_id_operator" class="form-control search-items">
                            </div>
					  </div>
					  <div class="form-group inline-small">
					    <label >发票号：</label>
					    <input type="text" name="inv_no" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >发票日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="inv_date_start" id="inv_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="inv_date_end" id="inv_date_end">
					  </div>
					  <div class="form-group input-group inline-small">
		                  		<label >记账年月：</label>
		                        <input type="text" name="account_month_all" class="form-control search-items">
							    <div class="input-group-btn">
	                                           <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                               <span class="caret"></span>
	                                           </button>
	                                           <ul class="dropdown-menu dropdown-menu-right" style="height:200px" role="menu">
	                                           </ul>
	                            </div>
                	  </div>                	  
					  <div class="form-group inline-small">
						    <label >是否已记账：</label>
						    <select name="is_account" class="form-control dictionary search-items isboolean" >
						    </select>
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
                <h5>发票列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
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
        </div>
    </div>
    <div class="sonpage-footer">
    		<button id="account" class="btn btn-success" type="button">记账</button>	
	        <button id="return_account" class="btn btn-danger" type="button">撤销</button>	                  
	</div>
	<div class="sonpage-footer-left">
            <button id="summary" class="btn btn-info" type="button">销售汇总</button>
            <button id="not_account_summary" class="btn btn-info" type="button">未记账汇总</button>
	</div>
	</body>
	<div class="col-md-4" id="account_div" style="display:none">
	   <form id="account_form" class="form-inline">
              <div class="panel-body">
                         <div class="row">
                           	<div class="form-group small-space col-xs-4 not-null">
		                  		<label >记账年月：</label>
		                        <input type="text" name="account_month" class="form-control search-items">
							    <div class="input-group-btn">
	                                           <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                               <span class="caret"></span>
	                                           </button>
	                                           <ul class="dropdown-menu dropdown-menu-right" style="height:200px" role="menu">
	                                           </ul>
	                            </div>
		                	</div>
		                	<div class="form-group small-space col-xs-12 print-layer-button">
		                  		<button id="account_commit" class="btn btn-success" type="button">确认</button>
		                	</div>
					    </div>                        
                </div>
       </form>
	 </div>
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
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
		inistal_data('#inv_date_start','#inv_date_end');
		var $table = $('#table');
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	        return json_obj;
		}
		$(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",500);
			$("#search").on('click',function(){
				var json_data_list=formToJson($("#form_search"));
				json_data_list['queryId']='${queryId}';
				search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getSaleAccountList",$table);
			 });
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 //自动搜索填补
			 initialize_bsSuggest_client("${context}");
			 initialize_bsSuggest_user_by_dept("${context}", "o_id_operator_name", "o_id_operator", "2000");      // 放用户信息(报刊的)
			 //initialize_bsSuggest_operator("${context}");
			 initialize_bsSuggest_account_month("${context}");
			 initialize_bsSuggest_account_month_not_close("${context}");
			 button_click_layer($("#summary"),2,"销售汇总",'accountSummary',true,['620px', '580px']);
			 button_click_layer($("#not_account_summary"),2,"未记账汇总",'notAccountSummary',true,['620px', '580px']);
			 $('#account').on('click',function(){
				 open_layer(1,"记账",$('#account_div'),['360px', '380px'],false);
			 });
			 $('#account_commit').on('click',function(){
				 if(!has_null($("#account_form"))){
						var kp_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
			                return row.kp_id;
			            });
						var account_month=$("input[name='account_month']").val();
						if(kp_ids.length!=0){
							ajax_function_ask_and_refresh("确认记账？","accountSale","post",{'kp_ids':kp_ids,'account_month':account_month},'操作成功',$table);
							layer.close(layer.index);
						}
						else
							layer.msg("未选择明细！");
				 }
			 });
			 $('#return_account').on('click',function(){
				 if(true){
					var kp_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
		                return row.kp_id;
		            });
					if(kp_ids.length!=0)
						ajax_function_ask_and_refresh("确认撤销？","deleteSaleAccount","post",{'kp_ids':kp_ids},'操作成功',$table);
					else
						layer.msg("未选择明细！");
				 }
			 });
	     });
	</script>
</html>