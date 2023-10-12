<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#cancelWrap{
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
	}
	table tr:last-child td{
		border-bottom: none;
	}
	table#table1{
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
		letter-spacing: 0.5px;
	}
	table tr td.no{
		color: #666;
    	font-size: 14px;
	}
	.btn{
		cursor: pointer;
	    font-size: 14px;
	    display: inline-block;
	    border: 1px solid #3d6cc4;
	    border-radius: 3px;
	    color: #3d6cc4;
	    width:110px;
	    line-height: 40px;
	    height: 40px;
	    background: #fff;
	    margin-right: 5px;
	}
	/*page버튼처리*/
	#btWrap{
		margin-top:	30px;
		position:	relative;
		height:	50px;
		text-align:	center;
	}
	#pageCon{
		margin:	auto;
	}
	#pageCon a{
		display:inline-block;
		width:30px;
		font-size: 14px;
		color:#666;
		line-height:30px;
		text-align:	center;
		vertical-align:	top;
	}
	#pageCon .btnPage{
		width: 30px;
	    height: 30px;
	    line-height: 30px;
	    border: 1px solid #ddd;
	    background: url(/static/img/common/arr_sp.png) 50% 0 no-repeat;
	}
	#pageCon .btnPage.prev{
		margin-right: 5px;
    	background-position-y: -27px;
	}
	#pageCon .btnPage.next{
		margin-left: 5px;
    	background-position-y: -52px;
	}
	#pageCon .btnPage.last{
		background-position-y: -77px;
	}
	#pageCon .btnPage.dis{
		pointer-event:none;
		cursor:default;
	}
</style>
</head>
<body>
<div id="secWrap">
	<div class="sImg"></div>
	<div id="section">
		<div id="labNav">
			<h2><span>좌석관리</span></h2>
			<ul id="lnb">
				<li><a href="reserveseat"><span>사용불가 지정</span></a></li>
				<li class="on"><a href="cancelseat"><span>퇴실처리</span></a></li>
			</ul>
		</div>
		<div id="contentCore">
				<div class="naviTit">
					<h3>퇴실처리</h3>
					<p>좌석 관리&nbsp;&nbsp;>&nbsp;&nbsp;퇴실처리</p>
				</div>
				<div id="contents">
					<div id="cancelWrap">
						<h4>금일 예약현황</h4>
						<table id="table1"> <!-- 금일 예약 테이블 -->
							<tr>
								<td width="230">예약자</td>
								<td width="300">예약좌석</td>
								<td width="425">예약시간</td>
								<td width="230">예약취소</td>
							</tr>
							<c:if test="${rlist2.size()==0}">
							<tr>
								<td colspan="4" class="no">※ 금일 예약 내역이 없습니다.</td>
							</tr>
							</c:if>
							<c:if test="${rlist2.size()!=0}">
							<c:forEach items="${rlist2}" var="rvo2" varStatus="sts">
							<tr>
								<td>${rvo2.userid}</td>
								<td>${rvo2.tname}</td>
								<td>${timelists.get(sts.index)}</td>
								<td><input type="button" value="예약취소" onclick="location='cancelSeat?no=${rvo2.no}&tn=${tntimes.get(sts.index)}&tname=${rvo2.tname}'" class="btn"></td>
							</tr>
							</c:forEach>
							</c:if>							
						</table>
						<h4>전체 예약현황</h4>
						<table id="table2"> <!-- 전체 예약 테이블 -->			
							<tr>
								<td width="230">예약자</td>
								<td width="300">예약좌석</td>
								<td width="230">예약일</td>
								<td width="425">예약시간</td>
							</tr>
							<c:if test="${rlist.size()==0}">
							<tr>
								<td colspan="4" class="no">※ 전체 예약 내역이 없습니다.</td>
							</tr>
							</c:if>
							<c:if test="${rlist.size()!=0}">
							<c:forEach items="${rlist}" var="rvo" varStatus="status">
							<tr>
								<td>${rvo.userid}</td>
								<td>${rvo.tname}</td>
								<td>${rvo.reserveday}</td>
								<td> ${timelist.get(status.index)}</td>
							</tr>
							</c:forEach>
							</c:if>
						</table>
						<div id="btWrap">
						<c:if test="${!empty rlist}">
							<div id="pageCon">
							<c:if test="${pstart!=1}">
								<a href="cancelseat?page=${pstart-1}" class="btnPage"></a>
							</c:if>
							<c:if test="${pstart==1}">
								<a class="btnPage dis"></a>
							</c:if>
							
							<c:if test="${page!=1}">
								<a href="cancelseat?page=${page-1}" class="btnPage prev"></a>
							</c:if>
							<c:if test="${page==1}">
								<a class="btnPage dis prev"></a>
							</c:if>
							
							<c:forEach begin="${pstart}" end="${pend}" var="i">
								<c:if test="${page!=i}">
									<a href="cancelseat?page=${i}">${i}</a>
								</c:if>
								<c:if test="${page==i}">
									<a href="cancelseat?page=${i}" style="background-color:	#555;color:#fff">${i}</a>
								</c:if>
							</c:forEach>
							
							<c:if test="${page!=chong}">
								<a href="cancelseat?page=${page+1}" class="btnPage next"></a>
							</c:if>
							<c:if test="${page==chong}">
								<a class="btnPage next dis"></a>
							</c:if>
							
							<c:if test="${pend!=chong}">
								<a href="cancelseat?page=${pend+1}" class="btnPage last"></a>
							</c:if>
							<c:if test="${pend==chong}">
								<a class="btnPage last dis"></a>
							</c:if>
							</div>
						</c:if>
						<c:if test="${empty mlist}">
						</c:if>
						</div>				
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>