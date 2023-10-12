package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.ReserveSeatMapper;
import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

@Service
@Qualifier("rs")
public class ReserveSeatServiceImpl implements ReserveSeatService {

	@Autowired
	private ReserveSeatMapper mapper;

	@Override
	public String reserveseat(Model model) {
		ArrayList<TableNameVo> list = mapper.searchTable();
		model.addAttribute("list", list);
		return "/rsvseat/reserveseat";
	}

	@Override
	public String stopTable(HttpServletRequest req, Model model) {
		String tname = req.getParameter("tname");
		//System.out.println(tname);
		mapper.stopTable(tname);
		return "redirect:/rsvseat/reserveseat";
	}

	@Override
	public String startTable(HttpServletRequest req, Model model) {
		String tname = req.getParameter("tname");
		mapper.startTable(tname);
		return "redirect:/rsvseat/reserveseat";
	}

	@Override
	public String cancelseat(Model model,HttpServletRequest request) {
		
		
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
		int chong=mapper.getChong1();
		if(pend>chong)
			pend=chong;
		
		model.addAttribute("page",page);
		model.addAttribute("pstart",pstart);
		model.addAttribute("pend",pend);
		model.addAttribute("chong",chong);
		model.addAttribute("start",start);
		
		// 전체 예약 현황 mapper 만들어 보내기
		ArrayList<ReserveSeatVo> rlist = mapper.searchReserve1(start);
		model.addAttribute("rlist",rlist);
		
		// 시간 값이 int로 들어가서 값을 스트링으로 들여보내려고 노가다함.
		ArrayList<String> timelist = new ArrayList<String>();
		ArrayList<String> tntime = new ArrayList<String>(); // 예약되있는거 찾으면 여기에 값 넣을거임
		for (int i = 0; i < rlist.size(); i++) {
			String time = ""; // 타임값 넣는거임.
			String tn = ""; // 예약된 시간 넣는거임.
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
				tn = tn + "time9,";
			}

			if (time10 == 1) {
				time = time + "10시~11시,";
				tn = tn + "time10,";
			}
			if (time11 == 1) {
				time = time + "11시~12시,";
				tn = tn + "time11,";
			}
			if (time12 == 1) {
				time = time + "12시~13시,";
				tn = tn + "time12,";
			}
			if (time13 == 1) {
				time = time + "13시~14시,";
				tn = tn + "time13,";
			}
			if (time14 == 1) {
				time = time + "14시~15시,";
				tn = tn + "time14,";
			}
			if (time15 == 1) {
				time = time + "15시~16시,";
				tn = tn + "time15,";
			}
			if (time16 == 1) {
				time = time + "16시~17시,";
				tn = tn + "time16,";
			}
			if (time17 == 1) {
				time = time + "17시~18시,";
				tn = tn + "time17,";
			}
			if (time18 == 1) {
				time = time + "18시~19시,";
				tn = tn + "time18,";
			}
			
			time = time.substring(0, time.length() - 1); // 마지막 ,를 자르기 위해 사용
			// System.out.println(time.length());
			timelist.add(time);
			tntime.add(tn);
		}

		model.addAttribute("timelist", timelist);
		model.addAttribute("tntime", tntime);
		//System.out.println(timelist);
		//System.out.println(tntime);
		// 당일 예약현황 만들기

		String today = LocalDate.now().toString(); // 당일 날짜 가져오기

		ArrayList<ReserveSeatVo> rlist2 = mapper.searchReserve2(today);
		
		model.addAttribute("rlist2", rlist2);
		
		// 시간 값이 int로 들어가서 값을 스트링으로 들여보내려고 노가다함.
				ArrayList<String> timelists = new ArrayList<String>();
				ArrayList<String> tntimes = new ArrayList<String>(); // 예약되있는거 찾으면 여기에 값 넣을거임
				for (int i = 0; i < rlist2.size(); i++) {
					String time = ""; // 타임값 넣는거임.
					String tn = ""; // 예약된 시간 넣는거임.
					int time9 = rlist2.get(i).getTime9();
					int time10 = rlist2.get(i).getTime10();
					int time11 = rlist2.get(i).getTime11();
					int time12 = rlist2.get(i).getTime12();
					int time13 = rlist2.get(i).getTime13();
					int time14 = rlist2.get(i).getTime14();
					int time15 = rlist2.get(i).getTime15();
					int time16 = rlist2.get(i).getTime16();
					int time17 = rlist2.get(i).getTime17();
					int time18 = rlist2.get(i).getTime18();

					if (time9 == 1) {
						time = time + "9시~10시,";
						tn = tn + "time9,";
					}

					if (time10 == 1) {
						time = time + "10시~11시,";
						tn = tn + "time10,";
					}
					if (time11 == 1) {
						time = time + "11시~12시,";
						tn = tn + "time11,";
					}
					if (time12 == 1) {
						time = time + "12시~13시,";
						tn = tn + "time12,";
					}
					if (time13 == 1) {
						time = time + "13시~14시,";
						tn = tn + "time13,";
					}
					if (time14 == 1) {
						time = time + "14시~15시,";
						tn = tn + "time14,";
					}
					if (time15 == 1) {
						time = time + "15시~16시,";
						tn = tn + "time15,";
					}
					if (time16 == 1) {
						time = time + "16시~17시,";
						tn = tn + "time16,";
					}
					if (time17 == 1) {
						time = time + "17시~18시,";
						tn = tn + "time17,";
					}
					if (time18 == 1) {
						time = time + "18시~19시,";
						tn = tn + "time18,";
					}
					
					time = time.substring(0, time.length() - 1); // 마지막 ,를 자르기 위해 사용
					// System.out.println(time.length());
					timelists.add(time);
					tntimes.add(tn);
				}

				model.addAttribute("timelists", timelists);
				model.addAttribute("tntimes", tntimes);

		
		return "/rsvseat/cancelseat";
	}

	@Override
	public String cancelSeat(HttpServletRequest req) {
		String no = req.getParameter("no");
		
		String tname = req.getParameter("tname");
		
		// tablename의 time 찾아서 0으로 만들기
		String tn = req.getParameter("tn");
		
		//이제 배열인거 확인하고, 잘라서 만들어야지
		String[] tntime = tn.split(",");
		
		for(int i=0; i<tntime.length; i++) {
			mapper.resetTablename(tntime[i],tname);
		}
		// reserveday 삭제

		mapper.cancelSeat(no);
		
		
		
		
		return "redirect:/rsvseat/cancelseat";
	}

}
