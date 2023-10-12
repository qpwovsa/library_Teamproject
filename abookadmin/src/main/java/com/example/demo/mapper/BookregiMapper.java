package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.BookregiVo;

@Mapper
public interface BookregiMapper {
	public void write_ok(BookregiVo bvo);
	public String getCode();
	public ArrayList<BookregiVo> list(String type,String keyword,int start);
	public ArrayList<BookregiVo> list2(String keyword,int start);
	public int getChong();
	public Integer getChong2(String type, String keyword);
	public Integer getChong3(String type);
	public ArrayList<BookregiVo> content(String bcode);
	// 0909 ksy
	public BookregiVo getlist(String bcode);
	public void add(BookregiVo bvo);
	public void beaUpdate(String bcode,int n);
	public void del(String bcode);
	public int getcnt(String bcode);
	
	public BookregiVo getValueBrvo(String brno);
	public void chgStateBookrequest(String brno);
}
