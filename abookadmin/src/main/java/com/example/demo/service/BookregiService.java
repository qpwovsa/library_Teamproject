package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.BookregiVo;

public interface BookregiService {
	public String list(Model model,HttpServletRequest request);
	public String write(HttpServletRequest request,Model model);
	public String write_ok(BookregiVo bvo,HttpServletRequest request,BookRequestVo brvo);
	public String content(BookregiVo bvo,HttpServletRequest request,Model model);
	public String add(HttpServletRequest request);
	public String del(HttpServletRequest request);
}
