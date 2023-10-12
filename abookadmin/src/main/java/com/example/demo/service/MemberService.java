package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MemberService {
	public String member(Model model,HttpServletRequest request);
	public String memberBan(Model model,HttpServletRequest request);
	public String detail(Model model, HttpServletRequest req);
	public String banOk(HttpServletRequest req);
	public String unsusBan(HttpServletRequest req);
}
