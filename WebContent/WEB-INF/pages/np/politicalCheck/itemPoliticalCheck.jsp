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
    <form id="form_verify" class="form-inline">
	<div class="wrapper wrapper-content animated fadeInRight">
         <div class="ibox float-e-margins">	            
	            <div class="col-xs-12">
					  <div class="form-group inline-middle">
					    <label>刊号：</label>
					    <input type="text" name="mail_code" class="form-control search-items" readonly="readonly"/>
					  </div>
					  <div class="form-group inline-middle">
					    <label>刊名：</label>
					    <input type="text" name="qk_name" class="form-control search-items" readonly="readonly"/>
					  </div>
					  <div class="form-group inline-middle">
					    <label>期名：</label>
					    <input type="text" name="period_name" class="form-control search-items" readonly="readonly"/>
					    <input type="hidden" name="qk_dh_id" />
					    <input type="hidden" name="ItemExclusiveCode" />
					    <input type="hidden" name="zs_pop" />
					    <input type="hidden" name="operate_type" />
					    <input type="hidden" name="instance_tm" />
					  </div>
				 </div>
				 <div class="col-xs-1 search-group-button">
				 </div>				
        </div>        
        <div class="ibox float-e-margins">
        	<div class="ibox-title">
                <h5>明细审读结果</h5>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
                    		<div class="col-xs-2"></div>                   
                             <div class="form-group select-group col-xs-3 not-null" style="margin-top: 20px;">
		                  		<label >一审结果：</label>
		                        <select name="zs1_result" id="zs1_result" class="dictionary">
		                        	<option></option>
		                        	<option value="1">通过</option>
		                        	<option value="2">不通过</option>
		                        	<option value="3">需加工</option>
		                        </select>
		                	</div>
		                	<div class="form-group textarea-group col-xs-7">
		                  		<label >一审意见：</label>
		                        <textarea rows="3" name="zs1_opn" id="zs1_opn">${zs1_opn}</textarea>
		                        <button type="button" class="btn btn-primary btn-xs" id="search" style="margin-bottom:50px;margin-left:20px">一审参考</button>
		                	</div>
                    </div>
                </div>
                <div class="row row-lg">                    
                    <div class="col-sm-12">
                    		<div class="col-xs-2"></div>                       
                            <div class="form-group select-group col-xs-3 not-null" style="margin-top: 20px;">
		                  		<label >二审结果：</label>
		                        <select name="zs2_result" id="zs2_result" class="dictionary">
		                        	<option></option>
		                        	<option value="1">通过</option>
		                        	<option value="2">不通过</option>
		                        	<option value="3">需加工</option>
		                        </select>
		                	</div>
		                	<div class="form-group textarea-group col-xs-7">
		                  		<label >二审意见：</label>
		                        <textarea rows="3" name="zs2_opn" id="zs2_opn"></textarea>
		                	</div>
                    </div>
                </div>
                <div class="row row-lg">                    
                    <div class="col-sm-12">
                    		<div class="col-xs-2"></div> 
                             <div class="form-group select-group col-xs-3 not-null" style="margin-top: 20px;">
		                  		<label >三审结果：</label>
		                        <select name="zs3_result" id="zs3_result" class="dictionary">
		                        	<option></option>
		                        	<option value="1">通过</option>
		                        	<option value="2">不通过</option>
		                        	<option value="3">需加工</option>
		                        </select>
		                	</div>
		                	<div class="form-group textarea-group  col-xs-7">
		                  		<label >三审意见：</label>
		                        <textarea rows="3" name="zs3_opn" id="zs3_opn"></textarea>
		                	</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>审读关联明细</h5>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">    
                    	<div class="btn-group hidden-xs" id="tableTool" role="group">
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
                        <table id="table_detail" data-mobile-responsive="true">
                                    
                        </table>
                    </div>
                </div>
            </div>
        </div>
   </div>
   
   <div class="sonpage-footer">
		<button id="save" class="btn btn-success" type="button">保存</button>
		<button id="saveAndCommit" class="btn btn-success" type="button">保存并提交</button>	                  
   </div>
   </form>
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
	<!-- layerDate plugin javascript -->
    <script src="${context}/js/plugins/layer/laydate/laydate.js"></script>
    
	<script type="text/javascript">
	var $table_detail = $('#table_detail');
	function queryParams(param) {
		var json_obj={};
		json_obj['limit'] =param.limit;
	    json_obj['offset'] =param.offset;
	    json_obj['sortName'] =this.sortName;
	  	json_obj['sortOrder'] =this.sortOrder;
	  	json_obj['ItemExclusiveCode'] ='${param.ItemExclusiveCode}';
	    return json_obj;
	}
	
	var politicalCheck_str='${oneJson}';
	politicalCheck_str=politicalCheck_str.replace(/\r\n/g,"\\r\\n")  
	politicalCheck_str=politicalCheck_str.replace(/\n/g,"\\n");
	politicalCheck_str=politicalCheck_str.replace(/\s/g," ");
	politicalCheck_str=politicalCheck_str.replace(/\\/g,"\\\\");  // 转义双斜杠
	var politicalCheck=JSON.parse(politicalCheck_str);
	
	function get_item_political_funtion(data) {
		$("textarea[name='zs1_opn']").val(data['zs1_opn']);
		$("textarea[name='zs2_opn']").val(data['zs2_opn']);
		$("textarea[name='zs3_opn']").val(data['zs3_opn']);
    }
	
	$(document).ready(function () {
		if('${param.is_detail}'==1){
			$("#save").remove();
			$("#add").remove();
			$("#saveAndCommit").remove();
		}
		
		//加载字典数据
		get_dictionary("${context}",null);

		//填写已有数据
		set_one_info($("#form_verify"), politicalCheck);
		// 将下拉框的数值填入
		setSelectValue('zs1_result', politicalCheck.zs1_result);
		setSelectValue('zs2_result', politicalCheck.zs2_result);
		setSelectValue('zs3_result', politicalCheck.zs3_result);
		
		// 有换行可能的文本框回填 必须得使用单独的后台调用模式
		ajax_function_dosuccess('queryItemPoliticalCheck',"post",{'ItemExclusiveCode':'${param.ItemExclusiveCode}'}, get_item_political_funtion);
		
		initialize_table($table_detail,"getItemPoliticalCheckList",${tableHeader},queryParams,"#tableTool",350);
		
		// 获得当前政审状态， 0-待一审 1-待二审 2-待三审 3-政审完成
		var zs_pop = politicalCheck.zs_pop;
		if (zs_pop == '3') {
			$("#save").hide();
			$("#saveAndCommit").hide();
		} else if (zs_pop == '2') {
			$("#zs1_result").attr("disabled", true);
			$("#zs1_opn").attr("disabled", true);
			$("#zs2_result").attr("disabled", true);
			$("#zs2_opn").attr("disabled", true);
		} else if (zs_pop == '1') {
			$("#zs1_result").attr("disabled", true);
			$("#zs1_opn").attr("disabled", true);
			$("#zs3_result").attr("disabled", true);
			$("#zs3_opn").attr("disabled", true);
		} else if (zs_pop == '0') {
			$("#zs2_result").attr("disabled", true);
			$("#zs2_opn").attr("disabled", true);
			$("#zs3_result").attr("disabled", true);
			$("#zs3_opn").attr("disabled", true);
		}
		
		//引入条目layer
		var $add=$("#add");
		// 类型2代表打开的是新页面, 类型1代表打开的是本页面元素
		button_click_layer_refresh($add,2,"新增政审记录",'politicalCheckItemAdd?ItemExclusiveCode=' + politicalCheck.ItemExclusiveCode + 
				'&qk_dh_id=' + politicalCheck.qk_dh_id + '&h_id=' + politicalCheck.h_id,$table_detail,false,['750px', '700px']);
		
		// 保存按钮, 结束后关闭
		$('#save').on('click', function () {
			$("input[name='operate_type']").val(0);  //操作方式 为0-保存
			
			if(!has_null($("#form_verify"))){				
				ajax_function("onePoliticalCheck","post",$('#form_verify').serialize(),'审读完成, 未提交!');
			}
		});
		
		// 保存并提交按钮, 结束后关闭
		$('#saveAndCommit').on('click', function () {
			$("input[name='operate_type']").val(1);  //操作方式 为1-提交
			
			if(!has_null($("#form_verify"))){				
				ajax_function("onePoliticalCheck","post",$('#form_verify').serialize(),'审读完成, 已提交!');
			}
		});
		
		$('#zs1_result').on('change', function () {
			var zs1_result = $(this).val();
			var zs1_opn = $("textarea[name='zs1_opn']").val();
			// 假如一审不通过, 且 一审意见是空的
			if (zs1_result == '2' && zs1_opn == '') {
				$("textarea[name='zs1_opn']").val('处理对象：订户ABCD，BCD，CD，D，Z，H\r\n处理范围：代销大范围，纯代销\r\n处理方式：缓发，扣发，贴条，盖章，撤页，涂改');
			}
		})
		
		//获取刊号
		var mail_code = $('input[name="mail_code"]').val();
		var instance_tm = $('input[name="instance_tm"]').val();
		//查询历史一审参考结果
		$("#search").on('click',function(){
			open_layer(2,'历史一审记录','firstPoliticalCheckItemConsult?mail_code=' + mail_code + '&instance_tm=' + instance_tm,['1000px', '500px'],false);
		});
	 });
	
	 // 查询历史一审参考结果-接收子页面数据的方法
     function receiveDataFromChild(item_ids) {
    	 $("#zs1_result").val(item_ids[0].zs1_result);
		 $("#zs1_opn").val(item_ids[0].zs1_opn);
     }
	 
	 // 填入下拉框选项
	 function setSelectValue(name, value) {
		 $("select[name='" + name + "']").children("option").each(function(){
			if($(this).val()==value){
				$(this).attr("selected", true);
			}
		 });
	 }
	 
	 function toEdit(ItemExclusiveCode, zs_id) {
		 open_layer_refresh(2,'编辑审读关联明细','toPoliticalCheckItemEdit?ItemExclusiveCode='+ItemExclusiveCode + '&zs_pop=' + politicalCheck.zs_pop + '&zs_id=' + zs_id,
				 $table_detail,['750px', '700px'],false);
	 }
	 
	 function toDel(zs_id){
		 ajax_function_ask_and_refresh("确认删除？","deletePoliticalCheckItem","post",{'zs_id':zs_id, 'zs_pop': politicalCheck.zs_pop},"删除成功！", $table_detail);
	 }
	 
	 function toPic(zs_id) {
		 open_layer_refresh(2,'图片上传管理','itemPoliticalCheckPic?zs_id='+zs_id,$table_detail,['800px', '600px'],false);
	 }
	 
	 function renderOperator(value,row,index){
		var str = '';
		if(${empty param.is_detail}){
			str += "<a onclick=\"toEdit('" + row.ItemExclusiveCode + "','" + row.zs_id + "')\">编辑</a> ";
			str += "<a onclick=\"toDel('"+row.zs_id+"')\">删除</a> ";
			str += "<a onclick=\"toPic('"+row.zs_id+"')\">文件管理</a> ";
		}
		return str;
	 }
	 
	</script>
</html>