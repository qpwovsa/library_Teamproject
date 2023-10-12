<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#loginWrap{
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	}
</style>
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
						
						<!-- 여기에 시작ddd -->
						<!-- li값 다 바꾸기 -->
						<!-- 위에 loginWrap은 사용할 이름으로 바꾸고 위에 css이름 수정 확인 -->
						<!-- 
							24번째 줄<li class="on"><a href=""><span>로그인</span></a></li>
							해당 페이지에 class="on"추가 나머지는 삭제 
						 -->
						 <!-- 링크 잘 확인해서 수정 -->
						
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>