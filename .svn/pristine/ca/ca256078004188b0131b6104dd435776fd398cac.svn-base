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
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                </div>
								  </div>
								  <div class="form-group inline-large">
								    <label >货源名称(_户号)：</label>
								    <input type="text" name="f_name" class="form-control search-items" disabled>
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
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
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
	                  <button id="commit" class="btn btn-success" type="button">提交</button>
	                  <button id="delete" class="btn btn-danger" type="button">作废</button>
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
	var finance_fhsh=JSON.parse('${oneJson}');
	if(finance_fhsh['status']!=0&&finance_fhsh['status']!=3){
		$("#save").hide();
		$("#commit").hide();
		$("#delete").hide();
	}
	function queryParams(param) {
		var json_obj_finance_fhsh = {};
		json_obj_finance_fhsh['limit'] =param.limit;
		json_obj_finance_fhsh['offset'] =param.offset;
		json_obj_finance_fhsh['sortName'] =this.sortName;
		json_obj_finance_fhsh['sortOrder'] =this.sortOrder;
	    return json_obj_finance_fhsh;
	}
	function toDel(inv_id){
		ajax_function_ask_and_dosuccess("是否删除","deleteFinanceFhshItem","post",{'inv_ids':inv_id},load_table_data_success);
	 }
	 function renderOperator(value,row,index){
		 if(finance_fhsh['status']==0||finance_fhsh['status']==3){
			 return "<a onclick=\"toDel('"+row.inv_id+"')\">删除</a>";
		 }else{
			 return "-";
		 }			
	 }
	 function load_table_data_success(data){
		if (data.success){    		
   			layer.msg("操作成功！");
   			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'finance_fhsh_guid'},$table);
    	} else {
    		layer.msg(data.errorMsg);
    	}
	}
	//新增窗口关闭操作
	function end_function(index, layero){
		load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'finance_fhsh_guid'},$table);
    }
	var $table = $('#table');
	load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','guidname':'finance_fhsh_guid'});
		$(document).ready(function () {
			$(".layer-date").each(function(){
				inistal_one_data('#'+$(this).attr('id'));
			})
			$('#save').on('click', function () {
				if(!has_null($("#form"))&&!auto_not_matching($("#form"))){
					if($("input[name='f_id']").attr("data-id")==""){
						layer.msg("货源编号不正确");
					}else{
						var currency_name="";
						var same_currency=true;
						$.each($table.bootstrapTable('getData'),function(idx, obj){
							if(currency_name==""){//为了判断币种是否一样
								currency_name=obj.currency_name;
							}else if(currency_name!=obj.currency_name){
								same_currency= false;
							}
						});
						if(same_currency){
							ajax_function("editFinanceFhsh","post",$('#form').serialize(),'保存成功');	
						}else{
							layer.confirm("申汇币种不同，确认新增？", {
							  	btn: ['确认','取消'] //按钮
								}, function(index){								
									ajax_function("editFinanceFhsh","post",$('#form').serialize(),'保存成功');	
								});	
						}										
					}
				}
			 });
			
			$('#commit').on('click', function () {
				if(!has_null($("#form"))){
					if($("input[name='f_id']").attr("data-id")==""){
						layer.msg("货源编号不正确");
					}else{
						ajax_function("commitFinanceFhsh","post",$('#form').serialize(),'提交成功');					
					}
				}
			 });
			
			//加载字典数据
			get_dictionary("${context}",finance_fhsh);
			$("input[name='f_name']").val(finance_fhsh['f_department']+"_"+finance_fhsh['f_account']);
			$("input[name='o_id_operator_name']").val(finance_fhsh['o_id_operator']);
			
			//填写已有数据
			set_one_info($("#form"),finance_fhsh);
			
			$('#delete').on('click',function(){
				 ajax_function_ask_and_close("确认删除？","deleteFinanceFhsh","post",{fh_id:finance_fhsh.fh_id},'删除成功');
			});
			//bootstrap初始化
			initialize_table_editable_footer($table,"getFinanceFhshItemList",${tableHeader},queryParams,"#tableTool",550,"editFinanceFhshItem");
			$table.bootstrapTable('refreshOptions',{onLoadSuccess: function(data){
				var invoice_amount=$table.bootstrapTable('getData').length;
				$("input[name='invoice_amount']").val(invoice_amount);
				//计算累加
				var sum_money=0;
				$.each($table.bootstrapTable('getData'),function(index, row){
					sum_money+=row.fh_money;
				});
				$("input[name='total_money']").val(sum_money.toFixed(2));
			}});
			$table.bootstrapTable('refreshOptions',{onCheck:function(row){
	          	var num=calculate_select($table);
	          	$("#checkbox_num").html(num);
	            }
			});
			//增加条目layer
			var $add=$("#add");
			button_click_windows_end($add,2,"引入申汇明细",'financeFhshItemPull',true,['750px', '580px'],end_function);
			
			$('#delete_items').on('click',function(){
				var inv_ids = $.map($table.bootstrapTable('getSelections'), function (row) {
	                return row.inv_id;
	            });
				if(inv_ids.length!=0) {
					ajax_function_ask_and_dosuccess("确认删除？","deleteFinanceFhshItem","post",{'inv_ids':inv_ids},load_table_data_success);
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
			//initialize_bsSuggest_operator("${context}");
			initialize_bsSuggest_user_by_dept("${context}", "o_id_operator_name", "o_id_operator", "2000");      // 放用户信息(报刊的)
			 
			initialize_bsSuggest_all_type_factory("${context}");
			initialize_bsSuggest_f_bank("${context}");
		});
	</script>
</html>