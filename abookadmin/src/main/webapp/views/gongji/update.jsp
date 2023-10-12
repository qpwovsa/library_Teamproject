<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#gongjiWrap{
		padding-bottom: 60px;
	}
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
		padding: 30px 0;
	}
	input[type=submit]{
	    color: #fff;
	    text-align: center;
	    background: #4e68b9;
	    /*font-family: 'NotoSansM';*/
	    height: 45px;
	    width: 110px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    font-size: 14px;
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
	    font-size: 14px;
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
   		height: 400px;
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
				<h2><span>게시판관리</span></h2>
				<ul id="lnb">
					<li class="on"><a href="/gongji/list"><span>공지사항</span></a></li>
					<li><a href="/inquiry/list"><span>문의사항</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>공지사항</h3>
					<p>게시판 관리&nbsp;&nbsp;>&nbsp;&nbsp;공지사항</p>
				</div>
				<div id="contents">
					<div id="gongiWrap">
						<form name="gform" method="post" id="form" action="updateOk" onsubmit="return stepchk(this)">
							<input type="hidden" name="no" value="${gvo.no}">
							<input type="hidden" name="page" value="${page}">
							<table>
								<tr>
									<td>제목</td>
									<td><input type="text" name="title" value="${gvo.title}"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td class="wh"><textarea name="content">${gvo.content}</textarea></td>
								</tr>
								<tr>
									<td>노출옵션</td>
									<td>
										<div>
										  <span class="gog">고정글은 체크해주세요</span>
										  <c:if test="${gvo.step==1}">
										    <c:set var="aa" value="checked"/>
										  </c:if> 
											<input type="checkbox" name="step" value="1" ${aa}>										
										</div>
									</td>
								</tr>
							</table>
							<div id="btn">
								<input type="button" value="취소" class="dis" onclick="location='content?no=${gvo.no}&page=${page}'">
								<input type="submit" value="수정하기">
							</div> 
						</form>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>