package com.example.demo.service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.MypageMapper;
import com.example.demo.vo.InquiryVo;
import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

@Service
@Qualifier("ms")
public class MypageServiceImple implements MypageService {

	@Autowired
	private MypageMapper mapper;
	
	@Override
	public String checkReserveSeat(HttpSession ss,Model model,HttpServletRequest req) {
		String userid = ss.getAttribute("userid").toString();
		// page
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
		
		int chong = mapper.getChongSeat(userid);
		
		if (pend > chong)
			pend = chong;

		model.addAttribute("chong", chong);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);
		
		//현재 시간 비례 예약취소 잠그기
		String imsi = LocalTime.now().toString();
		String now = imsi.substring(0,2);
		model.addAttribute("now",now);
		
		//전체 예약 현황 mapper 만들어 보내기
		
		model.addAttribute("userid",userid); 
		
		//System.out.println(userid);
		
		ArrayList<ReserveSeatVo> rlist = mapper.reserveok(userid); 
		
		model.addAttribute("rlist",rlist);
		
		//시간 값이 int로 들어가서 값을 스트링으로 들여보내려고 노가다함.
		ArrayList<String> timelist = new ArrayList<String>();
		ArrayList<String> tntime = new ArrayList<String>(); // 예약되있는거 찾으면 여기에 값 넣을거임
		ArrayList<Integer> chongtimes= new ArrayList<Integer>();
		ArrayList<String> rtimes = new ArrayList<String>();
		for (int i = 0; i < rlist.size(); i++) {
			String time = ""; // 타임값 넣는거임.
			String tn = ""; // 예약된 시간 넣는거임.
			int chongtime = 0; //총 예약시간 넣는거임.
			String rtime = ""; // 마이페이지 금일예약 시간 
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
			
			if(time9 == 1) {
				time = time + "9시~10시,";
				tn = tn + "time9,"; 
				chongtime = chongtime+1;
				rtime="9";
			}

			if(time10 == 1) {
				time = time + "10시~11시,";	
				tn = tn + "time10,"; 
				chongtime = chongtime+1;
				rtime="10";
			}
			if(time11 == 1) {				
				time = time + "11시~12시,";
				tn = tn + "time11,"; 
				chongtime = chongtime+1;
				rtime="11";
			}
			if(time12 == 1) {
				time = time + "12시~13시,";
				tn = tn + "time12,"; 
				chongtime = chongtime+1;
				rtime="12";
			}
			if(time13 == 1) {
				time = time + "13시~14시,";
				tn = tn + "time13,"; 
				chongtime = chongtime+1;
				rtime="13";
			}
			if(time14 == 1) {
				time = time + "14시~15시,";
				tn = tn + "time14,"; 
				chongtime = chongtime+1;
				rtime="14";
			}
			if(time15 == 1) { 
				time = time + "15시~16시,";
				tn = tn + "time15,"; 
				chongtime = chongtime+1;
				rtime="15";
			}
			if(time16 == 1) { 
				time = time + "16시~17시,";
				tn = tn + "time16,"; 
				chongtime = chongtime+1;
				rtime="16";
			}
			if(time17 == 1) { 
				time= time + "17시~18시,";
				tn = tn + "time17,"; 
				chongtime = chongtime+1;
				rtime="17";
			}
			if(time18 == 1) { 
				time = time + "18시~19시,";
				tn = tn + "time18,"; 
				chongtime = chongtime+1;
				rtime="18";
			}
			
			time=time.substring(0, time.length()-1); // 마지막 ,를 자르기 위해 사용
		    //System.out.println(time.length());
			timelist.add(time);
			tntime.add(tn);
			chongtimes.add(chongtime);
			rtimes.add(rtime);
		}
		
		model.addAttribute("timelist",timelist);
		model.addAttribute("tntime",tntime);
		model.addAttribute("chongtimes",chongtimes);
		model.addAttribute("rtimes",rtimes);
		// 당일 예약현황 만들기
		
		String today = LocalDate.now().toString(); // 당일 날짜 가져오기
		
		ArrayList<ReserveSeatVo> rtoday = mapper.reserveToday(userid,today);
		
		model.addAttribute("rtoday",rtoday);
		
		//시간 값이 int로 들어가서 값을 스트링으로 들여보내려고 노가다함.
				ArrayList<String> timelist2 = new ArrayList<String>();
				ArrayList<String> tntime2 = new ArrayList<String>(); // 예약되있는거 찾으면 여기에 값 넣을거임
				ArrayList<Integer> chongtimes2= new ArrayList<Integer>();
				for (int i = 0; i < rtoday.size(); i++) {
					String time = ""; // 타임값 넣는거임.
					String tn = ""; // 예약된 시간 넣는거임.
					int chongtime = 0;//총 예약시간 넣는거임.
					int time9 =  rtoday.get(i).getTime9();
					int time10 = rtoday.get(i).getTime10();
					int time11 = rtoday.get(i).getTime11();
					int time12 = rtoday.get(i).getTime12();
					int time13 = rtoday.get(i).getTime13();
					int time14 = rtoday.get(i).getTime14();
					int time15 = rtoday.get(i).getTime15();
					int time16 = rtoday.get(i).getTime16();
					int time17 = rtoday.get(i).getTime17();
					int time18 = rtoday.get(i).getTime18();
					
					if(time9 == 1) {
						time = time + "9시~10시,";
						tn = tn + "time9,"; 
						chongtime = chongtime+1;
					}

					if(time10 == 1) {
						time = time + "10시~11시,";	
						tn = tn + "time10,"; 
						chongtime = chongtime+1;
					}
					if(time11 == 1) {				
						time = time + "11시~12시,";
						tn = tn + "time11,"; 
						chongtime = chongtime+1;
					}
					if(time12 == 1) {
						time = time + "12시~13시,";
						tn = tn + "time12,"; 
						chongtime = chongtime+1;
					}
					if(time13 == 1) {
						time = time + "13시~14시,";
						tn = tn + "time13,"; 
						chongtime = chongtime+1;
					}
					if(time14 == 1) {
						time = time + "14시~15시,";
						tn = tn + "time14,"; 
						chongtime = chongtime+1;
					}
					if(time15 == 1) { 
						time = time + "15시~16시,";
						tn = tn + "time15,"; 
						chongtime = chongtime+1;
					}
					if(time16 == 1) { 
						time = time + "16시~17시,";
						tn = tn + "time16,"; 
						chongtime = chongtime+1;
					}
					if(time17 == 1) { 
						time= time + "17시~18시,";
						tn = tn + "time17,"; 
						chongtime = chongtime+1;
					}
					if(time18 == 1) { 
						time = time + "18시~19시,";
						tn = tn + "time18,"; 
						chongtime = chongtime+1;
					}
					
					time=time.substring(0, time.length()-1); // 마지막 ,를 자르기 위해 사용
				    //System.out.println(time.length());
					timelist2.add(time);
					tntime2.add(tn);
					chongtimes2.add(chongtime);
				}
				model.addAttribute("timelist2",timelist2);
				model.addAttribute("tntime2",tntime2);
				model.addAttribute("chongtimes2",chongtimes2);
		

		return "/mypage/checkReserveSeat";
	}
	
	@Override
	public String bookreserve(Model model,HttpSession session,HttpServletRequest req) {
		String userid=session.getAttribute("userid").toString();
		
		ArrayList<HashMap> mapall=mapper.bookreserve(userid);
		model.addAttribute("mapall",mapall);
		
		ArrayList<HashMap> mapall2=mapper.bookrefuse(userid);
		model.addAttribute("mapall2",mapall2);
		
		ArrayList<HashMap> mapall3= mapper.bookloan(userid);
		model.addAttribute("mapall3",mapall3);
		return "/mypage/bookreserve";
	}

	@Override
	public String cancelSeat(HttpServletRequest req,HttpSession ss) {
		String no = req.getParameter("no");
		String userid = ss.getAttribute("userid").toString();
		String tname = req.getParameter("tname");
		// tablename의 time 찾아서 0으로 만들기
		String tn = req.getParameter("tn");
		//System.out.println(tn);
		//이제 배열인거 확인하고, 잘라서 만들어야지
		String[] tntime = tn.split(",");
		// System.out.println(tntime[0]+" / "+tntime[1]+" / "+tntime[2]); 잘되네
		//System.out.println(tntime.length);
		for(int i=0; i<tntime.length; i++) {
			mapper.resetTablename(tntime[i],tname);
		}
		// reserveday 삭제

		mapper.cancelSeat(no);

		return "redirect:/mypage/checkReserveSeat";
	}

	@Override
	public String brsvCancel(HttpServletRequest request) {
		String bcode=request.getParameter("bcode");
		mapper.brsvCancel(bcode);
		mapper.changeState(bcode);
		return "redirect:/mypage/bookreserve";
	}

	@Override
	public String giganUpdate(HttpServletRequest request) {
		String no=request.getParameter("no");
		mapper.giganUpdate(no);
		return "redirect:/mypage/bookreserve";
	}

	@Override
	public String returnOk(HttpServletRequest request) {
		String no=request.getParameter("no");
		String bcode=request.getParameter("bcode");
		//System.out.println(bcode);
		mapper.returnOk(no);
		mapper.changeState(bcode);
		return "redirect:/mypage/bookreserve";
	}

	@Override
	public String loanlist(HttpSession session,Model model,HttpServletRequest request) {
		String userid=session.getAttribute("userid").toString();
		// page
		int page = 1;
		if (request.getParameter("page") == null || request.getParameter("page").equals(""))
			page = 1;
		else
			page = Integer.parseInt(request.getParameter("page"));

		int start = (page - 1) * 10;

		int pstart = page / 10;
		if (page % 10 == 0)
			pstart--;
		pstart = pstart * 10 + 1;

		int pend = pstart + 9;
		
		int chong = mapper.getChongloan(userid);

		if (pend > chong)
			pend = chong;

		model.addAttribute("chong", chong);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);
		
		
		ArrayList<HashMap> mapall=mapper.loanlist(userid,start);
		model.addAttribute("mapall",mapall);
		
		return "/mypage/loanlist";
	}

	@Override
	public String myjjim(HttpSession ss,Model model,HttpServletRequest req) {
		
		String userid= ss.getAttribute("userid").toString();
		
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
		
		int chong = mapper.getChongjjim(userid);
		if (pend > chong)
			pend = chong;

		model.addAttribute("chong", chong);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);
		
		ArrayList<HashMap> mapall = mapper.myjjim(userid);
		model.addAttribute("mapall",mapall);
		return "/mypage/myjjim";
	}

	@Override
	public String myinquiry(HttpSession ss, Model model, HttpServletRequest req) {
		// 페이지 처리할거면 쓰라고 일단 다 받음
		String userid = ss.getAttribute("userid").toString();
		
		// page
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
		
		int chong = mapper.getChongInquiry(userid);

		if (pend > chong)
			pend = chong;

		model.addAttribute("chong", chong);
		model.addAttribute("pstart", pstart);
		model.addAttribute("pend", pend);
		model.addAttribute("page", page);
		
		// 답변 대기중인것 받아오기
		ArrayList<InquiryVo> ilist = mapper.myinquiry1(userid);
		model.addAttribute("ilist",ilist);
		
		// 답변 완료인것 받아오기
		ArrayList<InquiryVo> alist = mapper.myinquiry2(userid);
		model.addAttribute("alist",alist);
		return "/mypage/myinquiry";
	}
	
	
}
