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
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">	
	</head>
	<body>
	<div class="wrapper wrapper-content animated fadeInRight">
         <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>查询：</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content search-content">
	            <form id="form_search" class="form-inline">
	            	<div class="col-xs-9">
						<div class="form-group inline-middle not-null">	
							<label >收订单号(必填)</label>
						    <input type="text" name="zd_id" id = "zd_id" class="form-control search-items">
						</div>
<!-- 						<div class="form-group inline-small"> -->
<!-- 			            	<label>操作开始时间：</label> -->
<!-- 			           		<input type="text" id="start_date" name="start_date" class="form-control search-items layer-date"> -->
<!-- 			        	</div> -->
<!-- 			        	<div class="form-group inline-small"> -->
<!-- 			            	<label>操作结束时间：</label> -->
<!-- 			           		<input type="text" id="end_date" name="end_date" class="form-control search-items layer-date"> -->
<!-- 			        	</div> -->
			         </div>
			         <div class="col-xs-3">
			         	<div class="form-group inline-small">
			         		<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
			         		<button id="cancel" class="btn btn-primary btn-xs" type="button">取消锁定</button>
			            </div>
			         </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>锁定查询</h5>
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
<!--                             <button type="button" class="btn btn-outline btn-default" id="add"> -->
<!--                                <i class="glyphicon glyphicon-plus" aria-hidden="true"></i> -->
<!--                             </button> -->
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
	  		//console.log(json_obj)
	        return json_obj;
	}
		
	$(document).ready(function () {
		
		//加载时间控件
		 $(".layer-date").each(function(){
				inistal_one_data('#'+$(this).attr('id'));
			});
			
		//bootstrap初始化
		initialize_table($table,"getCancelLockQueryList",${tableHeader},queryParams,"#tableTool",400);
        
		
      	//查询按钮
		$("#search").on('click',function(){
			if(!has_null($("#form_search"))){
				var json_data_list = {};
				 json_data_list['queryId']='${queryId}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getCancelLockQueryList",$('#table'));
			}
		 });
			
			
		$('#cancel').on('click', function () {
			if(!has_null($("#form_search"))){
				ajax_function_ask_and_close("确认取消锁定？","getLockCancel","post",$("#form_search").serialize(),"取消锁定完成！");
			}
		});
			
	});
	</script>
</html>