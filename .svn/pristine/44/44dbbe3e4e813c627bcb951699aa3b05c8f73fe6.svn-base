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
					  <div class="row" style="margin-bottom:5px">
					  		  <div class="form-group inline-small">
								  <label >代销预估单号(多个)：</label>
								  <textarea rows="3" cols="15" name="ap_ids" class="form-control search-items"></textarea>
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
            		<button type="button" class="btn btn-success" id="commit">提交引入</button>
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
		
		function queryParams_result(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	  		json_obj['f_id'] = '${param.f_id}';
   	        return json_obj;
		} 

		 $(document).ready(function () {
			//加载字典数据
			get_dictionary("${context}",null);			
			$('#commit').on('click', function () {
				var so_ids_money= $.map($table_result.bootstrapTable('getSelections'), function (row) {
	                return {'fh_id':'${param.fh_id}','ap_id':row.ap_id, 'against_money':row.advance_money, 'rmb_against_money':row.rmb_advance_money};
	            });
				if(so_ids_money.length!=0) {
					ajax_function_ask_and_close_json_data("确认引入？","pullFhshAgentAgaintItem","post",JSON.stringify(so_ids_money),'引入成功');
				} else {
					layer.msg("未选择明细！");
				}
			});
			//bootstrap初始化
			initialize_table($table_result,"",${tableHeader},queryParams_result,"",600);

			$("#search_pull_items").on('click', function () {
				$table_result.bootstrapTable('refreshOptions',{url: 'getFhshAgentAgaintItemPullList'});
			});
	     });
	</script>
</html>