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
				    <label >销售收入：</label>
				    <input type="text" name="real_money" class="form-control" disabled="disabled">
				  </div>
				  <div class="form-group inline-small">
				    <label >实物成本：</label>
				    <input type="text" name="entity_purchase_money" class="form-control" disabled="disabled">
				  </div>
				  <div class="form-group inline-small">
				    <label >非实物成本：</label>
				    <input type="text" name="no_entity_purchase_money" class="form-control" disabled="disabled">
				  </div>
				  <div class="form-group inline-small">
				    <label >其他支付：</label>
				    <input type="text" name="other_payment_money" class="form-control" disabled="disabled">
				  </div>
				  <div class="form-group inline-small">
				    <label >预估退税：</label>
				    <input type="text" name="predict_drawback" class="form-control" disabled="disabled">
				  </div>
				  <div class="form-group inline-small">
				    <label >实际退税：</label>
				    <input type="text" name="real_drawback" class="form-control" disabled="disabled">
				  </div>
				  <div class="form-group inline-small">
				    <label >本单结余：</label>
				    <input type="text" name="surplus_money" class="form-control" disabled="disabled">
				  </div>
				 </div>
			  </form>
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
   	  		json_obj['c_id'] ='${param.c_id}';
   	  		json_obj['export_invoice_no'] ='${param.export_invoice_no}';
   	        return json_obj;
		}
		
		load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}', 'c_id': '${param.c_id}', 'export_invoice_no': '${param.export_invoice_no}'});
		$(document).ready(function () {			
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"getExportInvoiceItemList",${tableHeader},queryParams,"#tableTool",600);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
						
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			var statement = JSON.parse('${oneJson}');
			//填写已有数据
			set_one_info($("#form"), statement);
	    });
	</script>
</html>