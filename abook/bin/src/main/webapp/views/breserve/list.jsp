<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#bookregiWrap{
		min-height: 350px;
	}
	form{
		width: 100%;
	    display: block;
	}
	h4{
		font-size: 25px;
	    font-family: 'NotoSansM';
	    text-align: center;
	    padding:30px 0;
	}
	table{
		border-top: 2px solid #cecece;
		text-align: center;
	}
	table tr{
		height: 230px;
		cursor:pointer;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
	}
	table tr td:nth-child(1){
		width: 180px;
		padding:10px;
	}
	table img{
	    width: 100%;
	    height:210px;
	    box-sizing: border-box;
    	border: 1px solid #e2e2e2;
    	/*object-fit:cover;*/   	   
	}
	table tr td:nth-child(1) > div{
		width: 100%;
	}
	table tr td:nth-child(2){
		text-align: left;
	}
	table tr td:nth-child(2) > div > div{
		height: 45px;
    	line-height: 45px;
	}
	table tr td.no{
		color: #666;
    	font-size: 15px;
    	text-align: center;
	}
	.tc{
		text-align: center!important;
	}
	#btnCon{    
		position: absolute;
		top:0;
		right:0;
	}
	#btnCon a{
		color: #fff;
	    text-align: center;
	    background: #4e68b9;
	    font-family: 'NotoSansM';
	    height: 50px;
	    width: 130px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    display: inline-block;
    	line-height: 50px;
	}	
	.aa{
		font-family: 'NotoSansM';
		font-size: 20px;
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
	#conBox{
		margin-left: 30px;
	}

	/*page버튼처리*/
	#btWrap{
	    margin-top: 30px;
	    position: relative;
	    height: 50px;
	    text-align: center;
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
	/*page버튼처리끝*/
	#search{
		padding:10px 20px;
		border-radius:5px;
		color:#fff;
		margin-bottom:40px;
		width:100px;
		background:#93765a;
	}
	#searchCon{
		width:630px;
		position:relative;
		right:0;
		display:flex;
		justify-content:space-between;
		align-items:center;
	}
	#select{
		display: inline-block;
	    width: 148px;
	    position: relative;
	    height: 48px;
	    border: 1px solid #e2e2e2;
	    background-color: #fff;
	}
	#select .selected{
		display: flex;
	    justify-content: space-between;
	    padding: 0;
	    cursor: pointer;
	}
	#select .selected_value{
		display: inline-block;
	    font-size: 16px;
	    width: calc(100% - 60px);
	    line-height: 44px;
	    text-align: left;
	    margin-left: 18px;
	}
	#select .arrow{
		width: 42px;
   		background: url(/static/img/common/ic_arrow.png) no-repeat 50% 50%;
	}
	#select ul{
	    width: 148px;
	    border: 1px solid #d6dae6;
	    position: absolute;
	    left: -1px;
	    z-index: 999;
	    background: #fff;
	    border-top: none;
	    
	    top: 47px;	
	    display: none;
	}
	#select ul li{
	    font-size: 16px;
	    padding: 0 20px;
	    line-height: 38px;
	    height: 38px;
	    border-bottom: 1px solid #eee;
	    cursor:pointer;
	}
	#select ul li:last-child{
		border:none;
	}
	#select ul li:hover{
		display: block;
		background-color:#ebeef7;
	}
	input.searchtext{
		border-radius: 0!important;
	    height: 48px!important;
	    vertical-align: top!important;
	    width: 500px;
	}
	.num_a{
		margin-bottom: 17px;
   	 	font-size: 18px;
   	 	color: #666;
    	font-family: 'NotoSansM';
	}
	.num_a .lst1{
		margin-right: 10px;
	}
</style>
<script>
	window.onload=function(){
		<c:if test="${type!=null}">
		   <c:if test="${type=='title'}">
		     <c:set var="aa" value="도서명"/>
		   </c:if>
		   <c:if test="${type=='writer'}">
		     <c:set var="aa" value="저자"/>
		   </c:if>
		   <c:if test="${type=='publi'}">
		     <c:set var="aa" value="출판사"/>
		   </c:if>
			<c:if test="${type=='aa'}">
				<c:set var="aa" value="전체"/>
			</c:if>
			document.getElementById("sv").innerText="${aa}";
		</c:if>
		
		document.getElementsByClassName("lst")[${num}].style.color="#c5425a";
	}
	var schk=0;
	function selectView(){
		
		if(schk==0){
			document.getElementById("type").style.display="block";
			document.getElementsByClassName("arrow")[0].style.transform="rotate(180deg)";
			schk=1;
		}else{
			document.getElementById("type").style.display="none";
			document.getElementsByClassName("arrow")[0].style.transform="rotate(0)";
			schk=0;
		}
	}
	function inputWr(txt){
 
		if(txt=="전체"){
			document.getElementsByClassName("selected_value")[0].innerText="전체";
			document.getElementById("seltype").value="aa";  // titlewriterpubli
			// aa로 value값을 줘서 impl
		}
		else if(txt=="도서명"){
			document.getElementsByClassName("selected_value")[0].innerText="도서명";
			document.getElementById("seltype").value="title";
		}else if(txt=="저자"){
			document.getElementsByClassName("selected_value")[0].innerText="저자";
			document.getElementById("seltype").value="writer";
		}
			else if(txt=="출판사"){
				document.getElementsByClassName("selected_value")[0].innerText="출판사";
				document.getElementById("seltype").value="publi";
			}
		document.getElementById("type").style.display="none";
		schk=0;
		document.getElementsByClassName("arrow")[0].style.transform="rotate(0)";
	}
	
	function listChange(num){
		location="list?num="+num;
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
					<form name="kjh" method="post" action="list">
						<input type="hidden" value="${type}" name="type" id="seltype">
						<input type="hidden" value="${keyword}">
						<div id="select">
							<div class="selected" onclick="selectView()">
								<div class="selected_value" id="sv">전체</div>								
								<div class="arrow"></div>
							</div>
							<ul id="type">
								<li class="option" id="notype" onclick="inputWr('전체')">전체</li>
								<li class="option" id="title" onclick="inputWr('도서명')">도서명</li>
								<li class="option" id="writer" onclick="inputWr('저자')">저자</li>
								<li class="option" id="publi" onclick="inputWr('출판사')">출판사</li>
							</ul>
						</div>
						<input type="text" class="searchtext" name="keyword" maxlength="100" placeholder="검색어 입력" value="${keyword}">
						<input type="submit" id="search" class="searchtext" value="검색">
						<div class="num_a"> <!-- 인기도서 신착도서 버튼 만들기 0913최윤도 -->
							<input type="button" value="신착도서" class="lst lst1" onclick="listChange(0)">
							<input type="button" value="인기도서" class="lst" onclick="listChange(1)">
						</div>					
					</form>
						<table>
						<c:if test="${empty blist}">
							<tr>
								<td colspan="5" align="center" class="no">※ 일치하는 검색 기록이 없습니다.</td>
							</tr>
						</c:if>	
						<c:if test="${! empty blist}">
						<c:forEach items="${blist}" var="bvo">
							<tr onclick="location='content?&page=${page}&bcode=${bvo.bcode}&type=${type}&keyword=${keyword}&num=${num }'"> 
								<td> 
									<div>
										<img src="/static/img/breserve/${bvo.bimg}">					
									</div>
								</td>		
								<td>
									<div id="conBox">
										<div class="aa">${bvo.title}</div>
										<div class="bb">${bvo.publi}<span>${bvo.writer} 지음</span></div>
										<div class="cc">${bvo.writeyear}</div>
										<div class="dd">소장도서관 : 작은 도서관</div>
									</div>
								</td>
							</tr>
						</c:forEach>
						</c:if>						
						</table>
						<div id="btWrap">
						<c:if test="${!empty blist}">
							<div id=pageCon>
							<c:if test="${pstart!=1}">
								<a href="list?page=${pstart-1}&num=${num}&type=${type}&keyword=${keyword}&start${start}" class="btnPage"></a>
							</c:if>
							<c:if test="${pstart==1}">
								<a class="btnPage dis"></a> 
							</c:if>
							
							<c:if test="${page!=1}">
								<a href="list?page=${page-1}&num=${num}&type=${type}&keyword=${keyword}&start${start}" class="btnPage prev"></a>
							</c:if>
							<c:if test="${page==1}">
								<a class="btnPage dis prev"></a>
							</c:if>
							
							<c:forEach begin="${pstart}" end="${pend}" var="i">
								<c:if test="${page!=i}">
									<a href="list?page=${i}&num=${num}&type=${type}&keyword=${keyword}&start${start}">${i}</a>
								</c:if>
								<c:if test="${page==i}">
									<a href="list?page=${i}&num=${num}&type=${type}&keyword=${keyword}&start=${start}" style="background-color: #555;color:#fff">${i}</a>
								</c:if>
							</c:forEach>
						
							<c:if test="${page!=chong}">
								<a href="list?page=${page+1}&num=${num}&type=${type}&keyword=${keyword}&start${start}" class="btnPage next"></a>
							</c:if>
							<c:if test="${page==chong}">
								<a class="btnPage next dis"></a>
							</c:if>
							
							<c:if test="${pend!=chong}">
								<a href="list?page=${pend+1}&num=${num}&type=${type}&keyword=${keyword}&start${start}" class="btnPage last"></a>
							</c:if>
							<c:if test="${pend==chong}">
								<a class="btnPage last dis"></a> 
							</c:if>	
							</div>			
						</div>	
						</c:if>
						<c:if test="${empty blist}">
						</c:if>						
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>