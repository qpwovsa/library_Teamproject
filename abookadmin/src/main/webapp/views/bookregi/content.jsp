<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#bookregiWrap{
		padding-bottom: 80px;
	}
	form{
		width: 100%;
	    display: block;
	}
	table#table1{
		border-bottom: 1px solid #ddd;
    	border-top: 2px solid #666;
	}
	table#table1 tr{
		height: 300px;
	}
	table#table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
	}
	table#table1 tr td:nth-child(1){
	    width: 220px;
    	padding: 20px 0;
	}
	table#table1 tr td:nth-child(1) > div{
		width: 220px;
		height: 300px;
	}
	table#table1 img{
	   	width: 100%;
	    height:100%;
	    box-sizing: border-box;
    	border: 1px solid #e2e2e2;     	   
	}
	#conBox{
		margin-left: 30px;
		padding: 20px 0;
		height: 340px;
		position: relative;
	}
	#conBox > div{
		height: 47px;
    	line-height: 47px;
	}
	.aa{
		font-family: 'NotoSansM';
		font-size: 20px;
		display: flex;
		align-items: center;
		flex-direction: row;
		justify-content: space-between;
	}
	.bb{
		color:#777;
	}
	.bb span{
		margin-left: 20px;
	}
	.cc{
		color:#777;
	}
	.dd{
		color: #555;
	}
	.ee{
		color: #444;
	    line-height: 29px!important;
	    width: 100%;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    word-break: break-word;
	    display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	    height: 60px!important;
	}
	.rbtn{
		display: inline-block;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    color: #71757b;
	    padding: 0 20px;
	    line-height: 43px;
	    height: 45px;
	    margin-bottom: 30px;
	}
	table#table2{
		margin-top: 100px;
		text-align: center;
	}
	table#table2 caption{
		text-align: left;
	    height: 80px;
	    font-size: 25px;
	    font-family: 'NotoSansM';
	}
	table#table2 tr:first-child td{
		border-top: 2px solid #666;
		background-color: #f9f9fb;
    	border-bottom:1px solid #666;
    	height: 55px;
    	color: #333;
	    font-family: 'NotoSansM';
	    text-align: center;
	}
	table#table2 tr td:nth-child(1) {
		width: 150px;
	}
	table#table2 tr td:nth-child(2) {
		width: 160px;
	}
	table#table2 tr td:nth-child(3) {
		width: 200px;
	}
	table#table2 tr td:nth-child(4) {
		width: 170px;
	}
	table#table2 tr td:nth-child(5) {
		width: 339px;
	}
	table#table2 tr td:last-child{
		width: 160px;
	}
	table#table2 tr {
		height: 60px;
	}
	table#table2 tr td{
		border-bottom: 1px solid #e2e2e2;
	}
	#addbtn{
		font-size: 14px;
	    display: inline-block;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    color: #fff;
	    width:110px;
	    line-height: 45px;
	    height: 45px;
	    background: #3d6cc4;
	}
	.delbtn{
		cursor:pointer;	
		font-size: 14px;
	    display: inline-block;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    color: #fff;
	    width:110px;
	    line-height: 40px;
	    height: 40px;
	    background: #3d6cc4;
	}
	.delbtn.dis{
		pointer-events:none;
		cursor:default;
		border: 1px solid #ddd;
		color:#888;
		background:#ddd;
	}
	.chubtn{
		position: absolute;
	    bottom: 20px;
	    right: 0px;
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
					<li class="on"><a href="/bookregi/list"><span>도서등록</span></a></li>
					<li><a href="/reservestatus/list"><span>예약현황</span></a></li>
					<li><a href="/loanstatus/list"><span>대출현황</span></a></li>
					<li><a href="/loanstatus/allList"><span>대출이력</span></a></li>
					<li><a href="/bookrequest/hopelist"><span>희망도서</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서등록</h3>
					<p>도서 관리&nbsp;&nbsp;>&nbsp;&nbsp;도서등록</p>
				</div>
				<div id="contents">
					<div id="bookregiWrap">
						<a href="/bookregi/list?page=${page}&type=${type}&keyword=${keyword}" class="rbtn">목록으로</a>
						<table id="table1">
							<tr>
								<td>
									<div>
										<img src="/static/img/bookregi/${mapall.get(0).bimg}">					
									</div>
								</td>
								<td>
									<div id="conBox">
										<div class="aa">${mapall.get(0).title}</div>
										<div class="bb">${mapall.get(0).publi}<span>${mapall.get(0).writer} 지음</span></div>
										<div class="cc">${mapall.get(0).writeyear}</div>
										<div class="dd">소장도서관 : 작은 도서관</div>
										<div class="ee">${mapall.get(0).ect}</div>
										<div class="ff">대출횟수 : ${mapall.get(0).cnt}번</div>
										<div class="chubtn">
											<input type="button" id="addbtn" value="도서추가" onclick="location='add?bcode=${mapall.get(0).bcode}&page=${page}'">
										</div>
									</div>
								</td>
							</tr>
						</table>	
						<table id="table2">
							<caption>소장정보</caption>
							<tr>
								<td>도서관</td>
								<td>번호</td>
								<td>대출상태</td>
								<td>예약상태</td>
								<td>반납예정일</td>
								<td></td>
								<td>도서삭제</td>
							</tr>
						<c:forEach items="${mapall}" var="map" varStatus="i">
							<tr>
								<td>작은도서관</td>
								<td>
									<fmt:formatNumber value="${i.index+1}" type="number" minIntegerDigits="2" />
								</td>
								<td>
								<c:if test="${map.state==0}">
									대출가능
								</c:if>
								<c:if test="${map.state==1}">
									대출불가(예약중)
								</c:if>
								<c:if test="${map.state==2}">
									대출불가(대출중)
								</c:if>
								</td>					
								<td>
								<c:if test="${map.state==0}">
									0
								</c:if>
								<c:if test="${map.state==1}">
									1
								</c:if>
								<c:if test="${map.state==2}">
									1
								</c:if>
								</td>
								<td>
								<c:if test="${map.state==0}">
									-
								</c:if>
								<c:if test="${map.state==2}">
									${map.returnday}
								</c:if>
								</td>
								<td></td>
								<td>
								<c:if test="${map.state==0}">
									<input type="button" value="삭제" class="delbtn" onclick="location='del?bcode=${map.bcode}&page=${page}'">
								</c:if>
								<c:if test="${map.state!=0}">
									<input type="button" value="삭제" class="delbtn dis">
								</c:if>	
								</td>
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