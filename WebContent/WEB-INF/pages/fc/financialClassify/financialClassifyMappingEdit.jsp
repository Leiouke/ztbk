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
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="sonpage-body" style="padding-bottom:20px">
			   <form id="form" class="form-inline">
			   <div class="col-md-12">
			   	    <div class="row">
				    	<div class="form-group small-space col-xs-4 not-null">	
	                  		<label>分类编码：</label>
	                        <input type="text" name="classfiy_code" value="${param.classfiy_code}" readonly="readonly">
		                </div>
		                <div class="form-group small-space col-xs-4 not-null">
		       				<div class="form-group inline-small">
						    <label >方向：</label>
						    <select name="cw_direction" class="form-control search-items" id="cw_direction">
						    	<option value="0">借</option>
						    	<option value="1">贷</option>
						    </select>
						  </div>
		          		</div>
		          		<div class="form-group small-space col-xs-4 not-null">
		       				<label>映射类别：</label>
	                        <select name="pay_style" class="dictionary" >
					    	</select>
		          		</div>
				    </div>
				    <div class="row">
				    	<div class="form-group small-space col-xs-6">	
	                  		<label>一级科目编号：</label>
	                        <input type="text" name="cw_km1_code" >
		                </div>
		                <div class="form-group small-space col-xs-6">
		       				<label>一级科目名称：</label>
	                        <input type="text" name="cw_km1_name" >
		          		</div>
				    </div>
				    <div class="row">
				    	<div class="form-group small-space col-xs-6">	
	                  		<label>二级科目编号：</label>
	                        <input type="text" name="cw_km2_code" >
		                </div>
		                <div class="form-group small-space col-xs-6">
		       				<label>二级科目名称：</label>
	                        <input type="text" name="cw_km2_name" >
		          		</div>
				    </div>
				    <div class="row">
				    	<div class="form-group small-space col-xs-6">	
	                  		<label>三级科目编号：</label>
	                        <input type="text" name="cw_km3_code" >
		                </div>
		                <div class="form-group small-space col-xs-6">
		       				<label>三级科目名称：</label>
	                        <input type="text" name="cw_km3_name" >
		          		</div>
				    </div>
				    <div class="row">
				    	<div class="form-group small-space col-xs-6">	
	                  		<label>四级科目编号：</label>
	                        <input type="text" name="cw_km4_code" >
		                </div>
		                <div class="form-group small-space col-xs-6">
		       				<label>四级科目名称：</label>
	                        <input type="text" name="cw_km4_name" >
		          		</div>
				    </div>
				    <div class="row">
				    	<div class="form-group small-space col-xs-6">	
	                  		<label>五级科目编号：</label>
	                        <input type="text" name="cw_km5_code" >
		                </div>
		                <div class="form-group small-space col-xs-6">
		       				<label>五级科目名称：</label>
	                        <input type="text" name="cw_km5_name" >
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
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			var statement = JSON.parse('${oneJson}');
			
			//加载字典数据
			get_dictionary("${context}",statement);
			//填写已有数据
			set_one_info($("#form"), statement);	
			
			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function_ask_and_close("确认修改财务分类科目映射？", "editFinancialClassifyMapping", "post", $("#form").serialize(), "修改完成！");
				}
			});
		});
	</script>
</html>