package com.example.demo.service;

import java.util.List;

import com.example.demo.bean.Menu;

public interface MenuService {

	public List<Menu> findByParentNodeIsNullOrderByNodeOrderAsc();
	
	public List<Menu> findAll();
	
	public void saveAll(List<Menu> list);
}
