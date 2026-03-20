package com.cnpiecsb.csu.entity;

/**
 * 动态列
 * 
 * @author user
 *
 */
public class DynamicColumn {
	// 列名
	private String field;
	
	// 列宽
	private int width;
	
	// 列标签
	private String title;
	
	// 列样式
	private String formatter;
	
	// 是否可见
	private boolean visible;
	
	// 行对齐字典  0-center 1-left(这个默认可不填) 2-right
	private String align;
	
	// 是否是复选框, 默认否
	private boolean checkbox;
	
	// 排序号
	private int index;
	
	// 是否可排序, 默认为false 不可排序
	private boolean sortable;
	
	// 是否可编辑, 默认为false 不可编辑
	private boolean editable;
	
	// 写底部汇总信息函数
	private String footerFormatter;
	
	// 动态列静态属性
	private String myClassStyle = "hid";
	
	// 是否为新增记录
	private boolean newLine;
	
	// 表别名
	private String tableAlias;
	
	private String cellStyle = "renderColorCheck";

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFormatter() {
		return formatter;
	}

	public void setFormatter(String formatter) {
		this.formatter = formatter;
	}

	public boolean isVisible() {
		return visible;
	}

	public void setVisible(boolean visible) {
		this.visible = visible;
	}

	public String getAlign() {
		// 如果为新增记录, 将英文的转为数字
		if (newLine) {
			if (align.equals("center")) {
				return "0";
			} else if (align.equals("right")) {
				return "2";
			}
			return "1";
		}
		// 读出来的时候用英文
		if (align.equals("0")){
			return "center";
		} else if (align.equals("2")){
			return "right";
		}
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public boolean isCheckbox() {
		return checkbox;
	}

	public void setCheckbox(boolean checkbox) {
		this.checkbox = checkbox;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public boolean isNewLine() {
		return newLine;
	}

	public void setNewLine(boolean newLine) {
		this.newLine = newLine;
	}

	public boolean isSortable() {
		return sortable;
	}

	public void setSortable(boolean sortable) {
		this.sortable = sortable;
	}

	public boolean isEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
	}

	public String getFooterFormatter() {
		return footerFormatter;
	}

	public void setFooterFormatter(String footerFormatter) {
		this.footerFormatter = footerFormatter;
	}

	public String getMyClassStyle() {
		return myClassStyle;
	}

	public void setMyClassStyle(String myClassStyle) {
		this.myClassStyle = myClassStyle;
	}

	public String getTableAlias() {
		return tableAlias;
	}

	public void setTableAlias(String tableAlias) {
		this.tableAlias = tableAlias;
	}

	public String getCellStyle() {
		return cellStyle;
	}

	public void setCellStyle(String cellStyle) {
		if (cellStyle != null ) {
			this.cellStyle = cellStyle;
        }
	}
}
