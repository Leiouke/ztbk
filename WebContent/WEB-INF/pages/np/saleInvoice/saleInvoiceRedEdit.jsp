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
			            <div class="col-xs-12">
				            <div class="row">
								  <div class="form-group input-group inline-middle not-null">
								    <label >客户编号：</label>
								    <input type="text" name="c_id" class="form-control search-items auto-not-null" >
								    <div class="input-group-btn">
	                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                        <span class="caret"></span>
	                                    </button>
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                </div>
								  </div>
								  <div class="form-group inline-large">
										    <label >户号(_客户名称)：</label>
										    <input type="text" name="c_department" class="form-control search-items" disabled>
								  </div>
								  <!-- <div class="checkbox">
									    <label style="font-weight:100;font-size:10px">
									      <input type="checkbox" name="is_duty_free" value=1 style="vertical-align: text-bottom;">客户免税
									    </label>
								  </div> -->
							</div>
							<div class="row">
								  <div class="form-group inline-small">
								    <label >发票号：</label>
								    <input type="text" name="inv_no" class="form-control search-items" readonly>
								  </div>
								  <div class="form-group inline-small">
								    <label >发票类型：</label>
								    <select name="invoice_type" data-id-list = "0001,0004,0005,0006,0009,0010" id = "invoice_type"  class="form-control dictionary search-items" >
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group inline-small">
								    <label >邮箱：</label>
								    <input name="kp_mail" id="kp_mail" type="text" class="form-control search-items date-type">
								  </div>
								  <div class="form-group inline-small">
								    <label >发票日期：</label>
								    <input name="kp_date" id="kp_date" type="text" class="form-control search-items date-type" readonly>
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-small">
								    <label >累加金额：</label>
								    <input type="text" name="total_money" class="form-control search-items" value="0.00" readonly>
								  </div>
								  <div class="form-group inline-small">
								    <label >发票税率：</label>
								    <select name="tax_rate" class="form-control dictionary search-items" >
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group inline-small">
								    <label >发票含税金额：</label>
								    <input type="text" name="tax_money" class="form-control search-items" value="0.00">
								  </div>
								  <div class="form-group inline-small">
								    <label >对冲蓝票：</label>
								    <input type="text" name="hedging_kp_id" id = "hedging_kp_id" class="form-control search-items" readonly>
								  </div>
								  <div class="form-group inline-small">
								    <label >对冲发票号：</label>
								    <input type="text" name="hedging_kp_no" id = "hedging_kp_no" class="form-control search-items" readonly>
								  </div>
							</div>
							<div class="row">
								  <!-- <div class="form-group inline-small">
								    <label >发票册数：</label>
								    <input type="text" name="amount" class="form-control search-items" value="0" readonly>
								  </div> -->
								  <!-- <div class="form-group inline-small">
								    <label >后续是否关联发货：</label>
								    <select name="is_relate_delivery" class="form-control dictionary search-items isboolean" >
								    	
								    </select>
								  </div> -->
								  <div class="form-group inline-small">
								    <label >是否明细开票：</label>
								    <select name="is_item_kp" class="form-control dictionary search-items isboolean" >
								    </select>
								  </div>
								  <div class="form-group inline-large">
								    <label >备注：</label>
								    <input type="text" name="memo" class="form-control search-items">
								  </div>
								  <div class="form-group input-group inline-small" >
							            <label >收款人：</label>
							            <input type="text" name="o_id_receiver_name">
									    <div class="input-group-btn">
				                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				                        	<span class="caret"></span>
				                        </button>
				                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                        </div>
				                        <input type="hidden" name="o_id_receiver">
							       </div>			
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>发票明细</h5>
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
	    <button id="delete_invoice" class="btn btn-danger" type="button">作废</button>
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
	
	function end_function(index, layero){
		load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'saleInvoice_guid'},$table);
	}
	
	function load_table_data_success(data){
		if (data.success){
   			layer.msg("操作成功！");
   			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'saleInvoice_guid'},$table);
    	} else {
    		layer.msg(data.errorMsg);
    	}
	}
	
	var $table = $('#table');
	var currency=[];
	var currency_rate=[];
	load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'saleInvoice_guid'});
	$(document).ready(function () {
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		console.log('jason='+'${oneJson}');
		var invoice=JSON.parse('${oneJson}');
		//加载字典数据
		get_dictionary("${context}",invoice);
		//填写已有数据
		set_one_info($("#form"),invoice);
		$("#kp_mail").val(invoice.kp_mail);//单独放入
		//bootstrap初始化		
		//initialize_table_editable_footer($table,"getSaleInvoiceAddItemList",${tableHeader},queryParams,"#tableTool",400,"updateSaleInvoiceItem");
		initialize_table($table,"getSaleInvoiceAddItemList",${tableHeader},queryParams,"#tableTool",550);
 		$table.bootstrapTable('refreshOptions',{onLoadSuccess: function(data){
 			var sum_money=0;
 			//var sum_amount=0;
 			$.each(data.rows, function(index, row){
 				//console.log(row.kp_money);
				if(row.kp_money==undefined){
					sum_money+=0;
				}else{
					sum_money+=row.kp_money;
				}
				//sum_amount+=row.amount;
			});
 			sum_money=sum_money.toFixed(2);
 			$("input[name='total_money']").val(sum_money);
 			//$("input[name='amount']").val(sum_amount);
		}});
		
 		$('#delete_invoice').on('click',function(){
			 ajax_function_ask_and_close("确认删除？","deleteSaleInvoice","post",{kp_id:invoice.kp_id},'删除成功');
		});

		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
		//自动搜索填补
		//initialize_bsSuggest_client_is_duty_free("${context}");
		initialize_bsSuggest_client("${context}");
		
		initialize_bsSuggest_user_by_dept("${context}", "o_id_receiver_name", "o_id_receiver", "2000");      // 放用户信息(报刊的)
	});
	
	$(document).ready(function () {
		$(".ibox-content-table").on("change",".input_total_money",function(){
			 var can_kp_money = $(this).data('can-kp-money');
			 if (can_kp_money < 0) {
				 layer.msg("负数开票金额不允许修改!");
				 $table.bootstrapTable('refresh');
				 return;
			 }
			 if(isNaN($(this).val())){
				  layer.msg("必须输入数字!");
				  $table.bootstrapTable('refresh');
				  return;
			 }else if(Number($(this).val())<0){
				 layer.msg("必须输入大于等于0!");
				 $table.bootstrapTable('refresh');
				 return;
			 }		 
			 
			 var statement_no = $.trim($(this).data('statement-no'));
			 ajax_function_refresh("updateSaleInvoiceItem","post",{"statement_no":statement_no, "kp_money": Number($(this).val()) },'修改成功',$table);
		 });
	})
	
	function renderTotalMoney(value, row, index) {
		if (!value) {
			value = 0;
		}
		return "<input type='text' class='"+row.statement_no+" input_total_money' data-can-kp-money='"+row.can_kp_money
				   + "' data-statement-no='" + row.statement_no
					+ "' data-item-index='"+index+"' value='"+value+"'> ";
	}
	</script>
</html>