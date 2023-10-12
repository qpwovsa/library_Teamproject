package com.example.demo.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.LoanstatusMapper;
import com.example.demo.vo.BookLoanVo;

@Service
@Qualifier("loans")
public class LoanstatusServiceImpl implements LoanstatusService{
	@Autowired
	private LoanstatusMapper mapper;

	@Override
	public String list(Model model,HttpServletRequest req) {
		
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

		model.addAttribute("page", page);
		model.addAttribute("pstart", pstart);
		model.addAttribute("chong", chong);
		model.addAttribute("pend", pend);
		
		ArrayList<BookLoanVo> blist=mapper.list(start);
		model.addAttribute("blist",blist);
		
		
		// 대여기간이 지난 책을 자동으로 반납상태로 만들기 (state=1로 만들기)
		LocalDate today = LocalDate.now();
		// System.out.println(today); 2023-09-15 확인 완료
		for(int i=0;i < blist.size(); i++) {
			String rday = blist.get(i).getReturnday(); 
			String bcode = blist.get(i).getBcode();
			LocalDate rrday = LocalDate.parse(rday, DateTimeFormatter.ISO_DATE);
			
			String no = Integer.toString(blist.get(i).getNo());
			
			if(rrday.isBefore(today)) {
				mapper.loanBook(no);
				mapper.chgStateBookregi(bcode);
			}
			
		}
		
		return "/loanstatus/list";
	}

	@Override
	public String loanBook(HttpServletRequest req) {
		String no = req.getParameter("no");
		String bcode = req.getParameter("bcode");
		mapper.loanBook(no);
		mapper.chgStateBookregi(bcode);
		
		return "redirect:/loanstatus/list";
	}

	
}
