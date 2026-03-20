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
	            <form id="form" class="form-inline">
		            <div class="col-xs-12">
		            	  <div class="form-group inline-small">
						  	<label >总外币实洋：</label>
						    <input type="text" name="sum_c_real_money" class="form-control" disabled>
						  </div>
						  <div class="form-group inline-small">
						  	<label >总人民币码洋：</label>
						    <input type="text" name="sum_total_money" class="form-control" disabled>
						  </div>
						  <div class="form-group inline-small">
						  	<label >总预估人民币实洋：</label>
						    <input type="text" name="sum_predict_real_money" class="form-control" disabled>
						  </div>
						  <div class="form-group inline-small">
						  	<label >总调整人民币实洋：</label>
						    <input type="text" name="sum_rebate_money" class="form-control" disabled>
						  </div>
						  <div class="form-group inline-small">
						  	<label >总实洋：</label>
						    <input type="text" name="sum_real_money" class="form-control" disabled>
						  </div>
					 </div>
				</form>
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
            <div class="sonpage-footer">
				<button id="update" class="btn btn-success" type="button">更新</button>	
			    <button id="goback" class="btn btn-white" type="button">退回</button>               
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
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">			
		var $table = $('#table');
		
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	  		json_obj['report_id'] ='${param.report_id}';
   	  		json_obj['cost_classification'] ='${param.cost_classification}';
   	  		json_obj['f_id'] ='${param.f_id}';
   	  		json_obj['currency'] ='${param.currency}';
   	        return json_obj;
		}
		
		function end_function(index, layero){
			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}', 'report_id': '${param.report_id}', 'cost_classification': '${param.cost_classification}',
				'f_id': '${param.f_id}', 'currency': '${param.currency}'},$table);
     	}
		
		load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}', 'report_id': '${param.report_id}', 'cost_classification': '${param.cost_classification}',
			'f_id': '${param.f_id}', 'currency': '${param.currency}'});
		$(document).ready(function () {			
			var statement = JSON.parse('${oneJson}');
			//填写已有数据
			set_one_info($("#form"), statement);
			
			//bootstrap初始化
			initialize_table($table,"getPurchaseReportFileItemManageList",${tableHeader},queryParams,"#tableTool",500);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			//增加条目layer
			var $add=$("#add");
			button_click_windows_end($add,2,"新增报表明细分类",'purchaseReportFileItemAdd?report_id=${param.report_id}&cost_classification=${param.cost_classification}&f_id=${param.f_id}&currency=${param.currency}&dep_org_code=' 
					+ statement.dep_org_code , false, ['620px', '520px'], end_function);
			
			$("#goback").on('click',function(){
				if(confirm("退回后明细维护结果将被取消, 确认退出？")){
					var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
			        parent.layer.close(index);
				}
			});
			
			$("#update").on('click',function(){
				ajax_function_ask_and_close("确认更新？","updatePurchaseReportFileItem","post",{'report_id': '${param.report_id}', 'cost_classification': '${param.cost_classification}',
					'f_id': '${param.f_id}', 'currency': '${param.currency}'},'更新成功');
			});
	   });
		
	   function toEdit(id) {
			open_layer_end(2,'编辑报表明细分类','purchaseReportFileItemEdit?id='+id,['620px', '520px'],false,end_function);
	   }
	   
	   function toDel(id) {
			ajax_function_ask_and_dosuccess("确认删除？","deletePurchaseReportFileItem","post",{'id':id},end_function);
	   }
		
	   function renderOperator(value,row,index) {
			var str = "";
			str += " <a onclick=\"toEdit('"+row.id+"')\">编辑</a> ";
			str += "<a onclick=\"toDel('"+row.id+"')\">删除</a>";
			return str;
	   }
	</script>
</html>