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
						    <label >货源编号：</label>
						    <input type="text" name="f_id" class="form-control search-items auto-not-null" >
						    <div class="input-group-btn">
                               <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                   <span class="caret"></span>
                               </button>
                               <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                        </div>
					  </div>
					  <div class="form-group inline-large">
						    <label >户号(_货源名称)：</label>
						    <input type="text" name="f_department" class="form-control search-items" disabled>
					  </div>
					  <div class="form-group input-group inline-small">
							<label >外币币种：</label>
							<select name="currency" id="currency" class="dictionary search-items">
								<option></option>
							</select>
						</div>	
					  <div class="form-group inline-small">
					    <label >发票号：</label>
					    <input type="text" name="inv_no" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >发票类型：</label>
					    <select name="fc_invoice_class" class="form-control dictionary search-items" >
					    	<option></option>
					    </select>
					  </div>	
					  <div class="form-group input-group inline-small">
					    <label>操作人：</label>
					    <input type="text" name="o_id_operator_name" class="form-control search-items">
					    <div class="input-group-btn">
                               <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                   <span class="caret"></span>
                               </button>
                               <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="o_id_operator" class="form-control search-items">
					  </div>
					  <div class="form-group input-group inline-small">
					    <label>创建人：</label>
					    <input type="text" name="o_id_input_name" class="form-control search-items">
					    <div class="input-group-btn">
                               <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                   <span class="caret"></span>
                               </button>
                               <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="o_id_input" class="form-control search-items">
					  </div>	
					  <div class="form-group inline-small">
					    <label >发票日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="invoice_date_start" id="invoice_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="invoice_date_end" id="invoice_date_end">
					  </div>
					  <div class="form-group inline-small">
					    <label >录入日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_date_start" id="input_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_date_end" id="input_date_end">
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
            <div class="ibox-content ibox-content-table">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
           				<div class="btn-group hidden-xs" id="tableTool_result" role="group">	                                    
                            <button type="button" class="btn btn-outline btn-default" id="config">
                                <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
                            </button>
                            <select class="form-control" >
                              <option value="all">导出全部</option>
              				  <option value="basic">导出当页</option>
          				    </select>
                    	</div>                         
                        <table id="table_result" data-mobile-responsive="true">
                           
                        </table>
                    </div>
                </div>                
                <div class="row row-lg" style="margin-top: 5px;text-align: center;">
              		<button type="button" class="btn btn-primary" id="select_in">提交选中的发票</button>
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
		inistal_data('#input_date_start','#input_date_end');
		inistal_data('#invoice_date_start','#invoice_date_end');
	
		$table_result=$("#table_result");
		function queryParams_result(param) {
			var json_obj = formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	        return json_obj;
		}
		
		function renderOperator(value,row,index){
			return "-";
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
			
			//bootstrap初始化
			initialize_table($table_result, "getFactoryPayItemItemPullList", ${tableHeader}, queryParams_result, "#tableTool_result", 350);
			$("#select_in").on('click', function () {			
				var item_ids= $.map($table_result.bootstrapTable('getSelections'), function (row) {
	                return {'f_id':row.f_id, 'currency':row.currency, 'inv_id':row.inv_id, 'can_c_real_money':row.can_c_real_money};
	            });
				
				if(item_ids.length != 0) {
					ajax_function_ask_and_close_json_data("确认提交?","pullFactoryPayItemItem","post",JSON.stringify(item_ids),"引入完成!");
				} else {
					layer.msg("没有选中发票记录！");
				}
			});
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool_result').find('select').change(function () {				 
				$('#table_result').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });	
			
			//自动搜索填补
			 initialize_bsSuggest_fc_factory("${context}", "f_department", "f_id");//货源
			 initialize_bsSuggest_fc_user("${context}", "o_id_input_name", "o_id_input");      // 放用户信息(录入人)
			 initialize_bsSuggest_fc_user("${context}", "o_id_operator_name", "o_id_operator");      // 放用户信息(操作人)
			
			$("#search").on('click',function(){
				var json_data_list = formToJson($("#form_search"));
				json_data_list['queryId']='${queryId}';
				search_sum_list("${context}/csu/getTableCollectData", json_data_list, "getFactoryPayItemItemPullList", $table_result);
			});
	     });
	</script>
</html>