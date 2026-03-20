<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			            <div class="col-xs-12">
				            <div class="row">
								  <div class="form-group inline-small">
								    <label >发票总金额：</label>
								    <input type="text" name="total_kp_money" class="form-control search-items" readonly>
								  </div>
								  <div class="form-group inline-small">
								    <label >折扣总金额：</label>
								    <input type="text" name="total_rebate_money" class="form-control search-items" readonly>
								  </div>
								  <div class="form-group inline-large">
								    <label >备注：</label>
								    <input type="text" name="memo" class="form-control search-items">
								    <input type="hidden" name = "c_id"/>
								    <input type="hidden" name = "pa_id"/>
								  </div>
								  <div class="form-group inline-small">
								    <label >余额：</label>
								    <input type="text" name="advance_balance" class="form-control search-items" value="${param.advance_balance}" disabled>
								  </div>
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>支出单发票明细</h5>
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
	<div class="sonpage-footer">
	    <button id="save" class="btn btn-primary" type="button">保存</button>
	    <button id="cancel" class="btn btn-white" type="button">取消</button>
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
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
	function queryParams(param) {
		var json_obj_invoice = {};
		json_obj_invoice['limit'] =param.limit;
		json_obj_invoice['offset'] =param.offset;
		json_obj_invoice['sortName'] =this.sortName;
		json_obj_invoice['sortOrder'] =this.sortOrder;
	    return json_obj_invoice;
	}
	
	function toDel(kp_id){
		ajax_function_ask_and_dosuccess("确认删除？","deleteIncomingClaimItemItem","post",{'kp_ids':kp_id},load_table_data_success);
	}
	
	function renderOperator(value,row,index){
	 	//console.log(row);
		return "<a onclick=\"toDel('" + row.kp_id + "')\">删除</a>";
	}
	
	function end_function(index, layero){
		load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'clientPayItem_guid'},$table);
	}
	
	function load_table_data_success(data){
		if (data.success){
   			layer.msg("操作成功！");
   			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'clientPayItem_guid'},$table);
    	} else {
    		layer.msg(data.errorMsg);
    	}
	}
	
	var $table = $('#table');
	load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'clientPayItem_guid'});
	$(document).ready(function () {
		$('#save').on('click', function () {
			if(!has_null($("#form"))&&!auto_not_matching($("#form"))){
				if($("input[name='c_id']").attr("data-id")=="") {
					layer.msg("客户编号不正确");
				} else {
					ajax_function("editClientPayItem","post",$('#form').serialize(),'修改成功！');
				}
			}
		});
		
		var invoice=JSON.parse('${oneJson}');
		$("input[name='c_name']").val(invoice['custom_id']+"_"+invoice['c_department']);
		//填写已有数据
		set_one_info($("#form"),invoice);
		
		<c:if test="${param.to_detail != null}">
			$("#save").hide();
		</c:if>
		
		//bootstrap初始化		
		initialize_table($table,"getClientPayItemAddList",${tableHeader},queryParams,"#tableTool",550);
 		$table.bootstrapTable('refreshOptions',{onLoadSuccess: function(data){
 			var total_kp_money = 0;
 			var total_rebate_money = 0;
 			$.each(data.rows, function(index, row){
				if(row.kp_money==undefined){
					total_kp_money += 0;
				}else{
					total_kp_money += row.kp_money;
				}
				
				if(row.rebate_money==undefined){
					total_rebate_money += 0;
				}else{
					total_rebate_money += row.rebate_money;
				}
			});
 			total_kp_money = total_kp_money.toFixed(2);
 			total_rebate_money = total_rebate_money.toFixed(2);
 			$("input[name='total_kp_money']").val(total_kp_money);
 			$("input[name='total_rebate_money']").val(total_rebate_money);
		}});
		
		//增加条目layer
		var $add=$("#add");
		button_click_windows_end($add,2,"引入发票明细",'clientPayItemItemPull',true,['750px', '580px'], end_function);
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions', {exportDataType: $(this).val()});
	    });
	});
	
	$(document).ready(function () {
		$(".ibox-content-table").on("change",".input_rebate_money",function(){
			 if(isNaN($(this).val())){
				  layer.msg("必须输入数字!");
				  $table.bootstrapTable('refresh');
				  return;
			 }
			 
			 var kp_id = $.trim($(this).data('kp-id'));
			 var kp_money = $.trim($(this).data('kp-money'));
			 ajax_function_dosuccess("updateClientPayItemItem","post",{"kp_id":kp_id, "kp_money":kp_money, "rebate_money": Number($(this).val()) }, rebate_money_update_success);
		 });
	})
	
	function rebate_money_update_success(data){
		if (data.success){
   			layer.msg("修改成功！");
    	} else {
    		layer.msg(data.errorMsg);
    	}
		load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'clientPayItem_guid'},$table);
	}
	
	function renderRebateMoney(value, row, index) {
		if (!value) {
			value = 0;
		}
		return "<input type='text' class='" + row.kp_id + " input_rebate_money' data-kp-id='" + row.kp_id + "' data-kp-money='" + row.kp_money
					+ "' data-item-index='"+index+"' value='"+value+"'> ";
	}
	
	function openSaleInvoice(kp_id) {
		open_layer(2,'结算单信息','../receivable/saleInvoiceEdit?is_detail=1&kp_id=' + kp_id, ['1200px', '500px'],true);
	}
	
	function renderSaleInvoice(value, row, index) {
		return "<a onclick=\"openSaleInvoice('"+row.kp_id + "')\">" + row.kp_id + "</a> ";
	}
	</script>
</html>