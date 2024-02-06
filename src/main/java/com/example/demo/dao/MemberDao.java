package com.example.demo.dao;


import org.springframework.data.domain.Page;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.Member;



@Repository
public interface MemberDao extends CrudRepository<Member, String>  {
	
	public Page<Member> findAll();
	
	public Member findByAccount(String account);
}
