package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BookLoanVo;

@Mapper
public interface LoanstatusMapper {
	public ArrayList<BookLoanVo> list(int start);
	public void loanBook(String no);
	public void chgStateBookregi(String bcode);
	public ArrayList<BookLoanVo> allList(int start);
	public int getChong();
}
