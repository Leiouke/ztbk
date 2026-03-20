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
		
		<script type="text/javascript">
		</script>
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
	            <div class="col-xs-10">
				    <div class="form-group inline-small">
					    <label >刊号：</label>
					    <input type="text" id="mail_code" name="mail_code" class="form-control search-items" >
					 </div>		  
					  <div class="form-group inline-small">
					    <label>刊名：</label>
					    <input type="text" id="qk_name" name="qk_name" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label>本期条码：</label>
					    <input type="text" id="instance_tm" name="instance_tm" class="form-control search-items" >
					  </div>
			   		  <div class="form-group inline-small">
					    <label>配送时间：</label>
			           	<input type="text" id="ps_time_start" name="ps_time_start" class="form-control search-items layer-date">
			           	-
			           	<input type="text" id="ps_time_end" name="ps_time_end" class="form-control search-items layer-date">
					 </div>
					 <div class="form-group inline-small">
					    <label>站点：</label>
					    <select name="station_id" id="station_id" class="form-control search-items">
					    	<option></option>
					    	<option value = "ZT02">报刊站点</option>
					    	<option value = "ZT51">代销站点</option>
					    </select>
					  </div>
				 </div>
				 <div class="col-xs-2 search-group-button">
					  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
					  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>补刊商品查询</h5>
<!--                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!--                 <a class="group">分组管理</a> -->
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-wrench"></i>
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
                    	<table id="table" data-height="400" data-mobile-responsive="true">
                                    
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
    <!-- comment-->
    <script src="${context}/js/common/common.js"></script>
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
	
	function colsethis(){
		var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
	}
	
	var date = new Date();
	$('#ps_time_start').val(date.getFullYear()+"-"+(date.getMonth()-1)+"-"+date.getDate());
	$('#ps_time_end').val(date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate());
	
	$(document).ready(function () {
		
		//加载时间控件
		$(".layer-date").each(function(){
			inistal_one_data('#'+$(this).attr('id'));
		});
			
		//bootstrap初始化
		initialize_table($table,"getPeriodicalItemList",${tableHeader},queryParams,"#tableTool",400);
		
		//表格配置 layer
		var $config=$("#config");
		
		table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
		
		 $('#tableTool').find('select').change(function () {				 
			 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
	     });
			
		//点击search查询
		$("#search").on('click',function(){
// 			console.log($table.html());
			var json_data_list=formToJson($("#form_search"));
			json_data_list['queryId']='${queryId}';
			search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getPeriodicalItemList",$('#table'));
		});

	 });
	
	function renderOperator(value,row,index){
		//处理带有一撇的英文名称
		var qk_name = String(row.qk_name).replace(/\'/g, "\\'");
		var str="<a onclick=\"toFile('"+row.mail_code+"','"+row.instance_tm+"','"+row.qk_id+"','"+qk_name+"','"+row.period_name+"')\">选择</a>";
		return str;
	 }
	
	
	//跳转进度状态页面
	function toFile(mail_code,instance_tm,qk_id,qk_name,period_name){
		var mail_code_instead = encodeURIComponent(mail_code);
		var instance_tm_instead = encodeURIComponent(instance_tm);
		var qk_id_instead = encodeURIComponent(qk_id);
		var qk_name_instead = encodeURIComponent(String(qk_name).replace(/\'/g, "\\'"));
		var period_name_instead = encodeURIComponent(period_name);
		open_layer_refresh(2,'补刊详情填写','toPeriodicalItemFile?mail_code=' +mail_code_instead+'&instance_tm='+instance_tm_instead+'&qk_id='+qk_id_instead+'&qk_name='+qk_name_instead+'&period_name='+period_name_instead,$table,['800px', '500px'],false);
	 }
		  
	</script>
</html>