package com.example.demo.dao;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.Menu;

@Repository
public interface MenuDao extends CrudRepository<Menu, String>  {
	
	public List<Menu> findByParentNodeIsNullOrderByNodeOrderAsc();
	
	public List<Menu> findAll();
	
}
