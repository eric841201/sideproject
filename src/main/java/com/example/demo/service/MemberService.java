package com.example.demo.service;

import org.springframework.data.domain.Page;
import com.example.demo.bean.Member;


public interface MemberService extends GenericEntityService<Member, String>  {
	
	public Page<Member> findAll();
	
	public Member findByAccount(String account);
	
}
