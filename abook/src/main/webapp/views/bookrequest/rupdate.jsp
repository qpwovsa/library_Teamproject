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
	    font-family: 'NotoSansM';
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
	    font-family: 'NotoSansM';
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
<script>
	function check(my)
	{
		if(my.title.value.trim()=="") // 제목이 비어있는경우
		{
			document.getElementById("msg2").style.visibility="visible"; // 메세지 보이게하기
			document.getElementById("msg2").style.color="red";
			my.title.focus();
		}
			if(my.writer.value.trim()=="") // 저자가 비어있는경우
			{
				document.getElementById("msg3").style.visibility="visible";
				document.getElementById("msg3").style.color="red";
				my.writer.focus();
			}
				if(my.publi.value.trim()=="") // 출판사가 비어있는경유
				{
					document.getElementById("msg4").style.visibility="visible";
					document.getElementById("msg4").style.color="red";
					my.publi.focus();
				}
					if(my.writeyear.value.trim()=="") // 출판년도가 비어있는경우
					{
						document.getElementById("msg5").style.visibility="visible";
						document.getElementById("msg5").style.color="red";
						my.writeyear.focus();
					}
						if(my.ect.value.trim()=="") // 비고가 비어있는경우
						{
							document.getElementById("msg6").style.visibility="visible";
							document.getElementById("msg6").style.color="red";
							my.ect.focus();
							return false;
						}
							else
								return true;
	}
	function returnchk()
	{
		var title=document.rform.title.value;
		var writer=document.rform.writer.value;
		var publi=document.rform.publi.value;
		var writeyear=document.rform.writeyear.value;
		var ect=document.rform.ect.value;
		
		if(title.trim().length>0) // 칸에 글이 들어가면 메세지 다시 숨기기.
		{
			document.getElementById("msg2").style.visibility="hidden";
		}
		if(writer.trim().length>0)
		{
			document.getElementById("msg3").style.visibility="hidden";
		}
		if(publi.trim().length>0)
		{
			document.getElementById("msg4").style.visibility="hidden";
		}
		if(writeyear.trim().length>0)
		{
			document.getElementById("msg5").style.visibility="hidden";
		}
		if(ect.trim().length>0)
		{
			document.getElementById("msg6").style.visibility="hidden";
		}
	}

/* 	function gongecheck() {
	    var gonge = document.getElementById("gonge").checked;
	    if (gonge) {
	        document.getElementById("gonge").value = "true";
	    } else {
	        document.getElementById("gonge").value = "false";
	    }
	}
 */
</script>
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
							<form name="rform" method="post" action="rupdate_ok" onsubmit="return check(this)">
							<input type="hidden" name="page" value="${page}">
							<input type="hidden" name="no" value="${brvo.no}">
							<input type="hidden" id="checkgonge" name="checkgonge" value="${brvo.gonge}">
							<table>
								<tr>
									<td>책제목</td>
									<td><input type="text" name="title" value="${brvo.title}"></td>
								</tr>
								<tr>
									<td>출판사</td>
									<td><input type="text" name="publi" value="${brvo.publi}"></td>
								</tr>
								<tr>
									<td>저자</td>
									<td><input type="text" name="writer" value="${brvo.writer}"></td>
								</tr>
								<tr>
									<td>출판년도</td>
									<td><input type="text" name="writeyear" value="${brvo.writeyear}"></td>
								</tr>
								<tr>
									<td>비고</td>
									<td class="wh"><textarea name="ect">${brvo.ect}</textarea></td>
								</tr>
								<tr>
									<td>노출옵션</td>
									<td>
										<div>
											<span class="gog">※ 비공개글은 체크해주세요</span>
										<c:if test="${brvo.gonge == 1}">
											<input type="checkbox" id="gonge" name="gonge" value="1" checked>
										</c:if>
										<c:if test="${brvo.gonge == 0}">
											<input type="checkbox" id="gonge" name="gonge" value="1">
										</c:if>
										</div>
									</td>
								</tr>
							</table>
							<div id="btn">
								<input type="button" value="취소" class="dis" onclick="location='rlist'">
								<input type="submit" value="수정하기" onclick="gongecheck()">
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