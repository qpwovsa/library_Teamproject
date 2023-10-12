package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.LoanlistMapper;

@Service
@Qualifier("ls")
public class LoanlistServiceImpl implements LoanlistService {

	@Autowired
	private LoanlistMapper mapper;
	
	@Override
	public String list(Model model,HttpServletRequest req) {
		
		//페이지 처리
		int page = 1;
		if (req.getParameter("page") == null)
			page = 1;
		else
			page = Integer.parseInt(req.getParameter("page"));

		int start = (page - 1) * 10;

		int pstart = page / 10;
		if (page % 10 == 0)
			pstart--;
		pstart = pstart * 10 + 1;

		int pend = pstart + 9;

		int chong = mapper.getChong();

		if (pend > chong)
			pend = chong;

		model.addAttribute("chong", chong);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);
		
		
		model.addAttribute("alist",mapper.list(start));
		return "/loanlist/list";
	}
}
