<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#MypageWrap{
		padding-bottom:30px; 
	}
	h4{
		font-size: 20px;
    	font-family: 'NotoSansM';
	}
	table{
		border-bottom: 1px solid #ddd;
    	border-top: 2px solid #cecece;
    	margin-top:30px;
		text-align: center;
	}
	table tr td {
    	border-bottom: 1px solid #ddd;
    	letter-spacing: 0.5px;
	}
	table tr:last-child td{
		border-bottom: none;
	}
	table#table1,
	table#table2{
		margin-bottom: 110px;
	}
	table tr:first-child td {
	    background-color: #f9f9fb;
	    border-bottom: 1px solid #ddd;
	    height: 55px;
	    color: #333;
	    font-family: 'NotoSansM';
	    text-align: center;
	} 
	table tr td{
		height: 60px;
	}
	table tr td.no{
		color: #666;
    	font-size: 14px;
    	text-align: center;
	}
	.tb1_tt{
		width: 350px;
		padding:0 20px;
		box-sizing: border-box;
		height: 100%;
		line-height: 60px;
		text-align: left;
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	.tb2_tt{
		width: 500px;
		padding:0 20px;
		box-sizing: border-box;
		height: 100%;
		line-height: 60px;
		text-align: left;
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	.tb3_tt{
		width: 340px;
		padding:0 20px;
		box-sizing: border-box;
		height: 100%;
		line-height: 60px;
		text-align: left;
		overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	#btn,
	#rebtn,
	#giganbtn{
		background: #fff;
	    border: 1px solid #967759;
	    color: #967759;
	    font-size: 14px;
	    width: 110px;
	    height: 40px;
	    border-radius: 3px;
	}
	.fs14{
		font-size: 14px;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>마이페이지</span></h2>
				<ul id="lnb">
					<li><a href="/mypage/mypage"><span>회원정보수정</span></a></li>
					<li><a href="/mypage/checkReserveSeat"><span>좌석예약현황</span></a></li>
					<li class="on"><a href="/mypage/bookreserve"><span>도서예약현황</span></a></li>
					<li><a href="/mypage/loanlist"><span>도서대출이력</span></a></li>
					<li><a href="/mypage/myjjim">도서찜리스트<span></span></a></li>
					<li><a href="/mypage/myinquiry"><span>문의현황</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서예약현황</h3>
					<p>마이페이지&nbsp;&nbsp;>&nbsp;&nbsp;도서 예약현황</p>
				</div>
				<div id="contents">
					<div id="MypageWrap">
						<h4>예약현황</h4>
						<table id="table1">
							<tr>
								<td width="350">도서명</td>
								<td width="190">출판사</td>
								<td width="160">저자</td>
								<td width="170">예약일</td>
								<td width="150">처리상태</td>
								<td width="150">예약취소</td>
							</tr>
						<c:if test="${mapall.size()==0}">
							<tr>
								<td colspan="6" class="no">※ 예약중인 도서가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${mapall.size()!=0}">
						<c:forEach items="${mapall}" var="map">
							<tr>
								<td><div class="tb1_tt">${map.title}</div></td>
								<td>${map.publi}</td>
								<td>${map.writer}</td>
								<td>${map.writeday}</td>
								<td>승인대기</td>
								<td>
									<input type="button" value="예약취소" id="btn" onclick="location='brsvCancel?bcode=${map.bcode}'">
								</td>
							</tr>
						</c:forEach>
						</c:if>
						</table>
						<h4>예약승인거절</h4>
						<table id="table2">
							<tr>
								<td width="500">도서명</td>
								<td width="190">출판사</td>
								<td width="160">저자</td>
								<td width="170">예약일</td>
								<td width="150">처리상태</td>
							</tr>
						<c:if test="${mapall2.size()==0}">
							<tr>
								<td colspan="6" class="no">※ 예약승인 거절된 도서가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${mapall2.size()!=0}">
							<c:forEach items="${mapall2}" var="map">
							<tr>
								<td><div class="tb2_tt">${map.title}</div></td>
								<td>${map.publi}</td>
								<td>${map.writer}</td>
								<td>${map.writeday}</td>
								<td>승인거절</td>
							</tr>
						</c:forEach>
						</c:if>
						</table>
						<h4>대출현황</h4>
						<table id="table3">
							<tr>
								<td>도서명</td>
								<td>출판사</td>
								<td>대출일</td>
								<td>반납일</td>
								<td>도서반납</td>
								<td>대출연장</td>
							</tr>
						<c:if test="${mapall3.size()==0}">
							<tr>
								<td colspan="7" class="no">※ 대출중인 도서가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${mapall3.size()!=0}">
						<c:forEach items="${mapall3}" var="map">
							<tr>
								<td width="340"><div class="tb3_tt">${map.title}</div></td>
								<td width="190">${map.publi}</td>
						 		<td width="170">${map.rental}</td>
								<td width="170">${map.returnday}</td>
								<td width="150">
									<input type="button" value="반납하기" id="rebtn" onclick="location='returnOk?no=${map.no}&bcode=${map.bcode}'">									
								</td>
								<td width="150">
								<c:if test="${map.gigan==0}">
									<input type="button" value="대출연장" id="giganbtn" onclick="location='giganUpdate?no=${map.no}'">						
								</c:if>
								<c:if test="${map.gigan!=0}">
									<div class="fs14">대출연장불가</div>						
								</c:if>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						</table>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>