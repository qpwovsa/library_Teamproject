package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class AbookApplication {

	public static void main(String[] args) {
		SpringApplication.run(AbookApplication.class, args);
	}

	@Bean
	public FilterRegistrationBean<SitemeshConfig> sitemeshbean(){
		FilterRegistrationBean<SitemeshConfig> bean=new FilterRegistrationBean<SitemeshConfig>();
		bean.setFilter(new SitemeshConfig());
		return bean;
	}
}
