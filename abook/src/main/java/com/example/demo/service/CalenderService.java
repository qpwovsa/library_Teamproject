package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


public interface CalenderService {
	public String calenderTab();
	public ArrayList<HashMap> cal2(HttpServletRequest request,Model model);
	public String calenderMain();
}
