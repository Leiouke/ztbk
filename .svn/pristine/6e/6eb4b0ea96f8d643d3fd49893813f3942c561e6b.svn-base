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
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <style type="text/css">
	    	/*table里面的文本框css*/
		    .ibox-content-table input[type='text']{
		    	width:70px;
		        text-align: right;
		    }
	    </style>
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
       		<div class="ibox float-e-margins">
	            <div class="ibox-title">
	                <h5>角色列表</h5>
	                <div class="ibox-tools">
	                    <a class="collapse-link">
	                        <i class="fa fa-chevron-up"></i>
	                    </a>
	                </div>
	            </div>
	            <div class="ibox-content ibox-content-table">
	                <div class="row row-lg">                    
	                    <div class="col-sm-12">
	                        <div class="btn-group hidden-xs" id="tableTool" role="group">
	                            <c:if test = '${empty param.editable}'>
	                            <button type="button" class="btn btn-outline btn-default" id="add">
	                                <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
	                            </button>
	                            </c:if>
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
	</div>
	<div class="sonpage-footer">
	    <button id="cancel" class="btn btn-white" type="button">返回</button>
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
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
	function queryParams(param) {
		var json_obj = {};
		json_obj['limit'] =param.limit;
		json_obj['offset'] =param.offset;
		json_obj['sortName'] =this.sortName;
		json_obj['sortOrder'] =this.sortOrder;
		json_obj['account'] = '${param.account}';
	    return json_obj;
	}
	
	function toDel(id){
		ajax_function_ask_and_refresh("确认删除？","deleteUserRole","post",{'ids':id, 'account': '${param.account}'},"已删除!",$('#table'));
	}
	
	function toUpdate(id) {
		parent.layer.open({
            type: 2,
            title:'修改用户角色',
            area: ['620px', '580px'],
            skin: 'layui-layer-rim', //加上边框
            content: 'system/userRoleEdit?id=' + id + '&account=${param.account}',
            end:function () {
            	$('#table').bootstrapTable('refresh');
            }
        }); 
	}
	
	function renderOperator(value,row,index){
	 	var str ='';
	 	<c:if test = '${empty param.editable}'>
	 	str += "<a onclick=\"toUpdate('"+row.ID+"')\">修改</a> ";
	 	str += "<a onclick=\"toDel('"+row.ID+"')\">删除</a>";
	 	</c:if>
	 	<c:if test = '${not empty param.editable}'>
	 	str += "<a onclick=\"toChange('"+row.ID+"')\">切换</a> ";
	 	</c:if>
		return str;
	}
	
	function toChange(id, account){
		ajax_function_ask_and_dosuccess("确认切换？","setUserRoleDefault","post",{'id':id, 'account':'${param.account}'},change_success);
	}
	
	function change_success(data){
		if (data.success){				
			layer.msg("切换完成!");
			setTimeout(function (){
				parent.location.href="../index";
        	   }, 1000);
    	} else {
    		alert(data.errorMsg);
    	}
	}
	
	var $table = $('#table');
	$(document).ready(function () {	
		//bootstrap初始化
		initialize_table($table,"getUserRoleManageList",${tableHeader},queryParams,"#tableTool",550);
		
		//增加条目layer
		var $add=$("#add");
		button_click_layer_refresh($add,2,"新增角色",'userRoleAdd?account=' + '${param.account}',$table,false,['750px', '580px']);
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		$('#tableTool').find('select').change(function () {
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	    });
	});
	</script>
</html>