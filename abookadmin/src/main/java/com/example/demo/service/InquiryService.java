package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.InquiryVo;
import com.example.demo.vo.MtmVo;

public interface InquiryService {
	public String list(HttpServletRequest req,Model model,HttpSession ss);
	public String content(HttpServletRequest req,Model model);
	public String writeOk(MtmVo mvo,HttpServletRequest req);
	public String updateOK(MtmVo mvo,HttpServletRequest req);
}
