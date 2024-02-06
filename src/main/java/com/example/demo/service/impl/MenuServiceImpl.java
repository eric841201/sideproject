package com.example.demo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.bean.Menu;
import com.example.demo.dao.MenuDao;
import com.example.demo.service.MenuService;

import lombok.extern.slf4j.Slf4j;
@Service("MenuService")
@Slf4j
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuDao menuDao;
	
	@Override
	public List<Menu> findByParentNodeIsNullOrderByNodeOrderAsc() {

		return menuDao.findByParentNodeIsNullOrderByNodeOrderAsc();
	}

	@Override
	public void saveAll(List<Menu> list) {
		try {
			menuDao.saveAll(list);
		} catch (Exception e) {
			log.debug("Save Menu was Error!");
		}
		
	}

	@Override
	public List<Menu> findAll() {
		// TODO Auto-generated method stub
		return menuDao.findAll();
	}

}
