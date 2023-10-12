package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface ReserveSeatService {
	public String reserveseat(Model model);
	public String stopTable(HttpServletRequest req,Model model);
	public String startTable(HttpServletRequest req, Model model);
	public String cancelseat(Model model,HttpServletRequest request);
	public String cancelSeat(HttpServletRequest req);
}
