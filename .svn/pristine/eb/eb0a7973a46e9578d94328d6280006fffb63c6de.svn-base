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
								    <label >货源编号：</label>
								    <input type="text" name="f_id" id ="f_id" class="form-control search-items auto-not-null"  disabled />
								  </div>
								  <div class="form-group inline-large">
								    <label >户号(_货源名称)：</label>
								    <input type="text" name="f_department" class="form-control search-items" disabled />
								  </div>
								  <div class="form-group input-group inline-small not-null">
								    <label >外币币种：</label>
								    <select name="currency" id="currency" class="dictionary search-items">
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group inline-small input-group">
								    <label >冲销外币总金额：</label>
								    <input type="text" name="against_c_real_money" class="form-control search-items" readonly>
								  </div>
<!-- 								  <div class="form-group inline-small"> -->
<!-- 								    <label >折扣总金额：</label> -->
<!-- 								    <input type="text" name="total_rebate_money" class="form-control search-items" readonly> -->
<!-- 								  </div> -->
								  <div class="form-group inline-large input-group">
								    <label >备注：</label>
								    <input type="text" name="memo" class="form-control search-items">
								  </div>
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>货源支出单发票明细</h5>
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
	                            <!-- <button type="button" class="btn btn-outline btn-default" id="delete_items">
	                               <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>
	                           	</button> -->
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
	var $table = $('#table');
	
	var cash_register_str='${oneJson}';
	cash_register_str=cash_register_str.replace(/\r\n/g,"\\r\\n")  
	cash_register_str=cash_register_str.replace(/\n/g,"\\n");
	cash_register_str=cash_register_str.replace(/\s/g," ");
	var cash_register=JSON.parse(cash_register_str);
	
	function queryParams(param) {
		var json_obj_invoice = {};
		json_obj_invoice['limit'] =param.limit;
		json_obj_invoice['offset'] =param.offset;
		json_obj_invoice['sortName'] =this.sortName;
		json_obj_invoice['sortOrder'] =this.sortOrder;
	    return json_obj_invoice;
	}
	
	function toDel(inv_id){
		ajax_function_ask_and_dosuccess("确认删除？","deleteFactoryPayItemItem","post",{'inv_ids':inv_id},load_table_data_success);
	}
	
	function renderOperator(value,row,index){
		return "<a onclick=\"toDel('" + row.inv_id + "')\">删除</a>";
	}
	
	function end_function(index, layero){
		load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'factoryPayItem_guid'},$table);
	}
	
	function load_table_data_success(data){
		if (data.success){
   			layer.msg("操作成功！");
   			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'factoryPayItem_guid'},$table);
    	} else {
    		layer.msg(data.errorMsg);
    	}
	}
	
	load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'factoryPayItem_guid'});
	$(document).ready(function () {
		
		
		//填写已有数据
		set_one_info($("#form"),cash_register);
		
		//加载字典数据
		get_dictionary("${context}",cash_register);
		
		$('#save').on('click', function () {
			if(!has_null($("#form"))){
				if($("input[name='f_id']").attr("data-id")=="") {
					layer.msg("货源编号不正确");
				} else {
					$("#f_id").removeAttr("disabled");
					ajax_function("addFactoryPayItem","post",$('#form').serialize(),'新增成功');
				}
			}
		});
		
		/*$('#delete_items').on('click',function(){
			var statement_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
                return row.statement_id;
            });
			if(statement_ids.length!=0) {
				ajax_function_ask_and_dosuccess("确认删除？","deleteSaleInvoiceItem","post",{'statement_ids':statement_ids},load_table_data_success);
			} else {
				layer.msg("未选择明细！");
			}
		});*/
		
		//bootstrap初始化		
		initialize_table($table,"getFactoryPayItemAddList",${tableHeader},queryParams,"#tableTool",550);
 		$table.bootstrapTable('refreshOptions',{onLoadSuccess: function(data){
 			var against_c_real_money = 0;
 			$.each(data.rows, function(index, row){
				if(row.against_c_real_money==undefined){
					against_c_real_money += 0;
				}else{
					against_c_real_money += row.against_c_real_money;
				}
			});
 			against_c_real_money = against_c_real_money.toFixed(2);
 			$("input[name='against_c_real_money']").val(against_c_real_money);
		}});
		
		//增加条目layer
		var $add=$("#add");
		button_click_windows_end($add,2,"引入货源发票明细",'factoryPayItemItemPull?f_id=' + cash_register.f_id+'&currency='+cash_register.currency,true,['750px', '580px'],end_function);
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
	});
	
	$(document).ready(function () {
		
		$(".ibox-content-table").on("change",".input_rebate_money",function(){
			 if(isNaN($(this).val())){
				  layer.msg("必须输入数字!");
				  $table.bootstrapTable('refresh');
				  return;
			 }
			 if($(this).val()>$(this).data("canCRealMoney")){
				 layer.msg("金额不能大于可冲销外币实洋!");
				  $table.bootstrapTable('refresh');
				  return;
			 }
			 
			 var inv_id = $.trim($(this).data('inv-id'));
			 var f_id = $.trim($(this).data('f-id'));
			 var currency = $.trim($(this).data('currency'));
			 var against_c_real_money = $(this).val();
			 ajax_function_dosuccess("updateFactoryPayItemItem","post",{"inv_id":inv_id, "against_c_real_money":against_c_real_money, "f_id":f_id,"currency": currency }, rebate_money_update_success);
		 });
	})
	
	function rebate_money_update_success(data){
		if (data.success){
   			layer.msg("修改成功！");
    	} else {
    		layer.msg(data.errorMsg);
    	}
		load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'factoryPayItem_guid'},$table);
	}
	
	function renderRebateMoney(value, row, index) {
		if (!value) {
			value = 0;
		}
		return "<input type='text' class='" + row.inv_id + " input_rebate_money' data-inv-id='" + row.inv_id + "' data-against-c-real-money='" + row.against_c_real_money
					+ "' data-f-id='" + row.f_id + "' data-currency='" + row.currency + "' data-can-c-real-money='" + row.can_c_real_money
					+ "' data-item-index='"+index+"' value='"+value+"'> ";
	}
	
	function openInvoice(inv_id) {
		open_layer(2,'货源发票信息','sourceInvoiceEdit?is_detail=1&inv_id=' + inv_id, ['1200px', '500px'],true);
	}
	
	function renderInvoice(value, row, index) {
		return "<a onclick=\"openInvoice('"+row.inv_id + "')\">" + row.inv_id + "</a> ";
	}
	</script>
</html>