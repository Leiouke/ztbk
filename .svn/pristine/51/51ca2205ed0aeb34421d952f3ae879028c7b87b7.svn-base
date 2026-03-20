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
				        	<label >期刊编号：</label>
				        	<input type="text" name="qk_id" value = '${qk_id}' style = "background-color: #e9ecef;" readonly>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >期刊名称：</label>
				        	<input type="text" name="qk_name" value = '${qk_name}' style = "background-color: #e9ecef;" readonly>
				        </div>
				        <div class="form-group small-space col-xs-4 not-null">
				        	<label >商品币种：</label>
				        	<select name="currency_id" id = "currency_id" class="dictionary" >
								<option></option>
							</select>
				        </div>
					</div>	
					<div class="row">
						<div class="form-group small-space col-xs-4 not-null">
				        	<label >价格：</label>
				        	<input type="text" name="qk_price" >
				      	</div>
				        <div class="form-group small-space col-xs-4 not-null">
				        	<label >价格类别：</label>
				        	<select name="price_class" id = "price_class" class="dictionary" >
								<option></option>
							</select>
				        </div>
						<div class="form-group small-space col-xs-4 not-null">
				        	<label >折扣：</label>
				        	<input type="text" name="h_discount">
				      	</div>
<!-- 				        <div class="form-group small-space col-xs-4"> -->
<!-- 				        	<label >qk_price1：</label> -->
<!-- 				        	<input type="text" name="qk_price1" > -->
<!-- 				        </div> -->
					</div>
					<div class="row">
						<div class="form-group small-space col-xs-4">
							<label >客户编号：</label>
							<input type="text" name="c_id" id = "c_id">
							<div class="input-group-btn">
	                        	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                           		<span class="caret"></span>
	                            </button>
	                             <ul class="dropdown-menu dropdown-menu-right" role="menu" style="margin-left:580px"></ul>
	                         </div>
						 </div>
						<div class="form-group small-space col-xs-4">
							<label >户号(_客户名称)：</label>
							<input type="text" name="c_department" id = "c_department" disabled>
						</div>
						<div class="form-group small-space col-xs-4 not-null">
				            <label >开始日期：</label>
							<input name="start_date" id="start_date" type="text" class="form-control layer-date" style ="width:68%;">
				        </div>
					</div>
					<div class="row">
				       <div class="form-group small-space col-xs-4">
					    <label >供应商ID：</label>
					    <input type="text" name="f_id" id = "f_id">
					    <div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu" style="margin-left:580px"></ul>
	                    </div>
					  </div>
					  <div class="form-group small-space col-xs-4">
					    <label >供应商名称：</label>
					    <input type="text" name="f_department" id = "f_department" disabled>
					  </div>
					  <div class="form-group small-space col-xs-4 not-null">
				            <label >结束日期：</label>
							<input name="end_date" id="end_date" type="text" class="form-control layer-date" style ="width:68%;">
				        </div>
					</div>
					<div class="row">
				        <div class="form-group small-space col-xs-4" style="display:none">
				        	<label >cf_id：</label>
				        	<input type="text" name="cf_id" id = "cf_id">
				        </div>
					</div>
					<div class="row">
							<div class="form-group small-space col-xs-4">
								<label >备注：</label>
								<input type="text" name="memo">
							</div>
<!-- 	            		<div class="form-group small-space col-xs-4"> -->
<!-- 				        	<label >other_fee1：</label> -->
<!-- 				        	<input type="text" name="other_fee1"> -->
<!-- 				        </div> -->
<!-- 				        <div class="form-group small-space col-xs-4"> -->
<!-- 				        	<label >other_fee2：</label> -->
<!-- 				        	<input type="text" name="other_fee2" > -->
<!-- 				      	</div> -->
					</div>	
		       </form>
			 </div>
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
    <!-- <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>--> 
    <script src="${context}/js/plugins/layer/laydate-new/laydate.js"></script>
    <!-- plugins -->
 	<script src="${context}/js/plugins/suggest/bootstrap-suggest-new.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			
			$(".layer-date").each(function(){
				inistal_one_data('#'+$(this).attr('id'));
			});
			
			//加载字典数据
			get_dictionary("${context}",null);
			
			//自动搜索填补
			initialize_bsSuggest_bk_factory("${context}", "f_department", "f_id");
			initialize_bsSuggest_bk_client("${context}", "c_department", "c_id");
			
			$('#save').on('click', function () {
				if(!has_null($('#form'))){
					if($('#c_department').val()!=null&&$('#c_department').val()!=""){
						$('#cf_id').val($('#c_id').val());
					}else if($('#f_department').val()!=null&&$('#f_department').val()!=""){
						$('#cf_id').val($('#f_id').val());
					}else{
						$('#cf_id').val("ALL");
					}
					ajax_function("addProductPrice","post",$('#form').serialize(),'新增成功');		
				}
			 });
			
			//客户搜索（带自动填充数据）
			function initialize_bsSuggest_bk_client(context, input_name, input_id){
				initialize_bsSuggest($("input[name='"+input_id+"']"),context+"/bk/basic/getClientAutoSearch?keyword=","c_department","c_id",{c_id: "客户编号",c_department:"户号_客户名称"},["c_id","c_department"],false,bsSuggest_data_process_bk_client,null);
				$("input[name='"+input_id+"']")
			    .on('onSetSelectValue', function (e, keyword) {
			        $("input[name='"+input_name+"']").val(keyword['id']);
			        $('#f_id').val("");
			        $('#f_department').val("");
			  }).on('onUnsetSelectValue', function (e) {
				  $("input[name='"+input_name+"']").val('');
			  }).on('keyup',function(){
				  if($(this).val()==""){
					  $("input[name='"+input_name+"']").val('');
				  }
			  });
			}
			
			//报刊供应商信息补全
			function initialize_bsSuggest_bk_factory(context, input_name, input_id){
				initialize_bsSuggest($("input[name='"+input_id+"']"),context+"/bk/basic/getFactoryAutoSearch?keyword=","f_department","f_id",{f_id: "客户编号",f_department:"户号_客户名称"},["f_id","f_department"],false,bsSuggest_data_process_bk_factory,null);
				$("input[name='"+input_id+"']")
			    .on('onSetSelectValue', function (e, keyword) {
			        $("input[name='"+input_name+"']").val(keyword['id']);
			        $('#c_id').val("");
			        $('#c_department').val("");
			  }).on('onUnsetSelectValue', function (e) {
				  $("input[name='"+input_name+"']").val('');
			  }).on('keyup',function(){
				  if($(this).val()==""){
					  $("input[name='"+input_name+"']").val('');
				  }
			  });
			}
		});
	</script>
</html>