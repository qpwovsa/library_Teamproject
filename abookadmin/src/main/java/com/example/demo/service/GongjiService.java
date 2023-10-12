package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.demo.vo.GongjiVo;

public interface GongjiService {
	public String list(Model model,HttpServletRequest request,GongjiVo gvo);
	public String write();
	public String writeOk(GongjiVo gvo);
	public String readnum(HttpServletRequest req,Model model);
	public String content(GongjiVo gvo,Model model,HttpServletRequest request);
	public String delete(GongjiVo gvo,HttpServletRequest request);
	public String update(GongjiVo gvo,Model model,HttpServletRequest request);
	public String updateOk(GongjiVo gvo,HttpServletRequest request);
}
