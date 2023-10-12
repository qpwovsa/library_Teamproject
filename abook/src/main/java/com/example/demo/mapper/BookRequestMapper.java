package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.BookRequestVo;
import com.example.demo.vo.BookregiVo;

@Mapper
public interface BookRequestMapper {
	public void requestwrite_ok(BookRequestVo brvo);
	public int getChong();
	public BookRequestVo rcontent(BookRequestVo brvo);
	public BookRequestVo rupdate(String no);
	public void rupdate_ok(BookRequestVo brvo);
	public void delete(BookRequestVo brvo);
	public ArrayList<BookRequestVo> search(String type,String keyword,int start);
	public ArrayList<BookRequestVo> list2(String keyword,int start);
	public int getChong2(String type,String keyword);
	public int getChong3(String keyword);
}
