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
                <h5>费用管理</h5>
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
							<div class="form-group inline-small">	
								<label >是否提醒：</label>
								<select name="is_reminder" id="is_reminder" class="form-control search-items dictionary">
									<option></option>
									<option value = "0">否</option>
									<option value = "1">是</option>
								</select>
							</div>
							<div class="form-group inline-small">	
								<label >是否抵扣：</label>
								<select name="is_rebate" id="is_rebate" class="form-control search-items dictionary">
									<option></option>
									<option value = "0">否</option>
									<option value = "1">是</option>
								</select>
							</div>
							<div class="form-group input-group inline-small">
								<label>录入人：</label>
								<input type="text" name="input_man_name" class="form-control search-items auto-not-null" id = "input_man_name" >
								<div class="input-group-btn">
						  			<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
						  				<span class="caret"></span>
						     		</button>
						        	<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
						    	</div>
						    	<input type="hidden" name="input_man" class="form-control search-items">
							</div>
							<div class="form-group inline-small">
								<label>招标部门：</label>
								<input type="text" name="dep_org" class="form-control search-items auto-not-null" id ="dep_org">
								<div>
						        	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
						            	<span class="caret"></span>
						        	</button>
						        	<ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
								</div>
								<input type="hidden" name="dep_code" class="form-control search-items auto-not-null" id = "dep_code">
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
                <h5>费用管理查询</h5>
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
		initialize_bsSuggest_user_by_dept('${context}',"input_man_name","input_man","")
		
		//查询按钮
		$("#search").on('click',function(){
			 var json_data_list = {};
			 json_data_list['queryId']='${queryId}';
			 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getFreeManagementList",$('#table'));
		 });
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		//bootstrap初始化
      	initialize_table($table,"getFreeManagementList",${tableHeader},queryParams,"#tableTool",400);
		
	});
	
	//加载操作按钮
	function renderOperator(value,row,index){
		var str = "<a onclick=\"toDetail('"+row.fe_id+"')\">详情</a>";
		if(row.fee_type==1){
			str = str +"&nbsp;&nbsp;"
			+"<a onclick=\"toInvoice('"+row.fe_id+"')\">发票</a>";
		}
        			
        			
//         //加载提醒功能
// 		if(row.fee_type==0||row.fee_type==2){//保证金和质保金要提醒
// 			str = str +"&nbsp;&nbsp;"
// 			+"<a onclick=\"toRemind('"+row.fe_id+"')\">提醒</a>";
// 		}
        
        //增加撤销归还和归还按钮
        if((row.fee_type==0||row.fee_type==2)&&!row.is_rebate){//确认是保证金或质保金，且没有被抵扣
        	if(row.main_fe_id!=null&&row.main_fe_id != ""){//判断来款单号为undefind，null或者""，不是的话增加撤销归还
    			str = str +"&nbsp;&nbsp;"
    			+"<a onclick=\"toRecycleCancel('"+row.fe_id+"')\">撤销归还</a>";
    		}else{//增加提醒和归还功能
    			str = str +"&nbsp;&nbsp;"
    			+"<a onclick=\"toRemind('"+row.fe_id+"')\">提醒</a>"
    			+"&nbsp;&nbsp;"
    			+"<a onclick=\"toRecycle('"+row.fe_id+"')\">归还</a>";
    			if(!row.remainder_fee==0){
    				str = str +"&nbsp;&nbsp;"
    				+"<a onclick=\"toReverse('"+row.td_id+"'\,'"+row.bids_project+"'\,'"+row.fe_id+"')\">冲销</a>";
    			}
    			
    		}
        }
		return str;
	 }
	
	//详情页面按钮
	function toDetail(fe_id){
		open_layer_refresh(2,'详情','toFreeManagementDetailPage?fe_id='+ fe_id,
			$table,['750px', '500px'],true);
	 }
	
	//提醒页面
	function toRemind(fe_id){
		open_layer_refresh(2,'设置提醒','toFreeRemindManagementPage?fe_id='+ fe_id,
			$table,['500px', '450px'],false);
	 }
	
	//设置发票号页面
	function toInvoice(fe_id){
		open_layer_refresh(2,'修改发票号','toSettoInvoicePage?fe_id='+ fe_id,
			$table,['400px', '200px'],false);
	 }
	
	//编辑归还金额按钮
	function toRecycle(fe_id){
		open_layer_refresh(2,'归还','toFreeRecycleManagementPage?fe_id='+ fe_id,
			$table,['600px', '300px'],false);
	 }
	
	//撤销回收按钮
	function toRecycleCancel(fe_id){
		ajax_function_ask_and_refresh("是否确认撤销归还","toRecycleCancel","post",{'fe_id':fe_id},'撤销回收归还',$table);
	 }
	
	//冲销页面
	function toReverse(td_id,bids_project,fe_id){
		open_layer_refresh(2,'冲销新增','toFeeReverseManagementPage?td_id='+td_id+'&bids_project='+bids_project+'&fe_id='+fe_id,
			$table,['800px', '400px'],false);
	 }
	
	
	</script>
</html>