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
					  	<label >支付单号：</label>
					    <input type="text" name="pc_id" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					  	<label >支付单状态：</label>
					    <select name="pc_status" class="form-control dictionary search-items">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					  	<label >发票号：</label>
					    <input type="text" name="invoice_nos" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >录入日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_time_start" id="input_time_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_time_end" id="input_time_end">
					  </div>
					  <div class="form-group input-group inline-small">
					    <label >录入人：</label>
					    <input type="text" name="o_id_input_name" class="form-control search-items">
					    <div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="o_id_input" class="form-control search-items">
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
                <h5>费用支付列表</h5>
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
	                        <button type="button" class="btn btn-outline btn-default" id="add">
	                            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
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
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
		inistal_data('#input_time_start','#input_time_end');
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
			 //固定列
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getPaymentChargeManageList",$table);
			 });
			//增加条目layer
			var $add=$("#add");
			button_click_layer_refresh($add,2,"新增费用支付单",'paymentChargeAdd',$table,true,['620px', '500px']);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 //自动搜索填补
			 initialize_bsSuggest_client("${context}");
			 initialize_bsSuggest_user_by_dept("${context}", "o_id_input_name", "o_id_input", "2000");      // 放用户信息(报刊的)
	     });
		 
		 function toEdit(pc_id){
			 open_layer_refresh(2,'编辑费用支付单','paymentChargeEdit?pc_id='+pc_id,$table,['620px', '580px'],true);
		 }
		 
		 function toCommit(pc_id){
			 ajax_function_ask_and_refresh("确认提交？","commitPaymentCharge","post",{pc_id:pc_id},'提交成功', $table);
		 }
		 
		 function toOA(pc_id){
			 ajax_function_ask_and_refresh("确认推送OA？","putPaymentChargeToOa","post",{bill_code:pc_id},'推送成功', $table);
		 }
		 
		 function renderOperator(value,row,index){
			var str="<a onclick=\"toEdit('"+row.pc_id+"')\">编辑</a>";
			
			if (row.status == '0' || row.status == '2') {
		    	str+="&nbsp;&nbsp;<a onclick=\"toCommit('"+row.pc_id+"')\">提交</a>";
		    }
			
			if(row.status == '1' && row.syn_oa != '1'){
				str+="&nbsp;&nbsp;<a onclick=\"toOA('"+row.pc_id+"')\">推送</a>";
			}
			
			return str;
		 }
	</script>
</html>