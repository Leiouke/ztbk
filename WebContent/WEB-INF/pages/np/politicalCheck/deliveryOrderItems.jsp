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
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-editable.css" rel="stylesheet">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <jsp:include page="../../include/h_superHead.jsp"></jsp:include>
	    <!-- 选中行背景色设置 -->
	    <style type="text/css">  
	    	.fixed-table-container tbody .selected td {
				background-color: #33ccff
			}
			.table td {
	  			padding: 8px;
	  			line-height: 20px;
	  			text-align: left;
	  			vertical-align: top;
	  			border-top: 5px solid #ffffff;
	  			color:black;
	  			background:#FFFFE0;
	  			font-family: verdana, 'Times New Roman','Arial Black', Tahoma;
	  			/*font-weight:bold;*/
			}
			.table-hover tbody tr:hover > td,
			.table-hover tbody tr:hover > th {
	  			background-color: #FF6699;
			}
	    </style>
	</head>
	<body>
	<!-- <div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>报表明细列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div> -->
            <div class="ibox-content search-content">
	            <form id="form_search" class="form-inline">
	            <div class="col-xs-11">
	            	  <div class="form-group inline-small">
					  	<label >到货单号：</label>
					    <input type="text" name="qk_dh_id" class="form-control" value="${param.qk_dh_id}" disabled>
					  </div>
					  <div class="form-group inline-small">
					  	<label >刊名：</label>
					    <input type="text" name="qk_name" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					  	<label >货源名称：</label>
					    <input type="text" name="f_department" class="form-control search-items" >
					  </div>
					  <div class="form-group inline-small">
					    <label >一审100%：</label>
					    <select name="first_complete" class="form-control dictionary search-items isboolean" >
					    	<option value=""></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >二审100%：</label>
					    <select name="second_complete" class="form-control dictionary search-items isboolean" >
					    	<option value=""></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					    <label >三审100%：</label>
					    <select name="third_complete" class="form-control dictionary search-items isboolean" >
					    	<option value=""></option>
					    </select>
					  </div>
					  <div class="form-group inline-small">
					  	<label >条码</label>
					    <input type="text" name="isbn" class="form-control search-items" >
					  </div>
				 </div>
				 <div class="col-xs-1 search-group-button">
					  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
					  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
				 </div>
				</form>
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
        <!-- </div>
    </div> -->
    
    <div class="sonpage-footer">
		<button id="batchCheckPass" class="btn btn-success" type="button">批量审读通过</button>	                  
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
    <!-- Bootstrap table editable-->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-editable.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-editable.js"></script>
    
    <!-- Layer-->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">			
		var $table = $('#table');
		
		function queryParams(param) {
			var json_obj=formToJson($("#form_search"));
			json_obj['limit'] =param.limit;
   	      	json_obj['offset'] =param.offset;
   	     	json_obj['sortName'] =this.sortName;
   	  		json_obj['sortOrder'] =this.sortOrder;
   	  		json_obj['qk_dh_id'] ='${param.qk_dh_id}';
   	        return json_obj;
		}
		
		load_sum_list_first("${context}/csu/getTableCollectData",{'queryId':'${queryId}'});
		$(document).ready(function () {			
			//加载字典数据
			get_dictionary("${context}",null);
			//bootstrap初始化(方法重写，加入高亮显示)
			initialize_table($table,"getDeliveryOrderItemsList",${tableHeader},queryParams,"#tableTool",600,rowStyle);
			
			//表格配置 layer
			var $config=$("#config");
			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{
					 exportDataType: $(this).val()
				 });
		    });
			
			$("#search").on('click',function(){
				 var json_data_list=formToJson($("#form_search"));
				 json_data_list['queryId']='${queryId}';
				 json_data_list['qk_dh_id'] ='${param.qk_dh_id}';
				 search_sum_list("${context}/csu/getTableCollectData",json_data_list,"getDeliveryOrderItemsList",$('#table'));
			});
	    });
		
		function toPoliticalCheck(qk_dh_id, ItemExclusiveCode) {
			open_layer_refresh(2,'审读','itemPoliticalCheck?qk_dh_id=' + qk_dh_id + '&ItemExclusiveCode=' + ItemExclusiveCode,$table,['750px', '500px'],true);
		}
		
		function toConsult(mail_code, instance_tm) {
			open_layer(2,'审读参考','politicalCheckItemConsult?mail_code=' + mail_code + '&instance_tm=' + instance_tm,['1000px', '500px'],false);
		}
		
		function toDelay(ItemExclusiveCode) {
			open_layer_refresh(2,'审读缓发','politicalCheckDelayManage?ItemExclusiveCode=' + ItemExclusiveCode,$table,['1000px', '500px'],true);
		}
		
		function toGoback(ItemExclusiveCode) {
			ajax_function_ask_and_refresh("确定退回一审重审？","gobackPoliticalCheckItem","post",{'ItemExclusiveCode':ItemExclusiveCode},"退回成功！",$table);
		}
		
		function renderOperator(value,row,index) {
			var str="";
			str += "<a onclick=\"toPoliticalCheck('" + row.qk_dh_id + "','" + row.ItemExclusiveCode + "')\">审读</a> ";
			str += "<a onclick=\"toConsult('"+row.mail_code+"','" + row.instance_tm + "')\">审读参考</a> ";
			str += "<a onclick=\"toDelay('"+row.ItemExclusiveCode+"')\">审读缓发</a> ";
			str += "<a onclick=\"toGoback('"+row.ItemExclusiveCode+"')\">退回待一审</a> ";
			return str;
		}
		
		$("#batchCheckPass").on('click',function() {
			// 代销source_type为01
			var item_ids= $.map($table.bootstrapTable('getSelections'), function (row) {
                return {'qk_dh_id':row.qk_dh_id,'ItemExclusiveCode':row.ItemExclusiveCode, 'zs_pop':row.zs_pop, 'zs1_result':1};
            });
			
			if(item_ids.length != 0) {
				//ajax_function_ask_and_close_json_data("确认引入?","importDeliveryOrder","post",JSON.stringify(item_ids),"引入完成!");
				
				ajax_function_ask_and_refresh_postdata("确认批量审读通过?","batchPoliticalCheckPass","post",JSON.stringify(item_ids),"批量审读完成！",$table)
				
				// 点了之后 按钮让他灰一段时间, 设定3秒, 保证不会连续提交
				$("#batchCheckPass").attr("disabled", true);
				setTimeout(function() {
					$("#batchCheckPass").attr("disabled", false);
				}, 3000);
			} else {
				layer.msg("未选择明细！");
			}
		});
		
		//重写加载方法，使其有不通过的能高亮显示
		function initialize_table($table,url,columns_config,queryParams,toolbar,height,rowStyle){
			$table.bootstrapTable({
			      url: url,
			      method:'post',
			      pagination: true,
			      showRefresh: true,
			      showColumns: true,
			      showExport:true,
			      sortable:true,
			      showFooter:true,
			      sidePagination : "server", // 服务端处理分页 
			      iconSize: 'outline',
			      toolbar: toolbar,
			      exportDataType:'all',
			      queryParams: queryParams,
			      pageSize:200,
			      height:height,
			      pageList:[200, 500, 5000],
			      columns: columns_config,
			      rowStyle: rowStyle,
			      icons: {
			        refresh: 'glyphicon-repeat',
			        toggle: 'glyphicon-list-alt',
			        columns: 'glyphicon-list'
			      },
		          onCheck:function(row){
		          	var num=calculate_select($table);
		          	$("#checkbox_num").html(num);
		            },
		          onUncheck:function(row){
		          	var num=calculate_select($table);
		          	$("#checkbox_num").html(num);
		          },
		          onCheckAll:function(row){
		          	var num=calculate_select($table);
		          	$("#checkbox_num").html(num);
		          },
		          onUncheckAll:function(row){
		          	var num=calculate_select($table);
		          	$("#checkbox_num").html(num);
		          }
			    });
		}
		//政审有不通过的高亮显示的方法
		function rowStyle(row, index) {
		    var style = {};
		    //以前有不及格记录或本次一审不通过
			if(row.no_pass_mark == 1 || row.zs1_result ==2){
				style = {css:{'background-color':'#ed5565'}};
			//以前有及格记录且没有不及格记录且一审进度为0%且条码不为空的
			} else if(row.pass_mark == 1 && row.no_pass_mark == 0 && row.no_pass_mark2 == 0 && (row.zs1_result == null || row.zs1_result == "") && row.instance_tm != null && row.instance_tm != "" ){
				style = {css:{'background-color':'#D7E4BC'}};
			}
		    return style;
		}
	</script>
</html>