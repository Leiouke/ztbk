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
	    <link rel="stylesheet" type="text/css" href="${context}/css/plugins/webuploader/webuploader.css">
	    <link href="${context}/css/boocup_style.css" rel="stylesheet">
	    <!-- Bootstrap table -->
	    <link href="${context}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="sonpage-body">
			<div class="col-md-12">
			   <form id="form" class="form-inline">			        
	            	<div class="row">
	            		<div class="form-group small-space col-xs-4">
				        	<label >刊号：</label>
				        	<input type="text" name="mail_code" id = "mail_code" readonly>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >条码：</label>
				        	<input type="text" name="qk_issn" id = "qk_issn" readonly>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >刊名：</label>
				        	<input type="text" name="qk_name" id = "qk_name" readonly>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<input type="text" name="qk_id" id = "qk_id" style="display:none">
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<input type="text" name="inc_no" id = "inc_no" style="display:none">
				        </div>
					</div>
					<div class="row">
						<div class="form-group small-space col-xs-4">
							<label >客户编号：</label>
							<input type="text" name="c_id" id = "c_id"  readonly>
							<div class="input-group-btn">
	                        	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                           		<span class="caret"></span>
	                            </button>
	                             <ul class="dropdown-menu dropdown-menu-right" role="menu"></ul>
	                         </div>
						 </div>
						<div class="form-group small-space col-xs-4">
							<label >户号(_客户名称)：</label>
							<input type="text" name="c_name" id = "c_name" disabled>
						</div>
					</div>	
					<div class="row">
				       <div class="form-group small-space col-xs-4">
					    <label >供应商ID：</label>
					    <input type="text" name="f_id" id = "f_id" readonly>
					    <div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu" style="margin-left:580px"></ul>
	                    </div>
					  </div>
					  <div class="form-group small-space col-xs-4">
					    <label >供应商名称：</label>
					    <input type="text" name="f_name" id = "f_name" disabled>
					  </div>
					</div>	
					<div class="row">
						<div class="form-group small-space col-xs-4">
				            <label >订阅开始日期：</label>
							<input name="period_start" id="period_start" type="text" class="form-control search-items layer-date" style = "width:68%;background-color: #FFE4E1;">
				        </div>
				        <div class="form-group small-space col-xs-4">
				            <label >订阅截止日期：</label>
							<input name="period_end" id="period_end" type="text" class="form-control search-items layer-date" style = "width:68%;background-color: #FFE4E1;">
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >数量：</label>
				        	<input type="text" name="h_amount" id = "h_amount" style = "background-color: #FFE4E1;">
				        </div>
					</div>	
					<div class="row">
				        <div class="form-group small-space col-xs-4">
				        	<label >折扣：</label>
				        	<input type="text" name="h_discount" id = "h_discount">
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >价格：</label>
				        	<input type="text" name="h_price" id = "h_price">
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >销售价：</label>
				        	<input type="text" name="real_money" id = "real_money">
				        </div>
				        <input type="hidden" name="total_money" id = "total_money" style = "background:#f5f5f5" readonly>
					</div>    
					<div class="row">
				        <div class="form-group middle-space col-xs-8">
							<label >备注：</label>
							<input type="text" name="memo">
						</div>
					</div>
		       </form>
			 </div>
<!-- 			 <div class="ibox-content" style="padding-bottom:0px"> -->
<!--                 <div class="row row-lg">                     -->
<!--                     <div class="col-sm-12"> -->
<!--                                 <div class="btn-group hidden-xs" id="tableTool" role="group"> -->
<!--                                     <button type="button" class="btn btn-outline btn-default" id="config"> -->
<!--                                         <i class="glyphicon glyphicon-cog" aria-hidden="true"></i> -->
<!--                                     </button> -->
<!--                                     <select class="form-control" > -->
<!--                                    		<option value="all">导出全部</option> -->
<!-- 						                <option value="basic">导出当页</option>	 -->
<!-- 						            </select> -->
<!--                                 </div> -->
<!--                                 <table id="table" data-mobile-responsive="true"> -->
                                    
<!--                                 </table> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
		</div>
		<div class="sonpage-footer">
	        <button id="save" class="btn btn-primary" type="button">保存</button>
	        <button id="cancel" class="btn btn-white" type="button">取消</button>
		</div>
	</body>
	<!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Bootstrap table export-->
    <script src="${context}/js/plugins/bootstrap-table/export/bootstrap-table-export.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/tableExport.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/js-xlsx/xlsx.core.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.min.js"></script>
    <script src="${context}/js/plugins/bootstrap-table/export/jsPDF/jspdf.plugin.autotable.js"></script>
    
	<script src="${context}/js/common/common.js"></script>
	<script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script src="${context}/js/plugins/webuploader/webuploader.min.js"></script>
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script> 
    <!--<script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>-->
    <!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<script type="text/javascript">
	var $table = $('#table');
    function queryParams(param) {
		var json_obj={};
		json_obj['limit'] =param.limit;
	      	json_obj['offset'] =param.offset;
	     	json_obj['sortName'] =this.sortName;
	  		json_obj['sortOrder'] =this.sortOrder;
	  	if($('#mail_code').val()!=null&&$('#mail_code').val()!=""){
		   json_obj['mail_code'] =$('#mail_code').val();
	   }
	   if($('#qk_issn').val()!=null&&$('#qk_issn').val()!=""){
		   json_obj['qk_issn'] =$('#qk_issn').val();
	   }
	   if($('#qk_name').val()!=null&&$('#qk_name').val()!=""){
		   json_obj['qk_name'] =$('#qk_name').val();
	   }
	        return json_obj;
	}
	
	
		$(document).ready(function () {
			
// 			$(".layer-date").each(function(){
// 				inistal_one_data('#'+$(this).attr('id'));
// 			});

			inistal_data('#period_start','#period_end');
			
			
			$('#save').on('click', function () {
				if(!has_null($('#form')))
					ajax_function("editQkZdItem","post",$('#form').serialize(),'保存成功');		
			 });

			var zd_item = JSON.parse('${oneJson}');
			
			//加载字典数据
			get_dictionary("${context}", zd_item);
			
			//填写已有数据
			set_one_info($("#form"), zd_item);
			
			//自动搜索填补
			initialize_bsSuggest_bk_factory("${context}", "f_name", "f_id");
			initialize_bsSuggest_bk_client("${context}", "c_name", "c_id");
			
// 			// 动态内容支持（事件委托）
// 			  $('table').on('change', 'input[type="checkbox"]', function() {
				  
// 				  //选中取消其他的选择框，保持表格为单选
// 				  $('table input[type="checkbox"]').not(this).prop('checked', false);
				  
// 				  const $row = $(this).closest('tr');
// 				  const rowIndex = $row.index();
// 				  const allData = $table.bootstrapTable('getData');
// 				  // 假设你要获取第2行（索引从0开始）
// 				  const rowData = allData[rowIndex];
// 				  if(rowData.checkStatus==1){
//				  $('#f_id').val(rowData.f_id);
// 		          	  $('#f_department').val(rowData.f_department);
// 		          	  $('#h_discount').val(rowData.h_discount_qk);
// 		          	  $('#mail_code').val(rowData.mail_code);
// 		          	  $('#qk_issn').val(rowData.qk_issn);
// 		          	  $('#qk_name').val(rowData.qk_name);
// 				  }else{
// 					  $('#f_id').val("");
// 		          	  $('#f_department').val("");
// 		          	  $('#h_discount').val("");
// 		          	  $('#mail_code').val("");
// 		          	  $('#qk_issn').val("");
// 		          	  $('#qk_name').val("");
// 				  }
// 			  });
		});
// 		// 绑定回车事件(自动填充供应商和商品名)
// 		  $('#mail_code, #qk_issn, #qk_name').on('keydown', function(e) {
// 		    if (e.which === 13) { // 13 是回车键的 keyCode
// 		      e.preventDefault();
// 		      getProductDetail();
// 		    }
// 		  });
		    
// 		   function getProductDetail(){
// 			   var json_obj_data={};
// 			   if($('#mail_code').val()!=null&&$('#mail_code').val()!=""){
// 				   json_obj_data['mail_code'] =$('#mail_code').val();
// 			   }
// 			   if($('#qk_issn').val()!=null&&$('#qk_issn').val()!=""){
// 				   json_obj_data['qk_issn'] =$('#qk_issn').val();
// 			   }
// 			   if($('#qk_name').val()!=null&&$('#qk_name').val()!=""){
// 				   json_obj_data['qk_name'] =$('#qk_name').val();
// 			   }
// 			   $('#f_id').val("");
//        	   $('#f_department').val("");
       	   
// 			   $.ajax({
// 			          type: "post",
// 			          contentType: "application/json",          // 明确指定请求体格式
// 			          url: "${context}/bk/basic/getProductList",
// 			          data: JSON.stringify(json_obj_data),
// 			          dataType: 'JSON',
// 			          success: function (data) {
// 			          	if(data.total==0){
// 			          		alert("编号未搜索到商品，请检查编号");
// 			          	}else if(data.total==1){
// 			          		$('#f_id').val(data.rows[0].f_id);
// 			          		$('#f_department').val(data.rows[0].f_department);
// 			          		$('#mail_code').val(data.rows[0].mail_code);
// 			          		$('#qk_name').val(data.rows[0].qk_name);
// 			          		$('#qk_issn').val(data.rows[0].qk_issn);
// 			          		alert("商品资料已填充");
// 			          	}else if(data.total>1){
// 			          		open_layer(2,"选择明细","qkZdItemSelect",['1200px', '800px'],false);
// 			          	}
// 			          },
// 			          error: function (data) {
// 			          	console.log(data);
// 			          }
// 			      });	
// 		    }
		   
		   
			// 绑定回车事件(自动填充商品价格)
			  $('#period_start, #period_end, #h_amount').on('keydown', function(e) {
			    if (e.which === 13) { // 13 是回车键的 keyCode
			      e.preventDefault();
			      getProductPrice();
			    }
			  });
		   
			  function getProductPrice(){
				  var allValid = true;  //为空标识（true默认不为空）
				  $('#period_start, #period_end, #h_amount').each(function() {  
				    if ($(this).val() == null || $(this).val() == '') {  
				      allValid = false;  //(有空值变为false)
				      return false; // 跳出循环  
				    }  
				  });  
				    
				  if (allValid) {
					  var json_obj_data={};
					  json_obj_data['qk_id'] =$('#qk_id').val();
					  json_obj_data['cf_id'] =$('#c_id').val();
					  json_obj_data['start_date'] =$('#period_start').val();
					  json_obj_data['end_date'] =$('#period_end').val();
					  $.ajax({
				          type: "post",
				          contentType: "application/json",          // 明确指定请求体格式
				          url: "getQkZdItemPrice",
				          data: JSON.stringify(json_obj_data),
				          dataType: 'JSON',
				          success: function (data) {
				        	  var h_amount= $('#h_amount').val();
				        	  $('#h_price').val(data);
				        	  $('#h_discount').val(1);
				        	  $('#real_money').val(data*1*h_amount);
				        	  $('#total_money').val(data*1*h_amount);
				          },
				          error: function (data) {
				          	console.log(data);
				          }
				      });	
				  }else{
					  alert("有必填项为空");
				  }
			  }
			  
		   //动态计算价格
// 		$('#h_amount, #h_discount, #h_price').change(function () {
// 			var amount = $('#h_amount').val();
// 			var discount = $('#h_discount').val();
// 			var price = $('#h_price').val();
				  
// 			$('#total_money').val(discount*price*amount);
// 		});
		   
		$('#h_amount, #h_discount, #h_price').on('input', function() {
			  var amount = $('#h_amount').val();
			  var discount = $('#h_discount').val();
			  var price = $('#h_price').val();
			  
			  $('#real_money').val(discount*price*amount);
			  $('#total_money').val(price*amount);
      });
	</script>
</html>