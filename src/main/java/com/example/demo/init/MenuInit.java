package com.example.demo.init;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.demo.bean.Menu;
import com.example.demo.service.MenuService;

@Component
public class MenuInit {

	@Autowired
	private MenuService menuService;
	
	@PostConstruct
	public void init() {
		List<Menu> menuList = menuService.findByParentNodeIsNullOrderByNodeOrderAsc();
		
		if (menuList.isEmpty()) {
		List<Menu> buffer = new ArrayList<Menu>();
		Menu modelMenu;
		Set<Menu> childNodes;
		
		modelMenu = new Menu("首頁",1, "ui.menu.index");
		childNodes = modelMenu.getChildNodes();
		childNodes.add(new Menu("選單",1,"page_1","../index/query?pageNumber=0",modelMenu,"ui.menu.inedex"));
		
		buffer.add(modelMenu);
		menuService.saveAll(buffer);
		}
		
	} 
}
