package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ReservestatusService;

@Controller
public class ReservestatusController {

	@Autowired
	@Qualifier("rsvs")
	private ReservestatusService service;

	@RequestMapping("/reservestatus/list")
	public String list(Model model, HttpServletRequest request) {
		return service.list(model, request);
	}

	@RequestMapping("/reservestatus/rcheck")
	public String rcheck(HttpServletRequest request) {
		return service.rcheck(request);
	}

	@RequestMapping("/reservestatus/dcheck")
	public String dcheck(HttpServletRequest request) {
		return service.dcheck(request);
	}

}
