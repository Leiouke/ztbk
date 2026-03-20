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
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
	<div class="wrapper wrapper-content animated fadeInRight" style="padding-top:0px;padding-bottom:0px">
		    <div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>到货商品信息</h5>
	                <div class="ibox-tools">
	                    <a class="collapse-link">
	                        <i class="fa fa-chevron-up"></i>
	                    </a>
	                </div>
	            </div>
            <div class="ibox-content search-content">
	            <form id="form" class="form-inline">
	            <div class="col-xs-12">
					  <div class="form-group inline-small">
						<label >刊号：</label>
						<input type="text" class="form-control search-items" name="mail_code" id="mail_code" readonly>
					  </div>
					  <div class="form-group inline-small">
						<label >报刊名称：</label>
						<input type="text" class="form-control search-items" name="qk_name" id="qk_name" readonly>
					  </div>
					  <div class="form-group inline-small">
						<label >自定义刊期：</label>
						<input type="text" class="form-control search-items" name="period_name" id="period_name" readonly>
					  </div>
					  <div class="form-group inline-small">
						<label >数量：</label>
						<input type="text" class="form-control search-items" name="h_amount" id="h_amount" readonly>
					  </div>
					  <div class="form-group inline-small">
						<label >进货价：</label>
						<input type="text" class="form-control search-items" name="jh_price" id="jh_price" readonly>
					  </div>
					  <div class="form-group inline-small">
						<label >备注：</label>
						<input type="text" class="form-control search-items" name="memo" id="memo" readonly>
					  </div>
					  <div class="form-group inline-small">
						<label >核销数量：</label>
						<input type="text" class="form-control search-items" name="verify_amount" id="verify_amount" readonly>
					  </div>
				 </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>核销</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content" style="padding-bottom:0px">
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
    		 <button id="commit" class="btn btn-success" type="button">核销</button>
             <button id="cancel" class="btn btn-white" type="button">返回</button>
	</div>
	</body>
	<!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>


    <!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
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
	 
		var $table = $('#table');
		
		var oneJson_offset = dealOneJson('${oneJson_offset}');
		
		//填写已有数据
		set_one_info($("#form"), oneJson_offset);
		
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	  	    json_obj['ItemExclusiveCode'] =oneJson_offset.ItemExclusiveCode;
   	  		json_obj['inv_id'] =oneJson_offset.inv_id;
   	        return json_obj;
		}
		
		$(document).ready(function () {
			
			
			if(oneJson_offset.is_offset == "1"){
				$('#commit').hide();
			}
			
			//inistal_data('#sd_date_start','#sd_date_end');
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table_editable($table,"getInvoiceOffsetItemSubList",${tableHeader},queryParams,"#tableTool",500,"updateInvoiceOffsetItemSubTemp");
			
			//表格配置 layer
			var $config=$("#config");			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {				 
				 $table.bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 
			 $('#commit').on('click', function () {
				    var inv_id = oneJson_offset.inv_id;
				    var ItemExclusiveCode = oneJson_offset.ItemExclusiveCode;
					//ajax_function_ask_and_dosuccess("确认核销完成？","offsetInvoice","post",{'inv_id':inv_id,'ItemExclusiveCode':ItemExclusiveCode},verifySuccess)
				    ajax_function_ask_and_close_json_data("确认核销完成？","offsetInvoice","post",JSON.stringify({'inv_id':inv_id,'ItemExclusiveCode':ItemExclusiveCode}),'核销完成！');
					parent.$table.bootstrapTable('refresh');
				    
			 });
			 
			 $table.bootstrapTable('refreshOptions',{onLoadSuccess: function(data){
		 			var offset_amount = 0;
		 			$.each(data.rows, function(index, row){
						if(row.jh_amount!=undefined){
							offset_amount += row.jh_amount;
						}
					});
		 			$("input[name='verify_amount']").val(offset_amount);
			}});
			
	     });
	</script>
</html>