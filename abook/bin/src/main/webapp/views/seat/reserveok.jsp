<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#rsvOkWrap{
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	}
	#outer {
	    font-size: 19px;
	    margin-top: 20px;
	    font-family: 'NotoSansM';
	    color: #555;
	}
	#rsvOkWrap h3{
		color:#333;
		font-size:25px;
		font-family: NotoSansM;
		margin-bottom: 20px;
	}
	#conBox {
		padding: 50px 0;
	}
	#conBox img{
		position: relative;
    	left: -10px;
    	width: 130px;
	}
	.mr{
		margin-right: 10px;
	}
	#conBox span{
		color:#333;
	}
	.pp{
		font-size: 15px;
	    margin-top: 30px;
	    color: #777;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>열람실이용</span></h2>
				<ul id="lnb">
					<li><a href="/seat/rulelibrary"><span>이용규칙</span></a></li>
					<li><a href="/seat/chkReserveSeat"><span>좌석예약</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>좌석예약</h3>
					<p>열람실 이용&nbsp;&nbsp;>&nbsp;&nbsp;좌석예약&nbsp;&nbsp;>&nbsp;&nbsp;예약완료</p>
				</div>
				<div id="contents">
						<div id="rsvOkWrap">
							<div id="conBox">
								<h3>예약이 완료 되었습니다.</h3>
								<img src="/static/img/member/ico_result.png">
								<div id="outer">
									예약좌석 : <span class="mr">${rvo.tname}번</span>
									예약시간 : <span>${timelist.time}</span>
								</div>	
								<div class="pp">예약취소는 마이페이지 > 좌석예약 에서 가능합니다.</div>						
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>