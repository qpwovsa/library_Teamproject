<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#introWrap{
		position: relative;
	}
	#introWrap .imgbox img{
	    width: 1150px;
	    height: 400px;
	    object-fit: cover;
	    border-radius: 35px;
	    z-index: 9;
	    position: relative;
	    border-radius: 35px;
	}
	#introWrap .imgbox{	
	    margin-bottom: 60px;
	    position: relative;	
	    opacity: 0.9;
	}
	#introWrap h2{
		font-family: NotoSansB;
	    color: #444;
	    font-size: 32px;
	    font-weight: bold;
	    margin-bottom: 45px;
	    color: #4d5e76;
	}
	#introWrap .imgbox:after{
	    content: "";
	    width: calc(100% - 30px);
	    height: calc(100% - 10px);
	    position: absolute;
	    right: 0;
	    top: 23px;
	    background: url(/static/img/common/bg_pattern.png) repeat 0 0;
	    border-radius: 20px;
	}
	.ttBox{
		color: #3f8fc8;
	    font-size: 25px;
	    line-height: 36px;
		letter-spacing: 0.5px;
	}
	.jang{
		font-size: 18px;
	    color: #555;
	    margin-top: 50px;
	    line-height: 31px;
    	letter-spacing: 0.5px;
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
					<li class="on"><a href="/introduce/intro"><span>인사말</span></a></li>
					<li><a href="/introduce/location"><span>오시는길</span></a></li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>인사말</h3>
					<p>도서관 소개&nbsp;&nbsp;>&nbsp;&nbsp;인사말</p>
				</div>
				<div id="contents">
					<div id="introWrap">
						<div class="imgbox">
							<img src="/static/img/introduce/intro_bg.jpg">
						</div>
						<h2>작은도서관에 오신 것을 환영합니다!</h2>
						<div class="ttBox">
							우리 도서관은 지역주민과 책이 만나 새로운 문화를 창출하고 
							세대 간 계층을 아우르는 지식 문화의 장으로서
							다양한 지식정보와 독서문화 활동을 제공하고 있습니다.
						</div>
						<div class="jang">
							작은도서관은 지역사회와 함께 하는 건강한 독서생태계 조성을 위해 다방면의 지원 사업을 강화하고 있으며,
							4차 산업혁명 시대를 맞이하여 체험·교육·소통·협력을 통한 메이커문화를 활성화하기 위해 최선을 다하고 있습니다.
				            필요한 책과 정보를 검색하기 쉽게 컴퓨터가 곳곳에 배치되어 있으며 
				            별도의 동아리 활동을 통해 경험과 지식에 더 많은 도움을 드리고 있습니다.
						</div>
						<div class="jang">
							또한 고객님들의 편의를 최우선으로 하여 불편함이 나오지 않게 항상 신경쓰며 고객님들의 불편사항은 만들어 놓은 메모함을 통해 전달받고 바로 처리 할 수 있도록 하겠습니다.
							저희와 함께 더 나은 세상을 만들어 나가길 바라며 성장해 나가는 도서관 작은 도서관이었습니다. 감사합니다.
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>