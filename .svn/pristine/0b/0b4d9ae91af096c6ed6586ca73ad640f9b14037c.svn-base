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
                            	<div class="form-group large-space col-xs-12 not-null">
			                  		<label >来款账号：</label>
			                        <input type="text" name="account" > 
			                	</div>
						    </div>
                            <div class="row">
                            	<div class="form-group large-space col-xs-12">
			                  		<label >来款单位：</label>
			                        <input type="text" name="company"> 
			                	</div>
						    </div>
						    <div class="row">
                            	<div class="form-group small-space col-xs-4">
			                  		<label >来款日期：</label>
			                        <input type="text" class="layer-date date-type" name="receive_date" id="receive_date"> 
			                	</div>
			                	<div class="form-group small-space col-xs-4">	
			                  		<label>金额：</label>
			                  		<input type="text" name="receive_money" > 
			                	</div>
						    </div>
						    <div class="row">	                            	
			                	<div class="form-group small-space col-xs-4">	
			                  		<label>来款方式：</label>
			                        <select name="pay_type" class="dictionary">
			                        	<option></option>
			                        </select>
			                	</div>
						        <div class="form-group middle-space col-xs-8" >
						            <label>凭证号：</label>
						            <input type="text" name="pay_certificate" >
						        </div>
						    </div>
						    <div class="row">
                            	<div class="form-group large-space col-xs-12">
			                  		<label>摘要：</label>
			                        <input type="text" name="summary">
			                	</div>				                	
						    </div>
                  </div>
		       </form>
			 
		</div><!-- sonpage-body -->
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-primary" type="button">保存</button>
	        <button id="cancel" class="btn btn-white" type="button">取消</button>
		</div>
	</body>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			//inistal_one_data('#receive_date');
			//日期范围限制
		    var start = {
		        elem: '#receive_date',
		        format: 'YYYY/MM/DD',
		        max: '2099-06-16', //最大日期
		        istime: false,
		        istoday: true,
		        zIndex:99999999
		    };
		    laydate(start);
			
			get_dictionary("${context}",null);		
			//加载字典数据
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function("addCashRegister","post",$('#form').serialize(),'新增成功');	
				}				
			 });
		});
	</script>
</html>