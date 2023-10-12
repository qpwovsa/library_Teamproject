<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#contents {
		min-height: 530px;
	}
	#loginWrap{
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	}
	#login{
		padding: 50px 0;
	}
	#login h3{
		color:#333;
		font-size:25px;
		font-family: NotoSansM;
		margin-bottom: 20px;
	}
	form > div{
		width: 450px;
    	margin: auto;
    	margin-bottom: 20px;
    	height: 48px;
	}
	form input{
		width: 100%;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    position: relative;
	    height: 48px!important;
	}
	form input[type=submit]{
		height: 48px!important;
		line-height: 48px;
		color:#fff;
		background: #967759; 
		font-size: 17px;
	}
	.txt{
		font-size: 14px;
    	padding-bottom: 20px;
	}
	.aBox{
		position: relative;
    	top: -10px;
	}
	.aBox a{
		font-size: 15px;
	    margin-right: 15px;
	    color: #777;
	    font-family: 'NotoSansM';
	}
	.aBox a:last-child {
		margin-right: 0;
	}
	#failmsg{
		font-size: 14px;
	    color: #e52528;
	    position: relative;
    	top: -30px;
	}
	#banmsg{
		font-size: 14px;
	    color: #e52528;
	    position: relative;
    	top: -30px;
	}
</style>
<script>
</script>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>회원정보</span></h2>
				<ul id="lnb">
					<li class="on"><a href=""><span>로그인</span></a></li>
					<li><a href="/member/member"><span>회원가입</span></a></li>
					<li><a href="/member/idfind"><span>아이디찾기</span></a></li>
					<li><a href="/member/pwdfind"><span>비밀번호찾기</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>로그인</h3>
					<p>회원정보&nbsp;&nbsp;>&nbsp;&nbsp;로그인</p>
				</div>
				<div id="contents">
					<div id="loginWrap">
						<div id="login">
							<h3>로그인</h3>
							<form method="post" action="loginOk">
								 <input type="hidden" name="page" value="${page}">
								 <input type="hidden" name="bcode" value="${bcode}">
								 <input type="hidden" name="brchk" value="${brchk}"> <!-- bookrequest alert -->
								 <input type="hidden" name="brno" value="${brno}"> <!-- bookrequest_content no -->
								 <input type="hidden" name="rchk" value="${rchk}"> <!-- reserveseat alert -->
								 <input type="hidden" name="ichk" value="${ichk}"> <!-- inquiry alert -->
						         <div><input type="text" name="userid" id="userid" placeholder="아이디"></div>
						         <div><input type="password" name="pwd" id="pwd" placeholder="비밀번호"></div>
						         <div><input type="submit" value="로그인"></div> 
						    </form>
							<span class="aBox">
								<a href="/member/idfind">아이디찾기</a>
								<a href="/member/pwdfind">비밀번호찾기</a>
								<a href="/member/member">회원가입</a>
							</span>
						</div>
						<c:if test="${chk==1}">
						<p id="failmsg">일치하는 회원정보가 없습니다. 다시 입력하세요.</p>
						</c:if>
						<c:if test="${bchk==1}">
						<p id="banmsg">본 계정은 임시정지 되었습니다. 사유 : ${breason}</p>
						</c:if>
						<p class="txt">※로그인이 안되시는 경우 한/영 키와 Caps Lock 키가 눌러져 있지 않은지 확인하세요.</p>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>