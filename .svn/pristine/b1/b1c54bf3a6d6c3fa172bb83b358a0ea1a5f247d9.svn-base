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
				        	<label >条码：</label>
				        	<input type="text" name="qk_issn" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >自定义类：</label>
							<select name="subclasses" class = "dictionary">
								<option></option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >属性：</label>
				        	<select name="qk_attribute" class = "dictionary">
								<option></option>
							</select>
				        </div>
					</div>
					<div class="row">
						<div class="form-group small-space col-xs-4">
				        	<label >报刊类别：</label>
				        	<select name="qk_tye" class = "dictionary">
								<option></option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >刊号：</label>
				        	<input type="text" name="mail_code" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >报刊代号：</label>
				        	<input type="text" name="f_mail_code" >
				        </div>
					</div>	
					<div class="row">
				        <div class="form-group small-space col-xs-4">
				        	<label >报刊名称：</label>
				        	<input type="text" name="qk_name" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >译名：</label>
				        	<input type="text" name="qk_name_Foreign" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >是否标识：</label>
				        	<select name="qk_zj_flag" class = "dictionary">
								<option></option>
							</select>
				        </div>
					</div>		    	    
					<div class="row">
						<div class="form-group small-space col-xs-4">
				        	<label >报刊简称：</label>
				        	<input type="text" name="qk_name_simple" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >自进数：</label>
				        	<input type="text" name="h_amount" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >出版社：</label>
				        	<input type="text" name="pub_id" >
				        </div>
					</div>	 
					<div class="row">
						<div class="form-group small-space col-xs-4">
				            <label >停刊日期：</label>
							<input name="stop_date" id="stop_date" type="text" class="form-control search-items layer-date" style = "width:68%">
				        </div>
<!-- 				        <div class="form-group small-space col-xs-4"> -->
<!-- 				        	<label >期刊ID：</label> -->
<!-- 				        	<input type="text" name="qk_id_zt51" > -->
<!-- 				        </div> -->
						<div class="form-group small-space col-xs-4">
				        	<label >是否催定：</label>
				        	<select name="is_cd">
								<option></option>
								<option value = "0">否</option>
								<option value = "1">是</option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >起订周期：</label>
				        	<select name="min_zd_period" class = "dictionary">
								<option></option>
							</select>
				        </div>
					</div>
					<div class="row">
						<div class="form-group small-space col-xs-4">
				        	<label >发订周期：</label>
				        	<select name="qkbd_style" class = "dictionary">
								<option></option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >报刊级别：</label>
				        	<select name="grade_id" class = "dictionary">
								<option></option>
							</select>
				        </div>
						<div class="form-group small-space col-xs-4">
				        	<label >货到批次：</label>
				        	<select name="Arrival_batches" class = "dictionary">
								<option></option>
							</select>
				        </div>
					</div>
					<div class="row">
						<div class="form-group small-space col-xs-4">
					    	<label >第一货源：</label>
					    	<input type="text" name="f_id">
					    	<div class="input-group-btn">
	                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
	                            <span class="caret"></span>
	                        </button>
	                        <ul class="dropdown-menu dropdown-menu-right" role="menu" style="margin-left:580px"></ul>
	                    </div>
					  </div>
					  <div class="form-group small-space col-xs-4">
					    	<label >第一货源名称：</label>
					    	<input type="text" name="f_department" disabled>
					  </div>
					   <div class="form-group small-space col-xs-4">
				        	<label >国家：</label>
				        	<select name="qa_id" class = "dictionary">
								<option></option>
							</select>
				        </div>
					</div>
					<div class="row">
						<div class="form-group small-space col-xs-4" >
							<label >第二货源：</label>
							<input type="text" name="f_id_second">
							<div class="input-group-btn">
					        	<button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
					          		<span class="caret"></span>
					            </button>
					            <ul class="dropdown-menu dropdown-menu-right" role="menu" style="margin-left:580px"></ul>
					      </div>
						</div>
						<div class="form-group small-space col-xs-4" >
							<label >第二货源（名称）：</label>
							 <input type="text" name="f_department_second" disabled>
						</div>
						<div class="form-group small-space col-xs-4">
				        	<label >刊期：</label>
				        	<input type="text" name="kq_id" >
				        </div>
					</div>
					<div class="row">
	                	<div class="form-group small-space col-xs-4">
				        	<label >发行范围：</label>
				        	<select name="r_id" class = "dictionary">
								<option></option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >代销码：</label>
				        	<input type="text" name="sales_by_proxy" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >单价：</label>
				        	<input type="text" name="qk_price_ls" >
				        </div>
					</div>
					<div class="row">
				        <div class="form-group small-space col-xs-4">
				        	<label >语种：</label>
				        	<select name="languages" class = "dictionary">
								<option></option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >周期类型：</label>
				        	<select name="type" class = "dictionary">
								<option></option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >发行规律（月/周）：</label>
				        	<input type="text" name="where_1" >
				        </div>
					</div>
					<div class="row">
				        <div class="form-group small-space col-xs-4">
				        	<label >发行规律（天/星期）：</label>
				        	<input type="text" name="where_2" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >打印顺序：</label>
				        	<input type="text" name="print_sort" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >出版机构：</label>
				        	<input type="text" name="pub_name_original" >
				        </div>
					</div>
					<div class="row">
						<div class="form-group small-space col-xs-4">
				        	<label >是否经营：</label>
				        	<select name="is_flag" class = "dictionary">
								<option></option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >总公司刊号：</label>
				        	<input type="text" name="cn_code" >
				        </div>
<!-- 				        <div class="form-group small-space col-xs-4"> -->
<!-- 				        	<label >国外发行号：</label> -->
<!-- 				        	<input type="text" name="abroad_code" > -->
<!-- 				        </div> -->
					</div>
					<div class="row">
						 <div class="form-group small-space col-xs-4">
				        	<label >是否邮发：</label>
				        	<select name="is_mail" class = "dictionary">
								<option></option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >到货折扣：</label>
				        	<input type="text" name="h_discount_qk" >
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >自制码：</label>
				        	<input type="text" name="qk_mytm" >
				        </div>
					</div>
					<div class="row">
						<div class="form-group small-space col-xs-4">
				        	<label >总署上报分类：</label>
				        	<select name="isbn_class" class = "dictionary">
								<option></option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >总署上报类型2：</label>
				        	<select name="isbn_class2" class = "dictionary">
								<option></option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >册数：</label>
				        	<input type="text" name="royalty" >
				        </div>
				    </div>
				    <div class="row">
				    	<div class="form-group small-space col-xs-4">
				        	<label >允许跨年：</label>
				        	<select name="is_allow">
								<option></option>
								<option value = "1">允许</option>
								<option value = "0">不允许</option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >购自国家：</label>
				        	<select name="gr_state_id" class = "dictionary">
								<option></option>
							</select>
				        </div>
				        <div class="form-group small-space col-xs-4">
				        	<label >海关：</label>
				        	<select name="hg_id" class = "dictionary">
								<option></option>
							</select>
				        </div>
				    </div>
				     <div class="row">
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
			
			
			$('#save').on('click', function () {
				if(!has_null($('#form')))
					ajax_function("addProduct","post",$('#form').serialize(),'新增成功');		
			 });

			//加载字典数据
			get_dictionary("${context}",null);
			
			//自动搜索填补
			initialize_bsSuggest_bk_factory("${context}", "f_department", "f_id");
			initialize_bsSuggest_bk_factory("${context}", "f_department_second", "f_id_second");
		});
	</script>
</html>