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
								    <input type="text" name="f_id" id="f_id"  class="form-control search-items auto-not-null" >
								    <div class="input-group-btn">
	                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                        <span class="caret"></span>
	                                    </button>
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                </div>
								  </div>
								  <div class="form-group inline-large">
								    <label >货源名称：</label>
								    <input type="text" name="f_department" id="f_department" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group inline-small">
								    <label >货源余额：</label>
								    <input type="text" name="yue" id = "yue" class="form-control search-items" disabled>
								  </div>
							</div>
							<div class="row">
								  <div class="form-group input-group inline-small">
								    <label >发票号：</label>
								    <input type="text" name="inv_no" class="form-control search-items">
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >发票日期：</label>
								    <input name="inv_date" id="inv_date" type="text" class="form-control layer-date search-items date-type">
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >发票类别：</label>
								    <select name="fc_invoice_class" class="form-control dictionary search-items" >
								    </select>
								  </div>
								  <div class="form-group inline-small">
<!-- 								    <label >inv_id：</label> -->
								    <input type="text" name="inv_id" class="form-control search-items" style="display:none">
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >是否红冲：</label>
								    <select name="is_red" id = "is_red" class="form-control search-items" disabled="disabled">
								    	<option value = "false">否</option>
								    	<option value = "true">是</option>
								    </select>
								  </div>
							</div>
							<div class="row">
								 <div class="form-group input-group inline-small not-null">
								    <label >外币币种：</label>
								    <select name="currency" id="currency" class="dictionary search-items">
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >发票外币总金额：</label>
								    <input type="text" name="c_real_money" id="is_real_money" class="form-control search-items">
								  </div>
							</div>
							<div class="row">
								  <div class="form-group input-group inline-large">
								    <label >备注：</label>
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
		var json_obj=formToJson($("#form"));
		json_obj['limit'] =param.limit;
		json_obj['offset'] =param.offset;
		json_obj['sortName'] =this.sortName;
		json_obj['sortOrder'] =this.sortOrder;
	    return json_obj;
	}
	
	function toDel(ps_id){
		ajax_function_ask_and_dosuccess("确认删除？","deleteSourceInvoiceItem","post",{'ps_ids':ps_id},load_table_data_success);
	}
	
	function renderOperator(value,row,index){
		if('${is_detail}'==0){
			return "<a onclick=\"toDel('" + row.ps_id + "')\">删除</a>";
		}
		return null;
	}
	
	function end_function(index, layero){
		load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'sourceInvoice_guid'},$table);
	}
	
	function load_table_data_success(data){
		if (data.success){
   			layer.msg("操作成功！");
   			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'sourceInvoice_guid'},$table);
    	} else {
    		layer.msg(data.errorMsg);
    	}
	}
	
	var $table = $('#table');
	load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'sourceInvoice_guid'});
	$(document).ready(function () {
		
		if('${is_detail}'==1){
			$("#save").remove();
			$("#add").remove();
			$("#delete_items").remove();
		}
	
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		$('#save').on('click', function () {
			if(!has_null($("#form"))&&!auto_not_matching($("#form"))){				
				if($("input[name='c_id']").attr("data-id")=="") {
					layer.msg("客户编号不正确");
				}else if($("#is_red").val()==true&&$("#is_real_money").val()>0){
					layer.msg("红冲发票金额必须为负数");
				}else if($("#is_red").val()==false&&$("#is_real_money").val()<0){
					layer.msg("非红冲发票金额必须大于等于0");
				}else{
					ajax_function("editSourceInvoice","post",$('#form').serialize(),'修改成功');
				}
			}
		});
		
		$('#delete_items').on('click',function(){
			var ps_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
                return row.ps_id;
            });
			if(ps_ids.length!=0) {
				ajax_function_ask_and_dosuccess("确认删除？","deleteSourceInvoiceItem","post",{'ps_ids':ps_ids},load_table_data_success);
			} else {
				layer.msg("未选择明细！");
			}
		});
		
		//填充数据
		var invoice=JSON.parse('${oneJson}');
		
		//加载字典数据
		get_dictionary("${context}",invoice);

		//填充数据
		set_one_info($("#form"),invoice);
		
		//加载后自动填充余额
		var f_id = $("input[name='f_id']").val();
		//var currency = $("select[name='currency']").val();
		var currency =invoice.currency;
		console.log("currency"+currency);
		console.log("f_id"+f_id);
		$.ajax({
			url: "${context}/fc/payment/getOneFactoryYue", 
			method: "post",
			dataType: "json",
			traditional:true,
			//传送请求数据
			data: {'f_id': f_id,'currency':currency},
			    success: function (data) { 
			    $('#yue').val(data.balance_c_real_money);
			},
			    error:function(data){
			    alert("ajax请求失败!");
			}
		});	
		
		//bootstrap初始化		
		initialize_table($table,"getSourceInvoiceEditItemList",${tableHeader},queryParams,"#tableTool",550);
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
		
		button_click_windows_end($add,2,"引入进货单明细",'sourceInvoiceStatementItemPull',true,['750px', '580px'],end_function);
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
		
		//自动搜索填补
		initialize_bsSuggest_fc_factory("${context}", "f_department", "f_id");
		initialize_bsSuggest_fc_user("${context}", "o_id_receiver_name", "o_id_receiver");      // 放用户信息
		
		// 获得当前部门的考核单位
		get_assess_unit_by_dept("${context}", "unit_code",invoice.unit_code);
	});
	
	$(document).ready(function () {
		$(".ibox-content-table").on("change",".c_real_money",function(){
			 var can_kp_money = $(this).data('can-c-real-money');
			 
			 /*if (can_kp_money < 0) {
				 layer.msg("负数开票金额不允许修改!");
				 $table.bootstrapTable('refresh');
				 return;
			 }*/
			 
			 if(isNaN($(this).val())){
				  layer.msg("必须输入数字!");
				  $table.bootstrapTable('refresh');
				  return;
			 } else if(can_kp_money > 0 && Number($(this).val())<=0){
				 layer.msg("正数结算单必须输入大于0!");
				 $table.bootstrapTable('refresh');
				 return;
			 } else if(can_kp_money < 0 && Number($(this).val())>=0){
				 layer.msg("负数结算单必须输入小于0!");
				 $table.bootstrapTable('refresh');
				 return;
			 }		
			 
			 if ((can_kp_money > 0 && $(this).val() > can_kp_money)  // 正数不允许出超
					||  (can_kp_money < 0 && $(this).val() < can_kp_money)  // 负数不允许出超
					 ){
				 layer.msg("开票金额不允许超过可开票金额!");
				 $table.bootstrapTable('refresh');
				 return;
			 }
			 
			 var ps_id = $.trim($(this).data('ps-id'));
			 ajax_function_refresh("updateSourceInvoiceItem","post",{"ps_id":ps_id, "c_real_money": Number($(this).val()) },'修改成功',$table);
		 });
	})
	
	function renderKpMoney(value, row, index) {
		if (!value) {
			value = 0;
		}
		return "<input type='text' class='"+row.ps_id+" c_real_money' data-can-c-real-money='"+row.can_c_real_money
				   + "' data-ps-id='" + row.ps_id
					+ "' data-item-index='"+index+"' value='"+value+"'> ";
	}
	
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
	
	//根据货源和币种自动填充货源余额
	$("input[name='f_id']").on("onSetSelectValue",function(){
		var f_id = $("input[name='f_id']").val();
		var currency = $("select[name='currency']").val();
		if(currency != null&currency!=""){//币种不为空显示余额，否则清除
			$.ajax({
		        url: "${context}/fc/payment/getOneFactoryYue", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: {'f_id': f_id,'currency':currency},
		        success: function (data) { 
		        	$('#yue').val(data.balance_c_real_money);
		        },
		        error:function(data){
		        	alert("ajax请求失败!");
		        }
		    });	
		}else{
			$('#yue').val();
		}
	});
	
	$('#currency').change(function(){
		var f_id = $("input[name='f_id']").val();
		var currency = $("select[name='currency']").val();
		if(currency == null||currency==""){ //币种为空，清空显示余额
			$('#yue').val("");
			return;
		}
		if(f_id != null&f_id!=""){//币种不为空，且货源不为空，显示余额，否则清空
			$.ajax({
		        url: "${context}/fc/payment/getOneFactoryYue", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: {'f_id': f_id,'currency':currency},
		        success: function (data) { 
		        	$('#yue').val(data.balance_c_real_money);
		        },
		        error:function(data){
		        	alert("ajax请求失败!");
		        }
		    });	
		}else{
			$('#yue').val("");
		}
	})
	
	function openStatement(ps_id) {
		open_layer(2,'结算单信息','statementEdit?is_detail=1&ps_id=' + ps_id, ['1200px', '500px'],true);
	}
	
	function renderStatement(value, row, index) {
		return "<a onclick=\"openStatement('"+row.ps_id + "')\">" + row.ps_id + "</a> ";
	}
	</script>
</html>