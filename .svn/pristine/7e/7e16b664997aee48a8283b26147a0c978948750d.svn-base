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
		                  		<label >发票类型：</label>
								<select name="fc_invoice_class" id="fc_invoice_class" class="dictionary search-items">
								</select> 
								<input type="hidden" name="inv_id"> 
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12 not-null">
		                  		<label >发票号：</label>
								<input type="text" name="inv_no" id = "inv_no">
		                	</div>
					    </div>
					    <div class="row">
                           	<div class="form-group small-space col-xs-12 not-null">
		                  		<label >发票日期：</label>
		                        <input type="text" id="inv_date" name="inv_date" class="layer-date date-type"> 
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
			inistal_one_data('#inv_date');
			
			var payment=JSON.parse('${oneJson}');
			
			set_one_info($("#form"),payment);
			//加载字典数据
			get_dictionary("${context}",payment);
			
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function_ask_and_close("是否确认？","financialComplementInvoice","post",$('#form').serialize(),'补充完成!');	
				}
			});
		});
	</script>
</html>