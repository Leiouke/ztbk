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
				    	<div class="form-group large-space col-xs-12 not-null">	
	                  		<label>报表类型：</label>
	                        <input type="text" name="report_type_name" value="${param.report_type == 0?'业务进货报表':'其他支付报表'}"  disabled>
	                        <input type="hidden" name="report_type" value="${param.report_type}"/> 
		                </div>		                
				    </div>
			   	    <div class="row">
				    	<div class="form-group large-space col-xs-12 not-null">	
	                  		<label>报表描述：</label>
	                        <input type="text" name="report_description" >
		                </div>		                
				    </div>
				    <div class="row">
				    	<div class="form-group small-space col-xs-4 not-null">
	                  		<label>所属部门：</label>
	                        <input type="text" name="dep_org_name" readonly="readonly" value="${sessionScope.defaultRole.dep_org_name}"/>
	                        <input type="hidden" name="dep_org_code" value="${sessionScope.defaultRole.dep_org_code}" />
		                </div>  
		                <div class="form-group small-space col-xs-4 not-null">
		       				<label >报表年月：</label>
		             		<input type="text" name="account_month">
							<div class="input-group-btn">
			                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
			                      	<span class="caret"></span>
			                    </button>
			                    <ul class="dropdown-menu dropdown-menu-right" style="height:200px" role="menu"></ul>
			                </div>
		          		</div>
		          		<div class="form-group small-space col-xs-4 not-null">	
	                  		<label>考核单位：</label>
	                        <select name="unit_code" class="dictionary" >
					    	</select>
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
			
			// 获得未关账的记账年月
			initialize_bsSuggest_fc_account_month("${context}", "account_month", 0);
			
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code");

			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function_ask_and_close("确认新增报表？", "addPurchaseReportAddReport", "post", $("#form").serialize(), "新增完成！");
				}
			 });
		});
	</script>
</html>