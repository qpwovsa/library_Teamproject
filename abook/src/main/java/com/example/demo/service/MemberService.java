package com.example.demo.service;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.example.demo.vo.MemberVo;

public interface MemberService {	
	public String member();
    public int useridCheck(MemberVo mvo);
    public String memberOk(MemberVo mvo,HttpServletRequest request);
    public String login(Model model,HttpServletRequest request);
    public String loginOk(MemberVo mvo, HttpSession session,HttpServletRequest request);
    public String logout(HttpSession session);
    public String idfind();
    public String idcheck(HttpServletRequest request);
    public String pwdfind();
    public String pwdcheck(HttpServletRequest request);
    public String newPwdCheck(HttpServletRequest request);
    public String updatePwd(MemberVo mvo);
    public String mypage(MemberVo mvo,HttpSession ss,Model model);
    public String mypageUpdateOk(MemberVo mvo,HttpSession ss,HttpServletRequest req);
}
