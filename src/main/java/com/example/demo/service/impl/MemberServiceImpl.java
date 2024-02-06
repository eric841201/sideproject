package com.example.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.demo.ResourceDataException;
import com.example.demo.bean.Member;
import com.example.demo.dao.MemberDao;
import com.example.demo.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Override
	public Page<Member> findAll() {

		return memberDao.findAll();
	}

	@Override
	public Member findByAccount(String account) {

		return memberDao.findByAccount(account);
	}

	@Override
	public <S extends Member>  S save(S s) throws ResourceDataException {

		return memberDao.save(s);
	}

	@Override
	public <S extends Member> void update(S s) throws ResourceDataException {
		memberDao.save(s);
	}

	@Override
	public void delete(String id) {
		memberDao.deleteById(id);
	}

	@Override
	public Member findById(String id) {
		
		return memberDao.findById(id).get();
	}

	@Override
	public Page<Member> findAll(Pageable pgbl) {
		
		return memberDao.findAll();
	}

}
