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
							<label >客户编号：</label>
							<input type="text" name="c_id" class="form-control search-items" >
							<div class="input-group-btn">
                            	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                	<span class="caret"></span>
                                </button>
                                	<ul class="dropdown-menu dropdown-menu-right" role="menu">
                                    </ul>
                           </div>
					  </div>
					  <div class="form-group inline-large">
							    <label >户号(_客户名称)：</label>
							    <input type="text" name="c_department" class="form-control search-items" disabled>
					  </div>					  
					  <div class="form-group inline-small">
					    <label >配送日期：</label>
					    <input type="text" class="form-control  layer-date search-items" name="start_date" id="start_date">
					    -
					    <input type="text" class="form-control  layer-date search-items" name="end_date" id="end_date">
					  </div>
<!-- 					  <div class="form-group input-group inline-small"> -->
<!-- 							    <label >录入员：</label> -->
<!-- 							    <input type="text" name="o_id_input_name" class="form-control search-items"> -->
<!-- 							    <div class="input-group-btn"> -->
<!--                                             <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown"> -->
<!--                                                 <span class="caret"></span> -->
<!--                                             </button> -->
<!--                                             <ul class="dropdown-menu dropdown-menu-right" role="menu"> -->
<!--                                             </ul> -->
<!--                                  </div> -->
<!--                         		<input type="hidden" name="o_id_input" class="form-control search-items"> -->
<!-- 					  </div> -->
					  <div class="form-group inline-small">
					    <label >配送状态：</label>
					    <select name="status" class="form-control search-items">
					    	<option></option>
					    	<option value = "0">待配送</option>
					    	<option value = "1">配送中</option>
					    	<option value = "2">已配送</option>
					    </select>
					  </div>
				 </div>
				 <div class="col-xs-1 search-group-button">
					  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
					  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>发货单</h5>
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
                                    <button type="button" class="btn btn-outline btn-default" id="add">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
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
            <div class="sonpage-footer">
			    <button id="sendout_combine" class="btn btn-primary" type="button">组包合并</button>
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
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
		inistal_data('#start_date','#end_date');
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
			initialize_table($table,"",${tableHeader},queryParams,"#tableTool",400);
			
			//增加条目layer
			var $add=$("#add");
			button_click_windows_refresh($add,2,"发货单新增",'sendOutAddManage',$table,true);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			 $('#tableTool').find('select').change(function () {				 
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		     });
			 $("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getSendOutList",$table);
			 });
			 //自动搜索填补
			 //initialize_bsSuggest_user_by_dept("${context}", "o_id_downshelves_name", "o_id_downshelves", "2000");      // 放用户信息(报刊的)
			 initialize_bsSuggest_bk_client("${context}", "c_department", "c_id");
			 
			 $('#sendout_combine').on('click', function () {
				 	var cid_check = 0;
				 	var status_check = 0;
				 	var last_c_id = "";
				 	
					var combine_items= $.map($table.bootstrapTable('getSelections'), function (row) {
						if(last_c_id == ""){//第一次做赋值
							last_c_id = row.c_id;
						}else if(last_c_id != row.c_id&&cid_check==0){//检查结果通过，且有不相等的客户，则修改为不通过
							cid_check = 1;
						}
						
						if(row.status!="0"&&status_check==0){//检查结果通过，且不为待配送，则修改为不通过
							status_check==1;
						}
						
			        	return {'c_id':row.c_id, 'status':row.status,"td_id":row.td_id};
			        });
					
					if(cid_check == 1){
						layer.msg("所选发货单包含不同客户，请检查后合并!");
						return;
					}
					
					if(status_check == 1){
						layer.msg("包含配送中或已配送订单，请检查后合并!");
						return;
					}
					
					if(combine_items.length>1) {
						ajax_function_ask_and_close_json_data("确认合并？","doSendOutItemsCombine","post",JSON.stringify(dh_items),'操作成功');
					} else {
						layer.msg("未选择明细或请选择两条以上的明细！");
					}
				});
	     });
		 
		 function toEdit(so_id){
			 open_layer_refresh(2,'编辑发货单','toSendOutEdit?so_id='+so_id,$table,['360px', '380px'],true);
		 }
		
		 function renderOperator(value,row,index){
			var str = "";
			str="&nbsp;&nbsp;<a onclick=\"toEdit('"+row.so_id+"')\">编辑</a>";
			return str;
		 }
	</script>
</html>