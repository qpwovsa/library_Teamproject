<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#loanstatusWrap{
		padding-bottom: 80px;
    	min-height: 650px;
	}
	table{
		border-bottom: 1px solid #ddd;
    	border-top: 2px solid #cecece;
	}
	table tr{
		height: 60px;
	}
	table tr:first-child{
		height: 55px;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
		text-align: center;
		letter-spacing: 0.5px;
	}
	table tr:last-child td{
		border:none;
	}
	table tr:first-child td{
	    background-color: #f9f9fb;
	    height: 55px;
	    color: #333;
	    font-family: 'NotoSansM';
	    text-align: center;
	}
	table tr td.ta{
		text-align: center!important;
	}
	table tr td:nth-child(1) {
		padding-left: 20px;
	}
	input[type=button]{
		cursor: pointer;
	    font-size: 14px;
	    display: inline-block;
	    border: 1px solid #3d6cc4;
	    border-radius: 3px;
	    color: #3d6cc4;
	    padding: 0 30px;
	    line-height: 40px;
	    height: 42px;
	    background: #fff;
	    margin-right: 5px;
	}
	input[type=button]#btn2{
		margin-right: 0;
	}
	table tr td .el{
		width: 565px;
	    box-sizing: border-box;
	    height: 100%;
	    line-height: 60px;
	    text-align: left;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	}
	table tr td.no{
		color: #666;
    	font-size: 14px;
    	text-align: center;
	}
	/*page버튼처리*/
	#btWrap{
	    margin-top: 30px;
	    position: relative;
	    height: 50px;
	    text-align:center;
	}
	#pageCon{
    	margin: auto;
	}
	#pageCon a{
		display: inline-block;
	    width: 30px;
	    font-size: 14px;
	    color: #666;
	    line-height: 30px;
	    text-align: center;
	    vertical-align: top;
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
				<h2><span>도서관리</span></h2>
				<ul id="lnb">
					<li><a href="/bookregi/list"><span>도서등록</span></a></li>
					<li><a href="/reservestatus/list"><span>예약현황</span></a></li>
					<li><a href="/loanstatus/list"><span>대출현황</span></a></li>
					<li class="on"><a href="/loanlist/list"><span>대출이력</span></a></li>
					<li><a href="/bookrequest/hopelist"><span>희망도서</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>대출이력</h3>
					<p>도서관리&nbsp;&nbsp;>&nbsp;&nbsp;대출이력</p>
				</div>
				<div id="contents">
					<div id="loanstatusWrap">
						<table>
							<tr>
								<td width="565">도서명</td>
								<td width="170">회원아이디</td>
								<td width="150">대출일</td>
								<td width="150">반납예정일</td>
								<td width="150">반납일</td>
							</tr>
						<c:if test="${alist.size()==0}">
							<tr>
								<td colspan="5" class="no">※ 대출이력이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${alist.size()!=0}">
						<c:forEach items="${alist}" var="avo">
							<tr>
								<td><div class="el">${avo.title}</div></td>
								<td>${avo.userid}</td>
								<td>${avo.rental}</td>
								<td>${avo.returnday}</td>
								<td>${avo.writeday}</td>
							</tr>
						</c:forEach>
						</c:if>
						</table>
						<div id="btWrap">
						<c:if test="${!empty alist}">
							<div id=pageCon>
							<c:if test="${pstart!=1}">
								<a href="list?page=${pstart-1}" class="btnPage"></a>
							</c:if>
							<c:if test="${pstart==1}">
								<a class="btnPage dis"></a> 
							</c:if>
							
							<c:if test="${page!=1}">
								<a href="list?page=${page-1}" class="btnPage prev"></a>
							</c:if>
							<c:if test="${page==1}">
								<a class="btnPage dis prev"></a>
							</c:if>
							
							<c:forEach begin="${pstart}" end="${pend}" var="i">
								<c:if test="${page!=i}">
									<a href="list?page=${i}">${i}</a>
								</c:if>
								<c:if test="${page==i}">
									<a href="list?page=${i}" style="background-color: #555;color:#fff">${i}</a>
								</c:if>
							</c:forEach>
						
							<c:if test="${page!=chong}">
								<a href="list?page=${page+1}" class="btnPage next"></a>
							</c:if>
							<c:if test="${page==chong}">
								<a class="btnPage next dis"></a>
							</c:if>
							
							<c:if test="${pend!=chong}">
								<a href="list?page=${pend+1}" class="btnPage last"></a>
							</c:if>
							<c:if test="${pend==chong}">
								<a class="btnPage last dis"></a> 
							</c:if>	
							</div>
						</c:if>
						<c:if test="${empty alist}">
						</c:if>
						</div>	
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>