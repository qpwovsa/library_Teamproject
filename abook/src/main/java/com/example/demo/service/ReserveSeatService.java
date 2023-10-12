package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

public interface ReserveSeatService {
	public String chkReserveSeat(HttpSession session,Model model);
	public String reserveseat(HttpSession session,Model model,HttpServletRequest req);
	public String rulelibrary();
	public TableNameVo tableName(HttpServletRequest request,Model model);
	public String reserveSeater(ReserveSeatVo rvo, HttpSession session,HttpServletRequest request);
	public String reserveok(HttpServletRequest req, Model model);
}
