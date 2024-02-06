package com.example.demo.controller;

import java.util.Locale;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.example.demo.bean.Member;
import com.example.demo.service.MemberService;
import com.example.demo.service.RegisterService;
import com.example.demo.session.IndexLoginSession;
import com.example.demo.util.WebKeyConst;


@Controller
@SessionAttributes({ "locale", "localLanguages"})
@RequestMapping("/index")
public class IndexController {
	
	@Autowired
	private LocaleResolver localeResolver;
	
	@Autowired
	private IndexLoginSession indexLoginSession;
	
	@Autowired
	private RegisterService registerService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/login")
	public String login(Model model) {
		IndexLoginFrom member = new IndexLoginFrom();
		model.addAttribute("form", member);
		return "index/login";
	}
	
	@PostMapping("/login")
	public String index(@ModelAttribute("form") IndexLoginFrom form ,  @RequestParam(name = "locale", required = false, defaultValue = "zh-TW") String locale,
			Model model) {
		
		Member member = memberService.findByAccount(form.getAccount());
		if(member == null) {
			model.addAttribute(WebKeyConst.ERRORS,"");
		}
		member.getPassword();
		
		Locale useLocale = getLocale(locale);
		if (locale != null) {
			((SessionLocaleResolver) this.localeResolver).setDefaultLocale(useLocale);
			model.addAttribute("locale", useLocale);
		}
		return "index/index";
	}
	
	@RequestMapping("/register")
	public String add(Model model) {
		Member member = new Member();
		model.addAttribute("member", member);
		return "index/register";
	}
	@PostMapping("/register")
	public String add(@Valid @ModelAttribute("member") Member member,BindingResult result ,Model model) {
		if(result.hasErrors()) {
			model.addAttribute("member", member);
			return  "index/register";
		}
		registerService.register(member);
		return "redirect :/login";
	}
	
	private Locale getLocale(String locale) {
		Locale useLocale = null;
		switch (locale) {
		case "zh-CN":
			useLocale = Locale.SIMPLIFIED_CHINESE;
			break;
		case "en-US":
			useLocale = Locale.US;
			break;
		case "zh-TW":
		default:
			useLocale = Locale.TRADITIONAL_CHINESE;
			break;
		}
		return useLocale;
	}
}
