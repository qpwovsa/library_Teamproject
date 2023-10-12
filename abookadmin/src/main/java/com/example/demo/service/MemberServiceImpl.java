package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MemberMapper;
import com.example.demo.vo.BookLoanVo;
import com.example.demo.vo.InquiryVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ReserveSeatVo;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;

	@Override
	public String member(Model model,HttpServletRequest request) {
		/*
		 * ArrayList<MemberVo> mlist = mapper.memberAll(); model.addAttribute("mlist",
		 * mlist); return "/member/member";
		 */
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
		model.addAttribute("mlist",mapper.memberAll(start));
		
		return "member/member";
	}

	@Override
	public String memberBan(Model model,HttpServletRequest request) {
		/*
		 * ArrayList<MemberVo> mlist = mapper.memberAll(start);
		 * model.addAttribute("mlist", mlist); return "member/memberBan";
		 */
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
		model.addAttribute("mlist",mapper.memberAll(start));
		
		return "member/memberBan";
	}

	@Override
	public String detail(Model model, HttpServletRequest req) {
		// 상세정보 불러오기
		String userid = req.getParameter("userid");
		HashMap map = mapper.detail(userid);
		model.addAttribute("map", map);
		
		// 작성글 불러오기 
		ArrayList<InquiryVo> ilist = mapper.myInquiry(userid);
		model.addAttribute("ilist",ilist);
		
		// 대출이력 불러오기
		ArrayList<BookLoanVo> blist = mapper.bLoan(userid);
		model.addAttribute("blist",blist);
		
		// 좌석정보 불러오기
		ArrayList<ReserveSeatVo> rlist = mapper.rSeat(userid);
		model.addAttribute("rlist", rlist);

		// 시간 값이 int로 들어가서 값을 스트링으로 들여보내려고 노가다함.
		ArrayList<String> timelist = new ArrayList<String>();
		
		for (int i = 0; i < rlist.size(); i++) {
			String time = ""; // 타임값 넣는거임.
			int time9 = rlist.get(i).getTime9();
			int time10 = rlist.get(i).getTime10();
			int time11 = rlist.get(i).getTime11();
			int time12 = rlist.get(i).getTime12();
			int time13 = rlist.get(i).getTime13();
			int time14 = rlist.get(i).getTime14();
			int time15 = rlist.get(i).getTime15();
			int time16 = rlist.get(i).getTime16();
			int time17 = rlist.get(i).getTime17();
			int time18 = rlist.get(i).getTime18();

			if (time9 == 1) {
				time = time + "9시~10시,";
			}

			if (time10 == 1) {
				time = time + "10시~11시,";

			}
			if (time11 == 1) {
				time = time + "11시~12시,";

			}
			if (time12 == 1) {
				time = time + "12시~13시,";
			}
			if (time13 == 1) {
				time = time + "13시~14시,";
			}
			if (time14 == 1) {
				time = time + "14시~15시,";
			}
			if (time15 == 1) {
				time = time + "15시~16시,";
			}
			if (time16 == 1) {
				time = time + "16시~17시,";
			}
			if (time17 == 1) {
				time = time + "17시~18시,";
			}
			if (time18 == 1) {
				time = time + "18시~19시,";
			}

			time = time.substring(0, time.length() - 1); // 마지막 ,를 자르기 위해 사용
			// System.out.println(time.length());
			timelist.add(time);
		}

		model.addAttribute("timelist", timelist);

		return "/member/detail";
	}

	@Override
	public String banOk(HttpServletRequest req) {
		String userid = req.getParameter("userid");
		String breason = req.getParameter("breason");
		
		mapper.banOk(userid,breason);
		return "redirect:/member/memberBan";
	}

	@Override
	public String unsusBan(HttpServletRequest req) {
		String userid=req.getParameter("userid");
		mapper.unsusBan(userid);
		return "redirect:/member/memberBan";
	}

}
