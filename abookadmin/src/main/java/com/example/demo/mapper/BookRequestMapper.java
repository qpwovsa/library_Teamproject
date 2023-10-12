package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.BookRequestVo;

@Mapper
public interface BookRequestMapper {
	public int getChong();
	public ArrayList<BookRequestVo> hopelist(BookRequestVo brvo,@Param("start")int start);
	public void cancelBrequest(String brno);
}
