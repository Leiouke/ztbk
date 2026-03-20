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
					    <label >货源名称</label>
					    <input type="text" name="f_department" class="form-control search-items" disabled>
					  </div>
					  <div class="form-group inline-small">
					    <label >创建日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_date_start" id="input_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_date_end" id="input_date_end">
					  </div>
					  <div class="form-group input-group inline-small">
                 		<label >记账年月：</label>
                        <input type="text" name="account_month_all" class="form-control search-items">
				        <div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" style="height:200px" role="menu"></ul>
                        </div>
                	  </div>                	  
					  <div class="form-group inline-small">
						    <label >是否已记账：</label>
						    <select name="is_account" class="form-control dictionary search-items isboolean" >
						    	<option value=""></option>
						    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >考核单位：</label>
					    <select name="unit_code" class="form-control dictionary search-items" id="unit_code">
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
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>折扣调整单管理</h5>
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
	                    <ul class="dropdown-menu dropdown-menu-right" style="height:200px" role="menu"></ul>
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

		$(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",null);
			
			//bootstrap初始化, 可编辑的table
			initialize_table($table,"getPaymentDiscountAdjustmentList",${tableHeader},queryParams,"#tableTool",500);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');		
			
			$('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getPaymentDiscountAdjustmentList",$('#table'));
			});
			
			//自动搜索填补
			initialize_bsSuggest_fc_factory("${context}", "f_department", "f_id");//货源
			
			// 获得 所有记账年月
			initialize_bsSuggest_fc_account_month("${context}", "account_month_all", "all");
			
			// 获得未关账的记账年月
			initialize_bsSuggest_fc_account_month("${context}", "account_month", 0);
			
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code");
			
			$('#account').on('click',function(){
				 open_layer(1,"记账",$('#account_div'),['360px', '380px'],false);
			});  
			
			$('#account_commit').on('click',function(){
				 if(!has_null($("#account_form"))){
					var bill_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
		                return row.bill_id;
		            });
					var account_month=$("input[name='account_month']").val();
					if(bill_ids.length!=0){
						ajax_function_ask_and_refresh("确认记账？","accountPaymentDiscountAdjustment","post",{'bill_ids':bill_ids,'account_month':account_month},'操作成功',$table);
						layer.close(layer.index);
					} else {
						layer.msg("未选择明细！");
					}
				 }
			});
			
			$('#return_account').on('click',function(){
				 if(true){
					var bill_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
		                return row.bill_id;
		            });
					if(bill_ids.length!=0) {
						ajax_function_ask_and_refresh("确认撤销？","deletePaymentDiscountAdjustmentAccount","post",{'bill_ids':bill_ids},'操作成功',$table);
				 	} else {
						layer.msg("未选择明细！");
				 	}
				 }
			});
	     });
		 
		 function toItem(bill_id) {
			open_layer_refresh(2,'折扣明细','paymentDiscountAdjustmentItems?bill_id=' + bill_id,$table,['750px', '500px'],true);
		 }

		 function renderOperator(value,row,index) {
			var str="";
			str += "<a onclick=\"toItem('" + row.bill_id + "')\">折扣明细</a>";
			return str;
		 }
	</script>
</html>