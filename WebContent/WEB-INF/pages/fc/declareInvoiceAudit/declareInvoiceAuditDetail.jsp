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
									<div class="form-group input-group inline-small not-null">
										<label >关联报关单号：</label>
									    <input type="text" name="dcl_id" class="search-items" id = "dcl_id" disabled/>
	                                 </div>
									<div class="form-group input-group inline-small not-null">
										<label >发票号：</label>
									    <input type="text" name="inv_no" class="search-items" id = "inv_no" disabled/>
	                                 </div>
									<div class="form-group input-group inline-small not-null">
										<label >合计金额：</label>
									    <input type="text" name="total_real_money" class="search-items"  id = "total_real_money" disabled/>
	                                 </div>
	                                 <div class="form-group input-group inline-small not-null">
										<label >合计税额：</label>
									    <input type="text" name="total_tax_money" class="search-items" id = "total_tax_money" disabled/>
	                                 </div>
	                       		</div>
	                       		<div class="row">
	                        		<div class="form-group input-group inline-small not-null">
										<label >明细金额：</label>
									    <input type="text" name="detail_real_money" class="search-items" id = "detail_real_money" disabled/>
	                                 </div>
	                        		<div class="form-group input-group inline-small not-null">
										<label >明细税额：</label>
									    <input type="text" name="detail_tax_money" class="search-items" id = "detail_tax_money" disabled/>
	                                 </div>
	                        		<div class="form-group input-group inline-small not-null">
										<label >应退税额：</label>
									    <input type="text" name="detail_pre_taxback" class="search-items" id = "detail_pre_taxback" disabled/>
	                                 </div>
	                                 <div class="col-xs-12"  style="display:none">
								  		<div class="form-group middle-space col-xs-12">
								    		<label >inv_id</label>
								    		<input type="text" name="inv_id" class="search-items">
								  		</div>
									</div>
	                                 <div class="col-xs-12"  style="display:none">
								  		<div class="form-group middle-space col-xs-12">
								    		<label ></label>
								    		<input type="text" name="audit_result" class="search-items" id = "audit_result">
								  		</div>
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
	    <button id="save" class="btn btn-primary" type="button">核验通过</button>
	    <button id="not_save" class="btn btn-warning" type="button">核验不通过</button>
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
		
		//判断是否是详情页
		if('${is_detail}'==1){
			$("#save").remove();
			$("#not_save").remove();
		}
		
		$('#save').on('click', function () {
			if(!has_null($("#form"))){
				$("#audit_result").val("1");
				ajax_function_ask_and_close("确认核验通过","auditInvoice","post",$('#form').serialize(),'核验通过');
			}
		});
		
		$('#not_save').on('click', function () {
			if(!has_null($("#form"))){
				$("#audit_result").val("2");
				ajax_function_ask_and_close("确认核验不通过","auditInvoice","post",$('#form').serialize(),'核验不通过');
			}
		});
		
		//填充数据
		var invoice=JSON.parse('${oneJson}');
		set_one_info($("#form"),invoice);
		
		
		//bootstrap初始化
		initialize_table($table,"getTaxbackInvoiceAuditItemList",${tableHeader},queryParams,"#tableTool",400);
		
		//增加条目layer
		var $add=$("#add");
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
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