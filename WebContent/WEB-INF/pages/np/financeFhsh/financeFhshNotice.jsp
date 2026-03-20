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
								<div class="form-group small-space col-xs-6">
			                  		<label>申请外币金额：</label>
			                        <input type="text" name="apply_c_real_money" disabled>
			                        <input type="hidden" name="fh_id" />
			                        <input type="hidden" name="currency" />
			                        <input type="hidden" name="is_print" />
			                	</div>
			                	<div class="form-group small-space col-xs-6" >
						            <label >汇款方式：</label>
						            <select name="fc_remittance_method" class="form-control dictionary" >
					    			</select>
						        </div>
							</div>
							<div class="row">
								<div class="form-group small-space col-xs-4">
			                  		<label >提交银行：</label>
						            <select name="fc_submit_bank" id="fc_submit_bank" class="form-control dictionary" >
					    			</select>
			                	</div>
			                </div>
							<div class="row">
								<div class="form-group small-space col-xs-4 not-null">
			                  		<label>现汇金额：</label>
			                        <input type="text" name="fx_amount">
			                	</div>
			                	<div class="form-group small-space col-xs-8" >
						            <label >现汇付款账号：</label>
						            <select name="fc_fx_account" id="fc_fx_account" class="form-control" >
					    			</select>
						        </div>
							</div>
							<div class="row">
								<div class="form-group small-space col-xs-4 not-null">
			                  		<label>购汇金额：</label>
			                        <input type="text" name="purchase_amount">
			                	</div>
			                	<div class="form-group small-space col-xs-8 not-null" >
						            <label >购汇付款账号：</label>
						            <select name="fc_purchase_account" id="fc_purchase_account" class="form-control" >
					    			</select>
						        </div>
							</div>
							<div class="row">
			                	<div class="form-group small-space col-xs-6" >
						            <label >提交方式：</label>
						            <select name="fc_submit_method" class="form-control dictionary" >
					    			</select>
						        </div>
						        <div class="form-group small-space col-xs-6" >
						            <label >付汇性质：</label>
						            <select name="fc_remittance_nature" class="form-control dictionary" >
					    			</select>
						        </div>
							</div>
							<div class="row">
								<div class="form-group small-space col-xs-6">
			                  		<label >汇付款类型：</label>
						            <select name="fc_remittance_type" class="form-control dictionary" >
					    			</select>
			                	</div>
						        <div class="form-group small-space col-xs-6" >
						            <label >汇付款类别：</label>
						            <select name="fc_remittance_category" class="form-control dictionary" >
					    			</select>
						        </div>
							</div>
							<div class="row">
						        <div class="form-group large-space col-xs-12" >
						            <label>汇款附言：</label>
				                    <textarea  name="remittance_information" rows="10" readonly="readonly"></textarea>
						        </div>
							</div>
						 </div>
						</form>
		            </div>
       		</div>
		</div>
	</div>
	<div class="sonpage-footer">
	    <button id="save" class="btn btn-primary" type="button">仅保存</button>
	    <button id="saveExport" class="btn btn-primary" type="button">保存并导出</button>
	    <!-- <button id="savePrint" class="btn btn-primary" type="button">保存并打印</button> -->
	    <button id="cancel" class="btn btn-white" type="button">关闭</button>
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
			$('#save').on('click', function () {
				if(!has_null($("#form")) && !auto_not_matching($("#form"))){
					ajax_function("createFinanceFhshNotice","post",$('#form').serialize(),'保存成功');
				}
			});
			
			$('#saveExport').on('click', function () {
				if(!has_null($("#form")) && !auto_not_matching($("#form"))){
					ajax_function_dosuccess("createFinanceFhshNotice","post",$('#form').serialize(),function(){
						 var href_str="${context}/np/print/financeFhshPrintNotice?is_print=0&";
						 var fh_id=$("#form").find("input[name='fh_id']").val();
						 href_str+="fh_id="+fh_id;
						 window.open(href_str);	
					});
				}
			});
			
			$('#savePrint').on('click', function () {
				if(!has_null($("#form")) && !auto_not_matching($("#form"))){
					ajax_function_dosuccess("createApplicationPaymentNotice","post",$('#form').serialize(),function(){
						$("#form").find("input[name='is_print']").val(1);
						ajax_function_no_close("${context}/np/print/financeFhshPrintNotice","post",$('#form').serialize(),"发送打印完成！"); 
					});
				}
			});	

			var bank_str='${oneJson}';
			bank_str=bank_str.replace(/\r\n/g,"\\r\\n");
        	bank_str=bank_str.replace(/\n/g,"\\n");
			bank_str=bank_str.replace(/\s/g," ");
			var bank=JSON.parse(bank_str);
			
			//加载字典数据
			get_dictionary("${context}", bank);
			
			//填写已有数据
			set_one_info($("#form"),bank);
			
			var fc_submit_bank = '中国银行';
			if (bank.fc_submit_bank != undefined) {
				fc_submit_bank = bank.fc_submit_bank;
			}
			
			renderFcAccount(fc_submit_bank, bank.currency, bank.fc_fx_account, bank.fc_purchase_account);
			
			$('#fc_submit_bank').on('change', function () {
				//alert('value：'+$(this).val());//获取value；
				renderFcAccount($(this).val(), bank.currency, bank.fc_fx_account, bank.fc_purchase_account);
			});
		});
		
		// 填充付款账号下拉框(传入提交银行 和 币种, 另外传入需填入的值)
		function renderFcAccount(fc_submit_bank, currency, fc_fx_account, fc_purchase_account) {
			// 以下刷新 控件  fc_fx_account
			$.ajax({
		        url: "../fc/payment/getBankAccountList", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: {fc_submit_bank: fc_submit_bank, currency: currency},
		        success: function (data) { 
		        	$("#fc_fx_account option").remove();
		        	for (i = 0; i < data.rows.length; i++) {
		                if (data.rows[i].code == fc_fx_account) {
		                	$("#fc_fx_account").append("<option value=" + data.rows[i].code + " selected>" + data.rows[i].name + "</option>");
		                } else {
		                	$("#fc_fx_account").append("<option value=" + data.rows[i].code + ">" + data.rows[i].name + "</option>");
		                }
		        	}
		        },
		        error:function(data){
		        	alert("ajax请求失败!");
		        }
			});
			
			// 以下刷新 控件  fc_purchase_account
			$.ajax({
		        url: "../fc/payment/getBankAccountList", 
		        method: "post",
		        dataType: "json",
		        traditional:true,
		        //传送请求数据
		        data: {fc_submit_bank: fc_submit_bank, currency: '00'},  // 填入人民币数据
		        success: function (data) { 
		        	$("#fc_purchase_account option").remove();
		        	for (i = 0; i < data.rows.length; i++) {
		                if (data.rows[i].code == fc_purchase_account) {
		                	$("#fc_purchase_account").append("<option value=" + data.rows[i].code + " selected>" + data.rows[i].name + "</option>");
		                } else {
		                	$("#fc_purchase_account").append("<option value=" + data.rows[i].code + ">" + data.rows[i].name + "</option>");
		                }
		        	}
		        },
		        error:function(data){
		        	alert("ajax请求失败!");
		        }
			});
		}
	</script>
</html>