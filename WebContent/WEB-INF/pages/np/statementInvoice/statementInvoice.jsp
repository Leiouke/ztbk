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
			            <input type="hidden" name="statement_no">
			            <div class="col-xs-12">
				            <div class="row">
								  <div class="form-group input-group inline-middle">
								    <label >客户编号：</label>
								    <input type="text" name="c_id" class="form-control search-items auto-not-null" >
								    <div class="input-group-btn">
	                                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                                        <span class="caret"></span>
	                                    </button>
	                                    <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                                </div>
								  </div>
								  <div class="form-group inline-large">
								    <label >户号(_客户名称)：</label>
								    <input type="text" name="c_name" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group inline-small">
								    <label>来源单号：</label>
								    <input type="text" name="source_no" class="form-control search-items">
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-middle not-null">
								    <label >发票号：</label>
								    <input type="text" name="kp_no" class="form-control">
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >发票类型：</label>
								    <select name="invoice_type" class="form-control dictionary" >
								    	<option></option>
								    </select>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >发票日期：</label>
								    <input name="kp_date" id="kp_date" type="text" class="form-control layer-date">
								  </div>
							</div>
							<div class="row">
								<div class="form-group inline-small not-null">
								    <label >发票税率：</label>
								    <select name="tax_rate" class="form-control dictionary" >
								    	<option></option>
								    </select>
								</div>
								<div class="form-group inline-small not-null">
								    <label >是否开到明细：</label>
								    <select name="is_item" class="form-control dictionary isboolean" >
								    </select>
								</div>
								<div class="form-group inline-small">
								    <label >可开金额：</label>
								    <input type="text" name="claim_kp_money" class="form-control search-items" readonly>
								</div>  
								<div class="form-group inline-small not-null">
								    <label >发票含税金额：</label>
								    <input type="text" name="tax_money" class="form-control" readonly>
								</div>
							</div>
							<div class="row">
								  <div class="form-group inline-large">
								    <label >备注：</label>
								    <input type="text" name="memo" class="form-control">
								  </div>
							</div>
						 </div>
						</form>
		            </div>
       		</div>
		</div>
	</div>
	<div class="sonpage-footer">
	    <button id="save" class="btn btn-primary" type="button">开票</button>
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
	$(document).ready(function () {
			$(".layer-date").each(function() {
				inistal_one_data('#'+$(this).attr('id'));
			});
			
			$('#save').on('click', function () {
				if(!has_null($("#form")) && !auto_not_matching($("#form"))){
					ajax_function("statementKp","post",$('#form').serialize(),'保存成功');
				}
			});		
			
			var invoice=JSON.parse('${oneJson}');
			//加载字典数据
			get_dictionary("${context}",invoice);
			$("input[name='c_name']").val(invoice['s_custom_id']+"_"+invoice['f_name']);
			
			$(".search-items").each(function(){
				$(this).attr("readonly",true);
			});
			//填写已有数据
			set_one_info($("#form"),invoice);
			$("input[name='tax_money']").val($("input[name='claim_kp_money']").val());

			//自动搜索填补
			initialize_bsSuggest_client("${context}");
		});
	</script>
</html>