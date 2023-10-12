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
		padding-bottom: 30px;
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
	    width: 121px;
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
	    background: #4e68b9;
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
	input[type=file]::file-selector-button {
	    height: 38px;
	    border: 1px solid #cccccc;
	    cursor: pointer;
	    vertical-align: middle;
	    background: #fff;
	    font-weight: bold;
	    margin-right: 10px;
	    outline:none;
	    padding:5px 10px;
	}
	input[type=file]{
		font-size: 14px;
	}
	table tr td.wh {
    width: 986px;
    height: 150px;
	}
	textarea{
		width: 100%;
	    height: 100%;
	    display: block;
	    padding: 10px 0;
	    font-size: 15px;
	    overflow:hidden;
	}	
</style>
<script>

	function check(my) {
		if (my.title.value.trim().length == 0) {
			alert("도서명을 입력하세요.");
			return false;
		} else if (my.publi.value.trim().length == 0) {
			alert("출판사를 입력하세요.");
			return false;
		} else if (my.writer.value.trim().length == 0) {
			alert("저자를 입력하세요.");
			return false;
		} else if (my.writeyear.value.trim().length == 0) {
			alert("출판년도를 입력하세요.");
			return false;
		} else if (my.bea.value.trim().length == 0) {
			alert("갯수를 입력하세요.");
			return false;
		} else if (my.ect.value.trim().length == 0) {
			alert("설명을 입력하세요.");
			return false;
		} else if (my.bimg.value.trim().length == 0) {
			alert("책이미지를 넣어주세요.");
			return false;
		} else {
			return true;
		}
	}
</script>
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
						<form name="bform" method="post" action="write_ok" enctype="multipart/form-data" onsubmit="return check(this)">
						<input type="hidden" name="brno" value="${bvo.no}"> <!-- 희망도서 등록용 -->
							<table>
								<tr>
									<td>도서명</td>
									<td>
									<c:if test="${bvo.title==null}">
										<input type="text" id="title" name="title">
									</c:if>
									<c:if test="${bvo.title!=null}">
										<input type="text" id="title" name="title" value="${bvo.title}">
									</c:if>
									</td>
								</tr>
								<tr>
									<td>출판사</td>
									<td>
									<c:if test="${bvo.publi==null}">
										<input type="text" id="publi" name="publi">
									</c:if>
									<c:if test="${bvo.publi!=null}">
										<input type="text" id="publi" name="publi" value="${bvo.publi}">
									</c:if>
									</td>
								</tr>
								<tr>
									<td>저자</td>
									<td>
									<c:if test="${bvo.writer==null}">
										<input type="text" id="writer" name="writer">
									</c:if>
									<c:if test="${bvo.writer!=null}">
										<input type="text" id="writer" name="writer" value="${bvo.writer}">
									</c:if>
									</td>
								</tr>
								<tr>
									<td>출판년도</td>
									<td>
									<c:if test="${bvo.writeyear==null}">
										<input type="text" id="writeyear" name="writeyear">
									</c:if>
									<c:if test="${bvo.writeyear!=null}">
										<input type="text" id="writeyear" name="writeyear" value="${bvo.writeyear}">
									</c:if>
									</td>
								</tr>
								<tr>
									<td>갯수</td>
									<td>
									<input type="text" id="bea" name="bea">
									</td>
								</tr>
								<tr>
									<td>비고</td>
									<td class="wh">
									<c:if test="${bvo.ect==null}">
										<input type="text" id="ect" name="ect">
									</c:if>
									<c:if test="${bvo.ect!=null}">
										<textarea id="ect" name="ect">${bvo.ect}</textarea>
									</c:if>
									</td>
								</tr>
								<tr>
									<td>책이미지</td>
									<td><input type="file" id="bimg" name="bimg" ></td>
								</tr>
							</table>
							<div id="btn">
								<input type="button" value="취소" class="dis" onclick="location='list'">
								<input type="submit" value="등록하기">
							</div> 
						</form>						
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>