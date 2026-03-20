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
							</div>
							<div class="row">
								 <div class="form-group input-group inline-small not-null">
								    <label >外币币种：</label>
								    <select name="currency" id="currency" class="dictionary search-items">
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group input-group inline-large">
								    <label >总价：</label>
								    <input type="text" name="total_money" class="form-control search-items" disabled="disabled"> 
								  </div>
								  <div class="form-group inline-small">
<!-- 								    <label >ap_id：</label> -->
								    <input type="text" name="ap_id" class="form-control search-items" style="display:none">
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
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>流程详情</h5>
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
	    return json_obj_invoice;
	}
	
	var $table = $('#table');
	
	$(document).ready(function () {
	
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		//填充数据
		var invoice_str='${oneJson}';
		invoice_str=invoice_str.replace(/\r\n/g,"\\r\\n")  
    	invoice_str=invoice_str.replace(/\n/g,"\\n");
		invoice_str=invoice_str.replace(/\s/g," ");
		var invoice=JSON.parse(invoice_str);
		
		console.log(invoice);
		
		set_one_info($("#form"),invoice);
		//加载字典数据
		get_dictionary("${context}",invoice);
		
		//bootstrap初始化
		initialize_table($table,"getFcFlowDetialList",${tableHeader},queryParams,"#tableTool",550);

		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
		
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
		
		//自动搜索填补
		initialize_bsSuggest_fc_factory("${context}", "f_department", "f_id");
		initialize_bsSuggest_fc_user("${context}", "o_id_operator_name", "o_id_operator");      // 放用户信息
		initialize_bsSuggest_fc_f_bank("${context}");//银行
	});
	</script>
</html>