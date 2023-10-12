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
	table tr:nth-child(3){
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
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>열린공간</span></h2>
				<ul id="lnb">
					<li class="on"><a href="/gongji/list"><span>공지사항</span></a></li>
					<li><a href="/inquiry/list"><span>문의사항</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>공지사항</h3>
					<p>열린공간&nbsp;&nbsp;>&nbsp;&nbsp;공지사항</p>
				</div>
				<div id="contents">
					<div id="gongjiWrap">	
						<a href="list?page=${page}&type=${type}&keyword=${keyword}" class="dis">목록으로</a>
						<table>
							<tr>
								<td>${gvo.title}</td>
							</tr>
							<tr>
								<td id="flex">
									<div>작성일<span class="sp">${gvo.writeday}</span></div>
									<div class="tar">조회수<span class="sp">${gvo.readnum}</span></div>
								</td>	
							</tr>
							<tr>
								<td class="p3">${gvo.content}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>