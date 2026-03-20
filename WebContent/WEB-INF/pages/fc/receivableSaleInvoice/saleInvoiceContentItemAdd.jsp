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
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="sonpage-body" style="padding-bottom:20px">
			   <form id="form" class="form-inline">
			   <div class="col-md-12">
			   	    <div class="row">
				    	<div class="form-group middle-space col-xs-8 not-null">	
	                  		<label>开票内容：</label>
	                        <input type="text" name="kp_content" >
	                        <input type="hidden" name="kp_id" value="${param.kp_id}"/>
		                </div>		                
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8">	
	                  		<label>税收分类：</label>
	                        <select id="fc_tax_class_code" name="fc_tax_class_code" class="dictionary search-items"></select>
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8">	
	                  		<label>数量：</label>
	                        <input type="text" name="kp_amount" >
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8">	
	                  		<label>单位：</label>
	                        <input type="text" name="kp_unit" >
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8 not-null">	
	                  		<label>金额：</label>
	                        <input type="text" name="kp_money" >
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8">	
	                  		<label>备注：</label>
	                        <input type="text" name="kp_memo" >
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8">	
	                  		<label>规格型号：</label>
	                        <input type="text" name="kp_specs" >
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8">	
	                  		<label>折扣：</label>
	                        <input type="text" name="discount" >
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8">	
	                  		<label>码洋：</label>
	                        <input type="text" name="total_money" >
		                </div>  
				    </div>
				    <div class="row">						    	
		                <div class="form-group middle-space col-xs-8">	
	                  		<label class="control-label text-right">填写要求：</label>
	                  		<p class="form-control-static" style="color:red">
	                  			折扣必须填写小数格式, 形如0.15, 填了折扣码洋不能为空
	                  		</p>	                        
		                </div>				                
				    </div>
               </div>
		       </form>
			 
		</div><!-- sonpage-body -->
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-primary" type="button">新增</button>
	        <button id="cancel" class="btn btn-white" type="button">取消</button>
		</div>
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",null);
			
			$('#save').on('click', function () {
				var discount = $("input[name='discount']").val();
				var total_money = $("input[name='total_money']").val();
				var kp_money = $("input[name='kp_money']").val();
				
				if (discount != '' &&  total_money == '') {
					alert("填了折扣请填写码洋值！");
					return;
				}
				var real_kp_money = total_money * (1 - discount);
				if (discount != '' && parseFloat(real_kp_money.toFixed(2)) > kp_money) {  // 注意取一下小数点2位
					alert("实际开票金额不能大于所填的金额值！");
					return;
				}
				
				var kp_amount = $("input[name='kp_amount']").val();
				var kp_unit = $("input[name='kp_unit']").val();
				var fc_tax_class_code = $("#fc_tax_class_code").val();
				
				if (
					 (kp_amount != '' && kp_unit == '') || (kp_amount == '' && kp_unit != '')
					) { 
					alert("数量和单位不能只填一项！");
					return;
				}
				
				if(!has_null($("#form"))){
					ajax_function_ask_and_close("确认新增发票内容明细？","addSaleInvoiceContentItem","post",$("#form").serialize(),"新增完成！");
				}
			 });
		});
	</script>
</html>