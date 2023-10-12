package com.example.demo.vo;

import lombok.Data;

@Data
public class BookRequestVo {
	private int no,gonge;
	private String title,writer,writeyear,publi,ect,userid,writeday;
	private int state;
	
	private String type; // 검색 타입
	private String keyword; // 검색 내용
}
