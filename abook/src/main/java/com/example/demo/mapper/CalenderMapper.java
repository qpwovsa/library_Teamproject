package com.example.demo.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalenderMapper {
	public ArrayList<HashMap> Cal2(String day);
}
