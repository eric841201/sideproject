package com.example.demo.bean;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@NoArgsConstructor
@ToString(callSuper = true )
@Table(name = "T_MOVIE" ,indexes =  { @Index(name = "IDX_NAME", columnList = "NAME", unique = false) })
public class Movie extends BaseBean {

	@Column(name ="NAME" , nullable = true ,length = 100)
	private String name;
	
	@Column(name = "MESSAGE" , nullable = true , length = 255)
	private String message;
	
}
