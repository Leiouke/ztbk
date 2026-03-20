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
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 自动新增刊期</a>
                        </li>
                    </ul>
                    <div class="tab-content" style = "height: 300px">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
	                            <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label >报刊名称</label>
				                        <input type="text" name="NewspaperName" >
				                	</div>
							        <div class="form-group small-space col-xs-4">
				                  		<label >开始时间：</label>
								    	<input name="StartDate" id="StartDate" type="text" class="form-control search-items layer-date">
				                	</div>
				                	<div class="form-group small-space col-xs-4">
				                  		<label >结束时间：</label>
								    	<input name="EndDate" id="EndDate" type="text" class="form-control search-items layer-date">
				                	</div>
							    </div>
							    <div class="row">
							    	<div class="form-group small-space col-xs-4">
							            <label >类型：</label>
							            <select name="Type">
							            	<option></option>
							            	<option value = "month">月份</option>
							            	<option value = "week">周次</option>
							            </select>
							        </div>
							        <div class="form-group small-space col-xs-4">
				                  		<label >每年发行刊数</label>
				                        <input type="text" name="IssuesPerYear" >
				                	</div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>发行规律(月/周)：</label>
				                        <input type="text" name="Rule1" >
				                	</div>
				                	<div class="form-group small-space col-xs-4">
				                  		<label>发行规律(日期/星期)：</label>
				                        <input type="text" name="Rule2" >
				                	</div>
									<div class="form-group small-space col-xs-4">
 				                        <input type="text" name="qk_id" style="display: none;" value = '${qk_id}'>
									</div>
							    </div>
                            </div>
                        </div>
                    </div>
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
					ajax_function("addProductInstanceAuto","post",$('#form').serialize(),'新增成功');		
			 });
			//子元素滚动到底，父元素不随着滚动
			$('.tab-content').scrollUnique();
			//加载字典数据
			get_dictionary("${context}",null);
		});
	</script>
</html>