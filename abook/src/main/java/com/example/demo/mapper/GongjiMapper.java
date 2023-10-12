package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.GongjiVo;

@Mapper
public interface GongjiMapper {
	public int getChong();
	public int getChong2(String type,String keyword);
	public int getChong3(String keyword);
	public ArrayList<GongjiVo> list(String type,String keyword,int start);
	public ArrayList<GongjiVo> list2(String keyword,int start);
	public void readnum(String no);
	public GongjiVo content(GongjiVo gvo);
}
