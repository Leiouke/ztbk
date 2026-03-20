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
			            <input type="hidden" name="rs_id">
			            <div class="col-xs-12">
				            <div class="row">
								  <div class="form-group input-group inline-middle not-null">
								    <label >客户编号：</label>
								    <input type="text" name="c_id" class="form-control search-items auto-not-null" >
								  </div>
								  <div class="form-group inline-large">
								    <label >户号(_客户名称)：</label>
								    <input type="text" name="c_name" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >开票类别：</label>
								    <select name="fc_kp_form" data-id-start=3 data-id-end=4 class="form-control dictionary" id = "fc_kp_form">
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >发票类别：</label>
								    <select name="fc_kp_family" class="form-control dictionary" data-id-list="0,0" >
								    </select>
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-small">
								    <label >累加金额：</label>
								    <input type="text" name="total_money" class="form-control" value="0.00" readonly>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >发票税率：</label>
								    <select name="fc_tax_rate" class="form-control dictionary" >
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >可开票金额：</label>
								    <input type="text" name="can_kp_money" class="form-control search-items">
								  </div>
								  <div class="form-group input-group inline-small" >
							            <label >收款人：</label>
							            <input type="text" name="o_id_receiver_name"  class="form-control">
									    <div class="input-group-btn">
				                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				                        	<span class="caret"></span>
				                        </button>
				                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                        </div>
				                        <input type="hidden" name="o_id_receiver"  class="form-control">
							       </div>
							       <div class="form-group inline-small not-null">
			                  		<label>所属组织机构：</label>
			                        <input type="text" name="org_name" readonly="readonly"/>
			                        <input type="hidden" name="org_code"/>
				                   </div>
				                   <div class="form-group inline-small">	
			                  		<label>考核单位：</label>
			                        <select name="unit_code" class="dictionary" id="unit_code">
							    	</select>
					               </div>
					               <div class="form-group inline-small">
								    <label >邮箱：</label>
								    <input type="text" name="fc_kp_mail" id ="fc_kp_mail" class="form-control search-items">
								 </div>
							</div>
							<div class="row">
								<div class="form-group inline-large not-null">
			                  		<label>开票银行：</label>
			                        <input type="text" name="bank_name" readonly="readonly"/>
			                        <input type="hidden" name="bank_id"/>
				                </div> <a id="select_bank">选择</a>
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>开票明细</h5>
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
	    <button id="save" class="btn btn-primary" type="button">快捷开票</button>
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
	
	function toDel(inc_no){
		ajax_function_ask_and_refresh("确认删除?","deleteStatementQuikKpItem","post",{'rs_id': '${param.rs_id}', 'inc_no': inc_no},"删除成功!",$('#table'));
	}
	
	function renderOperator(value,row,index){
		return "<a onclick=\"toDel('"+ row.inc_no + "')\">删除</a>";
	}
	
	function end_function(index, layero){
		load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'statement_quick_kp_guid'},$table);
	}
	
	/*function load_table_data_success(data){
		if (data.success){
   			layer.msg("操作成功！");
   			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'statement_quick_kp_guid'},$table);
    	} else {
    		layer.msg(data.errorMsg);
    	}
	}*/
	
	var $table = $('#table');
	load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'statement_quick_kp_guid'});
	$(document).ready(function () {
			$('#save').on('click', function () {
				console.log($("#fc_kp_form").val());
				console.log($("#fc_kp_mail").val());
				if(!has_null($("#form"))&&!auto_not_matching($("#form"))){
					if($("input[name='c_id']").attr("data-id")==""){
						layer.msg("客户编号不正确");
					}else if(($("#fc_kp_form").val()=="2"||$("#fc_kp_form").val()=="3"||$("#fc_kp_form").val()=="4")&&$("#fc_kp_mail").val()==""){
						layer.msg("电子发票必须输入邮箱");
					}else {
						if ($table.bootstrapTable('getData',false).length == 0) {
							alert("请加入开票明细后在完成开票！");
						} else {
							ajax_function_ask_and_close("确认快捷开票？","statementQuikKpComplete","post",$("#form").serialize(),"快捷开票完成！");
						}
					}
				}
			});
			
			var invoice=JSON.parse('${oneJson}');
			//加载字典数据
			get_dictionary("${context}",invoice);
			$("input[name='c_name']").val(invoice['f_name']);
			$("input[name='c_id']").val(invoice['custom_f_id']);
			
			//填写已有数据
			set_one_info($("#form"),invoice);
			
			$(".search-items").each(function(){
				$(this).attr("readonly",true);
				$("#fc_kp_mail").attr("readonly",false);
			});
			
			$('#select_bank').on('click', function () {
				open_layer(2,'开票银行选择','clientBankQuery?c_id=' + $("input[name='c_id']").val(), ['1200px', '500px'],false);
			});
			
			//bootstrap初始化
			initialize_table($table,"getStatmentQuikKpItemList",${tableHeader},queryParams,"#tableTool",550);
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
			button_click_windows_end($add,2,"新增结算单开票明细",'statementQuikKpItemAdd?rs_id=' + invoice.rs_id,false,['750px', '580px'],end_function);

			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			
			//自动搜索填补
			//initialize_bsSuggest_fc_client("${context}", "c_name", "c_id");
			initialize_bsSuggest_fc_user("${context}", "o_id_receiver_name", "o_id_receiver");      // 放用户信息
			
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code", invoice.unit_code);
		});
	</script>
</html>