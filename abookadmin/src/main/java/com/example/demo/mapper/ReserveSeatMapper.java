package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.ReserveSeatVo;
import com.example.demo.vo.TableNameVo;

@Mapper
public interface ReserveSeatMapper {
	public void stopTable(String tname);
	public void startTable(String tname);
	public ArrayList<TableNameVo> searchTable();
	public ArrayList<ReserveSeatVo> searchReserve1(@Param("start")int start);
	public ArrayList<ReserveSeatVo> searchReserve2(String today);
	public void resetTablename(String time,String tname);
	public void cancelSeat(String no);
	public int getChong1();
}
