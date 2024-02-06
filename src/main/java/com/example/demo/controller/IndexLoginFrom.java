package com.example.demo.controller;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class IndexLoginFrom {
	
	/**
	 * 用戶登入帳號
	 */
	@NotEmpty
	private String account;
	/**
	 * 用戶登入密碼
	 */
	@NotEmpty
	private String password;
	
	/**
	 * 使用語言
	 */	
	@NotEmpty
    private String locale;

}
