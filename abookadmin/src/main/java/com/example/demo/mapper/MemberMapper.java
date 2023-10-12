package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.BookLoanVo;
import com.example.demo.vo.InquiryVo;
import com.example.demo.vo.MemberVo;
import com.example.demo.vo.ReserveSeatVo;

@Mapper
public interface MemberMapper {
	public int getChong();
	public ArrayList<MemberVo> memberAll(@Param("start")int start);
	public HashMap detail(String userid);
	public ArrayList<ReserveSeatVo> rSeat(String userid);
	public void banOk(String userid,String breason);
	public void unsusBan(String userid);
	public ArrayList<BookLoanVo> bLoan(String userid);
	public ArrayList<InquiryVo> myInquiry(String userid);
}
