package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.BookRequestMapper;
import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.BookregiVo;

@Service
@Qualifier("brs")
public class BookRequestServiceImpl implements BookRequestService {

	@Autowired
	private BookRequestMapper mapper;

	@Override
	public String hopelist(HttpServletRequest request, BookRequestVo brvo, Model model,BookregiVo bvo) {
		
		//페이지 처리
		int page;
		if(request.getParameter("page")==null) {
			page=1;
		}
		else {
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int start=(page-1)*10;
		int pstart=page/10;
		
		if(page%10==0) {
			pstart--;
		}
		
		pstart=pstart*10+1;
		
		int pend=pstart+9;
		int chong=mapper.getChong();
		
		if(pend>chong)
			pend=chong;
		
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("start",start);
		model.addAttribute("hlist",mapper.hopelist(brvo,start));
		
		return "bookrequest/hopelist";
	}

	@Override
	public String cancelBrequest(HttpServletRequest req) {
		String brno = req.getParameter("brno");
		//System.out.println(brno);
		mapper.cancelBrequest(brno);
		return "redirect:/bookrequest/hopelist";
	}

	
	
}
