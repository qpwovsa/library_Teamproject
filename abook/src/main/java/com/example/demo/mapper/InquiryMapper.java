package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.InquiryVo;
import com.example.demo.vo.MtmVo;

@Mapper
public interface InquiryMapper {
	public int getChong();
	public ArrayList<InquiryVo> list(String type,String keyword,int start);
	public ArrayList<InquiryVo> list2(String keyword,int start);
	public void writeOk(InquiryVo ivo);
	public void setRownum(int r);
	public void readnum(String no);
	public InquiryVo content(String no);
	public void delete(String no);
	public void update(InquiryVo ivo);
	public void updateOk(InquiryVo ivo);
	public MtmVo getAnswer(String no);
	public InquiryVo getState(int state,int no);
	public MtmVo getMtm(MtmVo mvo);
	public int getChong2(String type,String keyword);
	public int getChong3(String keyword);
}
