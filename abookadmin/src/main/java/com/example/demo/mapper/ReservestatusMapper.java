package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.BookregiVo;
import com.example.demo.vo.ReservestatusVo;

@Mapper
public interface ReservestatusMapper {
	public ArrayList<HashMap> list(int start);
	public void rcheck(String bcode);
	public BookregiVo getbook(String bcode);
	public void setloan(String bcode,String userid,String title,String publi,String writer);
	public void delbreserve(String bcode);
	public void dcheck(String bcode);
	public void setbrefuse(String bcode,String userid,String writeday,String title,String publi,String writer);
	public void cntupdate(String bcode);
	public int getChong();
}
