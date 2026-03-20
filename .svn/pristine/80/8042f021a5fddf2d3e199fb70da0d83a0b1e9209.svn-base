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
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
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
					  <div class="form-group input-group inline-middle">
	 						<label >货源编号：</label>
	 						<input type="text" name="f_id" class="form-control search-items" >
	 						<div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                           <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                      </div>
					  </div>
					  <div class="form-group inline-large">
					    <label >户号(_货源名称)：</label>
					    <input type="text" name="f_department" class="form-control search-items" disabled>
					  </div>					  				  
					  <div class="form-group input-group inline-small">
					    <label >录入人：</label>
					    <input type="text" name="o_id_name" class="form-control search-items">
					    <div class="input-group-btn">
                               <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                   <span class="caret"></span>
                               </button>
                               <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
                        </div>
                        <input type="hidden" name="o_id" class="form-control search-items">
					  </div>
					  <div class="form-group inline-small">
					    <label >录入日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="input_date_start" id="input_date_start">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="input_date_end" id="input_date_end">
					  </div>
				 </div>
				 <div class="col-xs-1 search-group-button">
					  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
					  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins" style="margin-bottom:0px">
            <div class="ibox-title">
                <h5>到货管理</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content" style="padding-bottom:0px">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
                                <div class="btn-group hidden-xs" id="tableTool" role="group">
                                    <button type="button" class="btn btn-outline btn-default" id="addPaper">
                                        	新增报刊到货
                                    </button>
                                    <button type="button" class="btn btn-outline btn-default" id="addMag">
                                        	新增杂志到货
                                    </button>
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

    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
  	<script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
    
	<script type="text/javascript">
		//加载时间控件
	 	$(".layer-date").each(function(){	
			inistal_one_data('#'+$(this).attr('id'));
		});
		
		var $table = $('#table');
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));;
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	        return json_obj;
		}
		
		function end_function(index, layero){
			ajax_function_no_close("returnQkZd","post",{},null);
			var json_data_list=formToJson($("#form_search"));
			json_data_list['queryId']='${queryId}';
			search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getQkDhManageList",$table);
     	}
		
		$(document).ready(function () {
			 //固定列
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getQkDhManageList",$table);
			});
			
			//增加条目layer
			var $add=$("#addPaper");
			button_click_layer_refresh($add,2,"新增报刊到货",'paperDhAdd',$table,false,['650px', '500px']);
			
			//增加条目layer
			var $add_mag=$("#addMag");
			button_click_layer_refresh($add_mag,2,"新增杂志到货",'magDhAdd',$table,true,['650px', '500px']);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 //自动搜索填补
			 initialize_bsSuggest_bk_factory("${context}", "f_department", "f_id");
			 initialize_bsSuggest_fc_user("${context}", "o_id_name", "o_id");      // 放用户信息
	     });
		
		function toDetail(qk_dh_id,dh_flag){
// 			if (is_verify === null || is_verify === undefined) {
// 				is_verify = 0;
// 			}
			open_layer_refresh(2,'到货明细','paperDhItem?qk_dh_id='+qk_dh_id+'&dh_flag='+dh_flag,$table,['750px', '500px'],true);
		}
		
		function toDel(qk_dh_id) {
			ajax_function_ask_and_refresh("确认删除?","deleteQkDh","post",{'qk_dh_id': qk_dh_id},"删除成功!",$('#table'));
		}
		
		function toEdit(qk_dh_id){
			open_layer_refresh(2,'到货明细','toMagDhItemEdit?qk_dh_id='+qk_dh_id,$table,['750px', '500px'],true);
		}
		
		function toVerify(qk_dh_id){
			ajax_function_ask_and_refresh("确认提交?","verifyQkDh","post",{'qk_dh_id': qk_dh_id,'is_verify':'1'},"提交成功!",$('#table'));
		}
	 
		function renderOperator(value,row,index){
			var str = "";
		    if(row.qk_attribute == "01"){
		    	str += "<a onclick=\"toDetail('"+row.qk_dh_id+"','"+row.dh_flag+"')\">明细</a> ";
				if(row.is_verify != 1){
					str += "&nbsp;";
					str += "<a onclick=\"toVerify('"+row.qk_dh_id+"')\">提交</a>";
					str += "&nbsp;";
					str += "<a onclick=\"toDel('"+row.qk_dh_id+"')\">作废</a>";
				}
		    }else if(row.is_verify == 1){
		    	str += "<a onclick=\"toEdit('"+row.qk_dh_id+"')\">明细</a> ";
		    }else{
		    	str += "<a onclick=\"toEdit('"+row.qk_dh_id+"')\">编辑</a> ";
				str += "&nbsp;";
				str += "<a onclick=\"toVerify('"+row.qk_dh_id+"')\">提交</a>";
				str += "&nbsp;";
				str += "<a onclick=\"toDel('"+row.qk_dh_id+"')\">作废</a>";
		    }
			return str;
		}
		

	</script>
</html>