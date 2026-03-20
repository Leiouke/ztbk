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
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form_verify" class="form-inline">
			            <input type="hidden" name="fh_id" value="">
			            <input type="hidden" name="status" value="">
			            <input type="hidden" name="is_pass" value="">
			            <div class="col-xs-12">
				            <div class="row">
								  <div class="form-group input-group inline-small">
										    <label >业务员：</label>
										    <input type="text" name="o_id_operator_name" class="form-control search-items" disabled>										    
								  </div>
								  <div class="form-group input-group inline-middle">
										    <label >货源编号：</label>
										    <input type="text" name="f_id" class="form-control search-items" disabled>										    
								  </div>
								  <div class="form-group inline-large">
										    <label >货源名称(_户号)：</label>
										    <input type="text" name="f_name" class="form-control search-items" disabled>
								  </div>
							</div>
							<div class="row client-info">
								  <div class="form-group input-group inline-middle">
								    <label >客户编号：</label>
								    <input type="text" name="c_id" class="form-control search-items" disabled>								    
								  </div>
								  <div class="form-group inline-large">
								    <label >户号(_客户名称)：</label>
								    <input type="text" name="c_name" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group inline-small">
								    <label >账户余额：</label>
								    <input type="text" name="advance_balance" class="form-control search-items" disabled>
								  </div>
							</div>
							<div class="row">
								<div class="form-group inline-small">
								    <label >发票张数：</label>
								    <input type="text" name="invoice_amount" class="form-control search-items"  disabled>
								</div>
								<div class="form-group inline-small">
								    <label >申汇单号：</label>
								    <input type="text" name="fh_no" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group inline-small">
								    <label >申汇日期：</label>
								    <input type="text" class="form-control layer-date search-items date-type"  name="fh_date" id="fh_date" disabled>
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-small">
								    <label >付汇方式：</label>
								    <select name="fw_mode" class="form-control dictionary search-items" disabled>
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group inline-small">
								    <label >区域类别：</label>
								    <select name="region_catagory" class="form-control dictionary search-items" disabled>
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group input-group inline-large">
								    <label >汇款账号：</label>
								    <input type="text" name="bank_account" class="form-control search-items" disabled>
								  </div>					  
							</div>							
							<div class="row">
								  <div class="form-group inline-small">
								    <label >累加金额：</label>
								    <input type="text" name="total_money" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group inline-small">
								    <label >币种金额：</label>
								    <select name="currency" class="form-control dictionary search-items" disabled>
								    	<option></option>
								    </select>
								    <input type="text" name="fh_money" class="form-control search-items" disabled>
								  </div>								  								  
							</div>							
							<div class="row">								  							  
								  <div class="form-group inline-small">
								    <label >是否预付：</label>
								    <select name="is_advance" class="form-control dictionary search-items isboolean" disabled>
								    </select>
								  </div>
								  <div class="form-group inline-small">
								    <label >是否保证金：</label>
								    <select name="is_bail" class="form-control dictionary search-items isboolean" disabled>
								    </select>
								  </div>
								  <div class="form-group inline-large">
								    <label >备注：</label>
								    <input type="text" name="memo" class="form-control search-items" disabled>
								  </div>
							</div>
						 </div>
						</form>
		            </div>
       		</div>
       		<div class="ibox float-e-margins">
       		<form id="form_isnozs" class="form-inline">
       		<input type="hidden" name="fh_id">
	            <div class="ibox-title">
	                <h5>申汇发票明细</h5>
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
		       </form>
	        </div>       			
		</div>
	</div>
	<div class="sonpage-footer">
	                  <button id="pass" class="btn btn-success" type="button">审核通过</button>
	                  <button id="notpass" class="btn btn-danger" type="button">审核退回</button>
	                  <button id="cancel" class="btn btn-white" type="button">取消</button>
	</div>
	<div class="sonpage-footer-left">
            <button id="show_group" class="btn btn-info" type="button">客户余额汇总</button>
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
	<script src="${context}/js/common/common.js"></script>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
	var fh=JSON.parse('${oneJson}');
	function queryParams(param) {
		var json_obj_fh = {};
		json_obj_fh['limit'] =param.limit;
		json_obj_fh['offset'] =param.offset;
		json_obj_fh['sortName'] =this.sortName;
		json_obj_fh['sortOrder'] =this.sortOrder;
		json_obj_fh['fh_id'] =fh['fh_id'];
	    return json_obj_fh;
	}
	
	var $table = $('#table');
	if(fh.fhsh_family==0){
		$(".client-info").hide();
	}
	
	load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}','fh_id':fh['fh_id']});
	
	$(document).ready(function () {
			$(".layer-date").each(function(){
				inistal_one_data('#'+$(this).attr('id'));
			});
			
			$('#pass').on('click', function () {
				if(!has_null($("#form_verify"))){
					$("#form_verify").children("input[name='is_pass']").val(1);
					ajax_function("verifyFinanceFhsh","post",$('#form_verify').serialize(),'审核已通过');	
				}	
			});
			
			$('#notpass').on('click', function () {
				if(!has_null($("#form_verify"))){
					$("#form_verify").children("input[name='is_pass']").val(0);
					ajax_function("verifyFinanceFhsh","post",$('#form_verify').serialize(),'审核已退回');
				}	
			});
			
			//汇总详情
			$('#show_group').on('click', function () {
				 	open_layer(2,"客户余额汇总",'financeAgentClientSum',['750px', '580px'],true);
			});
			
			//加载字典数据
			get_dictionary("${context}",fh);
			set_one_info($("#form_verify"),fh);
			$("input[name='f_name']").val(fh['f_department']+"_"+fh['f_account']);
			
			//bootstrap初始化
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",550);
			$table.bootstrapTable('refreshOptions',{url:"getFinanceFhshVerifyList",clickToSelect: true});
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     }); 
		}); 
	</script>
</html>