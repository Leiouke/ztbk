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
	    <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">
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
			            <input type="hidden" name="fh_id">
			            <input type="hidden" name="fhsh_family">
			            <div class="col-xs-12">
				            <div class="row">
								  <div class="form-group input-group inline-small not-null">
										    <label >业务员：</label>
										    <input type="text" name="o_id_operator_name" class="form-control search-items auto-not-null">
										    <div class="input-group-btn">
			                                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
			                                                <span class="caret"></span>
			                                            </button>
			                                            <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
			                                 </div>
			                                 <input type="hidden" name="o_id_operator" class="form-control search-items">
								  </div>
								  <div class="form-group input-group inline-middle not-null">
										    <label >货源编号：</label>
										    <input type="text" name="f_id" class="form-control search-items auto-not-null" >
										    <div class="input-group-btn">
			                                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
			                                                <span class="caret"></span>
			                                            </button>
			                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
			                                            </ul>
			                                 </div>
								  </div>
								  <div class="form-group inline-large">
										    <label >货源名称(_户号)：</label>
										    <input type="text" name="f_name" class="form-control search-items" disabled>
								  </div>
							</div>
							<div class="row">
								<div class="form-group input-group inline-middle not-null">
								    <label >客户编号：</label>
								    <input type="text" name="c_id" class="form-control search-items auto-not-null" >
								    <div class="input-group-btn">
	                                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                                <span class="caret"></span>
	                                            </button>
	                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
	                                            </ul>
	                                 </div>
								  </div>
								  <div class="form-group inline-large">
										    <label >户号(_客户名称)：</label>
										    <input type="text" name="c_name" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group inline-small">
								    <label >账户余额：</label>
								    <input type="text" name="surplus_money" class="form-control search-items" value="0" readonly>
								  </div>
							</div>
							<div class="row">
								<div class="form-group inline-small">
								    <label >发票张数：</label>
								    <input type="text" name="invoice_amount" class="form-control search-items" value="0" readonly>
								</div>
								<div class="form-group inline-small">
								    <label >申汇单号：</label>
								    <input type="text" name="fh_no" class="form-control search-items" disabled>
								    <input type="hidden" name="fh_id" id = "fh_id" class="form-control search-items">
								  </div>
								  <div class="form-group inline-small">
								    <label >申汇日期：</label>
								    <input type="text" class="form-control layer-date search-items date-type"  name="fh_date" id="fh_date">
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-small">
								    <label >付汇方式：</label>
								    <select name="fw_mode" class="form-control dictionary search-items" >
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group inline-small">
								    <label >区域类别：</label>
								    <select name="region_catagory" class="form-control dictionary search-items" >
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group input-group inline-large not-null">
								    <label >汇款账号：</label>
								    <input type="text" name="f_bank_name" class="form-control search-items auto-not-null" >
								    <div class="input-group-btn">
	                                            <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                                <span class="caret"></span>
	                                            </button>
	                                            <ul class="dropdown-menu dropdown-menu-right" role="menu">
	                                            </ul>
	                                 </div>
								  </div>
							  		<input type="hidden" name="bank_id">
							</div>							
							<div class="row">
								  <div class="form-group inline-small">
								    <label >累加金额：</label>
								    <input type="text" name="total_money" class="form-control search-items" readonly>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >币种金额：</label>
								    <select name="currency" class="form-control dictionary search-items" >
								    	<option></option>
								    </select>
								    <input type="text" name="fh_money" class="form-control search-items">
								  </div>								  								  
							</div>							
							<div class="row">								  							  
								  <div class="form-group inline-small">
								    <label >是否预付：</label>
								    <select name="is_advance" class="form-control dictionary search-items isboolean" >
								    </select>
								  </div>
								  <div class="form-group inline-small">
								    <label >是否保证金：</label>
								    <select name="is_bail" class="form-control dictionary search-items isboolean" >
								    </select>
								  </div>
								  <div class="form-group inline-large">
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
	                <h5>冲销明细</h5>
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
    
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
     <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
	<script type="text/javascript">
	var finance_fhsh=JSON.parse('${oneJson}');

	function queryParams(param) {
		var json_obj_finance_fhsh = {};
		json_obj_finance_fhsh['limit'] =param.limit;
		json_obj_finance_fhsh['offset'] =param.offset;
		json_obj_finance_fhsh['sortName'] =this.sortName;
		json_obj_finance_fhsh['sortOrder'] =this.sortOrder;
		json_obj_finance_fhsh['source_id'] ='${fh_id}';
	    return json_obj_finance_fhsh;
	}
	
	$('#fh_id').val('${fh_id}');
	
// 	function toDel(inv_id){
// 		ajax_function_ask_and_refresh("是否删除","deleteAgentFinanceFhshItem","post",{'inv_ids':inv_id},"删除成功",$('#table'));
// 	}
	
// 	function renderOperator(value,row,index){
// 		 if(finance_fhsh['status']==0 || finance_fhsh['status']==3){
// 			 return "<a onclick=\"toDel('"+row.inv_id+"')\">删除</a>";
// 		 }else{
// 			 return "-";
// 		 }			
// 	}
	
	var $table = $('#table');
		$(document).ready(function () {
			$(".layer-date").each(function(){
				inistal_one_data('#'+$(this).attr('id'));
			})
			
			//加载字典数据
			get_dictionary("${context}",finance_fhsh);
			//填写已有数据
			set_one_info($("#form"),finance_fhsh);
			
			//bootstrap初始化
			initialize_table_editable_footer($table,"getFinanceAgentFhShReverse",${tableHeader},queryParams,"#tableTool",550,"editFinanceAgentFhShReverseItem?fh_id="+'${fh_id}');

			//增加条目layer
			var $add=$("#add");
			button_click_layer_refresh($add,2,"引入冲销明细",'financeAgentFhshReverseItemPull',$table,true,['750px', '580px']);
			
			$('#delete_items').on('click',function(){
				
				var reverse_items = $.map($table.bootstrapTable('getSelections'), function (row) {
	                return {'c_id':row.c_id,'pay_id':row.id,'fh_id':finance_fhsh.fh_id,"pre_id":row.pre_id}
	            });

				if(reverse_items.length!=0)
					ajax_function_ask_and_close_json_data("确认删除？","deleteAgentFinanceFhshReverseItem","post",JSON.stringify(reverse_items),'删除成功',$('#table'));
				else
					layer.msg("未选择明细！");
			});

			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 //自动搜索填补
			 //initialize_bsSuggest_operator("${context}");
			 initialize_bsSuggest_user_by_dept("${context}", "o_id_operator_name", "o_id_operator", "2000");      // 放用户信息(报刊的)
			 
			 initialize_bsSuggest_all_type_factory("${context}");
			 initialize_bsSuggest_client_advance_balance("${context}");
			 initialize_bsSuggest_f_bank("${context}");
		});
		
		function ajax_function_ask_and_close_json_data(ask_info,url,method,data,success_info,$table){
			if(confirm(ask_info)){
				$.ajax({ 
			        url: url, 
			        method: method,
			        dataType: "json",
			        traditional:true,
			        contentType : "application/json;charset=utf-8",  // 要提交json格式的数据,必须加入这句
			        //传送请求数据
			        data: data,
			        success: function (data) {
			        	if (data.success){
			        		if(success_info==null){
			        			$table.bootstrapTable('refresh');
			        		}else{
			        			layer.msg(success_info);
			        			$table.bootstrapTable('refresh');
			        		}
			        	}else {
			        		layer.msg(data.errorMsg);
			        		$table.bootstrapTable('refresh');
			        	}	
			        },
			        error:function(data){
			        	layer.close(index);
			        	alert("请求失败!");	
			        }
			    });		
			}
		}
	</script>
</html>