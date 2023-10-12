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
		margin-bottom: 50px;
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
	table tr:first-child td {
	    background-color: #f9f9fb;
	    border-bottom: 1px solid #ddd;
	    height: 55px;
	    color: #333;
	    font-family: 'NotoSansM';
	    text-align: center;
	} 
	table tr {
		height:60px;
	}
	table tr:first-child{
		height: 55px;
	}
	.btn{
		background: #fff;
	    border: 1px solid #4379d6;
	    color: #4379d6;
	    font-size: 14px;
	    width: 110px;
	    height: 41px;
	    border-radius: 3px;
	    display: inline-block;
	    line-height: 41px;
	}
	
	/*page버튼처리*/
	#btWrap{
		margin-top:	30px;
		position:relative;
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
					<div id="MemberWrap">
						<table>
								<tr>
									<td width="130">번호</td>
									<td>아이디</td>
									<td width="180">이름</td>
									<td width="290">이메일</td>
									<td width="180">가입일</td>
									<td width="210">상세정보</td>
								</tr>
							<c:if test="${mlist.size()==0}">
								<tr>
									<td colspan="6" class="no">※ 회원정보가 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${mlist.size()!=0}">
								<c:forEach items="${mlist}" var="mvo" varStatus="sts">
								<tr>	
									<td>${sts.count+((page-1)*10)}</td>
									<td>${mvo.userid}</td>
									<td>${mvo.name}</td>
									<td>${mvo.email1}@${mvo.email2}</td>
									<td>${mvo.writeday}</td>
									<td><a href="/member/detail?userid=${mvo.userid}" class="btn">상세정보</a></td>
								</tr>
								</c:forEach>
							</c:if>
						</table>
						<div id="btWrap">
						<c:if test="${!empty mlist}">
						<div id="pageCon">
						<c:if test="${pstart!=1}">
							<a href="member?page=${pstart-1}" class="btnPage"></a>
						</c:if>
						<c:if test="${pstart==1}">
							<a class="btnPage dis"></a>
						</c:if>
						
						<c:if test="${page!=1}">
							<a href="member?page=${page-1}" class="btnPage prev"></a>
						</c:if>
						<c:if test="${page==1}">
							<a class="btnPage dis prev"></a>
						</c:if>
						
						<c:forEach begin="${pstart}" end="${pend}" var="i">
							<c:if test="${page!=i}">
								<a href="member?page=${i}">${i}</a>
							</c:if>
							<c:if test="${page==i}">
								<a href="member?page=${i}" style="background-color:	#555;color:#fff">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${page!=chong}">
							<a href="member?page=${page+1}" class="btnPage next"></a>
						</c:if>
						<c:if test="${page==chong}">
							<a class="btnPage next dis"></a>
						</c:if>
						
						<c:if test="${pend!=chong}">
							<a href="member?page=${pend+1}" class="btnPage last"></a>
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