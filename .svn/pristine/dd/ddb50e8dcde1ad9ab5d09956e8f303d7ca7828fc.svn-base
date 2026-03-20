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
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	     <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	</head>
	<body>
	<div class="wrapper wrapper-content animated fadeInRight">
         <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>付款审批</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content search-content">
	            <form id="form_search" class="form-inline">
	            	<div class="col-xs-12">
	            		<div class="col-xs-9">
							<div class="form-group inline-middle">
				            	<label>招标项目：</label>
				           		<input type="text" id="bids_project" name="bids_project" class="form-control search-items">
				        	</div>
				        	<div class="form-group inline-small">	
								<label >费用类型：</label>
								<select name="fee_type" id="fee_type" class="form-control search-items dictionary">
									<option></option>
								</select>
							</div>
							<div class="form-group input-group inline-small">
								<label>申请人：</label>
								<input type="text" name="apply_man_name" class="form-control search-items auto-not-null" id = "input_man_name" >
								<div class="input-group-btn">
						  			<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
						  				<span class="caret"></span>
						     		</button>
						        	<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
						    	</div>
						    	<input type="hidden" name="apply_man" class="form-control search-items">
							</div>
							<div class="form-group input-group inline-small">
								<label>申请部门：</label>
								<input type="text" name="dep_org" class="form-control search-items auto-not-null" id ="dep_org">
								<div>
						        	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
						            	<span class="caret"></span>
						        	</button>
						        	<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
								</div>
								<input type="hidden" name="dep_code" class="form-control search-items auto-not-null" id = "dep_code">
							</div>
							<div class="form-group input-group inline-small">	
								<label >审批结果：</label>
								<select name="approval_result" id="approval_result" class="form-control search-items">
									<option></option>
									<option value = "0">未提交</option>
									<option value = "1">待一级审批</option>
									<option value = "15">待二级审批</option>
									<option value = "2">已通过</option>
									<option value = "3">未通过</option>
								</select>
							</div>
						 </div>	
				         <div class="search-group-button col-xs-3">
						  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
						  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
						 </div>
		         	</div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>付款审核查询</h5>
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
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
    <!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
    
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
	
	//加载单位类型字典
	get_dictionary('${context}',null);
	
	//自动搜索填补		
	initialize_bsSuggest_org_type("${context}","dep_org","dep_code","0");
	
	if('${dep_org_code}'!=''){
		$('#dep_code').val('${dep_org_code}');
		$('#dep_code').attr("readOnly","readOnly");
	}
	if('${dep_org_name}'!=''){
		$('#dep_org').val('${dep_org_name}');
		$('#dep_org').attr("readOnly","readOnly");
	}
	
	$(document).ready(function () {	
		
		//加载申请人字典
		initialize_bsSuggest_user_by_dept('${context}',"apply_man_name","apply_man","")
		
		//查询按钮
		$("#search").on('click',function(){
			 var json_data_list = {};
			 json_data_list['queryId']='${queryId}';
			 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getFeeApproveManageList",$('#table'));
		 });
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		//bootstrap初始化
      	initialize_table($table,"getFeeApproveManageList",${tableHeader},queryParams,"#tableTool",400);
		
	});
	
	//加载操作按钮
    function renderOperator(value,row,index){
		if(row.is_approval==0){
			var str = "<a onclick=\"toApprovePage('"+row.pr_id+"','"+row.flow_id+"')\">审批</a>";
		}
 		return str;
 	}
  	
  	//进入审核界面
	function toApprovePage(pr_id,flow_id){
		open_layer_refresh(2,'审批','toFreeApproveDealPage?pr_id='+ pr_id+"&flow_id="+flow_id,
				$table,['500px', '300px'],false);
	 }
  	
	function renderFlowUrl(value, row, index){
		if (value){
			return "<a href='/itoms/fc/flow/oneExistFlowDetial?bill_code="+row.pr_id+"' target='_blank'>"+value+"</a>";
		}
		return value;
	}
	</script>
</html>