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
							    <label >货源名称(_户号)：</label>
							    <input type="text" name="f_name" class="form-control search-items" disabled>
						  </div>
					 </div>
					 <div class="row">
						  <div class="form-group inline-small">
						  <label >发票号：</label>
						    <input type="text" name="inv_no" class="form-control search-items" >
						  </div>					  
						  <div class="form-group inline-small">
						    <label >发票日期：</label>
						    <input type="text" class="form-control  layer-date search-items" name="inv_date_start" id="inv_date_start">
						    -
						    <input type="text" class="form-control  layer-date search-items" name="inv_date_end" id="inv_date_end">
						 </div>
					 </div>
					 <div class="row" style="margin-bottom:5px">
					  		  <div class="form-group inline-small">
								  <label >发票号(多个)：</label>
								  <textarea rows="3" cols="15" name="inv_nos" class="form-control search-items"></textarea>
							  </div>
					  </div>
				 </div>
				 <div class="col-xs-1 search-group-button">
					  	<button type="button" class="btn btn-primary btn-xs" id="search_pull_items">查询</button>
					  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
        </div>
        <div class="ibox float-e-margins" style="margin-bottom:0px">
            <div class="ibox-title">
                <h5>查询结果明细</h5>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">                                
	                    <table id="table_result" data-mobile-responsive="true">
	                        
	                    </table>
                    </div>
                </div>                
                <div class="row row-lg" style="margin-top: 5px;text-align: center;">
              		<button type="button" class="btn btn-primary" id="select_in">选择</button>
                </div>
            </div>
        </div>
        <div class="ibox float-e-margins">
        	<div class="ibox-title">
                <h5>本次引入明细</h5>
            </div>
            <div class="ibox-content">
	            <div class="row row-lg">                    
	                    <div class="col-sm-12">                                
	                        <table id="table_pull_in" data-mobile-responsive="true">
	                            
	                        </table>
	                    </div>
	            </div>
	            <div class="row row-lg" style="margin-top: 5px;text-align: center;">
              		<button type="button" class="btn btn-success" id="commit">提交</button>
              		<button type="button" class="btn btn-warning" id="cancel_pull_in">清空</button>
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
    	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
    <!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
	<script type="text/javascript">
		var $table_result = $('#table_result');
		var $table_pull_in = $('#table_pull_in');
		inistal_data('#inv_date_start','#inv_date_end');
		function queryParams_result(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	        return json_obj;
		} 
		
		function queryParams_pull_in(param) {
			var json_obj={};
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	        return json_obj;
		}
		
		function toDel(inv_id){
			if(confirm("确认删除？")){
				var inv_ids = new Array(1);
				inv_ids[0]=inv_id;
				$table_pull_in.bootstrapTable('remove', {field: 'inv_id', values: inv_ids});
			}
		}
		
		function renderOperator(value,row,index){
			return "<a onclick=\"toDel('"+row.inv_id+"')\">删除</a>";
		}
		 
		$(document).ready(function () {
			get_dictionary("${context}",null);			
			$('#commit').on('click', function () {
				var inv_ids_money= $.map($table_pull_in.bootstrapTable('getData'), function (row) {
	                return {'inv_id':row.inv_id,'fh_money':row.can_sw_money};
	            });
				if(inv_ids_money.length!=0) {
					ajax_function_ask_and_close_json_data("确认引入？","pullFinanceFhshItem","post",JSON.stringify(inv_ids_money),'引入成功');  // 这种采用json放在requestbody里面上传的模式
				} else {
					layer.msg("未选择明细！");
				}
			});			
			//bootstrap初始化
			initialize_table($table_result,"",${tableHeader_result},queryParams_result,"",500);
			$table_result.bootstrapTable('refreshOptions',{
				rowStyle: function (row, index) {
		             //var style = "";             
		             //    style='danger'; 
		             var style = {};
		             if(row.is_red==1)
	                 	style={css:{'background':'pink'}};
		             return style;
		         } 
			});
			
			initialize_table_simple($table_pull_in,"",${tableHeader_pull_in},queryParams_pull_in,350);
			$("#search_pull_items").on('click', function () {
				$table_result.bootstrapTable('refreshOptions',{url: 'getFinanceFhshPullList'});
			});
			
			$("#cancel_pull_in").on('click', function () {
				$table_pull_in.bootstrapTable('removeAll');
			});
			
			$("#select_in").on('click', function () {
				var has_all_pull_in=true;
				$.each($('#table_result').bootstrapTable('getSelections'),function(index,result_row){
					var has_pull=false;					
					$.each($('#table_pull_in').bootstrapTable('getData'),function(index,row){
					 	if(row.inv_id==result_row.inv_id){
					 		has_pull=true;
					 		has_all_pull_in=false;
					 	}
				 	});
					if(!has_pull)
						$table_pull_in.bootstrapTable('append',result_row);				
				});
				if(!has_all_pull_in) {
					layer.msg("有明细已经添加！");
				}
			});
			
			//自动搜索填补
			initialize_bsSuggest_all_type_factory("${context}");
	     });
	</script>
</html>