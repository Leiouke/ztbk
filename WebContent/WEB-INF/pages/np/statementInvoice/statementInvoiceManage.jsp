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
					    <label >客户编号：</label>
					    <input type="text" name="c_id" class="form-control search-items" >
					    <div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                    </div>
					  </div>
					  <div class="form-group inline-middle">
					    <label >户号(_客户名称)：</label>
					    <input type="text" name="c_name" class="form-control search-items" disabled>
					  </div>
					  <!-- <div class="form-group inline-small">
					    <label >客户名称(模糊)：</label>
					    <input type="text" name="c_department" class="form-control search-items" >
					  </div> -->
					  <div class="form-group inline-small">
					    <label >录入日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_date_start" id="input_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_date_end" id="input_date_end">
					  </div>
					  <div class="form-group inline-small">
					    <label >业务类型：</label>
					    <select name="source_type" class="form-control dictionary search-items">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >开票类型：</label>
					    <select name="kp_type" class="form-control dictionary search-items">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
						    <label >是否开明细：</label>
						    <select name="is_item" class="form-control dictionary search-items isboolean" >
						    	<option value=""></option>
						    </select>
					  </div>
					  <div class="form-group inline-small">
						    <label >是否已快速开票：</label>
						    <select name="is_quick_kp" class="form-control dictionary search-items isboolean" >
						    	<option value=""></option>
						    </select>
					  </div>
					  <div class="form-group inline-small">
						    <label >是否申请开票：</label>
						    <select name="is_claim" class="form-control dictionary search-items isboolean" >
						    	<option value=""></option>
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
                <h5>结算单管理</h5>
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
	    <button id="export_kp_finance" class="btn btn-success" type="button">导出开票明细</button>
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
			// is_claim默认为是
			var one = {is_claim:1};
			//加载字典数据
			get_dictionary("${context}",one);
			
			//bootstrap初始化, 可编辑的table
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
			//增加条目layer
			var $add=$("#add");
			// 类型2代表打开的是新页面, 类型1代表打开的是本页面元素
			button_click_layer_refresh($add,2,"引入结算单",'statementAgencyItemPull',$table,true,['750px', '500px']);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');		
			
			$('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			 
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getStatementInvoiceList",$('#table'));
			});
			
			//自动搜索填补
			initialize_bsSuggest_client("${context}");
			
			$('#export_kp_finance').on('click', function () {
				var has_common = 0;
				var has_zengzhi = 0;
				var source_nos = $.map($table.bootstrapTable('getSelections'), function (row) {
					if (row.kp_type == '0'){
						has_common = 1;
					}
					if (row.kp_type == '1') {
						has_zengzhi = 1;
					}
	                return row.source_no;
	            });
				
				if (has_common == 1 && has_zengzhi == 1) {
					layer.msg("普通发票和增值税发票不能一起导出！");
					return;
				}
				if(source_nos.length!=0){
					var href_str="${context}/download/kpFinanceExport?";
					href_str+="source_nos="+source_nos;
					window.open( href_str);
				}else {
					layer.msg("未选择明细！");
				}
			});
	     });
		 
		 function toKp(statement_no) {
			open_layer_refresh(2,'快速开票','toStatementKp?statement_no='+statement_no,$table,['750px', '500px'],true);
		 }
		 
		 function renderOperator(value,row,index) {
			var str = "";
			if (row.is_claim) {
				str += "<a onclick=\"toKp('"+row.statement_no+"')\">开票</a>";
			}
			return str;
		 }
	</script>
</html>