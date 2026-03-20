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
								    <label >货源名称(_户号)：</label>
								    <input type="text" name="f_name" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group inline-small">
								    <label >申汇单号：</label>
								    <input type="text" name="fh_no" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group inline-small">
								    <label >币种金额：</label>
								    <select name="currency" class="form-control dictionary search-items" disabled>
								    	<option></option>
								    </select>
								    <input type="text" name="fh_money" class="form-control search-items"  disabled>
								  </div>
								  <div class="form-group inline-small">
								    <label >代销金额：</label>
								    <input type="text" name="agent_money" class="form-control search-items"  disabled>
								  </div>	
							</div>												
						 </div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>冲销代销预付明细</h5>
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

	if(finance_fhsh['status']!=0 && finance_fhsh['status']!=3){
		$("#add").hide();
	}
	
	function queryParams(param) {
		var json_obj_finance_fhsh = {};
		json_obj_finance_fhsh['limit'] =param.limit;
		json_obj_finance_fhsh['offset'] =param.offset;
		json_obj_finance_fhsh['sortName'] =this.sortName;
		json_obj_finance_fhsh['sortOrder'] =this.sortOrder;
		json_obj_finance_fhsh['fh_id'] = finance_fhsh.fh_id;
	    return json_obj_finance_fhsh;
	}
	
	function toDel(fh_id, ap_id){
		ajax_function_ask_and_dosuccess("是否删除","deleteFhshAgentAgaintItem","post",{'fh_id':fh_id, 'ap_id':ap_id},load_table_data_success);
	}
	
	function renderOperator(value,row,index){
		 if(finance_fhsh['status']==0||finance_fhsh['status']==3){
			 return "<a onclick=\"toDel('"+row.fh_id  + "','" + row.ap_id +"')\">删除</a>";
		 }else{
			 return "-";
		 }			
	}
	
	function load_table_data_success(data){
		if (data.success){    		
   			layer.msg("操作成功！");
   			load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','fh_id':finance_fhsh.fh_id},$table);
    	} else {
    		layer.msg(data.errorMsg);
    	}
	}
	//新增窗口关闭操作
	function end_function(index, layero){
		load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','fh_id':finance_fhsh.fh_id},$table);
    }
	
	var $table = $('#table');
	load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','fh_id':finance_fhsh.fh_id});
	$(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",finance_fhsh);
			$("input[name='f_name']").val(finance_fhsh['f_department']+"_"+finance_fhsh['f_account']);
			
			//填写已有数据
			set_one_info($("#form"),finance_fhsh);
			
			//bootstrap初始化
			initialize_table($table,"getFhshAgentAgaintItemList",${tableHeader},queryParams,"#tableTool",400);
			
			//增加条目layer
			var $add=$("#add");
			button_click_windows_end($add,2,"引入代销预付单",'fhshAgentAgaintItemPull?fh_id=' + finance_fhsh.fh_id + '&f_id=' + finance_fhsh.f_id,true,['750px', '580px'],end_function);
			
			/*$('#delete_items').on('click',function(){
				var so_ids_money= $.map($table_result.bootstrapTable('getSelections'), function (row) {
	                return {'fh_id':'${param.fh_id}','ap_id':row.ap_id};
	            });
				
				if(so_ids_money.length!=0) {
					ajax_function_ask_and_dosuccess_postdata("确认删除？","deleteFhshAgentAgaintItem","post",JSON.stringify(so_ids_money),load_table_data_success);
				} else {
					layer.msg("未选择明细！");
				}
			});*/
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
	});
	</script>
</html>