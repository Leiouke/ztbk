function renderCellColour(value, row, index) {
    var style = {};//用于储存式样
    var textColor; // 用于存储字体颜色的变量
 
    var cell_colour; //颜色代码
    
    //若单元格颜色代码为0，但行的代码不为0，则以行的代码为准，颜色显示统一
    if(row.cell_colour == "0" && row.row_colour != "0"){
    	cell_colour = row.row_colour
    }else {
    	cell_colour = row.cell_colour
    }
    
    // 根据 cell_colour 设置背景色和字体颜色
    if (cell_colour == "0") {
        style.css = {'background-color': ''};//默认背景色
        textColor = ''; 
    } else if (cell_colour == "1") {
        style.css = {'background-color': '#ffff99'}; // 黄色背景
        textColor = '#000000'; // 黑色字体
    } else if (cell_colour == "2") {
        style.css = {'background-color': '#EE6363'}; // 红色背景
        textColor = '#ffffff'; // 白色字体
    } else if (cell_colour == "3") {
        style.css = {'background-color': '#87CEFA'}; // 蓝色背景
        textColor = '#000000'; // 黑色字体
    } else if (cell_colour == "4") {
        style.css = {'background-color': '#50ac62'}; // 绿色背景
        textColor = '#ffffff'; // 白色字体
    } else if (cell_colour == "5") {
        style.css = {'background-color': '#eb992f'}; // 土黄色背景
        textColor = '#000000'; // 黑色字体
    }
 
    // 如果设置了字体颜色，则添加到样式对象中
    if (textColor) {
        style.css['color'] = textColor;
    }
 
    return style;
}

//为了不为空而写的方法，为空会加载不出
function renderColorCheck(value, row, index) {
	var style = {};
    return style; // 返回样式对象
}