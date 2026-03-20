package com.cnpiecsb.system.entity.viewobject;

import java.util.List;

import com.cnpiecsb.system.entity.Menu;


public class MenuNode extends Menu {
	// 二级菜单
	private List<Menu> childMenu;

	public List<Menu> getChildMenu() {
		return childMenu;
	}

	public void setChildMenu(List<Menu> childMenu) {
		this.childMenu = childMenu;
	}
}
