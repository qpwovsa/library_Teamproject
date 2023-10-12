package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface LoanstatusService {
	public String list(Model model,HttpServletRequest req);
	public String loanBook(HttpServletRequest req);
}
