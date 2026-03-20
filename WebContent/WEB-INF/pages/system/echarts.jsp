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
	    <jsp:include page="../include/h_superHead.jsp"></jsp:include>
		
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
        </div>
        <!-- Panel Other -->
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>用户管理</h5>
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
                <div id="main" style="width: 600px;height:400px;"></div>
            </div>
        </div>
        <!-- End Panel Other -->
    </div>
    
	</body>
	    
	<!-- 自定义js -->
    <script src="${context}/js/content.js?v=1.0.0"></script>
    <!-- echart-js -->
	<script src="${context}/js/plugins/echarts/echarts-3.0.js"></script>

    <!-- Bootstrap table -->
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
    <!-- Peity -->
    <%-- <script src="${context}/js/demo/bootstrap-table-demo.js"></script> --%>
	<script type="text/javascript">
			// 基于准备好的dom，初始化echarts实例
		    var myChart = echarts.init(document.getElementById('main'));
		
		    // 指定图表的配置项和数据
		    var option = {
		        title: {
		            text: 'ECharts 入门示例'
		        },
		        tooltip: {},
		        legend: {
		            data:['寸衫','羊毛衫','雪纺衫','裤子','高跟鞋','袜子']
		        },
		        xAxis: {
		            data: ["异常"]
		        },
		        yAxis: {type : 'value'},
		        series: [{
		            name: '寸衫',
		            type: 'bar',
		            data: [{value:5,name:1}]
		            },
		        {
		            name: '羊毛衫',
		            type: 'bar',
		            data: [ {value:15,name:11}]
		        },
		        {
		            name: '雪纺衫',
		            type: 'bar',
		            data: [{value:25,name:21}]
		        },
		        {
		            name: '裤子',
		            type: 'bar',
		            data: [{value:35,name:31}]
		        },
		        {
		            name: '高跟鞋',
		            type: 'bar',
		            data: [{value:45,name:41}]
		        },
		        {
		            name: '袜子',
		            type: 'bar',
		            data: [{value:55,name:51}]
		        }] 
		    };
		
		    // 使用刚指定的配置项和数据显示图表。
		    myChart.setOption(option);
		    myChart.on('click', function (params) {
		        window.open('https://www.baidu.com/s?wd=' + encodeURIComponent(params.data.name));
		        console.log(params.data.name);
		    });
	</script>
</html>