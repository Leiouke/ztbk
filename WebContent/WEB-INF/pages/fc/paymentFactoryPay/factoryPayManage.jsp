<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String context = request.getContextPath();
	request.setAttribute("context",context);
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
	<div class="wrapper wrapper-content animated fadeInRight">
         <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查询</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content search-content">
	            <form id="form_search" class="form-inline">
	            <div class="col-xs-11">
					  <div class="form-group inline-small">
					    <label >户号：</label>
					    <input type="text" name="f_account" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >货源名称：</label>
					    <input type="text" name="f_department" class="form-control search-items" >
					  </div>
					  <div class="form-group input-group inline-small">
					    <label >业务员：</label>
					    <input type="text" name="f_charge_man_name" class="form-control search-items">
					    <div class="input-group-btn">
                         <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                             <span class="caret"></span>
                         </button>
                         <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="f_charge_man" class="form-control search-items">
					  </div>
					  <div class="form-group inline-small">
					    <label >考核单位：</label>
					    <select name="unit_code" class="form-control dictionary search-items" id="unit_code">
					    	<option></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >外币余额 > </label>
					    <input type="text" name="b_value" class="form-control search-items" value = "0">
					  </div>
				 </div>
				 <div class="col-xs-1 search-group-button">
					  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
					  	<button type="button" class="btn btn-default btn-xs" id="reset">清空</button>
				 </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>货源信息</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
	                    <div class="btn-group hidden-xs" id="tableTool" role="group">
	                        <button type="button" class="btn btn-outline btn-default" id="config">
	                            <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
	                        </button>
	                        <select class="form-control" >
	                       		<option value="all">导出全部</option>
					            <option value="basic">导出当页</option>	
					        </select>
	                    </div>
	                    <table id="table" data-mobile-responsive="true">
	                        
	                    </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	</body>
	    
	<!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>

    <!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
    <!-- 通用查询grid 列渲染函数库 -->
	<script src="${context}/js/common/gridColumnFormat.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
    
	<script type="text/javascript">		
		var $table = $('#table');
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
	  		json_obj['sortOrder'] =this.sortOrder;
   	        return json_obj;
		}
		
		$(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table_no_footer($table,"",${tableHeader},queryParams,"#tableTool",400);
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getFactoryPayList",$('#table'));
			});
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','csu/columnConfig?queryId=${queryId}');
			
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    });
			initialize_bsSuggest_fc_user("${context}", "f_charge_man_name", "f_charge_man");      // 放用户信息
			
			// 获得当前部门的考核单位
			get_assess_unit_by_dept("${context}", "unit_code"); 
	    });
		
		var is_audit = 0;
		<c:if test="${param.to_audit != null}">
			is_audit = 1;
		</c:if>
		function toPay(f_id,currency){
			if (is_audit == 0) {
				open_layer_refresh(2,'余额支出','factoryPayItemManage?f_id='+f_id+'&currency='+currency,$table,['720px', '580px'],true);
			} else {
				open_layer_refresh(2,'支出审核','factoryPayItemManage?to_audit=1&f_id='+f_id+'&currency='+currency,$table,['720px', '580px'],true);
			}
		}
		
		function toPayDetail(f_id,currency){
			open_layer_refresh(2,'余额收支明细','factoryPayItemDetailManage?f_id='+f_id+'&currency='+currency,$table,['720px', '580px'],true);
		}
		 
		function renderOperator(value,row,index) {
			var str="";
		 	if (is_audit == 0) {
		 		str += "<a onclick=\"toPay('"+row.f_id+"','"+row.currency+"')\">余额支出</a>";
			} else {
		 		str += "<a onclick=\"toPay(\'"+row.f_id+"','"+row.currency+"')\">支出审核</a>";
			}
		 	
		 	str +="&nbsp;&nbsp;"
		 	str += "<a onclick=\"toPayDetail('"+row.f_id+"','"+row.currency+"')\">收支明细</a>";
			return str;
		}
	</script>
</html>