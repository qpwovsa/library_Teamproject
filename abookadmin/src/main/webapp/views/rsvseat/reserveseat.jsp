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
	   margin-bottom: 80px;
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
function stoptable(my) {
	// var tname = document.getElementsByClassName("tablename")[n].value;
	// tname = document.getElementsByClassName("tablename")[n].innerText;
	 var tname=my.innerText;
	//alert(tname);
	if(confirm(tname+"번 좌석을 닫겠습니까?")) {
		location="stopTable?tname="+tname;		
	}else {
		return false;
	}
}
function starttable(my) {
	// var tname = document.getElementsByClassName("tablename")[n].value;
	// tname = document.getElementsByClassName("tablename")[n].innerText;
	var tname=my.innerText;
	 //alert(tname);
	 if(confirm(tname+"번 좌석을 열겠습니까?")) {
		 location="startTable?tname="+tname;
	}else {
		return false;
	}
	 
}
</script>
</head>
<body>
<div id="secWrap">
	<div class="sImg"></div>
	<div id="section">
		<div id="labNav">
			<h2><span>좌석관리</span></h2>
			<ul id="lnb">
				<li class="on"><a href="/rsvseat/reserveseat"><span>사용불가 지정</span></a></li>
				<li><a href="/rsvseat/cancelseat"><span>퇴실처리</span></a></li>
			</ul>
		</div>
		<div id="contentCore">
				<div class="naviTit">
					<h3>사용불가 지정</h3>
					<p>좌석 관리&nbsp;&nbsp;>&nbsp;&nbsp;사용불가 지정</p>
				</div>
				<div id="contents">
				<div id="reserveWrap">
					<h3>자리 배치도</h3>
					<div class="ruletab">
					<div class="inner_right">
					<div class="pc_aa">
						<div class="pc_line">
						<c:if test="${list.get(0).close==0}">
							<div class="pc tablename" onclick="stoptable(this)">pc1</div>
						</c:if>		
						<c:if test="${list.get(0).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc1</div>
						</c:if>		
						<c:if test="${list.get(1).close==0}">
							<div class="pc tablename" onclick="stoptable(this)">pc2</div>
						</c:if>		
						<c:if test="${list.get(1).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc2</div>
						</c:if>		
						
						
						</div>
						<div class="pc_line">
						<c:if test="${list.get(6).close==0}">
							<div class="pc tablename" onclick="stoptable(this)">pc7</div>
						</c:if>		
						<c:if test="${list.get(6).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc7</div>
						</c:if>		
						<c:if test="${list.get(7).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc8</div>
						</c:if>		
						<c:if test="${list.get(7).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc8</div>
						</c:if>		
						
						
						
						
						</div>
					</div>
					<div class="pc_aa_2">
						<div class="pc_line">
						<c:if test="${list.get(2).close==0}">	
							<div class="pc tablename mt" onclick="stoptable(this)">pc3</div>
						</c:if>		
						<c:if test="${list.get(2).close==1}">	
							<div class="pc tablename mt" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc3</div>
						</c:if>		
						<c:if test="${list.get(3).close==0}">	
							<div class="pc tablename"  onclick="stoptable(this)">pc4</div>
						</c:if>		
						<c:if test="${list.get(3).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc4</div>
						</c:if>		
						</div>
						<div class="pc_line">
						<c:if test="${list.get(8).close==0}">	
							<div class="pc tablename mt" onclick="stoptable(this)">pc9</div>
						</c:if>		
						<c:if test="${list.get(8).close==1}">	
							<div class="pc tablename mt" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc9</div>
						</c:if>		
						<c:if test="${list.get(9).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc10</div>
						</c:if>		
						<c:if test="${list.get(9).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc10</div>
						</c:if>		
						</div>
					</div>
					
					<div class="pc_aa_3">
						<div class="pc_line">
						<c:if test="${list.get(4).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc5</div>
						</c:if>		
						<c:if test="${list.get(4).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc5</div>
						</c:if>		
						<c:if test="${list.get(5).close==0}">
							<div class="pc tablename" onclick="stoptable(this)">pc6</div>
						</c:if>		
						<c:if test="${list.get(5).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc6</div>
						</c:if>		
						
						</div>
						<div class="pc_line">
						<c:if test="${list.get(10).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc11</div>
						</c:if>		
						<c:if test="${list.get(10).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc11</div>
						</c:if>		
						<c:if test="${list.get(11).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc12</div>
						</c:if>		
						<c:if test="${list.get(11).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc12</div>
						</c:if>		
						</div>
					</div>
					<div class="pc_bb">
						<div class="pc_line_two">
						<c:if test="${list.get(24).close==0}">
							<div class="nomal tablename" onclick="stoptable(this)">N1</div>
						</c:if>	
						<c:if test="${list.get(24).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N1</div>
						</c:if>	
						<c:if test="${list.get(25).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N2</div>
						</c:if>	
						<c:if test="${list.get(25).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N2</div>
						</c:if>	
						<c:if test="${list.get(26).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N3</div>
						</c:if>	
						<c:if test="${list.get(26).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N3</div>
						</c:if>	
						<c:if test="${list.get(27).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N4</div>
						</c:if>	
						<c:if test="${list.get(27).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N4</div>
						</c:if>	
						<c:if test="${list.get(28).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N5</div>
						</c:if>	
						<c:if test="${list.get(28).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N5</div>
						</c:if>	
						<c:if test="${list.get(29).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N6</div>
						</c:if>	
						<c:if test="${list.get(29).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N6</div>
						</c:if>	
						<c:if test="${list.get(30).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N7</div>
						</c:if>	
						<c:if test="${list.get(30).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N7</div>
						</c:if>	
						<c:if test="${list.get(31).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N8</div>
						</c:if>	
						<c:if test="${list.get(31).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N8</div>
						</c:if>	
						<c:if test="${list.get(32).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N9</div>
						</c:if>	
						<c:if test="${list.get(32).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N9</div>
						</c:if>	
						<c:if test="${list.get(33).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N10</div>
						</c:if>	
						<c:if test="${list.get(33).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N10</div>
						</c:if>	
						<c:if test="${list.get(34).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N11</div>
						</c:if>	
						<c:if test="${list.get(34).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N11</div>
						</c:if>	
						<c:if test="${list.get(35).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N12</div>
						</c:if>	
						<c:if test="${list.get(35).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N12</div>
						</c:if>	
						<c:if test="${list.get(36).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N13</div>
						</c:if>	
						<c:if test="${list.get(36).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N13</div>
						</c:if>	
						<c:if test="${list.get(37).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N14</div>
						</c:if>	
						<c:if test="${list.get(37).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N14</div>
						</c:if>	
						<c:if test="${list.get(38).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N15</div>
						</c:if>	
						<c:if test="${list.get(38).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N15</div>
						</c:if>	
						<c:if test="${list.get(39).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N16</div>
						</c:if>	
						<c:if test="${list.get(39).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N16</div>
						</c:if>	
						<c:if test="${list.get(40).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N17</div>
						</c:if>	
						<c:if test="${list.get(40).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N17</div>
						</c:if>	
						<c:if test="${list.get(41).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N18</div>
						</c:if>	
						<c:if test="${list.get(41).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N18</div>
						</c:if>	
						<c:if test="${list.get(42).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N19</div>
						</c:if>	
						<c:if test="${list.get(42).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N19</div>
						</c:if>	
						<c:if test="${list.get(43).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N20</div>
						</c:if>	
						<c:if test="${list.get(43).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N20</div>
						</c:if>	
						</div>
					</div>
					
					<div class="pc_cc">
						<div class="pc_line_three_cc">
						<c:if test="${list.get(12).close==0}">
							<div class="pc tablename" onclick="stoptable(this)">pc13</div>
						</c:if>		
						<c:if test="${list.get(12).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc13</div>
						</c:if>		
						<c:if test="${list.get(13).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc14</div>
						</c:if>		
						<c:if test="${list.get(13).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc14</div>
						</c:if>		
						<c:if test="${list.get(14).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc15</div>
						</c:if>		
						<c:if test="${list.get(14).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc15</div>
						</c:if>		
						<c:if test="${list.get(15).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc16</div>
						</c:if>		
						<c:if test="${list.get(15).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc16</div>
						</c:if>	
						<c:if test="${list.get(16).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc17</div>
						</c:if>	
						<c:if test="${list.get(16).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc17</div>
						</c:if>	
						<c:if test="${list.get(17).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc18</div>
						</c:if>	
						<c:if test="${list.get(17).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc18</div>
						</c:if>	
						<c:if test="${list.get(18).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc19</div>
						</c:if>	
						<c:if test="${list.get(18).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc19</div>
						</c:if>	
						<c:if test="${list.get(19).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc20</div>
						</c:if>	
						<c:if test="${list.get(19).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc20</div>
						</c:if>	
						<c:if test="${list.get(20).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc21</div>
						</c:if>	
						<c:if test="${list.get(20).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc21</div>
						</c:if>	
						<c:if test="${list.get(21).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc22</div>
						</c:if>	
						<c:if test="${list.get(21).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc22</div>
						</c:if>	
						<c:if test="${list.get(22).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc23</div>
						</c:if>	
						<c:if test="${list.get(22).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc23</div>
						</c:if>	
						<c:if test="${list.get(23).close==0}">	
							<div class="pc tablename" onclick="stoptable(this)">pc24</div>
						</c:if>	
						<c:if test="${list.get(23).close==1}">	
							<div class="pc tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">pc24</div>
						</c:if>	
						</div>
					</div>
					
					<div class="pc_dd">
						<div class="pc_line_three">
						<c:if test="${list.get(44).close==0}">
							<div class="nomal tablename" onclick="stoptable(this)">N21</div>
						</c:if>	
						<c:if test="${list.get(44).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N21</div>
						</c:if>	
						<c:if test="${list.get(45).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N22</div>
						</c:if>	
						<c:if test="${list.get(45).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N22</div>
						</c:if>	
						<c:if test="${list.get(46).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N23</div>
						</c:if>	
						<c:if test="${list.get(46).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N23</div>
						</c:if>	
						<c:if test="${list.get(47).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N24</div>
						</c:if>	
						<c:if test="${list.get(47).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N24</div>
						</c:if>	
						<c:if test="${list.get(48).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N25</div>
						</c:if>	
						<c:if test="${list.get(48).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N25</div>
						</c:if>	
						<c:if test="${list.get(49).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N26</div>
						</c:if>	
						<c:if test="${list.get(49).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N26</div>
						</c:if>	
						<c:if test="${list.get(50).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N27</div>
						</c:if>	
						<c:if test="${list.get(50).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N27</div>
						</c:if>	
						<c:if test="${list.get(51).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N28</div>
						</c:if>	
						<c:if test="${list.get(51).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N28</div>
						</c:if>	
						<c:if test="${list.get(52).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N29</div>
						</c:if>	
						<c:if test="${list.get(52).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N29</div>
						</c:if>	
						<c:if test="${list.get(53).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N30</div>
						</c:if>	
						<c:if test="${list.get(53).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N30</div>
						</c:if>	
						<c:if test="${list.get(54).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N31</div>
						</c:if>	
						<c:if test="${list.get(54).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N31</div>
						</c:if>	
						<c:if test="${list.get(55).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N32</div>
						</c:if>	
						<c:if test="${list.get(55).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N32</div>
						</c:if>	
						<c:if test="${list.get(56).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N33</div>
						</c:if>	
						<c:if test="${list.get(56).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N33</div>
						</c:if>	
						<c:if test="${list.get(57).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N34</div>
						</c:if>	
						<c:if test="${list.get(57).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N34</div>
						</c:if>	
						<c:if test="${list.get(58).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N35</div>
						</c:if>	
						<c:if test="${list.get(58).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N35</div>
						</c:if>	
						<c:if test="${list.get(59).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N36</div>
						</c:if>	
						<c:if test="${list.get(59).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N36</div>
						</c:if>	
						<c:if test="${list.get(60).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N37</div>
						</c:if>	
						<c:if test="${list.get(60).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N37</div>
						</c:if>	
						<c:if test="${list.get(61).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N38</div>
						</c:if>	
						<c:if test="${list.get(61).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N38</div>
						</c:if>	
						<c:if test="${list.get(62).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N39</div>
						</c:if>	
						<c:if test="${list.get(62).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N39</div>
						</c:if>	
						<c:if test="${list.get(63).close==0}">	
							<div class="nomal tablename" onclick="stoptable(this)">N40</div>
						</c:if>	
						<c:if test="${list.get(63).close==1}">	
							<div class="nomal tablename" onclick="starttable(this)" style="background:#ddd;color:white;cursor:pointer;">N40</div>
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
<div id="end"></div>
</body>
</html>