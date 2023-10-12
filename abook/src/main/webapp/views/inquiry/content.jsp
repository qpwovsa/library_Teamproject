<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-top: 2px solid #cecece;
	}
	table tr{
		height: 55px;
	}
	table tr td{
		border-bottom: 1px solid #e4e4e4;
		padding:0 10px;
	}
	table tr:first-child td {
	    background: #f8f8fa;
	    font-size: 16px;
	    font-family: 'NotoSansM';
	    color: #555;
	    letter-spacing: 1px;
	    text-align:center;
	}
	table tr:nth-child(4){
		height: 400px;
	}
	#btn{
		text-align: center;
		padding-top: 30px;
	}
	.dis{
		display: inline-block;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    color: #71757b;
	    padding: 0 20px;
	    line-height: 43px;
	    height: 45px;
	    margin-bottom: 30px;
	}
	#flex{
		display: flex;
	    justify-content: space-between;
	    height: 55px;
	    padding: 0 30px;
	}
	#flex > div{
		width: 210px;
   		line-height: 55px;
	}
	.sp{
		color: #666;
    	margin-left: 20px;
	}
	.tar{
		text-align: right;
	}
	.p3{
		vertical-align: top;
    	padding: 20px 30px;
	}
	.p30{
		padding:0 30px!important;
	}
	#btn a{
		color: #fff;
	    text-align: center;
	    background: #93765a;
	    /* font-family: 'NotoSansM'; */
	    height: 45px;
	    width: 110px;
	    line-height: 45px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    display: inline-block;
	    font-size: 14px;
	}
	#table2{
		margin-top: 50px;
	}
	table#table2 tr:first-child td{
		text-align: left;
		padding-left: 30px;
		color:#333;
	}
	.answrite{
		margin-left: 15px;
		color:#555;
	}
	table#table2 tr:nth-child(2){
		height: 250px;
	}
	#table2 .p3{
		width: 1170px;
    	height: 250px;
	}
</style>
<script>
	function checkcDel() {
		if(confirm("삭제하시겠습니까?")) {
			location="delete?no=${ivo.no}&page=${page}";
		}else {
			return false;
		}
	}
</script>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>열린공간</span></h2>
				<ul id="lnb">
					<li><a href="/gongji/list"><span>공지사항</span></a></li>
					<li class="on"><a href="/inquiry/list"><span>문의사항</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>문의사항${keyword}</h3>
					<p>열린공간&nbsp;&nbsp;>&nbsp;&nbsp;문의사항</p>
				</div>
				<div id="contents">
					<div id="gongjiWrap">	
						<c:if test="${mchk==1}">
							<a href="/mypage/myinquiry" class="dis">목록으로</a>
						</c:if>
						<c:if test="${mchk!=1}">
							<a href="list?no=${ivo.no}&page=${page}&type=${type}&keyword=${keyword}" class="dis">목록으로</a>
						</c:if>			
						<table> 
							<tr>
								<td>${ivo.title}</td>
							</tr>
							<tr> 
								<td id="flex">
									<div>작성자<span class="sp">${ivo.userid}</span></div>
									<div class="tar">조회수<span class="sp">${ivo.readnum}</span></div>
								</td>
							</tr>
							<tr> 
								<td class="p30">
									<div>작성일<span class="sp">${ivo.writeday}</span></div>
								</td>
							</tr>
							<tr>
								<td class="p3"> 
									${ivo.content}
								</td>	
							</tr>
						 </table>	
						 <c:choose>
					     <c:when test="${not empty mvo.content}">
					     	<table id="table2">
					     		<tr>
					     			<td>답변일<span class="answrite">${mvo.writeday}</span></td>
					     		</tr>
					     		<tr>
					     			<td><div class="p3">${mvo.content}</div></td>
					     		</tr>
					     	</table>
					     </c:when>
					     <c:otherwise>
								<!-- 답변에 대한 값이 없다면 , 아무것도 뜨지 않음  -->
					     </c:otherwise>
						 </c:choose>
						 <!-- userid에 따른 수정,삭제 버튼 숨기기 -->
						 <div id="btn"> 		
							<c:if test="${userid == ivo.userid && ivo.state == 0}">
								<a href="update?no=${ivo.no}&page=${page}" id="update">수정하기</a>
							</c:if>
							<c:if test="${userid == ivo.userid && ivo.state == 1}">
								
							</c:if>
							
							<c:if test="${userid == ivo.userid && ivo.state == 0}">
								<a onclick="checkcDel()">삭제하기</a>
							</c:if>
							<c:if test="${userid != ivo.userid && ivo.state == 1}">
							</c:if>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>