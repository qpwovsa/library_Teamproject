package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BookLoanVo;

@Mapper
public interface LoanlistMapper {
	public int getChong();
	public ArrayList<BookLoanVo> list(int start);	
}
