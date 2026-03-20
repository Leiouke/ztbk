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
	            	<div class="col-xs-12">
	            		<div class="col-xs-9">
		            	  	<div class="form-group inline-small">
						    	<label>价格类型：</label>
						    	<select name="price_class" id="price_class" class="form-control search-items">
						    		<option value="16" >全年销售价(上海)</option>
							  	</select>
						  	</div>	
		            	  	<div class="form-group inline-small">
						    	<label>币种：</label>
						    	<select name="currency_id" id="currency_id" class="form-control search-items">
							    	<option value="00" >人民币</option>
							  	</select>
						  	</div>	
						  </div>	
				         <div class="search-group-button col-xs-3">
						  	<button type="button" class="btn btn-primary btn-xs" id="search">查询</button>
						  	<button type="button" class="btn btn-default btn-xs" id="reset" >清空</button>
						 </div>
		         	</div>
				</form>
            </div>
        </div>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>价格波动查询</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">                    
                    <div class="col-sm-12">
                        <div id="box" style="width:550px;height:400px;margin-left:10px"></div> 
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
     <!-- echart-js -->
	<script src="${context}/js/plugins/echarts/echarts-3.0.js"></script>
    
	<script type="text/javascript">			
		
		 $(document).ready(function () {	
			 
			//加载价格类型
			var $select1=$("[name='price_class']");
			$.ajax({
			    url: "getPriceClassList?qk_id="+'${qk_id}', 
			    method: "post",
			    dataType: "json",
			    traditional:true,
			    success: function (data) {
			        $.each(data.rows,function(dic_index,dic_info){  // dic_index是列表序列号, dic_info是内容
			        	if(dic_info.price_class!="16"){
							var item="<option value='"+dic_info.price_class+"'>"+dic_info.price_name+"</option>";
				        	$select1.append(item);	
						}
			        });
			     },
			     error:function(data){	
			       alert("请求失败!");	
			     }
			});
			
			//点击查询重新加载折线图
			$('#search').on('click', function (){
				json_obj=formToJson($("#form_search"));
				json_obj['qk_id'] = '${qk_id}';
				getViewChart(json_obj,"状态百分比","价格变动");
			});
			
			//根据价格类型修改币种
			var $select2=$("[name='currency_id']");
			$('#price_class').on('change', function (){
				$select2.empty();
				var value=$('#price_class').val();
				if(value==""){
					return;
				}else{
					$.ajax({
					    url: "getCurrencyIdList?qk_id="+'${qk_id}'+"&price_class="+value, 
					    method: "post",
					    dataType: "json",
					    traditional:true,
					    success: function (data) {
					        $.each(data.rows,function(dic_index,dic_info){  // dic_index是列表序列号, dic_info是内容
					        	var item="<option value='"+dic_info.currency_id+"'>"+dic_info.currency_name+"</option>";
					        	$select2.append(item);
					        });
					     },
					     error:function(data){	
					       alert("请求失败!");	
					     }
					});
				}
			});
			

			window.addEventListener('load', function(){
				json_obj_search=formToJson($("#form_search"));
				json_obj_search['qk_id'] = '${qk_id}';
				json_obj_search['price_class'] = '16';
				console.log(json_obj_search);
				getViewChart(json_obj_search,"状态百分比","价格变动");
			});
			
		 });
		 
		//获得折线图表
		function getViewChart(json,name,text,series_name){
			$.ajax({
				url: "getPriceFluctuationDetailChart", 
			    method: "post",
			    dataType: "json",
			    data: json,
			    traditional:true,
			    success: function (data) {
			    	create_chart(data.rows,text,series_name);
			    },
			    error:function(data){	
			        alert("暂无数据!");	
			        var chart = echarts.init(document.getElementById(name));
			    	chart.clear();
			    }
			});
		}
		
		//单条查询折线图加载方法
		function create_chart(data,text,series_name){
			var chart = echarts.init(document.getElementById("box"));
			chart.clear();
			var chart_year=[];
			var chart_currency = [];
			var chart_value=[];
			var product_name;
			
			for (var key in data){	
				chart_year.push(data[key].p_year);
				chart_value.push(data[key].qk_price);
				chart_currency.push(data[key].currency_name);
				product_name = data[key].qk_name;
			}
			text = product_name +text;
			chart.setOption({
				 //标题
		        title:{
		          text:text
		        },
		        //工具箱
		        //保存图片
		        toolbox:{
		            show:true,
		            feature:{
		                saveAsImage:{
		                    show:true
		                }
		            }
		        },
		        //图例-每一条数据的名字叫销量
		        legend:{
		            data:chart_currency
		        },
		        //x轴
		        xAxis:{
		            data:chart_year
		        },
		        //y轴没有显式设置，根据值自动生成y轴
		        yAxis:{},
		        //数据-data是最终要显示的数据
		        series:[{
		            name:'价格',
		            type:'line',
		            data:chart_value,
		            // 显示数值
		            itemStyle : { normal: {label : {show: true}}}
		        }]
				
		    },true);
		}
		 
		
		 
	</script>
</html>