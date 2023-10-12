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
	.aa{
    	border-right: 1px solid #ddd;
	}
	.co{
		background: #f8f8fa;
		width: 110px;
    	border-right: 1px solid #ddd;
	}
	.bb{
		height: 200px!important;
	}
	.bb td{
		padding:10px;
		vertical-align: top;
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
	#btn{
		text-align: center;
    	padding-top: 30px;
	}
	#btn a{
		color: #fff;
	    text-align: center;
	    background: #93765a;
	    /*font-family: 'NotoSansM';*/
	    height: 45px;
	    width: 110px;
	    line-height: 45px;
	    cursor: pointer;
	    margin: 0 2px;
	    border-radius: 3px;
	    display: inline-block;
	    font-size: 14px;
	}
	#btn a.dis{
		background: #e0e3e6;
    	color: #6e7277;
	}
	.rebtn{
		display: inline-block;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    color: #71757b;
	    padding: 0 20px;
	    line-height: 43px;
	    height: 45px;
	    margin-bottom: 30px;
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
						<a href="rlist?page=${page}&type=${type}&keyword=${keyword}" class="rebtn">목록으로</a>
						<table>
							<tr>
								<td class="co">도서명</td>
								<td class="aa" width="610">${brvo.title}</td>
								<td class="co">신청자</td>
								<td width="340">${brvo.userid}</td>
							</tr>
							<tr>
								<td class="co">출판사</td>
								<td class="aa" width="610">${brvo.publi}</td>
								<td class="co">저자</td>
								<td width="340">${brvo.writer}</td>
							</tr>
							<tr>
								<td class="co">출판년도</td>
								<td colspan="3">${brvo.writeyear}</td>
							</tr>
							<tr class="bb">
								<td class="co bb">비고</td>
								<td class="p3" colspan="3">${brvo.ect}</td>
							</tr>
						</table>
					<c:if test="${brvo.gonge == 1}"> <!-- 비공개일경우 -->
						<div id="btn">
							<a href="rupdate?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">수정하기</a>
							<a href="delete?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">석제하기</a>
						</div>
					</c:if>
					<c:if test="${brvo.gonge != 1 && userid != brvo.userid}">
						<div id="btn">
							<input type="button" value="수정하기" style="display:none;">
							<input type="button" value="삭제하기" style="display:none;">
						</div>
					</c:if>
					<c:if test="${brvo.gonge != 1 && userid == brvo.userid}">
						<div id="btn">
						<c:if test="${brvo.state==1}">
							<input type="button" value="신청완료"">
						</c:if>
						<c:if test="${brvo.state==0}">
							<c:if test="${userid==null}">
								<a href="/member/login?brchk=2&brno=${brvo.no}" onclick="alert('비로그인 상태에서는 수정할 수 없습니다.')">수정하기</a>
							</c:if>
							<c:if test="${userid!=null}">
							<a href="rupdate?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">수정하기</a>
							</c:if>
							<c:if test="${userid==null}">
								<a href="/member/login?brchk=2&brno=${brvo.no}" onclick="alert('비로그인 상태에서는 수정할 수 없습니다.')">삭제하기</a>							
							</c:if>
							<c:if test="${userid!=null}">
								<a href="delete?no=${brvo.no}&page=${page}&type=${type}&keyword=${keyword}">삭제하기</a>							
							</c:if>
						</c:if>
						</div>
					</c:if>		
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>