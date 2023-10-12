package com.example.demo.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.mapper.CalenderMapper;

@Service
@Qualifier("cc")
public class CalenderServiceImpl implements CalenderService {

	@Autowired
	private CalenderMapper mapper;

	@Override
	public String calenderTab() {
		
		return "calender/calenderTab";
	}

	@Override
	public ArrayList<HashMap> cal2(HttpServletRequest request,Model model) {
		
		String y=request.getParameter("y");
		int m=Integer.parseInt(request.getParameter("m"));
		
		String mm=String.format("%02d", m);
		
		ArrayList<HashMap> mapall=mapper.Cal2(y+"-"+mm);
		
		return mapall;
	}

	@Override
	public String calenderMain() {
		
		return "/calender/calenderMain";
	}

	
}
