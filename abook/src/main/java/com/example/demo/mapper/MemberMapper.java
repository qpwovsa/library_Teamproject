package com.example.demo.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.vo.MemberVo;

@Mapper
public interface MemberMapper {	
	 public int useridCheck(MemberVo mvo);
	 public void memberOk(MemberVo mvo);
	 public String loginOk(MemberVo mvo);
	 public String idcheck(String name,String phone);
	 public String pwdcheck(String userid,String name,String phone);
	 public String newPwdCheck(String userid);
	 public void updatePwd(MemberVo mvo);
	 public MemberVo mypage(String userid);
	 public void mypageUpdateOk(MemberVo mvo);
	 public void mypageUpdateOk2(MemberVo mvo);
	 public String getBreason(String userid);
	 public String getBan(String userid);
	 public String checkUserid(String userid);
}
