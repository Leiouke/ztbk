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
			            <input type="hidden" name="pc_id" value="">
			            <input type="hidden" name="is_pass" value="">
			            <div class="col-xs-12">
				            <div class="row">
								  <div class="form-group input-group inline-middle not-null">
								    <label >客户编号：</label>
								    <input type="text" name="c_id" class="form-control search-items" disabled>	
								  </div>
								  <div class="form-group inline-large">
								    <label >户号(_客户名称)：</label>
								    <input type="text" name="c_name" class="form-control search-items" disabled>
								  </div>
							</div>
							<div class="row">
								  <div class="form-group inline-small">
								    <label >费用类型：</label>
								    <select name="payment_type" class="form-control dictionary search-items"  disabled>
								    </select>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >支付金额：</label>
								    <input type="text" name="payment_money" class="form-control search-items" disabled>
								  </div>				
								  <div class="form-group input-group inline-large not-null">
								    <label >汇款账号：</label>
								    <input type="text" name="f_bank_name" class="form-control search-items" disabled>
								  </div>
							</div>													
							<div class="row">	
								  <div class="form-group inline-large">
								    <label >发票号：</label>
								    <input type="text" name="invoice_nos" class="form-control search-items" disabled>
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
		</div>
	</div>
	<div class="sonpage-footer">
        <button id="pass" class="btn btn-success" type="button">审核通过</button>
        <button id="notpass" class="btn btn-danger" type="button">审核退回</button>
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
	<script src="${context}/js/common/common.js"></script>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
	var fh=JSON.parse('${oneJson}');
	
	$(document).ready(function () {
		$('#pass').on('click', function () {
			if(!has_null($("#form_verify"))){
				$("#form_verify").children("input[name='is_pass']").val(1);
				ajax_function_ask_and_close("确认审核通过?","verifyPaymentCharge","post",$('#form_verify').serialize(),'审核已通过');	
			}	
		});
		
		$('#notpass').on('click', function () {
			//if(!has_null($("#form_verify"))){
				$("#form_verify").children("input[name='is_pass']").val(0);
				ajax_function_ask_and_close("确认审核不通过?","verifyPaymentCharge","post",$('#form_verify').serialize(),'审核已退回');
			//}	
		});
		
		//加载字典数据
		get_dictionary("${context}",fh);
		set_one_info($("#form_verify"),fh);
	}); 
	</script>
</html>