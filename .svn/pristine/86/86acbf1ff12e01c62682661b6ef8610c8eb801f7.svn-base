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
	            	 <div class="form-group inline-small">
					    <label >来款单位：</label>
					    <input type="text" name="company" class="form-control search-items" >
					 </div>
					 <div class="form-group inline-small">
					    <label >来款账号：</label>
					    <input type="text" name="account" class="form-control search-items" >
					 </div>
					 <div class="form-group inline-small">
					    <label >来款金额：</label>
					    <input type="text" name="receive_money" class="form-control search-items" >
					 </div>
					 <div class="form-group inline-small">
					    <label >来款日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="receive_date_start" id="receive_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="receive_date_end" id="receive_date_end">
					  </div>				
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
					    <label >认领日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_time_start" id="input_time_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_time_end" id="input_time_end">
					  </div>
					  <div class="form-group input-group inline-small">
						    <label >操作员：</label>
						    <input type="text" name="o_id_input_name" class="form-control search-items">
						    <div class="input-group-btn">
                                <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                                <input type="hidden" name="o_id_input" class="form-control search-items">
                            </div>
					  </div>
					  <div class="form-group inline-small">
					    <label >是否认领完：</label>
					    <select name="receive_out" class="form-control dictionary isboolean search-items">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >是否认领过：</label>
					    <select name="is_used" class="form-control dictionary isboolean search-items">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >考核单位：</label>
					    <select name="unit_code" class="form-control dictionary search-items" id="unit_code">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >收款银行：</label>
					    <input type="text" name="receive_bank" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >收款银行账号：</label>
					    <input type="text" name="receive_account" class="form-control search-items" >
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
                <h5>到款单列表</h5>
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
		inistal_data('#receive_date_start','#receive_date_end');
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
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			$("#search").on('click',function(){
				var json_data_list=formToJson($("#form_search"));
				json_data_list['queryId']='${queryId}';
				search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getIncomingClaimManageList",$table);
			});
			
			//自动搜索填补
			initialize_bsSuggest_fc_client("${context}", "c_name", "c_id");
			initialize_bsSuggest_fc_user("${context}", "o_id_input_name", "o_id_input");      // 放用户信息
			
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code");
	    });
		
		var is_audit = 0;
		<c:if test="${param.to_audit != null}">
			is_audit = 1;
		</c:if>
		function toClaimInvoice(ci_id){
			if (is_audit == 0) {
				open_layer_refresh(2,'来款认领','incomingClaimItemManage?ci_id='+ci_id,$table,['720px', '580px'],true);
			} else {
				open_layer_refresh(2,'认领审核','incomingClaimItemManage?to_audit=1&ci_id='+ci_id,$table,['720px', '580px'],true);
			}
		}
		
		function renderOperator(value,row,index){
		 	var str="";
		 	if (is_audit == 0) {
		 		str+="<a onclick=\"toClaimInvoice('"+row.ci_id+"')\">来款认领</a>";
			} else {
		 		str+="<a onclick=\"toClaimInvoice('"+row.ci_id+"')\">认领审核</a>";
			}
			return str;
		}		 
	</script>
</html>