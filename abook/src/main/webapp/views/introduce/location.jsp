<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
<style>
	#locationWrap{
		position: relative;
	}
	.txtBox .txt1{
		margin-top: 50px;
    	color: #777;
	}
	.txt1 .ti1 {
		text-indent: 18px;
		padding-top:5px;
	}
	.txt2{
		margin-top:50px;
	}
	.txt2 h3{
		font-size: 20px;
	    color: #333;
	    font-family: NotoSansM;
	}
	.txt2 .tt2{		
	    position: relative;
	    padding-left: 12px;
	    font-size: 18px;
	    margin-top: 10px;
	    display: inline-block;
	}
	.txt2 .tt2:before{
		content: "";
	    position: absolute;
	    left: 0;
	    top: 11px;
	    width: 3px;
	    height: 3px;
	    background-color: #99b5e2;
	}
	.tt_s{
		margin-left: 7px;
    	color: #555;
	}
	.ml{
		margin-left: 30px;
	}
</style>
</head>
<body>
	<div id="secWrap">
		<div class="sImg"></div>
		<div id="section">
			<div id="labNav">
				<h2><span>도서관소개</span></h2>
				<ul id="lnb">
					<li><a href="/introduce/intro"><span>인사말</span></a></li>
					<li class="on"><a href="/introduce/location"><span>오시는길</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>오시는길</h3>
					<p>도서관 소개&nbsp;&nbsp;>&nbsp;&nbsp;오시는길</p>
				</div>
				<div id="contents">
					<div id="locationWrap">
						<div id="daumRoughmapContainer1692788320031" class="root_daum_roughmap root_daum_roughmap_landing"></div>					
						<div class="txtBox">
							<div class="txt1">
								<p>※ 저시력자분들께서는 윈도우 돋보기의 색 반전 기능을 사용하시면 약도를 보다 쉽게 보실 수 있습니다.</p>
								<p class="ti1">[ 윈도우 시작 메뉴 → Windows 접근성 폴더 → 돋보기 실행 (단축키 : Windows 로고키 + 더하기(+) 키) → Ctrl + Alt + I (색 반전) ]</p>							
							</div>
							<div class="txt2">
								<h3>주소 및 연락처</h3>
								<div>
									<span class="tt2">주소 :<span class="tt_s">경기도 파주시 문화로 85(금촌동) 10929</span></span>
									<span class="tt2 ml">연락처 :<span class="tt_s">031-123-4567</span></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
<script charset="UTF-8">
	new daum.roughmap.Lander({
		"timestamp" : "1692788320031",
		"key" : "2fxm7",
		"mapWidth" : "1170",
		"mapHeight" : "550"
	}).render();
</script>
</body>
</html>