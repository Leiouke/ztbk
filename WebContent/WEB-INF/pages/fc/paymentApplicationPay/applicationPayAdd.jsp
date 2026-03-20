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
		<div class="sonpage-body">
			<div class="col-md-12">
			   <form id="form" class="form-inline">
                <div class="panel-body">
                		<div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >付款单号：</label>
		                        <input type="text" name="ap_id" id = "ap_id" disabled> 
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >外币币种：</label>
								<select name="currency" id="currency" class="dictionary search-items" disabled>
								   <option></option>
								</select> 
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >货源编号：</label>
								<input type="text" name="f_id" id = "f_id" disabled>
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >货源名称：</label>
								<input type="text" name="f_department" id = "f_department" disabled>
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >申请外币实洋：</label>
		                        <input type="text" name="apply_c_real_money" disabled> 
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >外币银行：</label>
		                        <input type="text" name="f_bank_name" disabled> 
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >银行账号：</label>
		                        <input type="text" name="bank_account" disabled> 
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >代理客户：</label>
		                        <input type="text" name="c_department" disabled> 
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >客户余额：</label>
		                        <input type="text" name="advance_balance" disabled> 
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12 not-null">
		                  		<label >付款日期：</label>
		                        <input type="text" id="pay_date" name="pay_date" class="layer-date date-type"> 
		                	</div>
					    </div>
						<div class="row">
                           	<div class="form-group small-space col-xs-12 not-null" >
		                  		<label >付款金额(人民币)：</label>
		                        <input type="text" name="pay_money"> 
		                	</div>
					    </div>
                        
                  </div>
		       </form>
			 </div>
		</div><!-- sonpage-body -->
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-primary" type="button">保存</button>
	        <button id="cancel" class="btn btn-white" type="button">取消</button>
		</div>
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			inistal_one_data('#pay_date');
			
			var f_str='${oneJson}';
			f_str=f_str.replace(/\r\n/g,"\\r\\n")  
        	f_str=f_str.replace(/\n/g,"\\n");
			f_str=f_str.replace(/\s/g," ");
			var payment = JSON.parse(f_str);
			
			//var payment=JSON.parse('${oneJson}');
			
			set_one_info($("#form"),payment);
			//加载字典数据
			get_dictionary("${context}",payment);
			
			$('#save').on('click', function () {
				$("#ap_id").removeAttr("disabled");
				$("#f_id").removeAttr("disabled");
				$("#currency").removeAttr("disabled");
// 				ajax_function("applicationPayComplete","post",$('#form').serialize(),'付款完成');	
				if(!has_null($("#form"))){
					ajax_function_ask_and_close("确认是否付款","applicationPayComplete","post",$('#form').serialize(),'付款完成');	
				}
			});
		});
	</script>
</html>