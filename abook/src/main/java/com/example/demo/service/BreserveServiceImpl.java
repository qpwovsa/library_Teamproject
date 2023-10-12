package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.BreserveMapper;
import com.example.demo.vo.BookregiVo;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Service
@Qualifier("brsv")
public class BreserveServiceImpl implements BreserveService {

	@Autowired
	private BreserveMapper mapper;

	@Override
	public String list(Model model, BookregiVo bvo, HttpServletRequest request) { //도서예약 list
		
		//검색창 타입 키워드
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		
		//신간도서,인기도서 확인
		String num = request.getParameter("num");
		
		//페이지 처리
		int page = 1;

		if (request.getParameter("page") == null)
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));

		int start = (page - 1) * 10;
		int pstart = page / 10;
		if (page % 10 == 0)
			pstart--;

		 pstart=pstart*10+1;
		
		int pend=pstart+9;
		
		if (num == null)
			num = "0"; // num null값일 시 0으로 지정(신간도서)
		//System.out.println(num);
		String str = ""; // 값 지정할 것
		switch (num) {
		case "0": str = "no desc"; break;
		case "1": str = "cnt desc"; break;
		default: str = "no desc"; break;
		} 
		model.addAttribute("num", num); // num값 보내기
		
		Integer chong;
		
		if(keyword==null || keyword.length()==0) //검색어 없을 경우
		{
			type="title";
      
			keyword="";
			
           chong=mapper.getChong();
           if(chong==null)
        	   chong=0;
           
			model.addAttribute("page",page);
			model.addAttribute("pstart",pstart);
			model.addAttribute("pend",pend);
			model.addAttribute("chong",chong);
			model.addAttribute("type","aa");
		    model.addAttribute("blist",mapper.list(type,keyword,start,str));
		
		} else{ //검색어 있을 경우

			model.addAttribute("page",page);
			model.addAttribute("pstart",pstart);
			model.addAttribute("pend",pend);
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			model.addAttribute("start",start);
			
			if (type.equals("aa")) { //전제검색
				
				chong=mapper.getChong3(keyword);
				
				if(chong==null)
					chong=0;
				
				model.addAttribute("chong",chong);
				model.addAttribute("blist", mapper.list2(keyword, start, str));
				
			} else { //전제검색 제외하고 검색
				
				chong=mapper.getChong2(type,keyword);
				model.addAttribute("chong",chong);
				model.addAttribute("blist", mapper.list(type, keyword, start, str));
			}
		}
		
		if(pend > chong)
			pend=chong;
		//System.out.println(chong);
		model.addAttribute("pend",pend);
		
		return "/breserve/list";
	}
	
	

	@Override
	public String content(HttpServletRequest request, Model model,HttpSession ss) {
		
		String chk = request.getParameter("chk");
		
		if (chk == null) {
			chk = "0";
		}

		model.addAttribute("chk", chk);
		String page = request.getParameter("page");
		String bcode = request.getParameter("bcode");
		
		String num = request.getParameter("num");
		model.addAttribute("num",num);
		String type=request.getParameter("type");
		model.addAttribute("type",type);
		String keyword = request.getParameter("keyword");
		model.addAttribute("keyword",keyword);
		bcode = bcode.substring(0, 4); //'b001'
		model.addAttribute("page", page);

		ArrayList<HashMap> mapall = mapper.content(bcode); //같은 도서 갯수만큼 예약 가능하게 list
		model.addAttribute("mapall", mapall);
		
		// jjim 체크해서 모델 보내기

		if(ss.getAttribute("userid")!=null) {
			String userid= ss.getAttribute("userid").toString();
			
			if(mapper.jjimCheck(userid, bcode)) {
				model.addAttribute("img","jjim2.png");
			}else {
				model.addAttribute("img","jjim1.png");
			}

			//mypage jjim 관련 mj 값 줌
			String mj = request.getParameter("mj");
							
			if(mj!=null) {
				model.addAttribute("mj",mj);
				model.addAttribute("img","jjim2.png"); // mypage에서 이동하는거니까 당연히 찜이 되있는 상태, 즉 빨강 하트로 보냄
			}
		}else {
			model.addAttribute("img","jjim1.png");
		}
		
		return "/breserve/content";
	}

	@Override
	public String bresOk(HttpSession session, HttpServletRequest request, Model model) {

		if (session.getAttribute("userid") == null) {
			
			String page = request.getParameter("page");
			String bcode = request.getParameter("bcode");

			return "redirect:/member/login?page=" + page + "&bcode=" + bcode;
		
		} else {
			
			String page = request.getParameter("page");
			String bcode = request.getParameter("bcode");
			String userid = session.getAttribute("userid").toString();

			if (mapper.cntCheck(userid)+mapper.cntCheck2(userid) > 3) { //예약중,대출중 회원 최대 4개까지만 가능 체크
				return "redirect:/breserve/content?bcode="+bcode+"&page="+page+"&chk=1";

			} else {

				mapper.bresOk(userid, bcode);
				mapper.bresUpdate(bcode);

				return "redirect:/breserve/content?bcode="+bcode+"&page="+page;
			}
		}

	}

	@Override
	public String addjjim(HttpServletRequest req, HttpSession ss) { //도서 찜
		if (ss.getAttribute("userid") != null) {

			String userid = ss.getAttribute("userid").toString();
			String bcode = req.getParameter("bcode");
			// System.out.println(userid+"/"+bcode);
			try {
				mapper.addjjim(userid, bcode);
				return "0";
			} catch (Exception e) {
				return "1";
			}
		} else {
			return "2";
		}
	}

	@Override
	public String deljjim(HttpServletRequest req, HttpSession ss) { //도서 찜 삭제
		if (ss.getAttribute("userid") != null) {
			String userid = ss.getAttribute("userid").toString();
			String bcode = req.getParameter("bcode");
			try {
				mapper.deljjim(userid, bcode);

				return "0";
			} catch (Exception e) {
				return "1";
			}
		} else {
			return "2";
		}
	}


}
