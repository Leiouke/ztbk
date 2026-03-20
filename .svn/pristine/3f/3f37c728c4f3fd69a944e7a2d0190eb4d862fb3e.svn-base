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
									<div class="form-group input-group inline-large not-null">
										<label >产品分类：</label>
										<select class="form-control module_input" name="dcl_inc_no">
											<option ></option>
										</select>
									</div>
	                       		</div>
	                       		<div class="row">
	                       			<div class="form-group input-group inline-small not-null">
										<label >数量：</label>
										<input type="text" name="unit_count" class="search-items" id = "unit_count" >
									</div>
									<div class="form-group input-group inline-small not-null">
										<label >金额：</label>
									    <input type="text" name="real_money" class="search-items"  id = "real_money"/>
	                                 </div>
	                       			<div class="form-group input-group inline-small not-null">
										<label >税率：</label>
									    <input type="text" name="tax_rate" class="search-items"  id = "tax_rate"/>
	                                 </div>
	                              </div>
	                              <div class="row">
	                       			<div class="form-group input-group inline-small not-null">
										<label >税额：</label>
								    	<input type="text" name="tax_money" class="search-items"  id = "tax_money"/>
                                  	</div>
	                                 <div class="form-group input-group inline-small not-null">
										<label >退税率：</label>
								    	<input type="text" name="taxback_rate" class="search-items"  id = "taxback_rate"/>
                                  	</div>
	                                 <div class="form-group input-group inline-small not-null">
										<label >应退税额：</label>
								    	<input type="text" name="pre_taxback" class="search-items"  id = "pre_taxback"/>
                                  	</div>
<!--                                   	<div class="row" style="display:none"> -->
<!-- 										<label >对应报关单明细编号：</label> -->
<!-- 										<input type="text" id="dcl_inc_no" name="dcl_inc_no" class="form-control search-items" > -->
<!-- 									</div> -->
	                       		</div>
							</div>
						</form>
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
// 	function queryParams(param) {
// 		var json_obj_invoice = {};
// 		json_obj_invoice['limit'] =param.limit;
// 		json_obj_invoice['offset'] =param.offset;
// 		json_obj_invoice['sortName'] =this.sortName;
// 		json_obj_invoice['sortOrder'] =this.sortOrder;
// 		json_obj_invoice['dcl_id'] ='${dcl_id}';
// 	    return json_obj_invoice;
// 	}
	
// 	var $table = $('#table');
	
	$(document).ready(function () {
		
		$('#save').on('click', function () {
			if(!has_null($("#form"))){
				
				ajax_function("addTaxbackInvoiceItemTemp","post",$('#form').serialize(),'新增成功');
			}
			
// 			inc_nos = $.map($table.bootstrapTable('getSelections'), function (row) {
//                 return row.inc_no;
//             });
// 			if(inc_nos.length==1){
// 				$('#dcl_inc_no').val(inc_nos[0]);
// 				if(!has_null($("#form"))){
					
// 					ajax_function("addTaxbackInvoiceItemTemp","post",$('#form').serialize(),'新增成功');
// 				}
// 			}else{
// 				layer.msg("未选择报关单对应明细或选择多条明细");
// 			}
			
		});
		
		
		//bootstrap初始化
		//initialize_table($table,"getTaxbackInvoiceRelatedItemList",${tableHeader},queryParams,"#tableTool",400);
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
		
		//加载事件类型字典
		var $select1=$("[name='dcl_inc_no']");
		$.ajax({
	        url: "getTaxbackInvoiceRelatedItemList?dcl_id="+'${dcl_id}', 
	        method: "post",
	        dataType: "json",
	        traditional:true,
	        success: function (data) {
	        	$.each(data.rows,function(dic_index,dic_info){  // dic_index是列表序列号, dic_info是内容
	        		var item="<option value='"+dic_info.inc_no+"'>"+dic_info.product_code +"   "+dic_info.product_name+"</option>";
	        		$select1.append(item);
	        	});
	        },
	        error:function(data){	
	        	alert("请求失败!");	
	        }
		});	
		
	});
	
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