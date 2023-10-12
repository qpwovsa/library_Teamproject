package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.MemberVo;

public interface BookRequestService {
	public String requestwrite();
	public String requestwrite_ok(HttpSession session,BookRequestVo brvo,HttpServletRequest request);
	public String rlist(Model model,HttpServletRequest request,BookRequestVo brvo,HttpSession session);
	public String rcontent(Model model,HttpServletRequest request,BookRequestVo brvo,HttpSession session);
	public String rupdate(HttpServletRequest request,Model model,BookRequestVo brvo,HttpSession session);
	public String rupdate_ok(HttpServletRequest request,BookRequestVo brvo,HttpSession session);
	public String delete(HttpServletRequest request,HttpSession session,BookRequestVo brvo);
}
