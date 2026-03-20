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
				<div class="tabs-container">
                    <ul class="nav nav-tabs">
                        <li class="active"><a data-toggle="tab" id="tab-1-title" href="#tab-1" aria-expanded="true">商品信息</a>
                        </li>
                        <li class=""><a data-toggle="tab" id="tab-2-title" href="#tab-2" aria-expanded="false">商品价格</a>
                        </li>
                    </ul>
                    <div class="tab-content">                    
                        <div id="tab-1" class="tab-pane active">
                        	<div class="panel-body">
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
								        	<label >报刊分类：</label>
								        	<select name="qk_tye" id = "qk_tye" class = "dictionary">
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
								        	<label >自进标识：</label>
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
<!-- 								        <div class="form-group small-space col-xs-4"> -->
<!-- 								        	<label >期刊ID：</label> -->
<!-- 								        	<input type="text" name="qk_id_zt51" > -->
<!-- 								        </div> -->
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
<!-- 								        <div class="form-group small-space col-xs-4"> -->
<!-- 								        	<label >国外发行号：</label> -->
<!-- 								        	<input type="text" name="abroad_code" > -->
<!-- 								        </div> -->
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
								        <div class="form-group small-space col-xs-4">
				 				        	<input type="text" name="qk_id" style="display: none;" value = '${qk_id}'>
										</div>
								     </div>
						       </form>
							</div><!-- panel-body1-->
                    	</div>
                    	<div id="tab-2" class="tab-pane">
	                            <div class="panel-body">
	                            <form id="form_tab4" class="form-inline">
		                            <div class="row row-lg">                    
						                    <div class="col-sm-12">
						                                <div class="btn-group hidden-xs" id="tableTool_content" role="group">
		                                	 				<button type="button" class="btn btn-outline btn-default" id="add">
	                            								<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>
	                        								</button>
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
						            </form>
	                            </div>
                        </div>
                    </div>
		       </div>
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
		
		var active=1;//区别那个窗口在活动
		var $table = $('#table');
	
		$(document).ready(function () {
			
			$(".layer-date").each(function(){
				inistal_one_data('#'+$(this).attr('id'));
			});
			
			$('#save').on('click', function () {
				if(!has_null($('#form')))
					ajax_function("editProduct","post",$('#form').serialize(),'修改成功');		
			 });

			var product = JSON.parse('${oneJson}');
			
			console.log("code="+product.qk_tye);
			
			//加载字典数据
 			get_dictionary("${context}", product);
			
			//填写已有数据
			set_one_info($("#form"), product);
			
			function queryParams(param) {
				var json_obj = {};
				json_obj['limit'] =param.limit;
				json_obj['offset'] =param.offset;
				json_obj['sortName'] =this.sortName;
				json_obj['sortOrder'] =this.sortOrder;
				json_obj['qk_id'] =product['qk_id'];
			    return json_obj;
			}
			
			//子元素滚动到底，父元素不随着滚动
// 			$('.tab-content').scrollUnique();
			//bootstrap初始化
			var to_initialize_tab2=true;
			
			$('#tab-1-title').on('click',function(){
				active=1;
				$("#tab-1").css('display','block');
				$("#tab-2").css('display','none');
			});
			
			$('#tab-2-title').on('click',function(){
				active=2;
				$("#tab-1").css('display','none');
				$("#tab-2").css('display','block');
				if(to_initialize_tab2){
					to_initialize_tab2=false;
					initialize_table_no_footer($table,"getProductPrice",${tableHeader},queryParams,"#tableTool",400);
				}		 
			});		
			
			var $config=$("#config");			
			table_column_config_layer($config,2,'表格属性配置','${context}/csu/columnConfig?queryId=${queryId}');
			
			//导出选择
			$('#tableTool').find('select').change(function () {
				 $('#table').bootstrapTable('refreshOptions',{exportDataType: $(this).val()});
		    }); 
			
			//增加条目layer
			var $add=$("#add");
			button_click_layer_refresh($add,2,"新增商品价格",'productPriceAdd?qk_id='+product['qk_id']+'&qk_name='+product['qk_name'],$table,true,['620px', '580px']);

			//自动搜索填补
 			initialize_bsSuggest_bk_factory("${context}", "f_department", "f_id");
			initialize_bsSuggest_bk_factory("${context}", "f_department_second", "f_id_second");
		});
		
		function toPriceEdit(qk_id,price_class,start_date){
			open_layer_refresh(2,'编辑商品价格','productPriceEdit?qk_id='+qk_id+'&price_class='+price_class+'&start_date_edit='+start_date,$table,['620px', '580px'],true)
		 }
		 
		 function toDel(qk_id,price_class,start_date,end_date){
			 ajax_function_ask_and_refresh("确认删除?","deleteProductPrice","post",{'qk_id': qk_id,'price_class': price_class,'start_date': start_date,'end_date': end_date},"删除成功!",$('#table'));
		 }
		 
		 function renderOperator(value,row,index){
			 //对时间做处理，否则汇变为毫秒值
			var start_date_type = new Date(row.start_date);
			var start_date = getSmpFormatDate(start_date_type, false);
			var end_date_type = new Date(row.end_date);
			var end_date = getSmpFormatDate(end_date_type, false);
				
			 var str = "";
			str = str + "<a onclick=\"toPriceEdit('"+row.qk_id+"','"+row.price_class+"','"+start_date+"')\">修改</a>";
			str = str + "&nbsp;&nbsp";
			str = str + "<a onclick=\"toDel('"+row.qk_id+"','"+row.price_class+"','"+start_date+"','"+end_date+"')\">删除</a>" + "&nbsp;&nbsp";
			 
			 return str;
		 }
	</script>
</html>