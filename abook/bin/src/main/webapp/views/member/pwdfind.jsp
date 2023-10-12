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
   		height: 360px;
	}*/
	#findform > div{
		width: 450px;
    	margin: auto;
    	margin-bottom: 20px;
    	height: 48px;
	}
	#sucessform form > div{
		width: 450px;
    	margin: auto;
    	margin-bottom: 20px;
    	height: 48px;
	}
	#findform input,
	#sucessform input{
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
		height: 309px;
	}
	#sucessform img{
		position: relative;
    	left: -10px;
    	width: 130px;
	}
	.msg{
	    font-size: 14px;
	    color: #e52528;
	    position: relative;
	    top: -10px;
	    left: 21px;
	    text-align:left;
	}
	#idmsg{
		color: #333;
	    height: 40px;
	    font-weight: bold;
	    font-size: 25px;
	}
	form{
		width: 450px;
	    text-align: center;
	    display: inline-block;
	}
	#sucessform a{
	    font-size: 14px;
	    margin-top: 59px;
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
	#sucessform input[type=submit]{
		height: 48px!important;
	    line-height: 48px;
	    color: #fff;
	    background: #967759;
	    font-size: 17px;
	}
	#findform > div.msg{
	    font-size: 14px;
	    color: #e52528;
	    position: relative;
	    top: 10px;
	    left:0;
	    display: none;
	    height: 30px;
	    margin-bottom: 0;
	    text-align:left;
	}
	#findform > div#failmsg{
		text-align: center;
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
</style>
<script>
	/* 회원정보 체크 */
	function check(){
		var userid=document.getElementById("userid").value;
		var name=document.getElementById("name").value;
		var phone=document.getElementById("phone").value;
		
		var chk=new XMLHttpRequest;

		chk.onload=function(){
			if(chk.responseText=="0") {
				document.getElementById("failmsg").style.display="block";
				document.getElementById("failmsg").innerHTML="일치하는 회원정보가 없습니다. 다시 입력하세요.";
				document.getElementById("sucessform").style.display="none";
				document.getElementById("findform").style.display="block";
			}else{
				document.getElementById("findform").style.display="none";
				document.getElementById("sucessform").style.display="block";
				document.getElementById("userid2").value=userid;
			}
		}
		
		chk.open("get","pwdcheck?name="+name+"&phone="+phone+"&userid="+userid);
		chk.send();
	}
	
	/* 비밀번호 길이체크,이전 비번 체크 */
	var pchk=0;
	var npwd=0;
	function pwdLength(my){
		
		if(my.length>5){
			
			var userid=document.getElementById("userid").value;
			var pwd=document.mform.pwd.value;
			var pwd2=document.mform.pwd2.value;
			var chk=new XMLHttpRequest();
			
			chk.onload=function(){
				if(chk.responseText==pwd){
					document.getElementById("pwdMsg1").innerText="사용 불가능한 비밀번호입니다.";
					document.getElementById("pwdMsg1").style.display="block";
		    		document.getElementById("pwdMsg1").style.color="#e52528";
		    		
		    		pchk=0;
		    		npwd=0;
				}else{
					document.getElementById("pwdMsg1").innerText="사용 가능한 비밀번호입니다.";
					document.getElementById("pwdMsg1").style.display="block";
		    		document.getElementById("pwdMsg1").style.color="#00891a";
	
		    		npwd=1;
		    		
		    		if(pwd==pwd2){
		    			pchk=1;
		    		}else{
		    			pchk=0;
		    		}
				}
			}
			
			chk.open("get","newPwdCheck?userid="+userid);
			chk.send();

		}else{
			document.getElementById("pwdMsg1").innerText="비밀번호를 6자 이상 입력하세요.";
			document.getElementById("pwdMsg1").style.display="block";
    		document.getElementById("pwdMsg1").style.color="#e52528";
    		pchk=0;
		}
	}
	
	/* 비밀번호 일치여부체크 */
	function pwdchk(){
		
		var pwd=document.mform.pwd.value;
		var pwd2=document.mform.pwd2.value;
	
		if(pwd2.trim().length>0){
			
			if(pwd==pwd2){
				document.getElementById("pwdMsg2").innerText="비밀번호가 일치합니다.";
				document.getElementById("pwdMsg2").style.display="block";
	    		document.getElementById("pwdMsg2").style.color="#00891a";
	    		
	    		if(npwd==0){
	    			pchk=0;
	    		}else{
	    			pchk=1;
	    		}
			}else{
				document.getElementById("pwdMsg2").innerText="비밀번호가 불일치합니다.";
				document.getElementById("pwdMsg2").style.display="block";
	    		document.getElementById("pwdMsg2").style.color="#e52528";
	    		pchk=0;
	    		npwd2=1;
			}
		}
	}
	
	function pwdupdate(my){
		
		var pwd=document.mform.pwd.value;
		var pwd2=document.mform.pwd2.value;
		
		if(pchk==0){
			
			if(pwd.trim().length==0){	
				document.getElementById("pwdMsg1").innerText="비밀번호를 입력하세요.";
				document.getElementById("pwdMsg1").style.display="block";
	    		document.getElementById("pwdMsg1").style.color="#e52528";	
			}else if(pwd.trim().length<6){	
				document.getElementById("pwdMsg1").innerText="비밀번호를 6자 이상 입력하세요.";
				document.getElementById("pwdMsg1").style.display="block";
	    		document.getElementById("pwdMsg1").style.color="#e52528";				
			}
	
			if(pwd!=pwd2){
				pwdMsg2.innerText="비밀번호가 불일치합니다.";
				pwdMsg2.style.display="block";
				pwdMsg2.style.color="#e52528";
			}
			
			if(pwd2.trim().length==0){
				pwdMsg2.innerText="확인을 위해 새 비밀번호 다시 입력하세요.";
				pwdMsg2.style.display="block";
				pwdMsg2.style.color="#e52528";
			}
			
			return false;
		}else{
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
				<h2><span>회원정보</span></h2>
				<ul id="lnb">
					<li><a href="/member/login"><span>로그인</span></a></li>
					<li><a href="/member/member"><span>회원가입</span></a></li>
					<li><a href="/member/idfind"><span>아이디찾기</span></a></li>
					<li class="on"><a href=""><span>비밀번호찾기</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>비밀번호찾기</h3>
					<p>회원정보&nbsp;&nbsp;>&nbsp;&nbsp;비밀번호찾기</p>
				</div>
				<div id="contents">
					<div id="loginWrap">
						<div id="login">
							<div id="findform">
								<h3>비밀번호찾기</h3>	
						        <div><input type="text" name="userid" id="userid" placeholder="아이디"></div>
						        <div><input type="text" name="name" id="name" placeholder="이름"></div>
						        <div><input type="text" name="phone" id="phone" placeholder="전화번호"></div>
						        <div><input type="button" value="비밀번호찾기" onclick="check()"></div> 
						        <span class="aBox">
									<a href="/member/idfind">아이디찾기</a>
									<a href="/member/login">로그인</a>
									<a href="/member/member">회원가입</a>
								</span>
						        <div id="failmsg" class="msg"></div>
							</div>
							<div id="sucessform">
								<h3>비밀번호 재설정</h3>
								<form name="mform" method="post" action="updatePwd" onsubmit="return pwdupdate(this)">
									<input type="hidden" name="userid" id="userid2">
									<div><input type="password" name="pwd" id="pwd" placeholder="비밀번호" oninput="pwdLength(this.value),pwdchk()"></div>
									<p id="pwdMsg1" class="msg"></p>
							        <div><input type="password" name="pwd2" id="pwd2" placeholder="비밀번호 확인" oninput="pwdchk()"></div>
							        <p id="pwdMsg2" class="msg"></p>
							        <div><input type="submit" value="비밀번호 재설정"></div> 			
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>