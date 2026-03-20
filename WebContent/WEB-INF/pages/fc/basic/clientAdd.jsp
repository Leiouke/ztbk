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
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">	
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   			        
                <div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" id="tab-1-title" href="#tab-1" aria-expanded="true"> 客户信息</a>
                        </li>
                    </ul>
                    <div class="tab-content">                    
                        <div id="tab-1" class="tab-pane active">
                            <div class="panel-body">
                            <form id="form" class="form-inline">
	                            <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label >户号：</label>
				                        <input type="text" name="custom_id" >  <!-- 如果没有赋值, 那么传到数据库是null 不是空字符串了 -->
				                	</div>
							        <div class="form-group small-space col-xs-4">
							            <label >财务编码：</label>
							            <input type="text" name="finance" id = "finance">
							        </div>
							        <div class="form-group small-space col-xs-4 not-null" >
							            <label >客户名称：</label>
							            <input type="text" name="c_department" >
							        </div>
							    </div>
							    <div class="row">
							        <div class="form-group small-space col-xs-4" >
							            <label >客户简称：</label>
							            <input type="text" name="c_department_simple" >
							        </div>	     
							        
							        <div class="form-group small-space col-xs-4" >
							            <label >译名：</label>
							            <input type="text" name="c_department_Foreign" >
							        </div>  
							        <div class="form-group small-space col-xs-4" >
							            <label >主管业务员：</label>
							            <input type="text" name="c_charge_man_name">
									    <div class="input-group-btn">
				                         <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				                             <span class="caret"></span>
				                         </button>
				                         <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                        </div>
				                        <input type="hidden" name="c_charge_man">
							        </div> 
							    </div>
							    <div class="row">
							        <div class="form-group small-space col-xs-4 not-null">	
				                  		<label>财务分类：</label>
				                        <select name="c_cw_type" class="dictionary" >
								    	</select>
					                </div>
							    	<div class="form-group small-space col-xs-4" >
							            <label >是否免税：</label>
							            <select name="c_ms_id" class="dictionary isboolean">
							            	<option></option>
							            </select>
							        </div>	
							    	<div class="form-group small-space col-xs-4" >
							            <label >折扣(填小数)：</label>
							            <input type="text" name="c_discount">
							        </div>						        						       	
							    </div>
							    <div class="row">
							        <div class="form-group small-space col-xs-4" >
							            <label >所在国家：</label>
							            <input type="text" name="a_id" >
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >所在省：</label>
							            <input type="text" name="p_id" >
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >所在市：</label>
							            <input type="text" name="city_id" >
							        </div>
							    </div>
							    <div class="row">
							        <div class="form-group small-space col-xs-4" >
							            <label >行业分类：</label>
							            <input type="text" name="c_hy_id" >
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >注册资金：</label>
							            <input type="text" name="c_money" >
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >法人：</label>
							            <input type="text" name="c_law_man" >
							        </div>
							    </div>
							    <div class="row">
	                            	<div class="form-group small-space col-xs-4">
				                  		<label>录入员：</label>
				                        <input type="text" disabled>
				                	</div>
							        <div class="form-group small-space col-xs-4" >
							            <label >创建日期：</label>
							            <input type="text" name="h_input_date" class="date-type" disabled>
							        </div>
							        <div class="form-group small-space col-xs-4" >
							            <label >最后修改时间：</label>
							            <input type="text" name="last_mod_date" class="date-type" disabled>
							        </div>
						    	</div>
						    	<div class="row">
	                            	<div class="form-group small-space col-xs-4 not-null">
				                  		<label>所属组织机构：</label>
				                        <input type="text" name="org_name" readonly="readonly" value="${sessionScope.defaultRole.org_name}"/>
				                        <input type="hidden" name="org_code" value="${sessionScope.defaultRole.org_code}" />
				                	</div>
				                	<div class="form-group small-space col-xs-4" >
							            <label >结算客户：</label>
							            <input type="text" name="settlement_c_id">
									    <div class="input-group-btn">
				                         <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
				                             <span class="caret"></span>
				                         </button>
				                         <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
				                        </div>
							        </div>
							        <div class="form-group small-space col-xs-4" >
							        	<label >结算客户户号(_客户名称)：</label>
									    <input type="text" name="settlement_c_name" disabled>
							        </div>
						    	</div>
						    	<div class="row">
							        <div class="form-group small-space col-xs-4 not-null">	
				                  		<label>考核单位：</label>
				                        <select name="unit_code" class="dictionary" >
								    	</select>
					                </div>					        						       	
							    </div>
						    </form>
						    </div>
                        </div>
                    </div>                    
                    
                </div>
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
	
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
 	
	<script type="text/javascript">
		$(document).ready(function () {
			$('#save').on('click', function () {
				var finance = $("#finance").val();
				if(finance.length>18){
					alert("财务编码应小于18位，请检查是否超长或前后有空格");
				}else{
					if(!has_null($("#form"))){
						ajax_function("addClient","post",$('#form').serialize(),'新增成功');
					}
				}
			});
			
			//加载字典数据
			get_dictionary("${context}",null);
			
			initialize_bsSuggest_fc_user("${context}", "c_charge_man_name", "c_charge_man");      // 放用户信息
			
			// 获得当前部门的财务分类(取普通型)
			get_financial_classify_by_dept("${context}", "${sessionScope.defaultRole.dep_org_code}", false, "c_cw_type");
			
			initialize_bsSuggest_fc_client("${context}", "settlement_c_name", "settlement_c_id");  // 结算客户
			
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code");
		});
	</script>
</html>