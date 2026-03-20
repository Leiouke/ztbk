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
	                        <select name="cw_type">
					    	</select>
		                </div>		                
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8 not-null">	
	                  		<label>分类码洋：</label>
	                        <input type="text" name="total_money" >
		                </div>  
				    </div>
				    <div class="row">
				    	<div class="form-group middle-space col-xs-8 not-null">	
	                  		<label>分类实洋：</label>
	                        <input type="text" name="real_money" >
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
			// 填充财务分类下拉框数据
			$.ajax({
			     url: "${context}/npBasic/getAgencyCwtypeList", 
			     method: "post",
			     dataType: "json",
			     traditional:true,
			     //传送请求数据
			     data: {statement_type: parent.$("#source_type").val()},
			     success: function (data) { 
			     	for (i = 0; i < data.rows.length; i++) {
			             /*if (data.rows[i].unit_code == input_value) {
			             	$("[name='" + input_name + "']").append("<option value=" + data.rows[i].unit_code + " selected>" + data.rows[i].unit_name + "</option>");
			             } else {*/
			             	$("[name='cw_type']").append("<option value=" + data.rows[i].cw_type + ">" + data.rows[i].name + "</option>");
			             //}
			     	}
			     },
			     error:function(data){
			     	alert("ajax请求失败!");
			     }
			});
			
			//加载字典数据
			//get_dictionary("${context}",null);

			$('#save').on('click', function () {
				if(!has_null($("#form"))){
					ajax_function_ask_and_close("确认新增明细分类？","addStatementCwItem","post",$("#form").serialize(),"新增完成！");
				}
			});
		});
	</script>
</html>