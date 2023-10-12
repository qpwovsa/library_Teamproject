package com.example.demo.vo;

import lombok.Data;

@Data
public class BookLoanVo {

	private int no,state,gigan;
	private String userid,bcode,rental,returnday,title,publi;
	private String writer,writeday;
}
