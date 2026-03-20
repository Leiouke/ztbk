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
		                  		<label >支付单号：</label>
		                        <input type="text" name="pc_id" readonly> 
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >客户：</label>
		                        <input type="text" name="c_name" disabled> 
		                	</div>
					    </div>
						<div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >付款金额(人民币)：</label>
		                        <input type="text" name="payment_money" disabled> 
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12">
		                  		<label >银行账号：</label>
		                        <input type="text" name="f_bank_name" disabled> 
		                	</div>
					    </div>
                        <div class="row">
                           	<div class="form-group small-space col-xs-12 not-null">
		                  		<label >付款日期：</label>
		                        <input type="text" id="pay_date" name="pay_date" class="layer-date date-type"> 
		                	</div>
					    </div>
                  </div>
		       </form>
			 </div>
		</div><!-- sonpage-body -->
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-primary" type="button">确认</button>
	        <button id="cancel" class="btn btn-white" type="button">取消</button>
		</div>
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			inistal_one_data('#pay_date');
			if(!'${oneJson}'==''){
				 var fh=JSON.parse('${oneJson}');	
				//填写已有数据
				set_one_info($("#form"),fh);
			}
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function("paymentChargePayConfirm","post",$('#form').serialize(),'完成付款');	
				}
			});
		});
	</script>
</html>