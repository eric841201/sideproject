package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import com.example.demo.filter.SiteMeshFilter;


@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}
	
    @Bean(name = "sitemesh3")
    SiteMeshFilter siteMeshFilter() {
    	return new SiteMeshFilter();
    }
}
