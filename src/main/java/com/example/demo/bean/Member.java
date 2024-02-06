package com.example.demo.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.SuperBuilder;

@Entity
@SuperBuilder
@Getter
@Setter
@NoArgsConstructor
@ToString(callSuper = true)

@Table(name = "T_MEMBER", indexes = { @Index(name = "IDX_ACCOUNT", columnList = "ACCOUNT", unique = false) })
public class Member extends BaseBean {

	@Column(name = "ACCOUNT", nullable = true, length = 40)
	private String account;

	@Column(name = "PASSWORD", nullable = true, length = 40)
	private String password;

	@Column(name = "PHONE", nullable = true, length = 20)
	private String phone;

	@Column(name = "EMAIL", nullable = false, length = 40)
	private String email;

	@Column(name = "ADDRESS", nullable = false, length = 100)
	private String address;

	@Column(name = "CREDIT_CARD", nullable = false, length = 40)
	private String creditCard;

}
