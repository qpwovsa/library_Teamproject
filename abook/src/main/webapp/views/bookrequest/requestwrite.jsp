<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	table tr td:first-child {
		padding-left: 10px;
	    background: #f8f8fa;
	    width: 112px;
	    border-right: 1px solid #e4e4e4;
	    font-size: 15px;
	    font-family: 'NotoSansM';
	    color: #555;
	    letter-spacing: 1px;
	}
	table input{
		width: 100%;
		font-size: 15px;
		border:none!important;
		padding:0!important;	
	}
	#btn{
		text-align: center;
		padding-top: 30px;
	}
	input[type=submit]{
		color: #fff;
	    text-align: center;
	    background: #93765a;
	    /* font-family: 'NotoSansM'; */
	    height: 45px;
	    width: 110px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    font-size: 15px;
	}
	input[type=button]{
		text-align: center;
	    background: #e0e3e6;
	    color: #6e7277;
	    /*font-family: 'NotoSansM';*/
	    height: 45px;
	    width: 110px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    font-size: 15px;
	}
	textarea{
		width: 100%;
	    height: 100%;
	    display: block;
	    padding: 10px 0;
	    font-size: 15px;
	    overflow:hidden;
	}	
	table tr td.wh{
		width: 986px;
   		height: 150px;
	}
	.gog{
		color: #555;
    	font-size: 15px;
	}
	input[type=checkbox]{
		width: 18px;
		height: 18px;
		position: relative;
	    top: 3px;
	    margin-left: 10px;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>도서관이용</span></h2>
				<ul id="lnb">
					<li><a href="/breserve/list"><span>도서예약</span></a></li>
					<li class="on"><a href="/bookrequest/rlist"><span>도서신청</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>도서신청</h3>
					<p>도서관 이용&nbsp;&nbsp;>&nbsp;&nbsp;도서신청</p>
				</div>
				<div id="contents">
					<div id="requestWrap">				
						<div class="request">
							<form name="rform" method="post" action="requestwrite_ok">
								<table>
									<tr>
										<td>책제목</td>
										<td><input type="text" name="title"></td>
									</tr>
									<tr>
										<td>출판사</td>
										<td><input type="text" name="publi"></td>
									</tr>
									<tr>
										<td>저자</td>
										<td><input type="text" name="writer"></td>
									</tr>
									<tr>
										<td>출판년도</td>
										<td><input type="text" name="writeyear"></td>
									</tr>
									<tr>
										<td>비고</td>
										<td class="wh"><textarea name="ect"></textarea></td>
									</tr>
									<tr>
										<td>노출옵션</td>
										<td>
											<div>
												<span class="gog">※ 비공개글은 체크해주세요</span>
												<input type="checkbox" name="gonge" value="1">
											</div>
										</td>
									</tr>
								</table>
								<div id="btn">
									<input type="button" value="취소" class="dis" onclick="location='rlist'">
									<input type="submit" value="등록하기">
								</div> 
							</form>						
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div> 	
</body>
</html>