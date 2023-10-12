package com.example.demo.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.mapper.GongjiMapper;
import com.example.demo.vo.GongjiVo;

@Service
@Qualifier("gs2")
public class GongjiServiceImpl implements GongjiService {
	
	@Autowired
	private GongjiMapper mapper;

	@Override
	public String list(Model model, HttpServletRequest req, GongjiVo gvo) {
		
		String type=req.getParameter("type");
		String keyword=req.getParameter("keyword");
		String title=req.getParameter("title");
		
		int page = 1;
		
		if (req.getParameter("page") == null || req.getParameter("page").equals(""))
			page = 1;
		else
			page = Integer.parseInt(req.getParameter("page"));

		int start = (page - 1) * 10;

		int pstart = page / 10;
		if (page % 10 == 0)
			pstart--;
		pstart = pstart * 10 + 1;

		int pend = pstart + 9;
		
		int chong;
		
		if(keyword==null || keyword.length()==0) { //전체일때 
				
			type="title";
			keyword="";
			
			chong = mapper.getChong();
			model.addAttribute("page", page);
			model.addAttribute("type","aa");
			model.addAttribute("pstart",pstart);
			model.addAttribute("pend",pend);
			model.addAttribute("chong",chong);
			model.addAttribute("glist",mapper.list(type,keyword,start));
			
		}else { //검색어 있을때
			
			model.addAttribute("pstart", pstart);
			model.addAttribute("pend", pend);
			model.addAttribute("page", page);
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			model.addAttribute("start",start);
			
			if(type.equals("aa")) // aa와 같을때. type은 필요가없다 다 필요하기 때문에.
			{	
				chong = mapper.getChong3(keyword);
				model.addAttribute("chong",chong);
				model.addAttribute("glist",mapper.list2(keyword,start));
			}
			else {
				chong = mapper.getChong2(type,keyword);
				model.addAttribute("chong",chong);
				model.addAttribute("glist",mapper.list(type,keyword,start));
			}
		}
		

		if (pend > chong)
			pend = chong;
		
		model.addAttribute("pend",pend);
		
		return "/gongji/list";
		
	}

	@Override
	public String readnum(HttpServletRequest req,RedirectAttributes rttr) {
		
		String no=req.getParameter("no");
		String page=req.getParameter("page");
		String keyword = req.getParameter("keyword");
		String type = req.getParameter("type");
		rttr.addAttribute("keyword",keyword);
		rttr.addAttribute("type",type);
		mapper.readnum(no);
		
		return "redirect:/gongji/content?no="+no+"&page="+page;
	}

	@Override
	public String content(Model model, HttpServletRequest req, GongjiVo gvo) {
		
		String page=req.getParameter("page");
		
		// 줄바꿈 처리
		gvo=mapper.content(gvo);
		String imsi=gvo.getContent().replace("\r\n", "<br>");
		gvo.setContent(imsi);
		
		model.addAttribute("gvo",gvo);
		model.addAttribute("page", page);
		
		
		return "/gongji/content";
	}
}
