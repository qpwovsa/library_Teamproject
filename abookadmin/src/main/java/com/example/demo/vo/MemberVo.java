package com.example.demo.vo;

import lombok.Data;

@Data
public class MemberVo {
	
	private int no;
	
	private String userid,name,pwd,phone,email1,email2,zip,addr,addrDtl,writeday;

	// 임시정지용 필드 2개 추가
	private int ban;
	private String breason;
	
 }
