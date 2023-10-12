package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.BookregiVo;

public interface BookRequestService {
	public String hopelist(HttpServletRequest request,BookRequestVo brvo,Model model,BookregiVo bvo);
	public String cancelBrequest(HttpServletRequest req);
}
