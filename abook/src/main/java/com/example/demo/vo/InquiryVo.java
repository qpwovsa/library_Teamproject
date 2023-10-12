package com.example.demo.vo;

import lombok.Data;

@Data
public class InquiryVo {
	private int no,readnum,rnum,state,gonge;
	private String title,content,userid,writeday;
	private String type,keyword;
}
