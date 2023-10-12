package com.example.demo.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.GongjiVo;

@Mapper
public interface GongjiMapper {
	public ArrayList<GongjiVo> list(String type,String keyword,int start);
	public ArrayList<GongjiVo> list2(String keyword,int start);
	public void writeOk(GongjiVo gvo);
	public GongjiVo content(String no);
	public void delete(GongjiVo gvo);
	public void update(GongjiVo gvo);
	public void updateOk(GongjiVo gvo);
	public int getChong();
	public void readnum(String id);
	public int getChong2(String type,String keyword);
	public int getChong3(String keyword);
}
