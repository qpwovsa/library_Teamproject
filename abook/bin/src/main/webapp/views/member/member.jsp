<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
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
	form{
		width: 500px;
    	margin: auto;
	}
	form > div{
		width: 500px;
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
	form input.email1{
		width: 166px;
		vertical-align: top;
	}
	form input.email2{
		width: 148px;
		vertical-align: top;
	}
	#select{
		display: inline-block;
	    width: 148px;
	    position: relative;
	    height: 48px;
	    border: 1px solid #e2e2e2;
	    margin-left: 11px;
	    background-color: #fff;
	}
	#select .selected{
		display: flex;
	    justify-content: space-between;
	    padding: 0;
	    cursor: pointer;
	}
	#select .selected_value{
		display: inline-block;
	    font-size: 16px;
	    width: calc(100% - 60px);
	    line-height: 44px;
	    text-align: left;
	    margin-left: 18px;
	}
	#select .arrow{
		width: 42px;
   		background: url(/static/img/common/ic_arrow.png) no-repeat 50% 50%;
	}
	#select ul{
	    width: 148px;
	    border: 1px solid #d6dae6;
	    position: absolute;
	    left: -1px;
	    z-index: 999;
	    background: #fff;
	    border-top: none;
	    
	    top: 47px;	
	    display: none;
	}
	#select ul li{
	    font-size: 16px;
	    padding: 0 20px;
	    line-height: 38px;
	    height: 38px;
	    border-bottom: 1px solid #eee;
	    cursor:pointer;
	}
	#select ul li:last-child{
		border:none;
	}
	#select ul li:hover{
		display: block;
		background-color:#ebeef7;
	}
	#zip{
		width: 120px;
		vertical-align: top;
	}
	#addr{
		width: 365px;
    	margin-left: 10px;
    	margin-bottom: 20px;
	}
	#addrDtl{
		vertical-align: top;
		width: 337px;
	}
	form > div#addrDiv{
		height: 116px;
		margin-bottom: 20px;	
	}
	#addBtn{
		width: 148px;
    	margin-left: 10px;
    	color: #fff;
	    background: #967759;
	    font-size: 15px;
	}

	#idBtn{
		width: 148px;
    	margin-left: 10px;
    	color: #fff;
	    background: #967759;
	    font-size: 15px;
	}
	.msg{
		font-size: 14px;
    	color: #e52528;
	    position: relative;
	    top: -11px;
	    text-align: left;
	    margin-left: 20px;
	    display: none;
	}
</style>
<script>
	/* 이메일 select,input */
	var schk=0;
	function selectView(){
		
		if(schk==0){
			document.getElementById("sel").style.display="block";
			document.getElementsByClassName("arrow")[0].style.transform="rotate(180deg)";
			schk=1;	
		}else{
			document.getElementById("sel").style.display="none";
			document.getElementsByClassName("arrow")[0].style.transform="rotate(0)";
			schk=0;
		}	
	}
	function inputWr(txt){
		
		if(txt=="직접입력"){
			document.getElementsByClassName("selected_value")[0].innerText="직접입력";
			mform.email2.value="";
		}else{
			mform.email2.value=txt;
			document.getElementsByClassName("selected_value")[0].innerText=txt;
			
			if(document.getElementById("email1").value.trim().length!=0){
				document.getElementById("emailMsg").style.display="none";
			}
			
		}
		
		document.getElementById("sel").style.display="none";
		schk=0;
		document.getElementsByClassName("arrow")[0].style.transform="rotate(0)";
	}
	
	function openZipSearch() {

		new daum.Postcode({
	    	
			oncomplete: function(data) {     
			
				var addr = ''; 
			
			if (data.userSelectedType === 'R') { 
				addr = data.roadAddress;
			} else {
				addr = data.jibunAddress;
			}

			$("#zip").val(data.zonecode);
			$("#addr").val(addr);
			$("#addrDtl").val("");
			$("#addrDtl").focus();
	        }
	    }).open();
	}
	
	/* 아이디 중복체크 & 아이디 길이체크 */
	var uidchk=0;
	function useridCheck(userid){
		
		if(userid.length<6){
			document.getElementById("idMsg").innerText="아이디를 6자 이상 입력하세요";
			document.getElementById("idMsg").style.display="block";
			document.getElementById("idMsg").style.color="#e52528";
			uidchk=0;
		}else{
			
			var chk=new XMLHttpRequest();
			
			chk.onload=function(){
				
				if(chk.responseText=="0"){
					document.getElementById("idMsg").innerText="사용 가능한 아이디입니다.";
					document.getElementById("idMsg").style.display="block";
					document.getElementById("idMsg").style.color="#00891a";
					uidchk=1;
				}else{
					document.getElementById("idMsg").innerText="사용 불가능한 아이디입니다.";
					document.getElementById("idMsg").style.display="block";
					document.getElementById("idMsg").style.color="#e52528";
	    			uidchk=0;
				}
			}
			
			chk.open("get","useridCheck?userid="+userid);
			chk.send();
		}
	}
	
	/* 비밀번호 길이체크 */
	var pchk=0;
	var pchk2=0;
	function pwdLength(my){
		
		if(my.length>5){
			document.getElementById("pwdMsg1").innerText="사용 가능한 비밀번호입니다.";
			document.getElementById("pwdMsg1").style.display="block";
    		document.getElementById("pwdMsg1").style.color="#00891a";
    		pchk2=1;
    		pchk=1;
		}else{
			document.getElementById("pwdMsg1").innerText="비밀번호를 6자 이상 입력하세요.";
			document.getElementById("pwdMsg1").style.display="block";
    		document.getElementById("pwdMsg1").style.color="#e52528";
    		pchk2=0;
    		pchk=0;
		}
	}
	
	/* 비밀번호 체크 */
	function pwdCheck(){
		
		var pwd=document.mform.pwd.value;
		var pwd2=document.mform.pwd2.value;
	
		if(pwd2.length>0){
			
			if(pwd==pwd2){
				document.getElementById("pwdMsg2").innerText="비밀번호가 일치합니다.";
				document.getElementById("pwdMsg2").style.display="block";
	    		document.getElementById("pwdMsg2").style.color="#00891a";
	    		if(pchk2==1){
	    			pchk=1;
	    		}else{
	    			pchk=0;
	    		}
			}else{
				document.getElementById("pwdMsg2").innerText="비밀번호가 불일치합니다.";
				document.getElementById("pwdMsg2").style.display="block";
	    		document.getElementById("pwdMsg2").style.color="#e52528";
	    		pchk=0;
			}
		}
	}
	
	/* 전송전 입력값 유효성 체크 */
	function check(my){
	
		var chk=7; //전체 체크값
		
		var userid=my.userid.value;
		var pwd=my.pwd.value;
		var pwd2=my.pwd2.value;
		var name=my.name.value;
		var zip=my.zip.value;
		var addrDtl=my.addrDtl.value;
		var email1=my.email1.value;
		var email2=my.email2.value;
		var phone=my.phone.value;
		
		var idMsg=document.getElementById("idMsg");
		var pwdMsg1=document.getElementById("pwdMsg1");
		var pwdMsg2=document.getElementById("pwdMsg2");
		var nameMsg=document.getElementById("nameMsg");
		var addMsg=document.getElementById("addMsg");
		var emailMsg=document.getElementById("emailMsg");
		var phoneMsg=document.getElementById("phoneMsg");
		
		if(uidchk==0){ //아이디 오류일때
			
			if(userid.trim().length==0){
				idMsg.innerText="아이디를 입력하세요.";
				idMsg.style.display="block";
				idMsg.style.color="#e52528";
				
			}else{
				
				if(userid.trim().length <6){
					idMsg.innerText="아이디를 6자 이상 입력하세요";
					idMsg.style.display="block";
					idMsg.style.color="#e52528";
				}else{
					idMsg.innerText="사용 불가능한 아이디입니다.";
					idMsg.style.display="block";
					idMsg.style.color="#e52528";
				}	
			}
			
		}else{
			chk--; 
		}
		
		if(pchk==0){ //비밀번호 오류
			
			if(pwd.trim().length==0){
				pwdMsg1.innerText="비밀번호를 입력하세요.";
				pwdMsg1.style.display="block";
				pwdMsg1.style.color="#e52528";
			}else if(pwd.trim().length<6){
				pwdMsg1.innerText="비밀번호를 6자 이상 입력하세요.";
				pwdMsg1.style.display="block";
				pwdMsg1.style.color="#e52528";
			}else{
				pwdMsg1.innerText="사용 가능한 비밀번호입니다.";
				pwdMsg1.style.display="block";
				pwdMsg1.style.color="#00891a";
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

		}else{
			chk--; 
		}
	
		if(name.trim().length==0){ //이름 
			nameMsg.innerText="이름을 입력하세요.";
			nameMsg.style.display="block";
		}else{
			nameMsg.style.display="none";
			chk--; 
		}
		
		if(zip.trim().length==0){ //주소 	
			addMsg.innerText="주소를 입력하세요.";
			addMsg.style.display="block";
		
		}else if(addrDtl.trim().length==0){
			addMsg.innerText="상세주소를 입력하세요.";
			addMsg.style.display="block";
		}else{
			addMsg.style.display="none";
			chk--;	
		}
		
		if(email1.trim().length==0 || email2.trim().length==0){ //이메일
			emailMsg.innerText="이메일을 입력하세요.";
			emailMsg.style.display="block";
			
		}else{
			emailMsg.style.display="none";
			chk--; //chk=2;	
		}
		
		if(phone.trim().length==0){ //전화번호
			phoneMsg.innerText="전화번호를 입력하세요.";
			phoneMsg.style.display="block";
		}else{
			phoneMsg.style.display="none";
			chk--; //chk=1;
		}
		
		if(chk==1){
			return true;
		}else{
			return false;
		}
	}
	
	function chgMsg(my,n){
		
		if(my!=""||my.trim().length!=0){
			document.getElementById(n).style.display="none";
		}else{
			document.getElementById(n).style.display="block";
		}
	}
	
	function chgMsg3(n){
		var email1=document.getElementById("email1").value;
		var email2=document.getElementById("email2").value;
		
		if(email1.trim().length!=0 && email2.trim().length!=0){
			document.getElementById(n).style.display="none";
		}else{
			document.getElementById(n).style.display="block";
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
					<li class="on"><a href=""><span>회원가입</span></a></li>
					<li><a href="/member/idfind"><span>아이디찾기</span></a></li>
					<li><a href="/member/pwdfind"><span>비밀번호찾기</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>회원가입</h3>
					<p>회원정보&nbsp;&nbsp;>&nbsp;&nbsp;회원가입</p>
				</div>
				<div id="contents">
					<div id="loginWrap">
						<div id="login">
							<h3>회원가입</h3>
							<form name="mform" method="post" action="memberOk" onsubmit="return check(this)">
						         <div id="idDiv">
						         	<input id="userid" type="text" name="userid" placeholder="아이디" oninput="useridCheck(this.value)">
						         </div>
						         <p id="idMsg" class="msg"></p>
						         <div><input type="password" name="pwd" placeholder="비밀번호" oninput="pwdLength(this.value),pwdCheck()"></div>
						         <p id="pwdMsg1" class="msg"></p>
						         <div><input type="password" name="pwd2" placeholder="비밀번호 확인" oninput="pwdCheck()"></div>
						         <p id="pwdMsg2" class="msg"></p>
						         <div><input type="text" name="name" placeholder="이름" oninput="chgMsg(this.value,'nameMsg')"></div>
						         <p id="nameMsg" class="msg"></p>
						         <div id="addrDiv">
						         	<input type="text" id="zip" name="zip" readonly="readonly" placeholder="우편번호">
									<input type="text" id="addr" name="addr" readonly="readonly" placeholder="주소">
									<input type="text" id="addrDtl" name="addrDtl" placeholder="상세주소" oninput="chgMsg(this.value,'addMsg')">
									<input type="button" value="주소검색" id="addBtn" onclick="openZipSearch()">
						         </div>
						         <p id="addMsg" class="msg"></p>
						         <div>
						         	<input type="text" id="email1" name="email1" placeholder="이메일" class="email1" oninput="chgMsg3('emailMsg')">
						         	<span>@</span> 
						         	<input type="text" id="email2" name="email2" class="email2" oninput="chgMsg3('emailMsg')">
						         	<div id="select">
						         		<div class="selected" onclick="selectView()">
						         			<div class="selected_value">직접입력</div>
						         			<div class="arrow"></div>
						         		</div>
						         		<ul id="sel">
						         			<li class="option" onclick="inputWr('직접입력')">직접입력</li>
						         			<li class="option" onclick="inputWr('naver.com')">naver.com</li>
						         			<li class="option" onclick="inputWr('gmail.com')">gmail.com</li>
						         			<li class="option" onclick="inputWr('kakao.com')">kakao.com</li>
						         			<li class="option" onclick="inputWr('hanmail.net')">hanmail.net</li>
						         		</ul>
						         	</div> 
						         </div>
						         <p id="emailMsg" class="msg"></p>
						         <div><input type="text" name="phone" placeholder="전화번호" oninput="chgMsg(this.value,'phoneMsg')"></div>
						         <p id="phoneMsg" class="msg"></p>
						         <div><input type="submit" value="회원가입"></div> 
						     </form>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>