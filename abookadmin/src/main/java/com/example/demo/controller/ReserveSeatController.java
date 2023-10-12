package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ReserveSeatService;

@Controller
public class ReserveSeatController {

	@Autowired
	@Qualifier("rs")
	private ReserveSeatService service;

	@RequestMapping("/rsvseat/reserveseat")
	public String reserveseat(Model model) {
		return service.reserveseat(model);
	}

	@RequestMapping("/rsvseat/stopTable")
	public String stopTable(HttpServletRequest req, Model model) {
		return service.stopTable(req, model);
	}

	@RequestMapping("/rsvseat/startTable")
	public String startTable(HttpServletRequest req, Model model) {
		return service.startTable(req, model);
	}

	@RequestMapping("/rsvseat/cancelseat")
	public String cancelseat(Model model, HttpServletRequest request) {
		return service.cancelseat(model, request);
	}

	@RequestMapping("/rsvseat/cancelSeat")
	public String cancelSeat(HttpServletRequest req) {
		return service.cancelSeat(req);
	}
}
