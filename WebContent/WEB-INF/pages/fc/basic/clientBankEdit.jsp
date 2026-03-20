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
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <div class="ibox float-e-margins">
		            <div class="ibox-content search-content">
			            <form id="form" class="form-inline">
			            <input type="hidden" name="id" value="${param.id}">
			            <input type="hidden" name="c_id" value="${param.c_id}">
			            <div class="col-xs-12">
				            <div class="row">
								<div class="form-group middle-space col-xs-8 not-null">
			                  		<label>公司名称：</label>
			                        <input type="text" name="f_companyName">
			                	</div>
						        <div class="form-group small-space col-xs-4" >
						            <label >税务号：</label>
						            <input type="text" name="f_registMark">
						        </div>
							</div>
							<div class="row">
								<div class="form-group middle-space col-xs-8">
			                  		<label>公司地址：</label>
			                        <input type="text" name="f_companyAddress">
			                	</div>
						        <div class="form-group small-space col-xs-4" >
						            <label >联系电话：</label>
						            <input type="text" name="f_companyPhone">
						        </div>
							</div>
							<div class="row">
								<div class="form-group small-space col-xs-4">
			                  		<label>开户银行：</label>
			                        <input type="text" name="f_bank">
			                	</div>
						        <div class="form-group small-space col-xs-4" >
						            <label >银行账号：</label>
						            <input type="text" name="f_account">
						        </div>
						        <div class="form-group small-space col-xs-4 not-null" >
						            <label >是否默认：</label>
						            <select name="f_default" class="dictionary isboolean">
						            	<option></option>
						            </select>
						        </div>
							</div>
							<div class="row">
                            	<div class="form-group small-space col-xs-4">
			                  		<label>我方银行：</label>
			                        <input type="text" name="my_bank">
			                	</div>
						        <div class="form-group small-space col-xs-4" >
						            <label >我方银行账号：</label>
						            <input type="text" name="my_account">
						        </div>
					    	</div>
						 </div>
						</form>
		            </div>
       		</div>
		</div>
	</div>
	<div class="sonpage-footer">
	    <button id="save" class="btn btn-primary" type="button">保存</button>
	    <button id="cancel" class="btn btn-white" type="button">关闭</button>
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
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
    
    
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
			$('#save').on('click', function () {
				if(!has_null($("#form")) && !auto_not_matching($("#form"))){
					ajax_function("editBank","post",$('#form').serialize(),'修改成功');
				}
			});	
			
			var bank_str='${oneJson}';
			bank_str=bank_str.replace(/\r\n/g,"\\r\\n")  
        	bank_str=bank_str.replace(/\n/g,"\\n");
			bank_str=bank_str.replace(/\s/g," ");
			var bank=JSON.parse(bank_str);
			
			//加载字典数据
			get_dictionary("${context}",bank);
			//填写已有数据
			set_one_info($("#form"),bank);
		});
	</script>
</html>