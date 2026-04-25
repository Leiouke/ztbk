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
	            <form id="form_search" class="form-inline">
	            <div class="col-xs-11">
	            	<div class="row">
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
								    <label >客户名称(_户号)：</label>
								    <input type="text" name="c_department" class="form-control search-items" disabled>
						  </div>
						  <div class="form-group inline-small">
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
				 </div>
				 <div class="col-xs-1 search-group-button">
					  	<button type="button" class="btn btn-primary btn-xs" id="search_pull_items">查询</button>
					  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
        </div>
        <div class="ibox float-e-margins">
        	<div class="ibox-title">
                <h5>明细</h5>
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
		                    	<button type="button" class="btn btn-outline btn-default" id="config">
		                               <i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
		                         </button>
<!-- 	                            <select class="form-control" > -->
<!-- 	                           	   <option value="all">导出全部</option> -->
<!-- 					               <option value="basic">导出当页</option>	 -->
<!-- 					            </select>  -->
					        </div>                       
	                        <table id="table" data-mobile-responsive="true">
	                                    
	                        </table>
	                    </div>
	            </div>
	            <div class="row row-lg" style="margin-top: 5px;text-align: center;">
                		<button type="button" class="btn btn-success" id="commit">提交</button>
                		<button type="button" class="btn btn-white" id="cancel">取消</button>
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
    	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
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
		 $(document).ready(function () {
			//加载字典数据
// 			$(".layer-date").each(function(){
// 				inistal_one_data('#'+$(this).attr('id'));
// 			})
			
			get_dictionary("${context}",null);			
			
			//表格配置 layer
			var $config=$("#config");
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			$('#commit').on('click', function () {
				var fh_id = parent.$('#fh_id').val();
				console.log("fh_id="+fh_id);
				var pre_ids= $.map($table.bootstrapTable('getSelections'), function (row) {
	                return {'c_id':row.c_id,'pre_id':row.pre_id,'fh_id':fh_id};
	            });
				if(pre_ids.length!=0) {
					ajax_function_ask_and_close_json_data("确认引入？","pullAgentFinanceFhshReverseItem","post",JSON.stringify(pre_ids),'引入成功');
				} else {
					layer.msg("未选择明细！");
				}
			});			
			//bootstrap初始化
			initialize_table_simple($table,"getfinanceAgentFhshReverseItemPullList",${tableHeader},queryParams,350);
			
			 //自动搜索填补
			initialize_bsSuggest_bk_client("${context}", "c_department", "c_id");
			
			initialize_bsSuggest_user_by_dept("${context}", "c_charge_man_name", "c_charge_man", "2000");      // 放用户信息(报刊的)
	     });
	</script>
</html>