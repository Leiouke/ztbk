<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->  
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <style type="text/css">
	    	/*table里面的文本框css*/
		    .ibox-content-table input[type='text']{
		    	width:70px;
		        text-align: right;
		    }
	    </style>
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form" class="form-inline">
			            <div class="col-xs-10">
							<div class="row">
								  <div class="form-group input-group inline-large">
								    <label >审批备注：</label>
								    <input type="text" name="audit_memo" class="form-control search-items">
								  </div>
								  <div class="form-group inline-large" style = "display:none">
									<label >结果：</label>
									<input type="text" id="audit_status" name="audit_status" class="form-control search-items">
								</div>
								<div class="form-group inline-large" style = "display:none">
									<label >flow_id：</label>
									<input type="text" id="flow_id" name="flow_id" class="form-control search-items">
								</div>			
								<div class="form-group inline-large" style = "display:none">
									<label >ap_id：</label>
									<input type="text" id="ap_id" name="ap_id" class="form-control search-items">
								</div>			
							</div>
						 </div>
						 <div class="col-xs-2 search-group-button">
					  		<button type="button" class="btn btn-primary btn-xl" id="detail">详情</button>
				 		</div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>流程查询</h5>
	                <div class="ibox-tools">
	                    <a class="collapse-link">
	                        <i class="fa fa-chevron-up"></i>
	                    </a>
	                </div>
	            </div>
	            <div class="ibox-content ibox-content-table">
	                <div class="row row-lg">                    
	                    <div class="col-sm-12">
	                        <div class="btn-group hidden-xs" id="tableTool" role="group">
	                            <button type="button" class="btn btn-outline btn-default" id="add">
	                               <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
	                            </button>
	                            <button type="button" class="btn btn-outline btn-default" id="delete_items">
	                               <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
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
	</div>
	<div style = "text-align: center">
	    <button type="button" class="btn btn-primary btn-xl"  id="approve">通过</button>
		<button type="button" class="btn btn-danger btn-xl" id="notapprove" >不通过</button>
	</div>
	</body>
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
    
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
	function queryParams(param) {
		var json_obj_invoice = formToJson($("#form"));
		json_obj_invoice['limit'] =param.limit;
		json_obj_invoice['offset'] =param.offset;
		json_obj_invoice['sortName'] =this.sortName;
		json_obj_invoice['sortOrder'] =this.sortOrder;
	    return json_obj_invoice;
	}
	
	var $table = $('#table');
	
	$(document).ready(function () {
	
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		//填充数据
		var invoice_str='${oneJson}';
		invoice_str=invoice_str.replace(/\r\n/g,"\\r\\n")  
    	invoice_str=invoice_str.replace(/\n/g,"\\n");
		invoice_str=invoice_str.replace(/\s/g," ");
		var invoice=JSON.parse(invoice_str);
		
		set_one_info($("#form"),invoice);
		//加载字典数据
		get_dictionary("${context}",invoice);
		
		//bootstrap初始化
		initialize_table($table,"getFcFlowDetialList",${tableHeader},queryParams,"#tableTool",300);

		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
		//自动搜索填补
		initialize_bsSuggest_fc_factory("${context}", "f_department", "f_id");
		initialize_bsSuggest_fc_user("${context}", "o_id_operator_name", "o_id_operator");      // 放用户信息
		initialize_bsSuggest_fc_f_bank("${context}");//银行
		
		
		//通过按钮
		$('#approve').on('click', function () {
			$('#audit_status').val(0);
			ajax_function_ask_and_close("确认是否通过审核","toProcessApprovelDeal","post",$('#form').serialize(),'审核通过');
		 });
		
		$('#detail').on('click', function () {
			var ap_id = $('#ap_id').val();
			open_layer(2,'付款申请详情','paymentApplicationEdit?ap_id='+ap_id+'&is_detail='+1,['620px', '580px'],true);
		});
		
		
		//不通过按钮
		$('#notapprove').on('click', function () {
			$('#audit_status').val(1);
			ajax_function_ask_and_close("该审批不通过，是否确认","toProcessApprovelDeal","post",$('#form').serialize(),'审核不通过');
		 });
	});
	</script>
</html>