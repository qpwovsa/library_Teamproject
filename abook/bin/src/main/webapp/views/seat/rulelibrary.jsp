<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#ruleWrap{
		position: relative;
		border:4px solid #f1f1f1;
	    padding: 7px;
	    text-align: center;
	    padding: 50px 20px;
	}
	#ruleWrap h3{
		color:#333;
		font-size:25px;
		font-family: NotoSansM;
		text-align:center;
		margin-bottom: 65px;
	}
	.ruletab {
		margin-bottom:40px;
	}
	.rule{
		text-align:left;
		display: flex;
    	justify-content: space-around;
    	margin-bottom: 30px;
    	color: #555;
	}
	.rule_img {
		width:60px;
	}
	.rule_img img{
		width: 100%;
		height: 100%:
		object-fit:contain;
	}
	.rule p{
		width: 1000px;
	}
	.c3{
		color: #333;
    	font-family: 'NotoSansM';
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
				<h2><span>열람실이용</span></h2>
				<ul id="lnb">
					<li class="on"><a href="/seat/rulelibrary"><span>이용규칙</span></a></li>
					<li>
					<c:if test="${userid!=null}">
					<a href="/seat/reserveseat"><span>좌석예약</span></a>
					</c:if>
					<c:if test="${userid==null}">
					<a href="/member/login?rchk=1" onclick="alert('비로그인 상태에서는 예약할 수 없습니다.')"><span>좌석예약</span></a>
					</c:if>
					</li>
				</ul>
			</div>
			<div id="contentCore">
				<div class="naviTit">
					<h3>이용규칙</h3>
					<p>열람실 이용&nbsp;&nbsp;>&nbsp;&nbsp;이용규칙</p>
				</div>
				<div id="contents">
					<div id="ruleWrap">
						<h3>도서관 이용규칙</h3>
						<div class="ruletab">
							<div class="rule">
								<div class="rule_img"><img src="/static/img/rule/libRlue1.png"></div>
								<p>
									<span class="c3">음식물반입 및 취식금지</span><br>
									- 본 도서관은 도서관 내에서 음식물 취식이 금지되어 있으며, 음식물은 야외공간(테라스, 정원)에서만 취식 가능합니다.<br>
									- 전층 자료실, 도서관에서는 음료 및 음식물 반입이 불가합니다.
								</p>
							</div>
							<div class="rule">
								<div class="rule_img"><img src="/static/img/rule/libRule2.png"></div>
								<p>
									<span class="c3">분실물 처리</span><br>
									- 분실물 습득시 중앙도서관 1층 대출· 반납실로 신고하여 주시기 바랍니다.<br>
									- 분실 시 분실물찾기 게시판을 확인하시거나 대출·반납실로 문의하시기 바랍니다.<br>
									- 문의사항 (TEL: 123-8282)
								</p>
							</div>
							<div class="rule">
								<div class="rule_img"><img src="/static/img/rule/libRule3.png"></div>
								<p>
									<span class="c3">도서관 전관 금연</span><br>
									현재 우리 도서관에서는 전관 금연을 실시하고 있습니다. 이는 도서관 이용자의 건강권을 보호하기 뿐만 아니라, 많은 책을 소장하고 있는 도서관의 특성상 화재에 극히 취약하기 때문입니다. 아직까지 화장실에서 일부 흡연하는 이용자가 있습니다. 
									도서관 전관 금연에 동참하여 주실 것을 당부 드립니다.
								</p>
							</div>
							<div class="rule">
								<div class="rule_img"><img src="/static/img/rule/libRule4.png"></div>
								<p>
									<span class="c3">자료의 오배열 방지</span><br>
									도서관에 소장되어 있는 자료는 이용한 후 서가에 직접 꽂지 마시고 가장 가까운 서가 옆의 이용한 책 보관함에 놓아 주시기 바랍니다.잘못 배열되어 있는 자료는 없는 자료와 마찬가지입니다. 협조 부탁드립니다.
								</p>
							</div>
							<div class="rule">
								<div class="rule_img"><img src="/static/img/rule/libRule5.png"></div>
								<p>
									<span class="c3">도서관 내 정숙</span><br>
									도서관은 학습 및 연구를 최우선의 목적으로 제공되는 공간입니다. 열람실 이용자에게 방해가 되지 않도록 도서관 내에서는 큰소리로 말하지 맙시다.
								</p>
							</div>
							<div  class="rule">
								<div class="rule_img"><img src="/static/img/rule/libRule6.png"></div>
								<p>
									<span class="c3">공공시설 에티켓 준수</span><br>
									도서관 및 도서실에 개인 사물을 방치하지 않습니다. 2일 이상 동일 장소에 개인사물이 방치될 경우 임의로 수거하여 습득물로 처리합니다.
								</p>
							</div>
							<div class="rule">
								<div class="rule_img"><img src="/static/img/rule/libRule7.png"></div>
								<p>
									<span class="c3">휴대폰 예절 준수</span><br>
									휴대폰 벨소리나 통화는 타 이용자에게 방해가 될 수 있습니다. 무음모드로 사용하시거나 도서관 내에서의 사용을 금해 주십시오.
								</p>
							</div>
							<div class="rule">
								<div class="rule_img"><img src="/static/img/rule/libRule8.png"></div>
								<p>
									<span class="c3">좌석배정시스템 이용안내</span><br>
									본 중앙도서실은 좌석배정시스템을 운영중입니다. 열람좌석의 독점 방지와 면학환경을 위해 좌석을 꼭 배정받아 이용하여야 하며, 테이프나 포스트잇으로 표시해놓은 좌석은 효력이 없으니 이용에 유의하시기 바랍니다.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>