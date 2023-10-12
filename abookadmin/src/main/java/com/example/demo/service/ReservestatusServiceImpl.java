package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.ReservestatusMapper;
import com.example.demo.vo.BookregiVo;

@Service
@Qualifier("rsvs")
public class ReservestatusServiceImpl implements ReservestatusService{
	
	@Autowired
	private ReservestatusMapper mapper;

	@Override
	public String list(Model model,HttpServletRequest request) {
		
		int page=1;
		if(request.getParameter("page") ==null)
			page =1;
		else
			page=Integer.parseInt(request.getParameter("page"));
		
		int start=(page -1) * 10;
		
		int pstart = page/10;
		if(page%10 ==0)
			pstart--;
		pstart=pstart*10+1;
		
		int pend=pstart +9;
		
		int chong=mapper.getChong();
		
		if(pend > chong)
			pend=chong;
		
		model.addAttribute("chong", chong);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);
		
		ArrayList<HashMap> mapall=mapper.list(start);
		model.addAttribute("mapall",mapall);
		
		return "/reservestatus/list";
	}

	@Override
	public String rcheck(HttpServletRequest request) {
		
		String bcode=request.getParameter("bcode");
		String userid=request.getParameter("userid");
		
		mapper.rcheck(bcode);
		
		String bcode2=bcode.substring(0,4);
		mapper.cntupdate(bcode2);
		
		BookregiVo bvo=mapper.getbook(bcode);
		String title=bvo.getTitle();
		String publi=bvo.getPubli();
		String writer=bvo.getWriter();
		
		mapper.setloan(bcode,userid,title,publi,writer);
		mapper.delbreserve(bcode);
		
		return "redirect:/reservestatus/list";
	}

	@Override
	public String dcheck(HttpServletRequest request) {
		
		String bcode=request.getParameter("bcode");
		String userid=request.getParameter("userid");
		String writeday=request.getParameter("writeday");
		
		mapper.dcheck(bcode);
		
		mapper.delbreserve(bcode);
		
		BookregiVo bvo=mapper.getbook(bcode);
		String title=bvo.getTitle();
		String publi=bvo.getPubli();
		String writer=bvo.getWriter();
		
		mapper.setbrefuse(bcode,userid,writeday,title,publi,writer);
		return "redirect:/reservestatus/list";
	}


}
