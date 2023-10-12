package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.LoanlistService;

@Controller
public class LoanlistController {

	@Autowired
	@Qualifier("ls")
	private LoanlistService service;

	@RequestMapping("/loanlist/list")
	public String allList(Model model, HttpServletRequest req) {
		return service.list(model, req);
	}
}
