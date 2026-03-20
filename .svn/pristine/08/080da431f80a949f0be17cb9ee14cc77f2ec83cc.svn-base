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
	<div class="sonpage-body">
			<div class="col-md-12" style = "top:50%;">
			   <form id="form" class="form-inline">
					<div class="col-xs-12">
						<div class="form-group middle-space-long-label col-xs-12">
			            	<label>处理时间：</label>
			           		<input type="text" id="process_time" name="process_time" class="search-items layer-date">
			        	</div>
			        </div>
			        <div class="col-xs-12">
			        	<div class="form-group middle-space-long-label col-xs-12">
							<label>备注：</label>
							<textarea rows="8" cols="50" name="process_memo" id = "process_memo"></textarea>
						</div>
						<div class="form-group inline-large" style="display:none">
				           	<label>费用编号：</label>
				         	<input type="text" id="fe_id" name="fe_id" class="search-items">
				        </div>
					</div>
		       </form>
			 </div>
			  <div class="search-group-button">
				<button id="deal" class="btn btn-danger" type="button" style="display:block;margin:0 auto">提交</button>
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
	function queryParams(param) {
		var json_obj=formToJson($("#form"));
		json_obj['limit'] =param.limit;
	      	json_obj['offset'] =param.offset;
	     	json_obj['sortName'] =this.sortName;
	  		json_obj['sortOrder'] =this.sortOrder;
	  		json_obj['sortOrder'] =this.sortOrder;
	        return json_obj;
	}
	
	//获得填充数据
	 var user=JSON.parse('${oneJson}');
	
	//填充数据
	set_one_info($("#form"),user);
	
	$(document).ready(function () {
		
		if(user.is_rebate == 1){//先处理抵扣
			$('#process_memo').val("保证金已抵扣");
		}else if(user.fee_type == 0){//保证金
			if(user.main_fe_id == null){//非归还
				$('#process_memo').val("保证金支付已处理");
			}else{
				$('#process_memo').val("保证金归还已处理");
			}
		}else if(user.fee_type == 2){//质保金
			if(user.main_fe_id == null){//非归还
				$('#process_memo').val("质保金支付已处理");
			}else{
				$('#process_memo').val("质保金归还已处理");
			}
		}else if(user.fee_type == 1){
			$('#process_memo').val("中标服务费支付已处理");
		}
		
		//加载时间控件
		 $(".layer-date").each(function(){
				inistal_one_data('#'+$(this).attr('id'));
			});
		
		//处理按钮
		$('#deal').on('click', function () {
			ajax_function_ask_and_close("确认是否提交处理结果","toFeeProcess","post",$('#form').serialize(),'提交处理成功');
		 });
	});
	</script>
</html>