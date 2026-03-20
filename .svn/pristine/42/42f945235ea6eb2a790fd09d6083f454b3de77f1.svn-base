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
                        <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 货源信息</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                            	<div class="row">
	                            	<div class="form-group small-space col-xs-4 not-null">
				                  		<label >地区：</label>
				                        <select name="f_country" class="dictionary">
							            	<option></option>
							            </select>
				                	</div>
							    </div>
	                            <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label >货源编号：</label>
				                        <input type="text" name="f_id" disabled>
				                	</div>
							        <div class="form-group small-space col-xs-4">
							            <label >财务编码：</label>
							            <input type="text" name="f_account_id" >
							        </div>
							    </div>
							    <div class="row">
	                            	<div class="form-group large-space col-xs-12 not-null">
				                  		<label >名称：</label>
				                        <input type="text" name="f_department" >
				                	</div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>简称：</label>
				                        <input type="text" name="f_department_simple">
				                	</div>
				                	<div class="form-group small-space col-xs-4" >
							            <label >货源户号：</label>
							            <input type="text" name="f_account" >
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >业务员：</label>
							            <input type="text" name="f_charge_man_name">
									    <div class="input-group-btn">
				                         <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				                             <span class="caret"></span>
				                         </button>
				                         <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                        </div>
				                        <input type="hidden" name="f_charge_man">
							        </div>						        
							    </div>
							    <div class="row">
	                            	<div class="form-group middle-space col-xs-8">
				                  		<label>网址：</label>
				                        <input type="text" name="f_website" >
				                	</div>
							    </div>
							    <div class="row">
	                            	<div class="form-group large-space col-xs-12">
				                  		<label>备注：</label>
				                        <textarea  name="f_mem" rows="5" ></textarea>
				                	</div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>录入人：</label>
				                        <input type="text" name="o_id_input" disabled>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >录入日期：</label>
							            <input type="text" name="h_input_date" disabled>
							        </div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>修改人：</label>
				                        <input type="text" name="o_id_lastmodify" disabled>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >修改日期：</label>
							            <input type="text" name="last_mod_date" disabled>
							        </div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4 not-null">
				                  		<label>所属组织机构：</label>
				                        <input type="text" name="org_name" readonly="readonly" value="${sessionScope.defaultRole.org_name}"/>
				                        <input type="hidden" name="org_code" value="${sessionScope.defaultRole.org_code}" />
				                	</div>
				                	<div class="form-group small-space col-xs-4 not-null">	
				                  		<label>考核单位：</label>
				                        <select name="unit_code" class="dictionary" >
								    	</select>
					                </div>
					                <div class="form-group small-space col-xs-4 not-null">	
				                  		<label>财务分类：</label>
				                        <select name="f_cw_type" class="dictionary" >
								    	</select>
					                </div>		
						    	</div>
                            </div>
                        </div>
                    </div>   <!-- tab-content  -->
                    
                </div>
		       </form>
			 </div>
		</div><!-- sonpage-body -->
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
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    <!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#save').on('click', function () {
				if(!has_null($('#form')))
					ajax_function("addFactory","post",$('#form').serialize(),'新增成功');		
			 });
			//子元素滚动到底，父元素不随着滚动
			//$('.tab-content').scrollUnique();
			//加载字典数据
			get_dictionary("${context}",null);
			
			initialize_bsSuggest_fc_user("${context}", "f_charge_man_name", "f_charge_man");      // 放用户信息
			
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code");
			
			// 获得当前部门的财务分类(取普通型)
			get_financial_classify_by_dept("${context}", "${sessionScope.defaultRole.dep_org_code}", false, "f_cw_type");
		});
	</script>
</html>