<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								  <div class="form-group inline-large not-null">
								    <label >开票银行公司名称选择：</label>
								    <select name="bank_id" id="bank_id">
		                         		<c:forEach items="${bankList}" var="s_bank">	  
		                         		    <c:choose>
			                                	<c:when test="${param.bank_id == s_bank.id}"><option value="${s_bank.id}" selected>${s_bank.f_companyName}</option></c:when>
			                                	<c:otherwise><option value="${s_bank.id}">${s_bank.f_companyName}</option></c:otherwise>
			                                </c:choose>
			                        	</c:forEach>
			                        </select>
								  </div>
							</div>
							<br/>
				            <div class="row">
								  <div class="form-group inline-large">
								    <label >户号(_客户名称)：</label>
								    <input type="text" name="c_name" class="form-control search-items" disabled>
								  </div>
								  <div class="form-group inline-small">
								    <label>来源单号：</label>
								    <input type="text" name="source_no" class="form-control search-items">
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >开票类型：</label>
								    <select name="kp_type" id = "kp_type" data-id-list = "3,4" class="form-control dictionary" >
								    </select>
								  </div>
							</div>
							<div class="row">
								<div class="form-group inline-small">
								    <label >发票税率：</label>
								    <select name="tax_rate" class="form-control dictionary" >
								    </select>
								  </div>
								  <div class="form-group inline-small not-null">
								    <label >是否开到明细：</label>
								    <select name="is_item" class="form-control dictionary isboolean" id="is_item">
								    </select>
								  </div>
								<div class="form-group inline-small">
								    <label >可申请开票金额：</label>
								    <input type="text" name="can_kp_money" class="form-control search-items" readonly>
								</div>  
								<div class="form-group inline-small not-null">
								    <label >申请开票金额：</label>
								    <input type="text" name="claim_kp_money" class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="form-group inline-middle">
								    <label >开票内容：</label>
								    <input type="text" name="kp_content" class="form-control">
								</div>  
								<div class="form-group inline-small">
								    <label >开票数量：</label>
								    <input type="text" name="kp_amount" class="form-control">
								</div>  
								<div class="form-group inline-small">
								    <label >开票单位：</label>
								    <input type="text" name="kp_unit" class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="form-group inline-large">
								    <label >开票备注：</label>
								    <input type="text" name="kp_memo" class="form-control">
								</div> 
								<div class="form-group inline-large">
								    <label >邮箱：</label>
								    <input name="kp_mail" id="kp_mail" type="text" class="form-control search-items">
							  </div> 
							</div>
						 </div>
						</form>
		            </div>
       		</div>
		</div>
	</div>
	<div class="sonpage-footer">
	    <button id="save" class="btn btn-primary" type="button">申请</button>
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
					console.log($("#kp_type").val());
					if(!has_null($("#form")) && !auto_not_matching($("#form"))){
						if ($("#is_item").find("option:selected").val() == '1' && $.trim($("input[name='kp_unit']").val())=='') {
							alert("开到明细的发票必须得填写开票单位！");
							return;
						}else if(($("#kp_type").val()=="2"||$("#kp_type").val()=="3"||$("#kp_type").val()=="4")&&$("#kp_mail").val()==""){
							layer.msg("电子发票必须输入邮箱");
							return;
						}
						
						ajax_function_ask_and_dosuccess("确认申请？","statementClaimKp","post",$('#form').serialize(),apply_success);
					}
				});		
				
				var invoice_str='${oneJson}';
				invoice_str=invoice_str.replace(/\r\n/g,"\\r\\n")  
	        	invoice_str=invoice_str.replace(/\n/g,"\\n");
				invoice_str=invoice_str.replace(/\s/g," ");
				console.log("invoice_str="+invoice_str);
				var invoice=JSON.parse(invoice_str);
				console.log("invoice="+invoice);
				//加载字典数据
				get_dictionary("${context}",invoice);
				$("input[name='c_name']").val(invoice['s_custom_id']+"_"+invoice['f_name']);
				
				$(".search-items").each(function(){
					$(this).attr("readonly",true);
					$("#kp_mail").attr("readonly",false);
				});
				//填写已有数据
				set_one_info($("#form"),invoice);
		});
		
		function apply_success(data){
			if (data.success){    		
	   			layer.msg("操作成功！");
	   		    window.location.href = 'toStatementNextClaimKp?statement_no=${param.statement_no}';
	   			//load_sum_list("${context}/csu/getTableCollectData",{'queryId':'${queryId}','bill_id':'${fh_id}'},$table);
	    	} else {
	    		layer.msg(data.errorMsg);
	    	}
		}
		
		$('#bank_id').on('change', function () {
			window.location.href='?statement_no=${param.statement_no}&f_id=${param.f_id}&bank_id=' + $('#bank_id').val();
		});
	</script>
</html>