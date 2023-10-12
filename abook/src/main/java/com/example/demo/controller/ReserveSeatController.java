package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ReserveSeatService;
import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

@Controller
public class ReserveSeatController {

	@Autowired
	@Qualifier("rs")
	private ReserveSeatService rs;

	@RequestMapping("/seat/chkReserveSeat")
	public String chkReserveSeat(HttpSession session, Model model) {
		return rs.chkReserveSeat(session, model);
	}

	@RequestMapping("/seat/reserveseat")
	public String reserveseat(HttpSession session, Model model, HttpServletRequest req) {
		return rs.reserveseat(session, model, req);
	}

	@RequestMapping("/seat/rulelibrary")
	public String rulelibrary() {
		return rs.rulelibrary();
	}

	@RequestMapping("/seat/tableName")
	public @ResponseBody TableNameVo tableName(HttpServletRequest request, Model model) {
		return rs.tableName(request, model);
	}

	@RequestMapping("/seat/reserveSeater")
	public String reserveSeater(ReserveSeatVo rvo, HttpSession session, HttpServletRequest request) {
		return rs.reserveSeater(rvo, session, request);
	}

	@RequestMapping("/seat/reserveok")
	public String reserveok(HttpServletRequest req, Model model) {
		return rs.reserveok(req, model);
	}

}
