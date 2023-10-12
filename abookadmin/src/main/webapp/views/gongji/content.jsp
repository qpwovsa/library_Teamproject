<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#gongjiWrap{
		padding-bottom: 30px;
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
		letter-spacing: 0.5px;
	}
	table tr td:first-child {
		padding-left: 10px;
	    background: #f8f8fa;
	    width: 121px;
	    border-right: 1px solid #e4e4e4;
	    font-size: 15px;
	    font-family: 'NotoSansM';
	    color: #555;
	    letter-spacing: 1px;
	}
	table tr:nth-child(2){
		height: 300px;
	}
	table tr td#cont{
		vertical-align: top;
    	padding: 13px 10px;
    	height: 400px;
	}
	#btn{
		text-align: center;
		padding: 30px 0;
	}
	#btn a{
		color: #fff;
	    text-align: center;
	    background: #4e68b9;
	    /*font-family: 'NotoSansM';*/
	    height: 45px;
	    width: 110px;
	    line-height:45px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    display:inline-block;
	    font-size: 14px;
	}
	#btn a.dis{
		background: #e0e3e6;
	    color: #6e7277;
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
					<div id="gongjiWrap">	
						<table>
							<tr>
								<td>제목</td>
								<td>${gvo.title}</td>
							</tr>
							<tr>
								<td>내용</td>
								<td class="tl" id="cont"> 
									${gvo.content}
								</td>	
							</tr>
							<tr>
								<td>등록일</td>
								<td class="tl">${gvo.writeday}</td>
							</tr>
						</table>
						<div id="btn">
							<a href="list?page=${page}&type=${type}&keyword=${keyword}" class="dis">목록</a>
							<a href="update?no=${gvo.no}&page=${page}">수정하기</a>
							<a href="delete?no=${gvo.no}&page=${page}">삭제하기</a>
						</div> 
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>