package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.vo.GongjiVo;

public interface GongjiService {
	public String list(Model model,HttpServletRequest req,GongjiVo gvo);
	public String readnum(HttpServletRequest req,RedirectAttributes rttr);
	public String content(Model model,HttpServletRequest req,GongjiVo gvo);
}
