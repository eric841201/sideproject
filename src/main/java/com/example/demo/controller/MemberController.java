package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.demo.bean.Member;
import com.example.demo.form.MemberForm;
import com.example.demo.service.MemberService;
import com.example.demo.util.DateUtil;

import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes({ "memberForm" })
@Slf4j
public class MemberController {

	@Autowired
	private MemberService memberService;

	@ModelAttribute
	private void init(Model model, HttpSession session) {
		MemberForm form = (MemberForm) session.getAttribute("memberForm");
		if (model.containsAttribute("memberForm") == false) {
			if (form == null) {
				form = new MemberForm();
				form.setStartTime(DateUtil.getCurrentFormatDate());
				form.setEndTime(DateUtil.getCurrentFormatDate());

			}
			model.addAttribute("memberForm", form);
		}
	}

	@RequestMapping("/member/query")
	public String query(@Valid @ModelAttribute("memberForm") MemberForm form, BindingResult result, Model model) {

		Page<Member> members = memberService.findAll();
		
		model.addAttribute("queryResult",members);
		
		return "member/query";
	}
}
