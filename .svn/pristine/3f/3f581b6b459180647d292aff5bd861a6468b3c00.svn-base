// 获得特定部门的财务分类 input_name指的是对应的下拉框的name
// is_other = true 取其他分类
// is_other = false 取普通分类
function get_financial_classify_by_dept(context, dep_org_code, is_other, input_name, input_value) {
	$.ajax({
        url: context + "/fc/basic/getFinancialClassifyList", 
        method: "post",
        dataType: "json",
        traditional:true,
        //传送请求数据
        data: {dep_org_code: dep_org_code, is_other: is_other},
        success: function (data) { 
        	for (i = 0; i < data.rows.length; i++) {
                if (data.rows[i].classfiy_code == input_value) {
                	$("[name='" + input_name + "']").append("<option value=" + data.rows[i].classfiy_code + " selected>" + data.rows[i].classify_name + "</option>");
                } else {
                	$("[name='" + input_name + "']").append("<option value=" + data.rows[i].classfiy_code + ">" + data.rows[i].classify_name + "</option>");
                }
        	}
        },
        error:function(data){
        	alert("ajax请求失败!");
        }
});
}

//获得特定部门的考核单位 input_name指的是对应的下拉框的name
function get_assess_unit_by_dept(context, input_name, input_value) {
	$.ajax({
     url: context + "/fc/basic/getAssessUnitList", 
     method: "post",
     dataType: "json",
     traditional:true,
     //传送请求数据
     data: {},
     success: function (data) { 
     	for (i = 0; i < data.rows.length; i++) {
             if (data.rows[i].unit_code == input_value) {
             	$("[name='" + input_name + "']").append("<option value=" + data.rows[i].unit_code + " selected>" + data.rows[i].unit_name + "</option>");
             } else {
             	$("[name='" + input_name + "']").append("<option value=" + data.rows[i].unit_code + ">" + data.rows[i].unit_name + "</option>");
             }
     	}
     },
     error:function(data){
     	alert("ajax请求失败!");
     }
});
}
//新获得特定部门的财务分类，获得该部门和所有部门
function get_financial_classify_base_by_dept(context, dep_org_code, category, input_name, input_value) {
	$.ajax({
        url: context + "/fc/basic/getFinancialClassifyBaseList", 
        method: "post",
        dataType: "json",
        traditional:true,
        //传送请求数据
        data: {org_code: dep_org_code, category: category},
        success: function (data) { 
        	for (i = 0; i < data.rows.length; i++) {
                if (data.rows[i].classfiy_code == input_value) {
                	$("[name='" + input_name + "']").append("<option value=" + data.rows[i].classfiy_code + " selected>" + data.rows[i].classify_name + "</option>");
                } else {
                	$("[name='" + input_name + "']").append("<option value=" + data.rows[i].classfiy_code + ">" + data.rows[i].classify_name + "</option>");
                }
        	}
        },
        error:function(data){
        	alert("ajax请求失败!");
        }
});
}