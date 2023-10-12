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
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
		letter-spacing: 0.5px;
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
	.ff{
		font-size: 15px;
    	color: #333;
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
		width: 190px;
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
	.resBtn{
		background: #967759;
	    border: 1px solid #967759;
	    color: #fff;
	    font-size: 14px;
	    width: 110px;
	    height: 40px;
	    border-radius: 3px;
	}
	.resBtn.dis{
		border: 1px solid #ddd;
		background: #e0e3e6;
    	color: #6e7277;
    	cursor:default;
    	pointer-events:none;
	}
	#jjim{
		width: 41px;
	    height: 41px;
	    border: none!important;
	    cursor: pointer;
	    position: relative;
	    left: -10px;
	}
</style>
<script>
	window.onload=function(){
		if(${chk==1}){
			alert("1인 최대 4회 예약/대출 가능하며 추가 예약을 원할 시\n마이페이지 > 도서 예약현황 기존 예약 취소 또는 대출 반납을\n해주세요.")
		}
	}

	function jjim(src) {
		// alert(src.indexOf("jjim1.png"));
		 if(src.indexOf("jjim1.png")==-1)  {
    		var url="deljjim?bcode=${mapall.get(0).bcode}";
    		var img="/static/img/breserve/jjim1.png";
    	}else {
    		var url="addjjim?bcode=${mapall.get(0).bcode}";
    		var img="/static/img/breserve/jjim2.png";
    	}	
		
		var chk = new XMLHttpRequest();
		
		chk.onload = function() {
			// alert(chk.responseText);
			if(chk.responseText=="1")
        		alert("잘못된 동작이 발생했습니다");
        	else if(chk.responseText=="0")
        		document.getElementById("jjim").src=img;
        	else if(chk.responseText=="2")
        		location="/member/login?bcode=${bcode}";
			}
		chk.open("GET", url);
		chk.send(); 
	}
</script>
</head>

<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>도서관이용</span></h2>
				<ul id="lnb">
					<li class="on"><a href="/breserve/list"><span>도서예약</span></a></li>
					<li><a href="/bookrequest/rlist"><span>도서신청</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서예약</h3>
					<p>도서관 이용&nbsp;&nbsp;>&nbsp;&nbsp;도서예약</p>
				</div>
				<div id="contents">
					<div id="bookregiWrap">
						<c:if test="${mj!=1}">
						<a href="/breserve/list?page=${page}&num=${num}&keyword=${keyword}&type=${type}" class="rbtn">목록으로</a>
						</c:if>
						<c:if test="${mj==1}">
						<a href="/mypage/myjjim" class="rbtn">목록으로</a>
						</c:if>
						<table id="table1">
							<tr>
								<td>
									<div>
										<img src="/static/img/breserve/${mapall.get(0).bimg}">					
									</div>
								</td>
								<td>
									<div id="conBox">
										<div class="aa">
											${mapall.get(0).title}
											<span> <!-- 도서 찜하기 -->
												<img src="/static/img/breserve/${img}" id="jjim" onclick="jjim(this.src)">
											</span>
										</div>
										<div class="bb">${mapall.get(0).publi}<span>${blist.get(0).writer} 지음</span></div>
										<div class="cc">${mapall.get(0).writeyear}</div>
										<div class="dd">소장도서관 : 작은 도서관</div>
										<div class="ee">${mapall.get(0).ect}</div>
										<div class="ff">대출횟수 : ${mapall.get(0).cnt}번</div>
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
								<td>도서예약</td>
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
									<input type="button" value="도서예약" class="resBtn" onclick="location='bresOk?bcode=${map.bcode}&page=${page}'">
								</c:if>
								<c:if test="${map.state==1}">
									<input type="button" value="예약중" class="resBtn dis">
								</c:if>
								<c:if test="${map.state==2}">
									<input type="button" value="대출중" class="resBtn dis">
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