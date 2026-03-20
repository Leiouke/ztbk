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
	                  		<label>财务分类：</label>
	                        <select name="cw_type" class="dictionary" >
					    	</select>
		                </div>		                
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8 not-null">	
	                  		<label>外币实洋：</label>
	                        <input type="text" name="c_real_money" >
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8 not-null">	
	                  		<label>人民币码洋：</label>
	                        <input type="text" name="total_money" >
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8 not-null">	
	                  		<label>预估人民币实洋：</label>
	                        <input type="text" name="predict_real_money" >
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8 not-null">	
	                  		<label>调整人民币实洋：</label>
	                        <input type="text" name="rebate_money" >
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8 not-null">	
	                  		<label>总实洋：</label>
	                        <input type="text" name="real_money" >
	                        <input type="hidden" name="report_id" value="${param.report_id}"/>
	                        <input type="hidden" name="cost_classification" value="${param.cost_classification}"/>
	                        <input type="hidden" name="f_id" value="${param.f_id}"/>
	                        <input type="hidden" name="currency" value="${param.currency}"/>
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
			// 取普通财务分类
			get_financial_classify_by_dept("${context}", "${param.dep_org_code}", false, "cw_type");
			
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function_ask_and_close("确认新增明细？","addPurchaseReportFileItem","post",$("#form").serialize(),"新增完成！");
				}
			});
		});
	</script>
</html>