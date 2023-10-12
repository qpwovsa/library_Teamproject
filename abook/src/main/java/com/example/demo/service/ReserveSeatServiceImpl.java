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

import com.example.demo.mapper.ReserveSeatMapper;
import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

@Service
@Qualifier("rs")
public class ReserveSeatServiceImpl implements ReserveSeatService {

	@Autowired
	private ReserveSeatMapper mapper;

	
	@Override
	public String chkReserveSeat(HttpSession session, Model model) {
		//지금 총 예약이 몇개인지 확인하는 쿼리
		String userid = session.getAttribute("userid").toString();
		String time = LocalDate.now().toString();
		
		int total = mapper.totalTime(userid,time);
		model.addAttribute("total",total);
		return "redirect:/seat/reserveseat?total="+total;
	}
	
	
	@Override
	public String reserveseat(HttpSession session, Model model, HttpServletRequest req) {
		// 현재 시간에 맞춰 예약 안된 테이블은 전부 1로 바꾸자 0908
		int now = Integer.parseInt(LocalTime.now().toString().substring(0, 2));
		int change = now - 1; // 현재 전 시간이니까 -1 함
		String time = "time" + change;
		if (time.equals("time9") || time.equals("time10") || time.equals("time11") || time.equals("time12") || time.equals("time13")
				|| time.equals("time14") || time.equals("time15") || time.equals("time16") || time.equals("time17") || time.equals("time18")) {
			mapper.closeTable(time); // 정해진 시간대 닫기 완료
		}else if(time.equals("time8")) {
			//time8은 없으니까 공백으로 비워두기 (9시에는 사람들이 예약해야되니까)
		}else {
			mapper.closeAllTable();
		}
			ArrayList<TableNameVo> list = mapper.searchTable();
			model.addAttribute("list", list);
			String total = req.getParameter("total");
			model.addAttribute("total",total);
		
		return "/seat/reserveseat";
	}

	@Override
	public String rulelibrary() {

		return "/seat/rulelibrary";
	}

	@Override
	public TableNameVo tableName(HttpServletRequest request, Model model) {
		String tname = request.getParameter("tname");
		
		TableNameVo tvo = mapper.tableName(tname);
		
		return tvo;
	}

	@Override
	public String reserveSeater(ReserveSeatVo rvo, HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("userid") == null) {
			return "redirect:/member/login?rchk=1";
		} else {
			String userid = session.getAttribute("userid").toString();

			// 배열로 만들어 time value값 가져오기
			String aa = request.getParameter("arrychktime");
			String[] imsi = aa.split(",");

			rvo.setUserid(userid);
			rvo.setTname(request.getParameter("tname"));

			mapper.reserveSeater(rvo); // 유저아이디 값 들어간 예약테이블
			// tablename 테이블에 시간 추가 적기(배열이용하기)
			for (int i = 0; i < imsi.length; i++) {
				if (imsi[i].equals("1")) {
					mapper.updateTableName("time" + (i + 9), rvo.getTname()); // time+숫자 , tname 사용
				}
			}

			return "redirect:/seat/reserveok?userid=" + userid;
		}
	}

		@Override
		public String reserveok(HttpServletRequest req, Model model) {
			String userid = req.getParameter("userid");

			model.addAttribute("userid", userid);
			ReserveSeatVo rvo = mapper.reserveok(userid);
			model.addAttribute("rvo", rvo);

			// 시간 값이 int로 들어가서 값을 스트링으로 들여보내려고 노가다함.
			HashMap<String, String> timelist = new HashMap<String, String>();

			String time = "";
			int time9 = rvo.getTime9();
			int time10 = rvo.getTime10();
			int time11 = rvo.getTime11();
			int time12 = rvo.getTime12();
			int time13 = rvo.getTime13();
			int time14 = rvo.getTime14();
			int time15 = rvo.getTime15();
			int time16 = rvo.getTime16();
			int time17 = rvo.getTime17();
			int time18 = rvo.getTime18();

			if (time9 == 1)
				time = time + "9시~10시,";
			if (time10 == 1)
				time = time + "10시~11시,";
			if (time11 == 1)
				time = time + "11시~12시,";
			if (time12 == 1)
				time = time + "12시~13시,";
			if (time13 == 1)
				time = time + "13시~14시,";
			if (time14 == 1)
				time = time + "14시~15시,";
			if (time15 == 1)
				time = time + "15시~16시,";
			if (time16 == 1)
				time = time + "16시~17시,";
			if (time17 == 1)
				time = time + "17시~18시,";
			if (time18 == 1)
				time = time + "18시~19시,";

			time = time.substring(0, time.length() - 1); // 마지막 ,를 자르기 위해 사용

			timelist.put("time", time);

			model.addAttribute("timelist", timelist);

			return "/seat/reserveok";
		}

	

}
