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
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form" class="form-inline">
			            <div class="col-xs-12">
				            <div class="row">
								  <div class="form-group inline-large">
								    <label >户号(_客户名称)：</label>
								    <input type="text" name="c_name" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group inline-small">
								    <label>开票单号：</label>
								    <input type="text" name="kp_id" class="form-control search-items">
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >开票类型：</label>
								    <select name="invoice_type" class="form-control dictionary search-items" >
								    </select>
								  </div>
							</div>
							<div class="row">
								<div class="form-group inline-small">
								    <label >发票税率：</label>
								    <select name="tax_rate" class="form-control dictionary search-items" >
								    </select>
								</div>
								<div class="form-group inline-small not-null">
								    <label >是否开到明细：</label>
								    <select name="is_item_kp" class="form-control dictionary isboolean search-items" >
								    </select>
								</div>
								<div class="form-group inline-small not-null">
								    <label >已申请开票金额：</label>
								    <input type="text" name="tax_money" class="form-control search-items">
								</div>
							</div>
							<div class="row">
								<div class="form-group inline-middle">
								    <label >开票内容：</label>
								    <input type="text" name="kp_content" class="form-control search-items">
								</div>  
								<div class="form-group inline-small">
								    <label >开票数量：</label>
								    <input type="text" name="kp_amount" class="form-control search-items">
								</div>  
								<div class="form-group inline-small">
								    <label >开票单位：</label>
								    <input type="text" name="kp_unit" class="form-control search-items">
								</div>
							</div>
							<div class="row">
								<div class="form-group inline-large">
								    <label >开票备注：</label>
								    <input type="text" name="kp_memo" class="form-control search-items">
								</div>  
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>开票内容明细</h5>
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
	                            <button type="button" class="btn btn-outline btn-default" id="mergeItems">
	                              	合并明细
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
	    <button id="commit_claim" class="btn btn-primary" type="button">提交申请</button>
	    <button id="cancel_claim" class="btn btn-warning" type="button">撤销申请</button>
	    <button id="cancel" class="btn btn-white" type="button">关闭</button>
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
		var $table = $('#table');
		var invoice=JSON.parse('${oneJson}');
		
		function queryParams(param) {
			var json_obj_invoice = {};
			json_obj_invoice['limit'] =param.limit;
			json_obj_invoice['offset'] =param.offset;
			json_obj_invoice['sortName'] =this.sortName;
			json_obj_invoice['sortOrder'] =this.sortOrder;
			json_obj_invoice['kp_id'] = invoice.kp_id;
		    return json_obj_invoice;
		}
		
		function toDel(id){
			ajax_function_ask_and_dosuccess("确认删除？","deleteSaleInvoiceContentItem","post",{'id':id},load_table_data_success);
		}
		
		function load_table_data_success(data){
			if (data.success){    		
	   			layer.msg("操作成功！");
	   			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','kp_id':invoice.kp_id},$table);
	    	} else {
	    		layer.msg(data.errorMsg);
	    	}
		}
		
		function toEdit(id) {
			open_layer_end(2,'编辑发票内容明细','toSaleInvoiceContentItemEdit?id='+id,['750px', '500px'],false,end_function);
		}
		
		function renderOperator(value,row,index){
			var str = '';
			if (!invoice.is_commit_claim) {
				str += "<a onclick=\"toEdit('"+row.id+"')\">编辑</a> ";
				str += "<a onclick=\"toDel('"+row.id+"')\">删除</a>";
			}
			return str;
		}
		
		function end_function(index){
			var json_data_list={};
			json_data_list['queryId']='${queryId}';
			json_data_list['kp_id']=invoice.kp_id;
			search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getSaleInvoiceContentItemList",$table);
     	}
		
		load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}', 'kp_id': invoice.kp_id});
		
		Number.isNaN = Number.isNaN || function(value) {
		    return  (typeof value) === 'number' && window. isNaN(value);
		}
		
		$(document).ready(function () {
			$('#cancel_claim').on('click', function () {
				ajax_function_ask_and_close("确认撤销？","saleInvoiceCancelClaimKp","post",$('#form').serialize(),'撤销成功');
			});	
			
			$('#commit_claim').on('click', function () {
				ajax_function_ask_and_close("确认提交？","statementCommitClaimKp","post",$('#form').serialize(),'提交成功');
			});	
			
			//加载字典数据
			get_dictionary("${context}",invoice);
			$("input[name='c_name']").val(invoice['custom_id']+"_"+invoice['c_department']);
			
			$(".search-items").each(function(){
				$(this).attr("readonly",true);
			});
			//填写已有数据
			set_one_info($("#form"),invoice);
			
			initialize_table($table,"getSaleInvoiceContentItemList",${tableHeader},queryParams,"#tableTool",550);
			
			//增加条目layer
			var $add=$("#add");
			button_click_windows_end($add,2,"新增发票内容明细",'saleInvoiceContentItemAdd?kp_id=' + invoice.kp_id,false,['750px', '500px'],end_function);
			
			//表格配置 layer
			var $config=$("#config");
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');	
			
			$('#mergeItems').on('click',function(){
				var money = 0;
				var amount = 0;
				var total_money = 0;
				var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
					money += row.kp_money;
					amount += parseInt(row.kp_amount);
					total_money += row.total_money;
	                return row.id;
	            });
				if(ids.length!=0){
					// 判断是否不是一个数字
					if (Number.isNaN(total_money)) {
						total_money = '';
					}
					
					open_layer_refresh(2,'合并后开票明细内容','toSaleInvoiceContentItemMerge?ids=' + ids + '&kp_money=' + money + '&kp_id=' + invoice.kp_id + '&kp_amount=' + amount
							+ '&total_money=' + total_money, $table,['750px', '500px'],false);
				} else {
					layer.msg("未选择明细！");
				}
			});
			
			if (invoice.is_commit_claim) {
				$("#add").hide();
				$("#mergeItems").hide();
				$("#commit_claim").hide();
				$("#cancel_claim").hide();
			}
		});
	</script>
</html>