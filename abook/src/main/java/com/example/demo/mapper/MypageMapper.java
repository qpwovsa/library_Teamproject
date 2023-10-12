package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.InquiryVo;
import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

@Mapper
public interface MypageMapper {
	public ArrayList<ReserveSeatVo> reserveok(String userid);
	public ArrayList<ReserveSeatVo> reserveToday(String userid, String today);
	public void cancelSeat(String no);
	public void resetTablename(String time,String tname);
	// 0909 ksy 백업
	public ArrayList<HashMap> bookreserve(String userid);
	public ArrayList<HashMap> bookloan(String userid);
	public ArrayList<HashMap> bookrefuse(String userid);
	public void brsvCancel(String bcode);
	public void changeState(String bcode);
	public void giganUpdate(String no);
	public void returnOk(String no);
	public int getChongjjim(String userid);
	public ArrayList<HashMap> loanlist(String userid,@Param("start") int start);
	// jjim추가 0911
	public ArrayList<HashMap> myjjim(String userid);
	// inquiry 추가 0917
	public ArrayList<InquiryVo> myinquiry1(String userid);
	public ArrayList<InquiryVo> myinquiry2(String userid);
	// mypage 페이지 처리 시작
	public int getChongSeat(String userid);
	public int getChongloan(String userid);
	public int getChongInquiry(String userid);

}
