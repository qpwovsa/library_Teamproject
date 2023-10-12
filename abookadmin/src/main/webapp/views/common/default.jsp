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
	nav .tt{
		width: 1500px;
	    height: 100%;
	    display: flex;
	    margin: auto;
	}
	nav .tt > span{
		font-family: NotoSansM;
	    font-size: 18px;
	    color: #fff;
	    line-height: 80px;
	    cursor: default;
	}
	nav .tt > ul{
		width: 1100px;
		height: 80px;
		display: flex;
    	justify-content: space-between;
    	align-items: center;
    	margin: auto;
	}
	nav .tt > ul > li{
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
	nav .tt > ul > li.on{
		color:#ad73f2;
	}
	nav .tt > ul > li > a{
	    display: inline-block;
		width: 100%;
	    height: 100%;
	}
	nav .tt > ul > li > a:before {
	    content: '';
	    display: block;
	    position: absolute;
	    bottom: 0;
	    right: 50%;
	    left: 50%;
	    height: 7px;
	    transition: right 0.3s ease, left 0.3s ease;
	}
	nav .tt > ul > li.on > a:before {
	    left: 0;
	    right: 0;
	}
	nav .tt > ul > li > a:before {
    	background-color: #744da2;
	}
	nav .tt > ul > li > ul {
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
	    background-color: #59387f;
	}
	nav .tt > ul > li.on > ul {
	    top: 80px;
	    opacity: 1;
	    visibility: visible;
	    transition: all .3 ease-in-out;
	}
	nav .tt > ul > li > ul > li {
    	margin: 0 23px 0 17px;
    	border-bottom: 1px solid #735694;
    	height: 44px;
	}	
	nav .tt > ul > li > ul > li > a {
	    display: block;
	    text-align: center;
	    text-decoration: none;
	    font-size: 16px;
	    color: #d9cfe3;
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
		$("nav .tt > ul > li").hover(function(){
			$(this).addClass('on').siblings().removeClass('on');
		}, function(){
			$(this).removeClass('on');
		}); 
	});
</script>
<sitemesh:write property="head"/>
</head>
<body>
	<nav>
		<div class="tt">
			<span>관리자페이지</span>
			<ul>
				<li class="gnbMenu">
					<a href="/bookregi/list">도서 관리</a>
					<ul>
						<li><a href="/bookregi/list">도서등록</a></li>
						<li><a href="/reservestatus/list">예약현황</a></li>
						<li><a href="/loanstatus/list">대출현황</a></li>
						<li><a href="/loanlist/list">대출이력</a></li>
						<li><a href="/bookrequest/hopelist">희망도서</a></li>
					</ul>
				</li>
				<li class="gnbMenu">
					<a href="/member/member">회원 관리</a>
					<ul>
						<li><a href="/member/member">회원조회</a></li>
						<li><a href="/member/memberBan">임시정지/삭제</a></li>
					</ul>
				</li>
				<li class="gnbMenu">
					<a href="/rsvseat/reserveseat">좌석 관리</a>
					<ul>
						<li><a href="/rsvseat/reserveseat">사용불가 지정</a></li>
						<li><a href="/rsvseat/cancelseat">퇴실처리</a></li>
					</ul>
				</li>
				<li class="gnbMenu">
					<a href="/gongji/list">게시판 관리</a>
					<ul>
						<li><a href="/gongji/list">공지사항</a></li>
						<li><a href="/inquiry/list">문의사항</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<sitemesh:write property="body"/>
</body>
</html>