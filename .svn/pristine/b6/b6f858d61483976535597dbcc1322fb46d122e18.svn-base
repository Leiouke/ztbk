<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		 <!-- Bootstrap table fix-columns-->
	    <link href="${context}/css/plugins/bootstrap-table/fixed-columns/bootstrap-table-fixed-columns.css"" rel="stylesheet">
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
            <div class="ibox-content">
            	<div class="form-inline">
				  <div class="form-group">
				    <label for="operation">操作</label>
				    <input type="text" class="form-control search-items" id="operation" placeholder="">
				  </div>
				  <div class="form-group">
				    <label for="userAccount">账号</label>
				    <input type="email" class="form-control search-items" id="userAccount" placeholder="">
				  </div>
				  <button type="button" class="btn btn-primary btn-sm">查询</button>
				</div>
            
            </div>
        </div>
        <!-- Panel Other -->
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>日志管理</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">
                    
                    <div class="col-sm-12">
                        <!-- Example Events -->
                        <div class="example-wrap">
                            <div class="example">
                                <table id="table" data-height="600" data-mobile-responsive="true">                                    
                                </table>
                            </div>
                        </div>
                        <!-- End Example Events -->
                    </div>
                </div>
            </div>
        </div>
        <!-- End Panel Other -->
    </div>
	</body>

    <!-- Bootstrap table -->
    <script src="${context}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<%--     <script src="${context}/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script> --%>
    <script src="${context}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="${context}/js/plugins/layer/layer.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		 $('#table').bootstrapTable({
		      url: "getLogList",
		      search: true,
		      method:'post',
		      pagination: true,
		      showRefresh: true,
		      showToggle: true,
		      //showColumns: true,
		      fixedColumns: false,
          	  fixedNumber: +3,
		      sidePagination : "server", // 服务端处理分页 
		      iconSize: 'outline',
		      pageList:[200, 500, 5000],
		      height: 500,
		     // toolbar: '#TableToolbar',
		      queryParams: function (param) {
		    		var temp = {   
		    		    //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
		    	            limit: param.limit,   //页面大小
		    	            offset: param.offset,  //页码
		    		    //我们吧#txt_search_departmentname里面的值以departmentname传到后台
		    	           	//account: $("#textAccount").val(),
		    	            //userAccount: $("#textUserAccount").val(),
		    				context: param.search,
		    				sortName:this.sortName,
                            sortOrder:this.sortOrder
		    	        };
		    	        return temp;
		    	},
		      columns: [{title: '行号',field: 'rowNo',align: 'center',formatter :function (value, row, index) { return index+1;}  },
		                {title: '用户账号',field: 'userAccount',align: 'center',sortable:true}, 
		                {title: '操作描述',field: 'context',align: 'center',valign: 'middle',sortable:true},
		                {title: '日志时间',field: 'logTime',align: 'center',sortable:true}
		                ] ,
		      icons: {
		        refresh: 'glyphicon-repeat',
		        toggle: 'glyphicon-list-alt',
		        columns: 'glyphicon-list'
		      }
		    });
    });
	</script>
</html>