<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#MemberWrap{
		padding-bottom:80px; 
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
	table#table2,
	table#table3{
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
	}
	.backbtn{
		display: inline-block;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    color: #71757b;
	    padding: 0 20px;
	    line-height: 43px;
	    height: 45px;
	    margin-bottom: 30px;
	}
	.el{
		width: 445px;
	    padding: 0 20px;
	    box-sizing: border-box;
	    height: 100%;
	    line-height: 60px;
	    text-align: left;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	.tt_l{
		width: 725px;
	    padding: 0 20px;
	    box-sizing: border-box;
	    height: 100%;
	    line-height: 60px;
	    text-align: left;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>회원관리</span></h2>
				<ul id="lnb">
					<li class="on"><a href="/member/member"><span>회원조회</span></a></li>
					<li><a href="/member/memberBan"><span>임시정지/삭제</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>회원관리</h3>
					<p>회원 관리&nbsp;&nbsp;>&nbsp;&nbsp;회원조회</p>
				</div>
				<div id="contents">
				<a href="/member/member" class="backbtn">목록가기</a>
					<div id="MemberWrap">
						<h4>${map.name}님의 상세정보</h4>
						<table id="table1">
								<tr>
									<td width="150">아이디</td>
									<td width="160">이름</td>
									<td width="180">전화번호</td>
									<td width="250">이메일</td>
									<td>주소</td>
									<td width="150">가입일</td>
								</tr>
								<tr>
									<td>${map.userid}</td>
									<td>${map.name}</td>
									<td>${map.phone}</td>
									<td>${map.email1}@${map.email2}</td>
									<td>${map.addr} ${map.addtDtl}</td>
									<td>${map.writeday}</td>
								</tr>
						</table>
						<h4>작성글</h4>
						<table id="table2">
							<tr>
								<td>제목</td>
								<td width="180">등록일</td>
								<td width="100">조회수</td>
								<td width="180">답변 상태</td>
							</tr>
							<c:if test="${ilist.size()==0}">
							<tr>
								<td colspan="4" class="no">※현재 문의하신 내역이 없습니다</td>
							</tr>
							</c:if>
							<c:if test="${ilist.size()!=0}">
							<c:forEach items="${ilist}" var="ivo">
							<tr>
								<td><div class="tt_l"><a href="/inquiry/content?no=${ivo.no}&mchk=1">${ivo.title}</a></div></td>
								<td>${ivo.writeday }</td>
								<td>${ivo.readnum}</td>
								<td>
								<c:if test="${ivo.state==0}">
									답변 대기
								</c:if>
								<c:if test="${ivo.state==1}">
									답변 완료
								</c:if>
								</td>
							</tr>
							</c:forEach>
							</c:if>	
						</table>
						<h4>대출이력</h4>
						<table id="table3">
							<tr>
								<td>도서명</td>
								<td width="170">출판사</td>
								<td width="170">저자</td>
								<td width="200">대출일</td>
								<td width="200">반납일</td>
							</tr>
							<c:if test="${blist.size()==0}">
							<tr>
								<td colspan="5" class="no">※현재 대출이력이 없습니다.</td>
							</tr>
							</c:if>
							<c:if test="${blist.size()!=0}">
							<c:forEach items="${blist}" var="bvo">
							<tr>
								<td><div class="el">${bvo.title}</div></td>
								<td>${bvo.publi}</td>
								<td>${bvo.writer}</td>
								<td>${bvo.rental}</td>
								<td>${bvo.writeday}</td>
							</tr>
							</c:forEach>
							</c:if>
						</table>
						<h4>좌석예약이력</h4>
						<table id="table4">
							<tr>
								<td width="180">예약좌석</td>
								<td>예약시간</td>
								<td width="180">예약일</td>
							</tr>
						<c:if test="${rlist.size()==0}">
							<td colspan="3" class="no">※ 예약이력이 없습니다.</td>
						</c:if>
						<c:forEach items="${rlist}" var="rvo" varStatus="status">
							<tr>
								<td>${rvo.tname}</td>
								<td>${timelist.get(status.index)}</td>
								<td>${rvo.reserveday}</td>
							</tr>
						</c:forEach>
						</table>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>