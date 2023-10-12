package com.example.demo.vo;

import lombok.Data;

@Data
public class InquiryVo {
	private int no,readnum,grp,seq,rnum,state;
	private String title,content,userid,writeday,name;
	private String type,keyword;
}
