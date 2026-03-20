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
										<label >报关单号：</label>
										<input type="text" name="dcl_no" class="search-items" id = "dcl_no" >
									</div>
						  			<div class="form-group input-group inline-middle not-null">
										<label >外销发票号：</label>
										<input type="text" name="export_invoice_no" class="search-items" id = "export_invoice_no" >
									</div>
									<div class="form-group input-group inline-small not-null">
										<label >报关金额：</label>
									    <input type="text" name="sales_money" class="search-items" />
	                                 </div>
	                       		</div>
	                       		<div class="row">
	                       			<div class="form-group input-group inline-middle not-null">
					    				<label >货币类型：</label>
					    				<select name="currency_type" class="dictionary" id="currency_type">
					    					<option></option>
					    				</select>
					  				</div>
	                       			<div class="form-group input-group inline-small not-null">
										<label >运杂费：</label>
								    	<input type="text" name="other_fee" class="search-items"  id = "other_fee"/>
                                  	</div>
	                                 <div class="form-group input-group inline-small not-null">
										<label >美元报关金额：</label>
								    	<input type="text" name="usbg_money" class="search-items"  id = "usbg_money"/>
                                  	</div>
	                       		</div>
	                        	<div class="row">
	                        		<div class="form-group input-group inline-small not-null">
				                  		<label >出口日期：</label>
				                        <input type="text" id="export_date" name="export_date" class="layer-date date-type"> 
				                	</div>
	                                 <div class="form-group input-group inline-small not-null">
										<label >出口地：</label>
								    	<select name="export_place" class="dictionary" id="export_place">
								    		<option></option>
					    				</select>
                                  	</div>
	                                 <div class="form-group input-group inline-small not-null">
										<label >总箱数：</label>
								    	<input type="text" name="total_packages" class="search-items"  id = "total_packages"/>
                                  	</div>
	                                 <div class="form-group input-group inline-small not-null">
										<label >预估汇率：</label>
								    	<input type="text" name="pre_exchange_rate" class="search-items"  id = "pre_exchange_rate"/>
                                  	</div>
	                                 <div class="form-group input-group inline-small not-null">
										<label >预估人民币：</label>
								    	<input type="text" name="pre_rmb" class="search-items"  id = "pre_rmb" disabled/>
                                  	</div>
	                        	</div>
	                        	<div class="row">
	                        		<div class="form-group input-group inline-middle">
			                  			<label>部门：</label>
			                        	<input type="text" name="org_name" readonly="readonly" value="${sessionScope.defaultRole.org_name}"/>
			                        	<input type="hidden" name="org_code" value="${sessionScope.defaultRole.org_code}" />
				                  	</div>
	                        		<div class="form-group input-group inline-small not-null">
					    				<label >考核单位：</label>
					    				<select name="unit_code" class="dictionary" id="unit_code">
					    					<option></option>
					    				</select>
					  				</div>
	                        		<div class="form-group input-group inline-large">
								    	<label >备注：</label>
								    	<input type="text" name="memo" class="search-items">
								  	</div>
	                        	</div>
							</div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>报关单明细</h5>
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
	    return json_obj_invoice;
	}
	
	var $table = $('#table');
	
	$(document).ready(function () {
	
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		$('#save').on('click', function () {
			$('#pre_rmb').removeAttr("disabled");
			if(!has_null($("#form"))){
				ajax_function("addTaxback","post",$('#form').serialize(),'新增成功');
			}
		});
		
		$('#delete_items').on('click',function(){
			var inc_nos = $.map($table.bootstrapTable('getSelections'), function (row) {
                return row.inc_no;
            });
			if(inc_nos.length!=0) {
				ajax_function_ask_and_refresh("确认删除?","deleteTaxbackItem","post",{'inc_nos': inc_nos},"删除成功!",$('#table'));
			} else {
				layer.msg("未选择明细！");
			}
		});
		
		//加载字典数据
		get_dictionary("${context}",null);
		
		//bootstrap初始化
		initialize_table($table,"getTaxbackItemTempList",${tableHeader},queryParams,"#tableTool",400);
		
		//增加条目layer
		var $add=$("#add");
		
		//增加条目layer
		$("#add").click(function(){
			open_layer_refresh(2,'新增报关录入明细','taxbackItemAdd',
					$table,['900px', '250px'],false);
		});
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
		
		$('#pre_exchange_rate').on('change',function(){
			if($('#usbg_money')!=""&&$('#pre_exchange_rate')!=""){
				$('#pre_rmb').val(($('#pre_exchange_rate').val()*$('#usbg_money').val()).toFixed(2));
			}
		});
		
		$('#usbg_money').on('change',function(){
			if($('#usbg_money')!=""&&$('#pre_exchange_rate')!=""){
				$('#pre_rmb').val(($('#pre_exchange_rate').val()*$('#usbg_money').val()).toFixed(2));
			}
		});
		
		// 获得当前部门的考核单位
		get_assess_unit_by_dept("${context}", "unit_code");
	});
	
	function toDel(inc_no) {
		ajax_function_ask_and_refresh("确认删除?","deleteTaxbackItem","post",{'inc_nos': inc_no},"删除成功!",$('#table'));
	}
	
	function renderOperator(value,row,index) {
		var str="";
			str += "<a onclick=\"toDel('"+row.inc_no + "')\">删除</a> "
			+"&nbsp;&nbsp;";
		
		return str;
	 }
	
	//query页面不刷新
	function table_column_config_layer($config,type,title,url,$table){
		$config.on('click', function () {
			  parent.layer.open({
	              type: 2,
	              title:title,
	              moveOut:true,
	              area: ['820px', '580px'],
	              skin: 'layui-layer-rim', //加上边框
	              content: url,
	              end:function () {

	              }
	          }); 				
		 });
	}

	</script>
</html>