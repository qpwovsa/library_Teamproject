package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface ReservestatusService {
	public String list(Model model,HttpServletRequest request);
	public String rcheck(HttpServletRequest request);
	public String dcheck(HttpServletRequest request);
}
