package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.LoanstatusService;

@Controller
public class LoanstatusController {

	@Autowired
	@Qualifier("loans")
	private LoanstatusService service;

	@RequestMapping("/loanstatus/list")
	public String list(Model model, HttpServletRequest req) {
		return service.list(model, req);
	}

	@RequestMapping("/loanstatus/loanBook")
	public String loanBook(HttpServletRequest req) {
		return service.loanBook(req);
	}

}
