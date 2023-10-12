package com.example.demo.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.BookRequestMapper;
import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.MemberVo;

@Service
@Qualifier("brs")
public class BookRequestServiceImpl implements BookRequestService {

	@Autowired
	private BookRequestMapper mapper;

	@Override
	public String requestwrite() {
		return "/bookrequest/requestwrite";
	}

	@Override
	public String requestwrite_ok(HttpSession session,BookRequestVo brvo,HttpServletRequest request) {
		
		int gonge;
		if(request.getParameter("gonge")==null) // 비공개체크를 안했을경우
		{
			gonge=0; // 공개글
		}
		else
		{
			gonge=1; // 비공개글
		}
		brvo.setGonge(gonge); // BookRequestVo에 공개값 주기.
		brvo.setUserid(session.getAttribute("userid").toString()); // 로그인한 유저아이디 brvo에 객체 설정.
		mapper.requestwrite_ok(brvo);
		return "redirect:/bookrequest/rlist";
	}

	@Override
	public String rlist(Model model, HttpServletRequest request, BookRequestVo brvo, HttpSession session) {
		String rchk=request.getParameter("rchk");
		if(rchk==null) {
			rchk="1";
		}
		
		// 검색창 type,keyword 받아오기.
	    String type = request.getParameter("type");
	    String keyword = request.getParameter("keyword");
	    String title = request.getParameter("title"); // title 도서명 받아오기.
	    
	    // 페이지 처리
	    int page;
	    if (request.getParameter("page")==null)
	        page=1;
	    else
	        page=Integer.parseInt(request.getParameter("page"));
	    
	    int start=(page-1)*10;
	    int pstart=page/10;
	    if (page%10==0)
	        pstart--;
	    
	    pstart=pstart*10+1;

	    int pend=pstart+9;
	    
	   
	    
	    model.addAttribute("rchk",rchk);
	    model.addAttribute("page",page);
	    
	    int chong;
	    if (keyword==null || keyword.length()==0) { // 검색어가 없을경우
	    	
	        type="title"; // type을 무작위(title)로 하나 선정.
	        
	        keyword = "";
	        
	        chong=mapper.getChong();
	        
		    model.addAttribute("page", page);
	    	model.addAttribute("pstart", pstart);
	    	model.addAttribute("pend", pend);
	    	model.addAttribute("chong", chong);
	    	model.addAttribute("type","aa");
	    	model.addAttribute("rlist",mapper.search(type,keyword,start));
	    }
	    else // 검색어가 있을경우
	    {
	    	model.addAttribute("page", page);
	    	model.addAttribute("pstart", pstart);
	    	model.addAttribute("pend", pend);
	    	model.addAttribute("type", type);
	    	model.addAttribute("keyword", keyword);
	    	model.addAttribute("start", start);
	    	
	    	if(type.equals("aa")) //전체 검색일경우 type 필요없다. 다 필요하기 때문.
			{
				chong = mapper.getChong3(keyword);
				model.addAttribute("chong",chong);
			    model.addAttribute("rlist",mapper.list2(keyword,start));
			}
			else // 전체검색 제외일 경우
			{
				chong = mapper.getChong2(type,keyword);
				model.addAttribute("chong",chong);
				model.addAttribute("rlist",mapper.search(type,keyword,start));
			}
	    }
	    if (pend>chong)
	        pend=chong;
	    model.addAttribute("pend", pend);
	    return "bookrequest/rlist";
	}

	@Override
	public String rcontent(Model model, HttpServletRequest request, BookRequestVo brvo,HttpSession session) {
		String page=request.getParameter("page");
		String gonge=request.getParameter("gonge");
		String type=request.getParameter("type");
		String keyword=request.getParameter("keyword");
		
		if(session.getAttribute("userid")==null && brvo.getGonge() == 0) { // 로그인을 안했거나 공개글일 경우
			model.addAttribute("type",type);
			model.addAttribute("keyword",keyword);
			model.addAttribute("page",page);
			brvo=mapper.rcontent(brvo);
			brvo.setEct( brvo.getEct().replace("\r\n","<br>") );
			model.addAttribute("brvo",brvo);
			return "/bookrequest/rcontent";
		}
		
		String userid=session.getAttribute("userid").toString();
		brvo.setGonge(brvo.getGonge());
		
		model.addAttribute("type",type);
		model.addAttribute("keyword",keyword);
		model.addAttribute("page",page);
		model.addAttribute("userid",userid);
		brvo=mapper.rcontent(brvo);
		brvo.setEct( brvo.getEct().replace("\r\n","<br>") );
		model.addAttribute("brvo",brvo);
		
		return "/bookrequest/rcontent";
	}

	@Override
	public String rupdate(HttpServletRequest request, Model model, BookRequestVo brvo,HttpSession session) {
		String no= request.getParameter("no");
		String userid=session.getAttribute("userid").toString();
		String page=request.getParameter("page");
		model.addAttribute("userid",userid);
		model.addAttribute("page",page);
		model.addAttribute("brvo",mapper.rupdate(no));
		return "/bookrequest/rupdate";
	}

	@Override
	public String rupdate_ok(HttpServletRequest request, BookRequestVo brvo,HttpSession session) {
		String page=request.getParameter("page");
		String userid=session.getAttribute("userid").toString();
		String no=request.getParameter("no");
		brvo.setUserid(userid);
		mapper.rupdate_ok(brvo);
		return "redirect:/bookrequest/rcontent?no="+no+"&page="+page;
	}

	@Override
	public String delete(HttpServletRequest request, HttpSession session, BookRequestVo brvo) {
		String page=request.getParameter("page");
		mapper.delete(brvo);
		return "redirect:/bookrequest/rlist?page="+page;
	}
}
