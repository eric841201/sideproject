package com.example.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.ApplicationException;
import com.example.demo.ResourceDataException;
import com.example.demo.bean.Member;
import com.example.demo.service.MemberService;
import com.example.demo.service.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private MemberService memberService;

	@Override
	public Member register(Member newMember) {
		Member member = memberService.findByAccount(newMember.getAccount());
		if (member != null) {
			throw new ApplicationException("");
		};
		try {
			newMember = memberService.save(newMember);
		} catch (ResourceDataException e) {			
			e.printStackTrace();
		}
		return newMember ;

	}

}
