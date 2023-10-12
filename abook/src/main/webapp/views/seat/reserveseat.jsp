<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#reserveWrap{
	   position: relative;
	   border: 4px solid #f1f1f1;
	   padding: 7px;
	   text-align: center;
	   padding: 50px 60px;
	}
	#reserveWrap h3{
		color:#333;
		font-size:25px;
		font-family: NotoSansM;
		text-align:center;
		margin-bottom: 65px;
	}
	.inner_right {
	    width: 100%;
	    position: relative;
	    height: 450px;
	    margin:auto;
	}
	#notice1 {
		text-align: center;
		font-size:25px;
		margin-bottom:15px;
	}
	.pc_left_line {
		position: absolute;
		left: 170px;
	    top: 5px;
	}
	.pc_right_line {
	    position: absolute;
	    left: 350px;
	    top: 65px;
	}
	.pc_right_line_two {
		position: absolute;
		left: 350px;
	    top: 490px;
	}
	.pc {
		width: 50px;
	    height: 50px;
	    border: 1px solid #ddd;
	    margin-left: 15px;
	    line-height: 50px;
	    margin-bottom: 15px;
	    text-align: center;
	    cursor: pointer;
	    font-size: 14px;
	    font-family: 'NotoSansM';
	    color: #93765a;
	}
	.nomal {
		width: 50px;
	    height: 50px;
	    border: 1px solid #ddd;
	    margin-left: 15px;
	    line-height: 50px;
	    margin-bottom: 15px;
	    text-align: center;
	    cursor: pointer;
	    font-size: 14px;
	    font-family: 'NotoSansM';
	    color: #93765a;
	}
	.pc_line {
		display:inline-block;
	}
	.pc_aa{
		position: absolute;
		top:0;
		left: -15px;
	}
	.pc_aa_2{
		position: absolute;
		top:150px;
		left: -15px;
	}
	.pc_aa_3{
		position: absolute;
		top:310px;
		left: -15px;
	}
	.pc_bb{
		position: absolute;
		right: 0;
		top:0;
	}
	.pc_cc{
		position: absolute;
		right: 200px;
		top:150px;
	}
	.pc_dd{
		position: absolute;
		right: 0;
		top:310px;
	}
	.pc_line_two,
	.pc_line_three{
		display: flex;
	    flex-wrap: wrap;
	    width: 650px;
	}
	.pc_line_three_cc{
		display: flex;
	    flex-wrap: wrap;
		width: 450px;
	}
	.our {
		width:80px;
		height:30px;
		border:1px solid black;
	}
	#layer_background {
		position: fixed;
		top:0; left: 0; bottom: 0; right: 0;
		background: rgba(0, 0, 0, 0.8);
		display:none;
		z-index:100;
	}
	#layer {
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    width:900px;
	    background: #fff;
	    padding: 20px 35px;
	    border-radius: 5px;
	    transform: translate(-50%, -50%);
	    height: 500px;
	}
	.head {
	    width: 100%;
	    height: 60px;
	    line-height: 50px;
	    text-align: center;
	    font-size: 26px;
	    font-family: 'NotoSansM';
	    color: #444;	
	    margin-bottom: 20px;
    	margin-top: 10px;
	}
	.touter {
		width: 100%;
	    display: flex;
	    flex-wrap: wrap;
	    justify-content: space-between;
	    margin-top: 50px;
	}
	.time {
	    width: 150px;
	    height: 65px;
	    margin-top: 20px;
	    border-radius: 5px;
	    text-align: center;
	    line-height: 65px;
	    cursor: pointer;
	    color: #333;
	    letter-spacing: 1px;
	}
	#notice {
	    display: flex;
		justify-content: space-between;
	}
	p {
		line-height: 25px;
	    color: #666;
	    font-size: 15px;
	    font-family: 'NotoSansM';
	}
	.sbouter {
		margin-top: 55px;
    	text-align: center;
	}
	input[type=submit] {	
	    border: 1px solid #ddd;
	    background: #Fff;
	    color: #333;
	    font-size: 15px;
	    width: 110px;
	    height: 45px;
	    margin-right: 2px;
	}
	input[type=button] {
		border: 1px solid #ddd;
	    background: #Fff;
	    color: #333;
	    font-size: 15px;
	    width: 110px;
	    height: 45px;
	    margin-left: 2px;
	}
	#end {
		clear: both;
	}
	.chktime {
		display:none;
	}
	.oo{
	    display: inline-block;
	    width: 14px;
	    height: 14px;
	    background: #f8931d;
	    position: relative;
	    top: 1px;
	}
	.gg{
		display: inline-block;
		width: 14px;
		height: 14px;
		background: #ddd;
		position: relative;
	    top: 1px;
	    margin-left: 18px;
	}
	.tb{
		position: absolute;
	    top: 0px;
	    left: 160px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    width: 205px;
	    height: 113px;
	    font-family: 'NotoSansM';
	    color: #93765a;
	    line-height: 113px;
	    font-size: 14px;
	    background: #f3ede3;
	}
	.tb2{
		top:150px;
	}
	.tb3{
		top:310px;
	}
	.tb4{
		top: 150px;
    	left: 836px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function tableName(n) {
		var tname = document.getElementsByClassName("tablename")[n].innerText;
		
		
		var chk = new XMLHttpRequest();
		chk.onload = function() {
			
			var aa = JSON.parse(chk.responseText); // JSON으로 tablename DB가져오기
			document.getElementById("layer_background").style.display = "inline-block"; //레이어 표시
			document.getElementById("tn").innerText = aa.tname; // 레이어창 tname 표시
			
			document.cf.tname.value= aa.tname; //input type hideen의 tname값 입력
			for(i=9; i<19; i++) { // time 숫자 맞추려고 9부터 ~ 18까지의 값을 잡음
					
					eval("document.getElementById('time"+i+"').style.background='#f8931d'");
					eval("document.getElementById('time"+i+"').style.pointerEvents='auto'");

			}
			
			for(i=9; i<19; i++) { // time 숫자 맞추려고 9부터 ~ 18까지의 값을 잡음
				
				if(eval("aa.time"+i) == 1) { 
					
					eval("document.getElementById('time"+i+"').style.background='#ddd'");
					eval("document.getElementById('time"+i+"').style.pointerEvents='none'");
				}
			}	
		}
		chk.open("GET", "tableName?tname="+tname);
		chk.send();
	}
	function hideLayer() { //레이어 닫기
		document.getElementById("layer_background").style.display = "none";
		var t = document.getElementsByClassName("time");
		var chk = document.getElementsByClassName("chktime").length;
		for (i = 0; i <= chk; i++) {
			if (document.getElementsByClassName("chktime")[i].checked) {
				document.getElementsByClassName("chktime")[i].checked = false;
				document.getElementsByClassName("time")[i].style.background = "white";
			}
		}
	}

	function checktime(n, my) {
		var t = document.getElementsByClassName("chktime")[n];
		const chk = document.querySelectorAll('input[type="checkbox"]:checked');
		if (t.checked) {
			t.checked = false;
			my.style.background = "#f8931d";
		} else {
			t.checked = true;
			my.style.background = "#7cc576";
			
			if (chk.length > 2) {
				alert("최대 3시간까지 가능합니다.");
				my.style.background = "#f8931d";
				t.checked = false;
			}
		}
	}

	function check(my) {
	
		var chk = document.querySelectorAll('input[type="checkbox"]:checked');
		var total = ${total} + chk.length; // 이전에 예약한 값 가져와 예약 확인하기
		
		 if (total > 3) {
			alert("당일 좌석 예약은 최대 3시간입니다. 이전 예약을 확인하세요.");
			return false;
		} else if (chk.length == 0) {
			alert("시간을 예약하세요");
			return false;
		}else {
			var chktime = document.getElementsByClassName("chktime");
			var len = chktime.length;
			// alert(len); chktime(체크박스) 길이 
			
			// 체크된 체크박스의 밸류값이 배열로 가져오기 힘들어 하나의 String으로 합치기
			var arrychktime="";			
			for(i=0;i<len;i++){
				if(chktime[i].checked){
					chktime[i].value=1;
					//alert(chktime[i].innerText+":"+chktime[i].value); // 1 체크된거 확인
					arrychktime= arrychktime+chktime[i].value+",";
				}else {
					chktime[i].value=0;
					arrychktime= arrychktime+chktime[i].value+",";
				}
			}
		}
		 document.cf.arrychktime.value= arrychktime;
		return true;
		
	}
</script>
</head>
<body>
<div id="secWrap">
	<div class="sImg"></div>
	<div id="section">
		<div id="labNav">
			<h2><span>열람실이용</span></h2>
			<ul id="lnb">
				<li><a href="/seat/rulelibrary"><span>이용규칙</span></a></li>
				<li class="on">
				<c:if test="${userid==null}">
				<a href="/member/login?rchk=1" onclick="alert('비로그인 시 예약할 수 없습니다.')"><span>좌석예약</span></a>
				</c:if>
				<c:if test="${userid!=null}">
				<a href="/seat/reserveseat"><span>좌석예약</span></a>
				</c:if>
				</li>
			</ul>
		</div>
		<div id="contentCore">
				<div class="naviTit">
					<h3>좌석예약</h3>
					<p>열람실 이용&nbsp;&nbsp;>&nbsp;&nbsp;좌석예약</p>
				</div>
				<div id="contents">
				<div id="reserveWrap">
					<h3>자리 배치도</h3>
					<div class="ruletab">
					<div class="inner_right">
					<div class="pc_aa">
						<div class="pc_line">
						<c:if test="${list.get(0).close==0}">
							<div class="pc tablename" onclick="tableName(0)">pc1</div>
						</c:if>		
						<c:if test="${list.get(0).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc1</div>
						</c:if>		
						<c:if test="${list.get(1).close==0}">
							<div class="pc tablename" onclick="tableName(1)">pc2</div>
						</c:if>		
						<c:if test="${list.get(1).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc2</div>
						</c:if>		
						
						
						</div>
						<div class="pc_line">
						<c:if test="${list.get(6).close==0}">
							<div class="pc tablename" onclick="tableName(2)">pc7</div>
						</c:if>		
						<c:if test="${list.get(6).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc7</div>
						</c:if>		
						<c:if test="${list.get(7).close==0}">	
							<div class="pc tablename" onclick="tableName(3)">pc8</div>
						</c:if>		
						<c:if test="${list.get(7).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc8</div>
						</c:if>		
						
						
						
						
						</div>
					</div>
					<div class="pc_aa_2">
						<div class="pc_line">
						<c:if test="${list.get(2).close==0}">	
							<div class="pc tablename mt" onclick="tableName(4)" >pc3</div>
						</c:if>		
						<c:if test="${list.get(2).close==1}">	
							<div class="pc tablename mt" style="background:#ddd;color:white;cursor:default;" disabled>pc3</div>
						</c:if>		
						<c:if test="${list.get(3).close==0}">	
							<div class="pc tablename"  onclick="tableName(5)">pc4</div>
						</c:if>		
						<c:if test="${list.get(3).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc4</div>
						</c:if>		
						</div>
						<div class="pc_line">
						<c:if test="${list.get(8).close==0}">	
							<div class="pc tablename mt" onclick="tableName(6)">pc9</div>
						</c:if>		
						<c:if test="${list.get(8).close==1}">	
							<div class="pc tablename mt" style="background:#ddd;color:white;cursor:default;" disabled>pc9</div>
						</c:if>		
						<c:if test="${list.get(9).close==0}">	
							<div class="pc tablename" onclick="tableName(7)">pc10</div>
						</c:if>		
						<c:if test="${list.get(9).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc10</div>
						</c:if>		
						</div>
					</div>
					
					<div class="pc_aa_3">
						<div class="pc_line">
						<c:if test="${list.get(4).close==0}">	
							<div class="pc tablename" onclick="tableName(8)">pc5</div>
						</c:if>		
						<c:if test="${list.get(4).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc5</div>
						</c:if>		
						<c:if test="${list.get(5).close==0}">
							<div class="pc tablename" onclick="tableName(9)">pc6</div>
						</c:if>		
						<c:if test="${list.get(5).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc6</div>
						</c:if>		
						
						</div>
						<div class="pc_line">
						<c:if test="${list.get(10).close==0}">	
							<div class="pc tablename" onclick="tableName(10)">pc11</div>
						</c:if>		
						<c:if test="${list.get(10).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc11</div>
						</c:if>		
						<c:if test="${list.get(11).close==0}">	
							<div class="pc tablename" onclick="tableName(11)">pc12</div>
						</c:if>		
						<c:if test="${list.get(11).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc12</div>
						</c:if>		
						</div>
					</div>
					<div class="pc_bb">
						<div class="pc_line_two">
						<c:if test="${list.get(24).close==0}">
							<div class="nomal tablename" onclick="tableName(12)">N1</div>
						</c:if>	
						<c:if test="${list.get(24).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N1</div>
						</c:if>	
						<c:if test="${list.get(25).close==0}">	
							<div class="nomal tablename" onclick="tableName(13)">N2</div>
						</c:if>	
						<c:if test="${list.get(25).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N2</div>
						</c:if>	
						<c:if test="${list.get(26).close==0}">	
							<div class="nomal tablename" onclick="tableName(14)">N3</div>
						</c:if>	
						<c:if test="${list.get(26).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N3</div>
						</c:if>	
						<c:if test="${list.get(27).close==0}">	
							<div class="nomal tablename" onclick="tableName(15)">N4</div>
						</c:if>	
						<c:if test="${list.get(27).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N4</div>
						</c:if>	
						<c:if test="${list.get(28).close==0}">	
							<div class="nomal tablename" onclick="tableName(16)">N5</div>
						</c:if>	
						<c:if test="${list.get(28).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N5</div>
						</c:if>	
						<c:if test="${list.get(29).close==0}">	
							<div class="nomal tablename" onclick="tableName(17)">N6</div>
						</c:if>	
						<c:if test="${list.get(29).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N6</div>
						</c:if>	
						<c:if test="${list.get(30).close==0}">	
							<div class="nomal tablename" onclick="tableName(18)">N7</div>
						</c:if>	
						<c:if test="${list.get(30).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N7</div>
						</c:if>	
						<c:if test="${list.get(31).close==0}">	
							<div class="nomal tablename" onclick="tableName(19)">N8</div>
						</c:if>	
						<c:if test="${list.get(31).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N8</div>
						</c:if>	
						<c:if test="${list.get(32).close==0}">	
							<div class="nomal tablename" onclick="tableName(20)">N9</div>
						</c:if>	
						<c:if test="${list.get(32).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N9</div>
						</c:if>	
						<c:if test="${list.get(33).close==0}">	
							<div class="nomal tablename" onclick="tableName(21)">N10</div>
						</c:if>	
						<c:if test="${list.get(33).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N10</div>
						</c:if>	
						<c:if test="${list.get(34).close==0}">	
							<div class="nomal tablename" onclick="tableName(22)">N11</div>
						</c:if>	
						<c:if test="${list.get(34).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N11</div>
						</c:if>	
						<c:if test="${list.get(35).close==0}">	
							<div class="nomal tablename" onclick="tableName(23)">N12</div>
						</c:if>	
						<c:if test="${list.get(35).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N12</div>
						</c:if>	
						<c:if test="${list.get(36).close==0}">	
							<div class="nomal tablename" onclick="tableName(24)">N13</div>
						</c:if>	
						<c:if test="${list.get(36).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N13</div>
						</c:if>	
						<c:if test="${list.get(37).close==0}">	
							<div class="nomal tablename" onclick="tableName(25)">N14</div>
						</c:if>	
						<c:if test="${list.get(37).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N14</div>
						</c:if>	
						<c:if test="${list.get(38).close==0}">	
							<div class="nomal tablename" onclick="tableName(26)">N15</div>
						</c:if>	
						<c:if test="${list.get(38).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N15</div>
						</c:if>	
						<c:if test="${list.get(39).close==0}">	
							<div class="nomal tablename" onclick="tableName(27)">N16</div>
						</c:if>	
						<c:if test="${list.get(39).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N16</div>
						</c:if>	
						<c:if test="${list.get(40).close==0}">	
							<div class="nomal tablename" onclick="tableName(28)">N17</div>
						</c:if>	
						<c:if test="${list.get(40).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N17</div>
						</c:if>	
						<c:if test="${list.get(41).close==0}">	
							<div class="nomal tablename" onclick="tableName(29)">N18</div>
						</c:if>	
						<c:if test="${list.get(41).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N18</div>
						</c:if>	
						<c:if test="${list.get(42).close==0}">	
							<div class="nomal tablename" onclick="tableName(30)">N19</div>
						</c:if>	
						<c:if test="${list.get(42).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N19</div>
						</c:if>	
						<c:if test="${list.get(43).close==0}">	
							<div class="nomal tablename" onclick="tableName(31)">N20</div>
						</c:if>	
						<c:if test="${list.get(43).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N20</div>
						</c:if>	
						</div>
					</div>
					
					<div class="pc_cc">
						<div class="pc_line_three_cc">
						<c:if test="${list.get(12).close==0}">
							<div class="pc tablename" onclick="tableName(32)">pc13</div>
						</c:if>		
						<c:if test="${list.get(12).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc13</div>
						</c:if>		
						<c:if test="${list.get(13).close==0}">	
							<div class="pc tablename" onclick="tableName(33)">pc14</div>
						</c:if>		
						<c:if test="${list.get(13).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc14</div>
						</c:if>		
						<c:if test="${list.get(14).close==0}">	
							<div class="pc tablename" onclick="tableName(34)">pc15</div>
						</c:if>		
						<c:if test="${list.get(14).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc15</div>
						</c:if>		
						<c:if test="${list.get(15).close==0}">	
							<div class="pc tablename" onclick="tableName(35)">pc16</div>
						</c:if>		
						<c:if test="${list.get(15).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc16</div>
						</c:if>	
						<c:if test="${list.get(16).close==0}">	
							<div class="pc tablename" onclick="tableName(36)">pc17</div>
						</c:if>	
						<c:if test="${list.get(16).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc17</div>
						</c:if>	
						<c:if test="${list.get(17).close==0}">	
							<div class="pc tablename" onclick="tableName(37)">pc18</div>
						</c:if>	
						<c:if test="${list.get(17).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc18</div>
						</c:if>	
						<c:if test="${list.get(18).close==0}">	
							<div class="pc tablename" onclick="tableName(38)">pc19</div>
						</c:if>	
						<c:if test="${list.get(18).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc19</div>
						</c:if>	
						<c:if test="${list.get(19).close==0}">	
							<div class="pc tablename" onclick="tableName(39)">pc20</div>
						</c:if>	
						<c:if test="${list.get(19).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc20</div>
						</c:if>	
						<c:if test="${list.get(20).close==0}">	
							<div class="pc tablename" onclick="tableName(40)">pc21</div>
						</c:if>	
						<c:if test="${list.get(20).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc21</div>
						</c:if>	
						<c:if test="${list.get(21).close==0}">	
							<div class="pc tablename" onclick="tableName(41)">pc22</div>
						</c:if>	
						<c:if test="${list.get(21).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc22</div>
						</c:if>	
						<c:if test="${list.get(22).close==0}">	
							<div class="pc tablename" onclick="tableName(42)">pc23</div>
						</c:if>	
						<c:if test="${list.get(22).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc23</div>
						</c:if>	
						<c:if test="${list.get(23).close==0}">	
							<div class="pc tablename" onclick="tableName(43)">pc24</div>
						</c:if>	
						<c:if test="${list.get(23).close==1}">	
							<div class="pc tablename" style="background:#ddd;color:white;cursor:default;" disabled>pc24</div>
						</c:if>	
						</div>
					</div>
					
					<div class="pc_dd">
						<div class="pc_line_three">
						<c:if test="${list.get(44).close==0}">
							<div class="nomal tablename" onclick="tableName(44)">N21</div>
						</c:if>	
						<c:if test="${list.get(44).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N21</div>
						</c:if>	
						<c:if test="${list.get(45).close==0}">	
							<div class="nomal tablename" onclick="tableName(45)">N22</div>
						</c:if>	
						<c:if test="${list.get(45).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N22</div>
						</c:if>	
						<c:if test="${list.get(46).close==0}">	
							<div class="nomal tablename" onclick="tableName(46)">N23</div>
						</c:if>	
						<c:if test="${list.get(46).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N23</div>
						</c:if>	
						<c:if test="${list.get(47).close==0}">	
							<div class="nomal tablename" onclick="tableName(47)">N24</div>
						</c:if>	
						<c:if test="${list.get(47).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N24</div>
						</c:if>	
						<c:if test="${list.get(48).close==0}">	
							<div class="nomal tablename" onclick="tableName(48)">N25</div>
						</c:if>	
						<c:if test="${list.get(48).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N25</div>
						</c:if>	
						<c:if test="${list.get(49).close==0}">	
							<div class="nomal tablename" onclick="tableName(49)">N26</div>
						</c:if>	
						<c:if test="${list.get(49).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N26</div>
						</c:if>	
						<c:if test="${list.get(50).close==0}">	
							<div class="nomal tablename" onclick="tableName(50)">N27</div>
						</c:if>	
						<c:if test="${list.get(50).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N27</div>
						</c:if>	
						<c:if test="${list.get(51).close==0}">	
							<div class="nomal tablename" onclick="tableName(51)">N28</div>
						</c:if>	
						<c:if test="${list.get(51).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N28</div>
						</c:if>	
						<c:if test="${list.get(52).close==0}">	
							<div class="nomal tablename" onclick="tableName(52)">N29</div>
						</c:if>	
						<c:if test="${list.get(52).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N29</div>
						</c:if>	
						<c:if test="${list.get(53).close==0}">	
							<div class="nomal tablename" onclick="tableName(53)">N30</div>
						</c:if>	
						<c:if test="${list.get(53).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N30</div>
						</c:if>	
						<c:if test="${list.get(54).close==0}">	
							<div class="nomal tablename" onclick="tableName(54)">N31</div>
						</c:if>	
						<c:if test="${list.get(54).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N31</div>
						</c:if>	
						<c:if test="${list.get(55).close==0}">	
							<div class="nomal tablename" onclick="tableName(55)">N32</div>
						</c:if>	
						<c:if test="${list.get(55).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N32</div>
						</c:if>	
						<c:if test="${list.get(56).close==0}">	
							<div class="nomal tablename" onclick="tableName(56)">N33</div>
						</c:if>	
						<c:if test="${list.get(56).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N33</div>
						</c:if>	
						<c:if test="${list.get(57).close==0}">	
							<div class="nomal tablename" onclick="tableName(57)">N34</div>
						</c:if>	
						<c:if test="${list.get(57).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N34</div>
						</c:if>	
						<c:if test="${list.get(58).close==0}">	
							<div class="nomal tablename" onclick="tableName(58)">N35</div>
						</c:if>	
						<c:if test="${list.get(58).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N35</div>
						</c:if>	
						<c:if test="${list.get(59).close==0}">	
							<div class="nomal tablename" onclick="tableName(59)">N36</div>
						</c:if>	
						<c:if test="${list.get(59).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N36</div>
						</c:if>	
						<c:if test="${list.get(60).close==0}">	
							<div class="nomal tablename" onclick="tableName(60)">N37</div>
						</c:if>	
						<c:if test="${list.get(60).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N37</div>
						</c:if>	
						<c:if test="${list.get(61).close==0}">	
							<div class="nomal tablename" onclick="tableName(61)">N38</div>
						</c:if>	
						<c:if test="${list.get(61).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N38</div>
						</c:if>	
						<c:if test="${list.get(62).close==0}">	
							<div class="nomal tablename" onclick="tableName(62)">N39</div>
						</c:if>	
						<c:if test="${list.get(62).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N39</div>
						</c:if>	
						<c:if test="${list.get(63).close==0}">	
							<div class="nomal tablename" onclick="tableName(63)">N40</div>
						</c:if>	
						<c:if test="${list.get(63).close==1}">	
							<div class="nomal tablename" style="background:#ddd;color:white;cursor:default;" disabled>N40</div>
						</c:if>	
						</div>
					</div>
					<div class="tb tb1">※ 도서 공간 입니다 (B23/B24)</div>
					<div class="tb tb2">※ 도서 공간 입니다 (C21/C22)</div>
					<div class="tb tb3">※ 도서 공간 입니다 (A26/A28)</div>
					<div class="tb tb4">※ 공용 자유 테이블 입니다</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>		
<div id="layer_background">
	<div id="layer">
			<div class="head">

				${name}님의 선택 좌석 : <span id="tn"></span>  번 <p>

			</div>
				<div id="notice">
					<p>※ 본 도서관은 1인 최대 3시간까지 좌석 배정이 가능합니다.</p>
					<span><span class="oo"></span> 예약 가능<span class="gg"></span> 예약중 또는 예약 불가</span>
				</div>
				<form name="cf" method="post" action="reserveSeater" onsubmit="return check(this)">
				<input type="hidden" name="tname" value=""> 
				<input type="hidden" name="arrychktime">
					<div class="touter">
						<div class="time" id="time9" onclick="checktime(0,this)">9시~10시</div><input type="checkbox" name="time9" class="chktime" value="0">
						<div class="time" id="time10" onclick="checktime(1,this)">10시~11시</div><input type="checkbox" name="time10" class="chktime" value="0">
						<div class="time" id="time11" onclick="checktime(2,this)">11시~12시</div><input type="checkbox" name="time11" class="chktime" value="0">
						<div class="time" id="time12" onclick="checktime(3,this)">12시~13시</div><input type="checkbox" name="time12" class="chktime" value="0">
						<div class="time" id="time13" onclick="checktime(4,this)">13시~14시</div><input type="checkbox" name="time13" class="chktime" value="0">
						<div class="time" id="time14" onclick="checktime(5,this)">14시~15시</div><input type="checkbox" name="time14" class="chktime" value="0">
						<div class="time" id="time15" onclick="checktime(6,this)">15시~16시</div><input type="checkbox" name="time15" class="chktime" value="0">
						<div class="time" id="time16" onclick="checktime(7,this)">16시~17시</div><input type="checkbox" name="time16" class="chktime" value="0">
						<div class="time" id="time17" onclick="checktime(8,this)">17시~18시</div><input type="checkbox" name="time17" class="chktime" value="0">
						<div class="time" id="time18" onclick="checktime(9,this)">18시~19시</div><input type="checkbox" name="time18" class="chktime" value="0">
					</div>
					<div class="sbouter">
						<input type="button" value="뒤로가기" onclick="hideLayer()">
						<input type="submit" value="좌석예약">
						<span id="chkaa"></span>
					</div>
				</form>
	</div>
</div>
<div id="end"></div>
</body>
</html>