<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	/*
	#findform,
	#sucessform{
		height: 309px;
	}*/
	#findform > div{
		width: 450px;
    	margin: auto;
    	margin-bottom: 20px;
    	height: 48px;
	}
	#findform input{
		width: 100%;
	    border: 1px solid #e2e2e2;
	    border-radius: 3px;
	    position: relative;
	    height: 48px!important;
	}
	#findform input[type=button]{
		height: 48px!important;
		line-height: 48px;
		color:#fff;
		background: #967759; 
		font-size: 17px;
	}
	#sucessform{
		display: none;
	}
	#sucessform img{
		position: relative;
    	left: -10px;
    	width: 130px;
	}
	#findform > div.msg{
	    font-size: 14px;
	    color: #e52528;
	    position: relative;
	    top: 10px;
	    display: none;
	    height: 30px;
	    margin-bottom: 0;
	    text-align: center;
	}
	#sucessform a{
	    font-size: 14px;
	    margin-top: 40px;
	    width: 120px;
	    display: inline-block;
	    height: 40px;
	    line-height: 40px;
	    color: #967759;
	    border: 1px solid #967759;
	    margin-right: 8px;
	    position: relative;
	    left: 8px;
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
	#idmsg{
		font-size: 25px;
	    margin-top: 20px;
	    font-family: 'NotoSansM';
	}
</style>
<script>
	function check(){ //아이디 체크
		var name=document.getElementById("name").value;
		var phone=document.getElementById("phone").value;
		
		var chk=new XMLHttpRequest;

		chk.onload=function(){
			if(chk.responseText=="") {
				document.getElementById("failmsg").style.display="block";
				document.getElementById("failmsg").innerHTML="일치하는 아이디가 없습니다. 다시 입력하세요.";
				document.getElementById("sucessform").style.display="none";
				document.getElementById("findform").style.display="block";
			}else{
				document.getElementById("findform").style.display="none";
				document.getElementById("sucessform").style.display="block";
				document.getElementById("idmsg").innerText = chk.responseText;
			}
		}
		
		chk.open("get","idcheck?name="+name+"&phone="+phone);
		chk.send();
	}
</script>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>회원정보</span></h2>
				<ul id="lnb">
					<li><a href="/member/login"><span>로그인</span></a></li>
					<li><a href="/member/member"><span>회원가입</span></a></li>
					<li class="on"><a href=""><span>아이디찾기</span></a></li>
					<li><a href="/member/pwdfind"><span>비밀번호찾기</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>아이디찾기</h3>
					<p>회원정보&nbsp;&nbsp;>&nbsp;&nbsp;아이디찾기</p>
				</div>
				<div id="contents">
					<div id="loginWrap">
						<div id="login">
							<div id="findform">
								<h3>아이디찾기</h3>	
						        <div><input type="text" name="name" id="name" placeholder="이름"></div>
						        <div><input type="text" name="phone" id="phone" placeholder="전화번호"></div>
						        <div><input type="button" value="아이디찾기" onclick="check()"></div> 
						        <span class="aBox">
									<a href="/member/pwdfind">비밀번호찾기</a>
									<a href="/member/login">로그인</a>
									<a href="/member/member">회원가입</a>
								</span>
						        <div id="failmsg" class="msg"></div>
							</div>
							<div id="sucessform">
								<h3>아이디 찾기 결과</h3>
								<img src="/static/img/member/ico_result.png">
								<div id="idmsg" class="msg"></div>
								<a href="/member/pwdfind">비밀번호 찾기</a>
								<a href="/member/login">로그인</a>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>