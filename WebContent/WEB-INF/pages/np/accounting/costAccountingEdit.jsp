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
			   <form id="form" class="form-inline">
			   		<div class="col-md-12">
					    <div class="row">
		                	<div class="form-group middle-space col-xs-8">	
		                  		<label>刊号：</label>
		                        <input type="text" class="content" name="mail_code" readonly="readonly">
		                        <input type="hidden" name="inc_id"/>
		                	</div>
					    </div>
					    <div class="row">
		                	<div class="form-group middle-space col-xs-8">	
		                  		<label>刊名：</label>
		                        <input type="text" class="content" name="qk_name" readonly="readonly">
		                	</div>
					    </div>
					    <div class="row">
		                	<div class="form-group middle-space col-xs-8">	
		                  		<label>币制：</label>
		                        <select name="money_type" class="dictionary">
		                        	<option></option>
							    </select>
		                	</div>
					    </div>
					    <div class="row">
		                	<div class="form-group middle-space col-xs-8">	
		                  		<label>外币价：</label>
		                        <input type="text" class="content" name="stock_cost" >
		                	</div>
					    </div>
					    <div class="row">
		                	<div class="form-group middle-space col-xs-8">	
		                  		<label>汇率：</label>
		                        <input type="text" class="content" name="exchange_rate" >
		                	</div>
					    </div>
					    <div class="row">
		                	<div class="form-group middle-space col-xs-8 not-null">	
		                  		<label>人民币价：</label>
		                        <input type="text" class="content" name="rmb_cost" >
		                	</div>
					    </div>
                  </div>
		       </form>
			 
		</div><!-- sonpage-body -->
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-success" type="button">保存</button>
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
			
			var cost_str='${oneJson}';
			cost_str=cost_str.replace(/\r\n/g,"\\r\\n")  
        	cost_str=cost_str.replace(/\n/g,"\\n");
			cost_str=cost_str.replace(/\s/g," ");
			var cost=JSON.parse(cost_str);
			
			set_one_info($("#form"), cost);
			//加载字典数据
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function("editCostAccounting","post",$('#form').serialize(),'修改成功');	
				}
			});
		});
	</script>
</html>