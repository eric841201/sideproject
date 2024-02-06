package com.example.demo.service;

import java.io.Serializable;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.demo.ResourceDataException;


public interface GenericEntityService <T extends Object , ID extends Serializable> {
		
	  public <S extends T> S save(S s) throws ResourceDataException;
	  
	  public <S extends T> void update(S s) throws ResourceDataException;
	  
	  public void delete(ID id);
	  
	  public T findById(ID id);
	  
	  public Page<T> findAll(Pageable pgbl);
}
