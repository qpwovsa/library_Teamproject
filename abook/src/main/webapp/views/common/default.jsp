<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/static/css/common.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
	header{
		width: 100%;
		height: 80px;
		line-height: 80px;
		position: relative;
	}
	header h1{
		position: absolute;
	    top: -7px;
	    left: 100px;
	    width: 210px;
	}
	header h1 a{
		width: 100%;
    	display: inline-block;
	}
	header h1 a img{
		width: 100%;
	}
	header #sign{
		position: absolute;
		top: 0;
		right: 100px;
	}
	#sign a{
		padding: 0 10px;
    	height: 100%;
    	display: inline-block;
	}
	nav{
		width: 100%;
		height: 80px;
		background: #171d33;
	}
	nav > ul{
		width: 1300px;
		height: 80px;
		display: flex;
    	justify-content: space-between;
    	align-items: center;
    	margin: auto;
	}
	nav > ul > li{
		display: inline-block;
	    position: relative;
	    text-align: center;
	    height: 100%;
	    line-height: 80px;
	    font-family: NotoSansM;
	    font-size: 18px;
	    padding: 0 50px;
	    color:#fff;
	}
	nav > ul > li.on{
		color:#c5425a;
	}
	nav > ul > li > a{
	    display: inline-block;
		width: 100%;
	    height: 100%;
	}
	nav > ul > li > a:before {
	    content: '';
	    display: block;
	    position: absolute;
	    bottom: 0;
	    right: 50%;
	    left: 50%;
	    height: 7px;
	    transition: right 0.3s ease, left 0.3s ease;
	}
	nav > ul > li.on > a:before {
	    left: 0;
	    right: 0;
	}
	nav > ul > li > a:before {
    	background-color: #ab3b4f;
	}
	nav > ul > li > ul {
	    position: absolute;
	    left: 0;
	    opacity: 0;
	    visibility: hidden;
	    top: 80px;
	    width: 100%;
	    padding-top: 7px;
	    padding-bottom: 25px;
	    box-shadow: 0px 10px 10px -3px rgba(0, 0, 0.6, 0.4);
	    z-index: 150;
	    background-color: #8c2b34;
	}
	nav > ul > li.on > ul {
	    top: 80px;
	    opacity: 1;
	    visibility: visible;
	    transition: all .3 ease-in-out;
	}
	nav > ul > li > ul > li {
    	margin: 0 23px 0 17px;
    	border-bottom: 1px solid #a7454e;
    	height: 44px;
	}	
	nav > ul > li > ul > li > a {
	    display: block;
	    text-align: center;
	    text-decoration: none;
	    font-size: 16px;
	    color: #f7eee7;
    	height: 44px;
    	line-height: 44px;
	}
	footer{
		width: 100%;
		background: #f1f1f1;
		padding:20px 0;
		margin-top: 80px;
		font-size:14px;
		cursor: default;
	}
	.fWrap{
		width:1500px;
		margin:auto;
		position: relative;
	}
	.fWrap .fMenu{
		color:#515151;
		padding-bottom: 25px;
		text-align: center;
		font-size: 13px;
	}
	.fMenu span{
		display: inline-block;
		width: 35px;
	}
	.ftxt{
		color: #515151;
	    text-align: center;
	    font-size: 13px;
	}
	.ftxt p{
		margin-bottom: 5px;
	}
	.ftxt p span{
		margin-left: 15px;
	}
	.mr13{
		margin-right: 13px;
		cursor: default;
	}
</style> 
<script>
	/*탭 메뉴*/
	$(function(){
		$("nav > ul > li").hover(function(){
			$(this).addClass('on').siblings().removeClass('on');
		}, function(){
			$(this).removeClass('on');
		}); 
	});
</script>
<sitemesh:write property="head"/>
</head>
<body>
	<header>
		<h1><a href="../main/main"><img src="/static/img/common/logo.png"></a></h1>
		<div id="sign">
		<c:if test="${userid==null}">
			<a href="../member/login">로그인</a>
			<a href="../member/member">회원가입</a>
		</c:if>
		<c:if test="${userid!=null}">
			<span class="mr13">${name}님</span>
			<a href="../member/logout">로그아웃</a>
			<a href="../mypage/mypage">마이페이지</a>
		</c:if>
		</div>
	</header>
	<nav>
		<ul>
			<li class="gnbMenu">
				<a href="/introduce/intro">도서관 소개</a>
				<ul>
					<li><a href="/introduce/intro">인사말</a></li>
					<li><a href="/introduce/location">오시는 길</a></li>
				</ul>
			</li>
			<li class="gnbMenu">
				<a href="/breserve/list">도서관 이용</a>
				<ul>
					<li><a href="/breserve/list">도서 예약</a></li>
					<li><a href="/bookrequest/rlist">도서 신청</a></li>
				</ul>
			</li>
			<li class="gnbMenu">
				<a href="/seat/rulelibrary">열람실 이용</a>
				<ul>
					<li><a href="/seat/rulelibrary">이용 규칙</a></li>
					<li>
					<c:if test="${userid!=null}">
					<a href="/seat/chkReserveSeat">좌석 예약</a>
					</c:if>
					<c:if test="${userid==null}">
					<a href="/member/login?rchk=1" onclick="alert('비로그인 상태에서는 예약할 수 없습니다.')">좌석 예약</a>
					</c:if>
					</li>
				</ul>
			</li>
			<li class="gnbMenu">
				<a href="/gongji/list">열린 공간</a>
				<ul>					
					<li><a href="/gongji/list">공지사항</a></li>
					<li><a href="/inquiry/list">문의사항</a></li>
				</ul>
			</li>
			<li class="gnbMenu">
				<a href="/calender/calenderTab">도서관 일정</a>
			</li>
		</ul>
	</nav>
	<sitemesh:write property="body"/>
	<footer>
		<div class="fWrap">
			<p class="fMenu">개인정보처리방침<span></span>이메일주소무단수집거부<span></span>이용약관<span></span>도서관법령<span></span>사전정보공개<span></span>저작권정책</p>
			<div class="ftxt">
				<p>작은도서관<span>경기도 파주시 문화로 85(금촌동) 10929 한국</span>전화번호<span>031-123-4567</span></p>
				<p></p>
				<p class="pco">Copyrightⓒ Small Library of Korea. All rights reserved.</p>
			</div>		
		</div>
	</footer>
</body>
</html>