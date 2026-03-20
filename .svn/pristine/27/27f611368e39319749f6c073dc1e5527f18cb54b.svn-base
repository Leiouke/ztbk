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
								    <input type="text" name="f_id" class="form-control search-items auto-not-null" id = "f_id">
								    <div class="input-group-btn">
	                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                        <span class="caret"></span>
	                                    </button>
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                </div>
								  </div>
								  <div class="form-group inline-large">
								    <label >货源名称：</label>
								    <input type="text" name="f_department" class="form-control search-items" disabled>
								  </div>
							</div>
				            <div class="row">
								  <div class="form-group input-group inline-large not-null">
								    <label >汇款账号：</label>
								    <input type="text" name="f_bank_name" class="form-control search-items auto-not-null" >
								    <div class="input-group-btn">
	                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                        <span class="caret"></span>
	                                    </button>
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                </div>
								  </div>
							  		<input type="hidden" name="bank_id">
							</div>
							<div class="row">
								  <div class="form-group input-group inline-small not-null">
								    <label >申请单类型：</label>
								    <select name="fc_apply_type" id = "fc_apply_type" class="form-control search-items" disabled="disabled">
								    	<option value = "1">发票申请</option>
								    	<option value = "0">预付申请</option>
								    </select>
								  </div>
								  <div class="form-group input-group inline-small not-null">
					    				<label >业务员：</label>
					    				<input type="text" name="o_id_operator_name" class="form-control search-items">
					    				<div class="input-group-btn">
                               				<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                   				<span class="caret"></span>
                               				</button>
                               				<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                       					 </div>
                        				<input type="hidden" name="o_id_operator" class="form-control search-items">
					  			</div>
					  			<div class="form-group input-group inline-small not-null">
								    <label >付款类型：</label>
								    <select name="oa_payment_type" id="oa_payment_type" class="dictionary search-items" disabled = "disabled">
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group input-group inline-small not-null">
								    <label >税金分类：</label>
								    <select name="oa_tax_type" id="oa_tax_type" class="dictionary search-items" disabled = "disabled">
								    	<option></option>
								    </select>
								  </div>
							</div>
							<div class="row">
								<div class="form-group input-group inline-small">
					  				<label >是否代理：</label>
								    <select name="is_agent" id = "is_agent" class="search-items">
								    	<option id = "agent_no" value = "0">否</option>
								    	<option id = "agent_yes" value = "1">是</option>
								    </select>
					  			</div>
					  			<div class="form-group input-group inline-small">
								    <label >代理客户编号：</label>
								    <input type="text" name="agent_c_id" id = "agent_c_id" class="form-control search-items" readonly>
								    <div class="input-group-btn">
	                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                        <span class="caret"></span>
	                                    </button>
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                </div>
								  </div>
								  <div class="form-group inline-large">
								    <label >代理客户名称：</label>
								    <input type="text" name="c_department" id="c_department" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group input-group inline-small">
								    <label >客户余额：</label>
								    <input type="text" name="advance_balance" id="advance_balance"  class="form-control search-items" disabled="disabled"> 
								  </div>
								  <a id="balanceLog">收支明细</a>
							</div>
							<div class="row">
								 <div class="form-group input-group inline-small not-null">
								    <label >外币币种：</label>
								    <select name="currency" id="currency" class="dictionary search-items">
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group input-group inline-large">
								    <label >总计：</label>
								    <input type="text" name="total_money" class="form-control search-items" disabled="disabled"> 
								  </div>
								  <div class="form-group input-group inline-small not-null">
								    <label >付款申请去向：</label>
								    <select name="application_target" id="application_target" class="dictionary search-items">
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group inline-small">
<!-- 								    <label >ap_id：</label> -->
								    <input type="text" name="ap_id" class="form-control search-items" style="display:none">
								  </div>
							</div>
							<div class="row">
								  <div class="form-group input-group inline-large">
								    <label >摘要：</label>
								    <input type="text" name="memo" class="form-control search-items">
								  </div>
							      <div class="form-group inline-small not-null">
			                  		<label>所属组织机构：</label>
			                        <input type="text" name="org_name" readonly="readonly" value="${sessionScope.defaultRole.org_name}"/>
			                        <input type="hidden" name="org_code" value="${sessionScope.defaultRole.org_code}" />
				                  </div>
				                  <div class="form-group input-group inline-small not-null">
					    			<label >考核单位：</label>
					    			<select name="unit_code" class="dictionary" id="unit_code">
					    				<option></option>
					    			</select>
					  			  </div>			
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>明细</h5>
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
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
	function queryParams(param) {
		var json_obj_invoice = formToJson($("#form"));
		json_obj_invoice['limit'] =param.limit;
		json_obj_invoice['offset'] =param.offset;
		json_obj_invoice['sortName'] =this.sortName;
		json_obj_invoice['sortOrder'] =this.sortOrder;
		json_obj_invoice['fc_apply_type'] ='${type}';
		if('${type}'==0){
			json_obj_invoice['oa_payment_type'] ='2';
			json_obj_invoice['oa_tax_type'] ='';
		}
		if('${type}'!=0&&$("#oa_payment_type").val()!=4){
			json_obj_invoice['oa_tax_type'] ='';
		}
	    return json_obj_invoice;
	}
	
	function toDel(bill_id){
		ajax_function_ask_and_dosuccess("确认删除？","deletePaymentApplicationItem","post",{'bill_ids':bill_id},load_table_data_success);
	}
	
	function renderOperator(value,row,index){
		if('${is_detail}'==0){
			return "<a onclick=\"toDel('" + row.bill_id + "')\">删除</a>";
		}else{
			return null;
		}
		
	}
	
	function end_function(index, layero){
		if('${type}'==0){
			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'paymentApplication_guid'},$table);
		}else{
			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${invoiceQueryId}','guidname':'paymentApplication_guid'},$table);
		}
		
	}
	
	function load_table_data_success(data){
		if (data.success){
   			layer.msg("操作成功！");
   			if('${type}'==0){
   				load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'paymentApplication_guid'},$table);
   			}else{
   				load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${invoiceQueryId}','guidname':'paymentApplication_guid'},$table);
   			}
    	} else {
    		layer.msg(data.errorMsg);
    	}
	}
	
	var $table = $('#table');
	if('${type}'==0){
			load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'paymentApplication_guid'});
		}else{
			load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${invoiceQueryId}','guidname':'paymentApplication_guid'});
		}
	
	$(document).ready(function () {
		
		//判断是否是详情页
		if('${is_detail}'==1){
			$("#save").remove();
			$("#add").remove();
			$("#delete_items").remove();
		}
	
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		$('#save').on('click', function () {
			if(!has_null($("#form"))){
				$("#fc_apply_type").removeAttr("disabled");
				$("#oa_payment_type").removeAttr("disabled");
				$("#oa_tax_type").removeAttr("disabled");
				ajax_function("editPaymentApplication","post",$('#form').serialize(),'修改成功');
			}
		});
		
		$('#delete_items').on('click',function(){
			var bill_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
                return row.bill_id;
            });
			if(ps_ids.length!=0) {
				ajax_function_ask_and_dosuccess("确认删除？","deletePaymentApplicationItem","post",{'bill_ids':bill_ids},load_table_data_success);
			} else {
				layer.msg("未选择明细！");
			}
		});
		
		//填充数据
		var invoice_str='${oneJson}';
		invoice_str=invoice_str.replace(/\r\n/g,"\\r\\n")  
    	invoice_str=invoice_str.replace(/\n/g,"\\n");
		invoice_str=invoice_str.replace(/\s/g," ");
		
		if('${type}'==0){
			
		}else{
			$("#oa_payment_type").removeAttr("disabled");
		}
		var invoice=JSON.parse(invoice_str);
		
		set_one_info($("#form"),invoice);
		
		if(invoice.oa_payment_type==4){
			$("#oa_tax_type").removeAttr("disabled");
		}
		
		if(invoice.is_agent){//是代理单据打开客户的自动填充
			$("#agent_c_id").attr("readonly",false);
		}
		
		//加载字典数据
		get_dictionary("${context}",invoice);
		
		//税金修改打开和关闭
		$("#oa_payment_type").change(function(){
	        // 获取所选选项的值
	        var selectedValue = $(this).val();

	       if(selectedValue == "4"){
	    	   $("#oa_tax_type").removeAttr("disabled");
	       }else{
	    	   $("#oa_tax_type").val("");
	    	   $("#oa_tax_type").attr("disabled", "disabled");
	       }
	      });
		
		//bootstrap初始化
		if('${type}'==0){
			initialize_table($table,"getPaymentApplicationItemList",${tableHeader},queryParams,"#tableTool",550);
		}else{
			initialize_table($table,"getPaymentApplicationItemList",${invoicetableHeader},queryParams,"#tableTool",550);
		}
 		$table.bootstrapTable('refreshOptions',{onLoadSuccess: function(data){
 			var sum_money=0;
 			$.each(data.rows, function(index, row){
				if(row.c_real_money==undefined){
					sum_money+=0;
				}else{
					sum_money+=row.c_real_money;
				}
			});
 			sum_money=sum_money.toFixed(2);
 			$("input[name='total_money']").val(sum_money);
		}});
		
		//增加条目layer
		var $add=$("#add");
		//button_click_windows_end($add,2,"引入付款申请明细",'paymentApplicationStatementItemPull?type='+'${type}',true,['750px', '580px'],end_function);
		$add.on('click', function () {
			  var f_id = $("#f_id").val();
			  var type = '${type}';
			  var title_now = "";
			  if(type ==0){
				  title_now = "引入预付单";
			  }else {
				  title_now = "引入发票";
			  }
			  //var f_department = $("#f_department").val();
			  var url = "paymentApplicationStatementItemPull?f_id="+f_id+"&type="+type;
			  var index=layer.open({
	              type: 2,
	              title:title_now,
	              resize:true,
	              maxmin: true,
	              //shadeClose: false,
	              //shade: false,
	              moveOut:true,
	              area: ['750px', '580px'],
	              scrollbar: true,
	              skin: 'layui-layer-rim', //加上边框
	              content: url,
	              end:end_function
	          });
			  if(true){
				  layer.full(index);
			  }
		 });
		
		//表格配置 layer
		var $config=$("#config");
		
		console.log("type="+'${type}');
		if('${type}'==0){//预付申请
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		}else{
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${invoiceQueryId}');
		}
		//table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
		
		$("#is_agent").change(function(){
			if($("#is_agent").val()=="1"){
				$("#agent_c_id").attr("readonly",false);
			}else{
				$("#agent_c_id").val("");
				$("#c_department").val("");
				$("#advance_balance").val("");
				$("#agent_c_id").attr("readonly",true);
			}
			
		}); 
		
		//自动搜索填补
		initialize_bsSuggest_fc_factory("${context}", "f_department", "f_id");
		initialize_bsSuggest_fc_user("${context}", "o_id_operator_name", "o_id_operator");      // 放用户信息
		initialize_bsSuggest_fc_f_bank("${context}");//银行
		initialize_bsSuggest_fc_client("${context}", "c_department", "agent_c_id");
		
		// 获得当前部门的考核单位
		get_assess_unit_by_dept("${context}", "unit_code",invoice.unit_code);
		
		$("#balanceLog").click(function(){
			var agent_c_id = $("input[name='agent_c_id']").val();
			if (agent_c_id != '') {
				open_layer(2,'余额收支明细','../collection/clientBalanceLog?c_id='+agent_c_id,['720px', '580px'],true);
			}
		});
	});
	
	$("input[name='f_id']").on("onSetSelectValue",function(){
		var f_id = $("input[name='f_id']").val();
		console.log("f_id="+f_id);
		var unit_code_value;
		$.ajax({
	        url: "${context}/fc/basic/getOneFactory", 
	        method: "post",
	        dataType: "json",
	        traditional:true,
	        //传送请求数据
	        data: {f_id: f_id},
	        success: function (data) { 
	        	unit_code_value = data.unit_code;
	        	
	        	// 将考核单位值设为 结算客户对应的考核单位值
				var count=$("#unit_code option").length;
			    for(var i=0;i<count;i++)  {           
			    	if($("#unit_code").get(0).options[i].value == unit_code_value){  
			            $("#unit_code").get(0).options[i].selected = true;  
			            break; 
			        }  
			    }
	        },
	        error:function(data){
	        	alert("ajax请求失败!");
	        }
	    });	
	});
	
	//自动填入余额
	$("input[name='agent_c_id']").on("onSetSelectValue",function(){
		var agent_c_id = $("input[name='agent_c_id']").val();
		var unit_code_value;
		$.ajax({
	        url: "${context}/fc/basic/getOneClient", 
	        method: "post",
	        dataType: "json",
	        traditional:true,
	        //传送请求数据
	        data: {c_id: agent_c_id},
	        success: function (data) { 
	        	$("#advance_balance").val(data.advance_balance);
	        },
	        error:function(data){
	        	alert("ajax请求失败!");
	        }
	    });	
	});
	
	function openInvoice(inv_id) {
		open_layer(2,'货源发票信息','sourceInvoiceEdit?is_detail=1&inv_id=' + inv_id, ['1200px', '500px'],true);
	}
	
	function openExportInvoice(export_invoice_no_st) {
		open_layer(2,'外销发票明细','../receivable/exportInvoiceItem?export_invoice_no=' + export_invoice_no_st, ['1200px', '500px'],true);
	}
	
	function renderInvoice(value, row, index) {
		return "<a onclick=\"openInvoice('"+row.bill_id + "')\">" + row.bill_id + "</a> ";
	}
	
	function renderExportInvoice(value, row, index) {
		return "<a onclick=\"openExportInvoice('"+row.export_invoice_no_st + "')\">" + row.export_invoice_no_st + "</a> ";
	}
	
	function renderExportInvoiceA(value, row, index) {
		return "<a onclick=\"openExportInvoice('"+row.export_invoice_no_ad + "')\">" + row.export_invoice_no_ad + "</a> ";
	}
	
	function renderAdvance(value,row,index) {
		var str = "";
		str += " <a onclick=\"toAdvance('" + row.pv_id + "')\">" + value + "</a>";
		return str;
	}
	
	function toAdvance(pv_id){
		 open_layer_refresh(2,'预付单详情','advancePrymentEdit?pv_id='+pv_id+'&is_detail='+1,$table,['850px', '450px'],false);
	 }
	</script>
</html>