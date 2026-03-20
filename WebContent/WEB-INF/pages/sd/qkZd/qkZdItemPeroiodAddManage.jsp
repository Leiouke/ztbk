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
	    <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <form id="form" class="form-inline">			        
	            	<div class="row">
	            		<div class="form-group small-space col-xs-4">
				        	<label >收订数量</label>
				        	<input type="text" name="h_amount" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >退订数量</label>
				        	<input type="text" name="tz_amount " >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >报订数量</label>
				        	<input type="text" name="bd_amount " >
				        </div>
					</div>	
					<div class="row">
	            		<div class="form-group small-space col-xs-4">
				        	<label >进货数量</label>
				        	<input type="text" name="jh_amount" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >配送数量</label>
				        	<input type="text" name="ps_amount " >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >财务分类</label>
				        	<select name="cw_type" class="dictionary" >
								<option></option>
							</select>
				        </div>
					</div>	
					<div class="row">
	            		<div class="form-group small-space col-xs-4">
				        	<label >定价</label>
				        	<input type="text" name="h_price" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >折后价</label>
				        	<input type="text" name="real_price " >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >进货价</label>
				        	<input type="text" name="jh_price " >
				        </div>
					</div>	
					<div class="row">
				       <div class="form-group small-space col-xs-4">
					    <label >供应商ID</label>
					    <input type="text" name="f_id">
					    <div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu" style="margin-left:580px"></ul>
	                    </div>
					  </div>
					  <div class="form-group small-space col-xs-4">
					    <label >供应商名称</label>
					    <input type="text" name="f_department" disabled>
					  </div>
					  <div class="form-group small-space col-xs-4">
				            <label >退订时间</label>
							<input name="tz_date" id="tz_date" type="text" class="form-control search-items layer-date" style = "width:68%;">
				        </div>
					</div>	    
					<div class="row">
						<div class="form-group small-space col-xs-4">
				        	<label >退订人：</label>
							<input type="text" name="tz_operator_name">
							<div class="input-group-btn">
				        		<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				                	<span class="caret"></span>
				        		</button>
				        		<ul class="dropdown-menu dropdown-menu-right" role="menu" style="margin-left:580px"></ul>
				        	</div>
				        		<input type="hidden" name="tz_operator">
				        </div>
				        <div class="form-group middle-space col-xs-8">
							<label >备注：</label>
							<input type="text" name="memo">
						</div>
					</div> 
					<div class="row">
				        
					</div>
		       </form>
			 </div>
		</div>
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-primary" type="button">保存</button>
	        <button id="cancel" class="btn btn-white" type="button">取消</button>
		</div>
	</body>
	<!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    
	<script src="${context}/js/common/common.js"></script>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	<!-- layerDate plugin javascript -->
    <!-- <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>--> 
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
    <!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			
			$(".layer-date").each(function(){
				inistal_one_data('#'+$(this).attr('id'));
			});
			
			
			$('#save').on('click', function () {
				if(!has_null($('#form')))
					ajax_function("addQkZdPriodItem","post",$('#form').serialize(),'新增成功');		
			 });

			//加载字典数据
			get_dictionary("${context}",null);
			
			//自动搜索填补
			initialize_bsSuggest_bk_factory("${context}", "f_department", "f_id");
			initialize_bsSuggest_user_by_dept("${context}", "tz_operator_name", "tz_operator", "2000");      // 放用户信息(报刊的)
		});
	</script>
</html>