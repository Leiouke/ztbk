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
			            <input type="hidden" name="kp_id">
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
								    <input type="text" name="c_name" class="form-control search-items" disabled>
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-small">
								    <label >发票号：</label>
								    <input type="text" name="kp_no" class="form-control search-items" readonly>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >开票类别：</label>
								    <select name="fc_kp_form" id = "fc_kp_form" data-id-list = "3,4"  class="form-control dictionary search-items" >
								    	<option></option>
								    </select>
								  </div>
								   <div class="form-group inline-small">
								    <label >邮箱：</label>
								    <input type="text" name="fc_kp_mail" id ="fc_kp_mail" class="form-control search-items">
								  </div>
								  <div class="form-group inline-small">
								    <label >发票日期：</label>
								    <input name="kp_date" id="kp_date" type="text" class="form-control search-items date-type" readonly>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >发票类别：</label>
								    <select name="fc_kp_family" class="form-control dictionary search-items" id = "fc_kp_family">
								    </select>
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-small">
								    <label >累加金额：</label>
								    <input type="text" name="total_money" class="form-control search-items" value="0.00" readonly>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >发票税率：</label>
								    <select name="fc_tax_rate" class="form-control dictionary search-items" >
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >发票含税金额：</label>
								    <input type="text" name="tax_money" class="form-control search-items">
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-large">
								    <label >备注：</label>
								    <input type="text" name="memo" class="form-control search-items">
								  </div>
								  <div class="form-group input-group inline-small" >
							            <label >收款人：</label>
							            <input type="text" name="o_id_receiver_name"  class="form-control search-items">
									    <div class="input-group-btn">
				                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				                        	<span class="caret"></span>
				                        </button>
				                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                        </div>
				                        <input type="hidden" name="o_id_receiver"  class="form-control search-items">
							       </div>
							       <div class="form-group inline-small not-null">
			                  		<label>所属组织机构：</label>
			                        <input type="text" name="org_name" readonly="readonly"/>
				                   </div>
				                   <c:if test="${param.fc_kp_type == 1}">  <!-- 只有预收发票才有 财务分类 选项 -->
				                   <div class="form-group inline-small">	
			                  		<label>财务分类：</label>
			                        <select name="kp_cw_type" class="dictionary" >
							    	</select>
				                   </div>
				                   </c:if>
				                   <div class="form-group inline-small">	
			                  		<label>考核单位：</label>
			                        <select name="unit_code" class="dictionary" id="unit_code">
							    	</select>
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
	
	function toDel(statement_id){
		ajax_function_ask_and_dosuccess("确认删除？","deleteSaleInvoiceItem","post",{'statement_ids':statement_id},load_table_data_success);
	}
	
	function renderOperator(value,row,index){
		var str = "";
		if(${empty param.is_detail}){
			str = "<a onclick=\"toDel('"+row.statement_id+"')\">删除</a>";
		}
		return str;
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
	load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'saleInvoice_guid'});
	$(document).ready(function () {
			if('${param.is_detail}'==1){
				$("#save").remove();
				$("#add").remove();
				$("#delete_invoice").remove();
				$("#delete_items").remove();
			}
		
			$(".layer-date").each(function(){
				inistal_one_data('#'+$(this).attr('id'));
			});
			$('#save').on('click', function () {
				if(!has_null($("#form"))&&!auto_not_matching($("#form"))){
					if($("input[name='c_id']").attr("data-id")==""){
						layer.msg("客户编号不正确");
					}else if(($("#fc_kp_form").val()=="2"||$("#fc_kp_form").val()=="3"||$("#fc_kp_form").val()=="4")&&$("#fc_kp_mail").val()==""&&$("#fc_kp_family").val()=="0"){
						layer.msg("电子发票必须输入邮箱");
					}else{
						ajax_function("editSaleInvoice","post",$('#form').serialize(),'保存成功');
					}
				}
			});			 
			var invoice=JSON.parse('${oneJson}');
			//加载字典数据
			get_dictionary("${context}",invoice);
			$("input[name='c_name']").val(invoice['custom_id']+"_"+invoice['c_department']);
			//填写已有数据
			set_one_info($("#form"),invoice);
			
			// 状态不为0-开票中 或者 已经申请开票了, 就不允许修改或者删除了
			if (invoice.status !=0  || invoice.is_claim_kp || invoice.is_account) {
				$("#save").hide();
				$("#delete_invoice").hide();
				$(".search-items").each(function(){
					$(this).attr("readonly",true);
				});
			}
			
			$('#delete_invoice').on('click',function(){
				 ajax_function_ask_and_close("确认删除？","deleteSaleInvoice","post",{kp_id:invoice.kp_id},'删除成功');
			});
			//bootstrap初始化
			initialize_table($table,"getSaleInvoiceEditItemList",${tableHeader},queryParams,"#tableTool",550);
			$table.bootstrapTable('refreshOptions',{onLoadSuccess: function(data){
	 			var sum_money=0;
	 			$.each(data.rows, function(index, row){ 
	 				if(row.kp_money==undefined){
						sum_money+=0;
					}else{
						sum_money+=row.kp_money;
					}			
				});
	 			sum_money=sum_money.toFixed(2);
	 			$("input[name='total_money']").val(sum_money);
			}});
			
			//增加条目layer
			var $add=$("#add");
			if (invoice.fc_kp_type == 0) {
				button_click_windows_end($add,2,"引入结算单明细",'saleInvoiceStatementItemPull',true,['750px', '580px'],end_function);
			} else if (invoice.fc_kp_type == 1) {
				button_click_windows_end($add,2,"引入预收单明细",'saleInvoiceAdvanceItemPull',true,['750px', '580px'],end_function);
			}

			$('#delete_items').on('click',function(){
				var statement_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
	                return row.statement_id;
	            });
				if(statement_ids.length!=0) {
					ajax_function_ask_and_dosuccess("确认删除？","deleteSaleInvoiceItem","post",{'statement_ids':statement_ids},load_table_data_success);
				} else {
					layer.msg("未选择明细！");
				}
			});
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			//自动搜索填补
			initialize_bsSuggest_fc_client("${context}", "c_name", "c_id");
			initialize_bsSuggest_fc_user("${context}", "o_id_receiver_name", "o_id_receiver");      // 放用户信息
			
			// 获得当前部门的财务分类(取普通型)
			get_financial_classify_by_dept("${context}", "${sessionScope.defaultRole.dep_org_code}", false, "kp_cw_type", invoice.kp_cw_type);
			
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code", invoice.unit_code);
		});
		
		$(document).ready(function () {
			$(".ibox-content-table").on("change",".input_kp_money",function(){
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
				 
				 if ($(this).val() > can_kp_money) {
					 layer.msg("开票金额不允许超过可开票金额!");
					 $table.bootstrapTable('refresh');
					 return;
				 }
				 
				 var statement_id = $.trim($(this).data('statement-id'));
				 ajax_function_refresh("updateSaleInvoiceItem","post",{"statement_id":statement_id, "kp_money": Number($(this).val()) },'修改成功',$table);
			 });
		})
		
		function renderKpMoney(value, row, index) {
			if (!value) {
				value = 0;
			}
			return "<input type='text' class='"+row.statement_id+" input_kp_money' data-can-kp-money='"+row.can_kp_money
					   + "' data-statement-id='" + row.statement_id
						+ "' data-item-index='"+index+"' value='"+value+"'> ";
		}
		
		$("input[name='c_id']").on("onSetSelectValue",function(){
			var c_id = $("input[name='c_id']").val();
			
			var unit_code_value;
			$.ajax({
		        url: "${context}/fc/basic/getOneClient", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: {c_id: c_id},
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
		
		function openStatement(rs_id) {
			open_layer(2,'结算单信息','statementEdit?is_detail=1&rs_id=' + rs_id, ['1200px', '500px'],true);
		}
		
		function renderStatement(value, row, index) {
			return "<a onclick=\"openStatement('"+row.rs_id + "')\">" + row.rs_id + "</a> ";
		}
	</script>
</html>